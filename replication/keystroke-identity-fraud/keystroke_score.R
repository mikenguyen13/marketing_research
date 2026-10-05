# keystroke_score.R -- server-side scoring for keystroke-capture.js payloads.
#
# Companion to the book's keystroke-dynamics section (ch. 57, sec-bio-keystroke). The design
# follows what the replication there supports:
#   * Template-free. A first-time applicant has no enrolled typing profile, so each session is
#     compared with a reference built from known-good sessions (applicants who later cleared
#     KYC and never charged back), not with the applicant's own past typing.
#   * Slower-than-reference is the risk direction. Typing someone else's identity is a
#     retrieval task; typing your own is motor memory (Kim et al. 2023; Monaro et al. 2018).
#   * Hesitation before a field (focus -> first key) carries most of the weight by default:
#     in the replication it was the timing feature that survived the lab-to-online move
#     (one-class AUC 0.874 with no fraud labels at all).
#   * A score is not a verdict. It ranks sessions so the riskiest k% go to step-up
#     verification, and everyone else onboards without friction.
#   * Separate references per device class, and a parity check on step-up rates by segment,
#     because typing speed varies with device, age, language, and disability.
#
# Dependencies: base R + jsonlite (only for ks_score_json).

KS_FEATURES <- c("latency", "key_alpha", "key_num", "field_trans", "max_pause", "deletion_rate")

KS_DEFAULT_WEIGHTS <- c(latency = 0.35, key_alpha = 0.20, key_num = 0.15,
                        field_trans = 0.15, max_pause = 0.10, deletion_rate = 0.05)

# ---- 1. features ----------------------------------------------------------------------
# `p` is a parsed payload (jsonlite::fromJSON(x, simplifyVector = FALSE)) or its $features.
ks_features <- function(p, min_keys = 8) {
  device <- if (!is.null(p$ua_mobile) && isTRUE(p$ua_mobile)) "mobile" else "desktop"
  f <- if (!is.null(p$features)) p$features else p
  fl <- f$fields
  num <- function(x) if (is.null(x)) NA_real_ else as.numeric(x)
  get <- function(k) vapply(fl, function(z) num(z[[k]]), numeric(1))
  n_content <- get("n_content"); digits <- get("digits_share"); dd <- get("median_dd_ms")
  typed <- n_content > 0
  med <- function(x) if (all(is.na(x))) NA_real_ else stats::median(x, na.rm = TRUE)
  out <- data.frame(
    device        = device,
    latency       = med(get("latency_ms")[typed]),
    key_alpha     = med(dd[typed & digits < 0.5]),
    key_num       = med(dd[typed & digits >= 0.5]),
    field_trans   = num(f$median_field_transition_ms),
    max_pause     = suppressWarnings(max(get("max_dd_ms"), na.rm = TRUE)),
    deletion_rate = sum(get("n_deletions"), na.rm = TRUE) / max(1, sum(n_content, na.rm = TRUE)),
    n_keys        = sum(n_content, na.rm = TRUE),
    untyped       = sum(get("untyped_inputs") + get("pastes"), na.rm = TRUE),
    synthetic     = sum(get("synthetic_events"), na.rm = TRUE),
    stringsAsFactors = FALSE)
  out$max_pause[!is.finite(out$max_pause)] <- NA_real_
  # Too little typing to say anything: autofill, password managers and paste are legitimate,
  # so absence of keystrokes is "no signal", never "risky".
  out$no_signal <- out$n_keys < min_keys
  out
}

# ---- 2. reference calibration ---------------------------------------------------------
# `good` is a data.frame of ks_features() rows from sessions known to be genuine.
ks_calibrate <- function(good, by_device = TRUE, min_n = 200) {
  good <- good[!good$no_signal & good$synthetic == 0, , drop = FALSE]
  one <- function(d) {
    t(vapply(KS_FEATURES, function(v) {
      x <- log1p(d[[v]][is.finite(d[[v]])])
      s <- stats::mad(x)                       # 1.4826 * MAD: a robust SD
      c(center = stats::median(x), scale = if (is.finite(s) && s > 0) s else stats::sd(x), n = length(x))
    }, numeric(3)))
  }
  groups <- if (by_device) split(good, good$device) else list(all = good)
  ref <- lapply(groups, one)
  small <- names(groups)[vapply(groups, nrow, 1L) < min_n]
  if (length(small)) warning("reference has fewer than ", min_n, " sessions for: ",
                             paste(small, collapse = ", "), call. = FALSE)
  structure(list(ref = ref, by_device = by_device, created = Sys.time(),
                 n = vapply(groups, nrow, 1L)), class = "ks_reference")
}

# ---- 3. scoring -----------------------------------------------------------------------
ks_score <- function(x, reference, weights = KS_DEFAULT_WEIGHTS, n_reasons = 2) {
  stopifnot(inherits(reference, "ks_reference"), all(names(weights) %in% KS_FEATURES))
  res <- lapply(seq_len(nrow(x)), function(i) {
    r <- x[i, ]
    key <- if (reference$by_device && r$device %in% names(reference$ref)) r$device else names(reference$ref)[1]
    R <- reference$ref[[key]]
    z <- vapply(names(weights), function(v) {
      if (!is.finite(r[[v]])) return(NA_real_)
      max(0, (log1p(r[[v]]) - R[v, "center"]) / R[v, "scale"])   # one-sided: only slower counts
    }, numeric(1))
    w <- weights[!is.na(z)]; zz <- z[!is.na(z)]
    score <- if (length(zz)) sum(w * pmin(zz, 6)) / sum(w) else NA_real_   # cap a single outlier
    contrib <- sort(w * zz, decreasing = TRUE)
    reasons <- names(contrib)[contrib > 0][seq_len(min(n_reasons, sum(contrib > 0)))]
    data.frame(score = score, reasons = paste(reasons, collapse = ";"),
               no_signal = r$no_signal, synthetic = r$synthetic > 0, device = r$device)
  })
  do.call(rbind, res)
}

# Refit weights once labelled outcomes exist (confirmed fraud = 1). Ridge logistic regression
# on the one-sided z-scores (a little shrinkage keeps it finite when a feature separates the
# classes, which keystroke data do readily); negative coefficients are clipped to zero and the
# weights renormalized.
ks_fit_weights <- function(x, reference, y, lambda = 1) {
  Z <- t(vapply(seq_len(nrow(x)), function(i) {
    r <- x[i, ]; key <- if (reference$by_device && r$device %in% names(reference$ref)) r$device else names(reference$ref)[1]
    R <- reference$ref[[key]]
    vapply(KS_FEATURES, function(v) if (is.finite(r[[v]])) max(0, (log1p(r[[v]]) - R[v, "center"]) / R[v, "scale"]) else 0, numeric(1))
  }, numeric(length(KS_FEATURES))))
  nll <- function(th) { eta <- th[1] + Z %*% th[-1]
    sum(log1p(exp(eta))) - sum(y * eta) + lambda / 2 * sum(th[-1]^2) }
  b <- stats::optim(rep(0, ncol(Z) + 1), nll, method = "BFGS")$par[-1]
  b <- pmax(b, 0); names(b) <- KS_FEATURES
  if (sum(b) == 0) return(KS_DEFAULT_WEIGHTS)
  b[b > 0] / sum(b)
}

# ---- 4. decision policy ---------------------------------------------------------------
# Threshold = the (1 - budget) quantile of recent scores among sessions that had a signal,
# so roughly `budget` of applicants are stepped up whatever the score's scale.
ks_threshold <- function(recent_scores, budget = 0.10) {
  s <- recent_scores[is.finite(recent_scores)]
  if (length(s) < 100) warning("threshold estimated from fewer than 100 sessions", call. = FALSE)
  unname(stats::quantile(s, 1 - budget, type = 7))
}

ks_decide <- function(scored, threshold) {
  with(scored, ifelse(synthetic, "step_up_automation",
               ifelse(no_signal | !is.finite(score), "no_signal",
               ifelse(score > threshold, "step_up", "allow"))))
}

# ---- 5. monitoring --------------------------------------------------------------------
# Population stability index between the calibration scores and a recent window.
ks_psi <- function(expected, actual, bins = 10) {
  expected <- expected[is.finite(expected)]; actual <- actual[is.finite(actual)]
  br <- unique(stats::quantile(expected, seq(0, 1, length.out = bins + 1)))
  br[1] <- -Inf; br[length(br)] <- Inf
  e <- pmax(tabulate(cut(expected, br, labels = FALSE), length(br) - 1) / length(expected), 1e-4)
  a <- pmax(tabulate(cut(actual,   br, labels = FALSE), length(br) - 1) / length(actual),   1e-4)
  sum((a - e) * log(a / e))
}

# Step-up rate by segment (device class, age band, locale ...). A ratio well above 1 means one
# group carries more of the friction; review before the threshold goes live.
ks_parity <- function(decision, segment, max_ratio = 1.25) {
  up <- decision %in% c("step_up", "step_up_automation")
  tab <- data.frame(segment = names(tapply(up, segment, mean)),
                    n = as.vector(table(segment)),
                    step_up_rate = as.vector(tapply(up, segment, mean)))
  tab$ratio_to_overall <- tab$step_up_rate / mean(up)
  tab$review <- tab$ratio_to_overall > max_ratio
  tab
}

# ---- 6. JSON in, JSON out (wrap in plumber, an AWS Lambda, or any HTTP handler) -------
ks_score_json <- function(json, reference, threshold, weights = KS_DEFAULT_WEIGHTS) {
  p <- jsonlite::fromJSON(json, simplifyVector = FALSE)
  x <- ks_features(p)
  s <- ks_score(x, reference, weights)
  jsonlite::toJSON(list(score = round(s$score, 3), decision = ks_decide(s, threshold),
                        reasons = if (nzchar(s$reasons)) strsplit(s$reasons, ";")[[1]] else list(),
                        device = s$device, n_keys = x$n_keys,
                        model = list(reference_created = format(reference$created, "%Y-%m-%d"),
                                     threshold = round(threshold, 3))),
                   auto_unbox = TRUE)
}
