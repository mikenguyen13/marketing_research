# A synthetic ad platform for practising the PIE workflow of Gordon, Moakler &
# Zettelmeyer (2026, Management Science). The Meta experiments behind the paper are
# proprietary, so this file does NOT reproduce the paper's empirical numbers. It
# builds a campaign-level population whose aggregates have the qualitative shape the
# paper reports (last-click overstates incrementality, more so in travel than in
# e-commerce; last-click is still highly rank-correlated with the truth) and then
# runs the paper's pipeline on it:
#   1. ICPD (incremental conversions per dollar) as the target,
#   2. random forests on pre-determined and post-determined features,
#   3. spend-weighted out-of-sample R^2 against raw last-click,
#   4. the industry "calibration factor" (one RCT's ICPD / LCC ratio) as a benchmark,
#   5. learning curve, new-advertiser (group) cross-validation,
#   6. go/no-go disagreement with the RCT at thresholds of 50-150% of segment medians.

simulate_platform <- function(n_adv = 450, rct_per_adv = 5, seed = 1,
                              sel_v = c(Ecomm = 0.07, Retail = 0.085, Travel = 0.18, Other = 0.06),
                              ret_sel = 0.7) {
  set.seed(seed)
  verticals <- c("Ecomm", "Retail", "Travel", "Other")
  adv <- data.frame(
    adv_id   = seq_len(n_adv),
    vertical = sample(verticals, n_adv, TRUE, prob = c(.30, .25, .17, .28)),
    adv_size = sample(c("Small", "Medium", "Large"), n_adv, TRUE, prob = c(.1, .6, .3)),
    adv_eff  = rnorm(n_adv, 0, 0.35),         # advertiser-level creative/product quality
    adv_kappa = rnorm(n_adv, 0.9, 0.6),       # advertiser-level share of lift last-click catches
    adv_tenure = runif(n_adv, 1, 120)         # months on the platform (a logged descriptor)
  )
  # sel_v: share of an exposed clicker's baseline (would-have-bought-anyway)
  # conversion that last-click credits to the ad, by vertical; ret_sel raises it
  # for retargeting. Defaults put mean LCC-7D/$ over mean ICPD near the paper's
  # ratios (about 1.2 e-commerce, 1.5 retail, 2.0 travel; 1.33 overall).
  # campaigns
  n   <- n_adv * rct_per_adv
  cmp <- adv[sample(n_adv, n, TRUE), ]
  cmp$funnel      <- sample(c("Lower", "Mid", "Upper"), n, TRUE)
  cmp$retargeting <- rbinom(n, 1, 0.35)
  cmp$year        <- sample(2019:2020, n, TRUE, prob = c(.55, .45))
  cmp$bid_auto    <- rbinom(n, 1, 0.6)
  cmp$spend       <- exp(rnorm(n, log(60000), 0.9)) *
                     c(Small = .3, Medium = 1, Large = 3)[cmp$adv_size]
  cpm             <- 8 * exp(rnorm(n, 0, 0.25))                    # $ per 1,000 impressions
  users           <- cmp$spend / cpm * 1000 / 3                     # ~3 impressions per user
  cmp$exposure    <- plogis(1.1 + 0.4 * cmp$bid_auto - 0.5 * cmp$retargeting + rnorm(n, 0, .5))
  f_mult          <- c(Lower = 1, Mid = 2.5, Upper = 8)[cmp$funnel]
  # baseline conversion rate among exposed users: retargeted audiences buy anyway
  base            <- 0.004 * f_mult * exp(0.9 * cmp$retargeting + rnorm(n, 0, .45))
  # relative lift: heterogeneous, correlated with advertiser quality, smaller in retargeting
  lift            <- exp(log(0.25) + cmp$adv_eff - 0.6 * cmp$retargeting +
                         0.15 * (cmp$year == 2020) + rnorm(n, 0, .45))
  att             <- base * lift                                    # ATT per exposed user
  n_exp           <- users * cmp$exposure
  incr            <- att * n_exp
  ctr             <- 0.012 * exp(0.3 * cmp$adv_eff + rnorm(n, 0, .3))
  # last-click credits: a share of the truly incremental conversions plus selected
  # baseline conversions of clickers; a 1-day window captures fewer of both
  kappa7          <- plogis(cmp$adv_kappa + rnorm(n, 0, .25))
  lcc7            <- kappa7 * incr + sel_v[cmp$vertical] * (1 + ret_sel * cmp$retargeting) *
                     base * n_exp * (1 + 25 * ctr)
  lcc1            <- lcc7 * plogis(rnorm(n, 0.6, .3))
  ybar_t          <- (base + att) * cmp$exposure + base * 0.6 * (1 - cmp$exposure)
  # the RCT estimate carries sampling noise (control group ~10% of users)
  se_incr         <- sqrt(n_exp * base * 1.1 + n_exp^2 * base / (0.1 * users))
  cmp$icpd        <- (incr + rnorm(n, 0, se_incr)) / cmp$spend      # RCT-estimated target
  cmp$icpd_true   <- incr / cmp$spend
  cmp$ybar_t      <- ybar_t
  cmp$lcc7_pd     <- lcc7 / cmp$spend
  cmp$lcc1_pd     <- lcc1 / cmp$spend
  cmp$ctr         <- ctr
  cmp$log_spend   <- log(cmp$spend)
  for (v in c("vertical", "adv_size", "funnel")) cmp[[v]] <- factor(cmp[[v]])
  rownames(cmp) <- NULL
  cmp
}

pie_specs <- list(
  "PIE(Pre)"             = c("vertical", "adv_size", "funnel", "retargeting", "year",
                             "bid_auto", "log_spend", "adv_tenure"),
  "PIE(Pre, Yt)"         = c("vertical", "adv_size", "funnel", "retargeting", "year",
                             "bid_auto", "log_spend", "adv_tenure", "ybar_t"),
  "PIE(Pre, Yt, LCC-7D)" = c("vertical", "adv_size", "funnel", "retargeting", "year",
                             "bid_auto", "log_spend", "adv_tenure", "ybar_t", "lcc7_pd"),
  "PIE(Full)"            = c("vertical", "adv_size", "funnel", "retargeting", "year",
                             "bid_auto", "log_spend", "adv_tenure", "ybar_t", "lcc7_pd", "lcc1_pd",
                             "exposure", "ctr")
)

wr2 <- function(obs, pred, w) {
  w <- w / sum(w)
  1 - sum(w * (obs - pred)^2) / sum(w * (obs - sum(w * obs))^2)
}

# k-fold cross-validated predictions; group = adv_id gives "new advertiser" folds
cv_predict <- function(d, feats, k = 10, group = NULL, num.trees = 300) {
  folds <- if (is.null(group)) sample(rep_len(1:k, nrow(d))) else {
    g <- unique(d[[group]]); gf <- sample(rep_len(1:k, length(g)))
    gf[match(d[[group]], g)]
  }
  pred <- numeric(nrow(d))
  for (j in 1:k) {
    tr  <- folds != j
    fit <- ranger::ranger(x = d[tr, feats, drop = FALSE], y = d$icpd[tr],
                          case.weights = d$spend[tr], num.trees = num.trees,
                          min.node.size = 5, seed = j)
    pred[!tr] <- predict(fit, d[!tr, feats, drop = FALSE])$predictions
  }
  pred
}

# The "calibration factor" practice: run ONE RCT, compute ICPD / LCC, scale every
# other campaign's last-click count by that ratio. Averaged over which RCT you ran.
calibration_factor_r2 <- function(d, draws = 200) {
  mean(replicate(draws, {
    i <- sample(nrow(d), 1)
    wr2(d$icpd[-i], d$lcc7_pd[-i] * d$icpd[i] / d$lcc7_pd[i], d$spend[-i])
  }))
}

disagreement <- function(d, pred, grid = seq(0.5, 1.5, by = 0.1)) {
  seg <- interaction(d$vertical, d$funnel)
  med <- ave(d$icpd, seg, FUN = median)
  do.call(rbind, lapply(grid, function(m) {
    k <- m * med
    rct <- d$icpd > k; mod <- pred > k
    data.frame(threshold = m, type1 = mean(mod & !rct), type2 = mean(!mod & rct),
               disagree = mean(mod != rct))
  }))
}

if (sys.nframe() == 0) {
  d <- simulate_platform()
  cat("RCTs:", nrow(d), " advertisers:", length(unique(d$adv_id)), "\n")
  cat("mean LCC-7D/$ over mean ICPD:",
      round(tapply(d$lcc7_pd, d$vertical, mean) / tapply(d$icpd, d$vertical, mean), 2), "\n")
  cat("Spearman(LCC-7D/$, ICPD):", round(cor(d$lcc7_pd, d$icpd, method = "spearman"), 2), "\n")
  set.seed(2)
  r2 <- sapply(pie_specs, function(f) wr2(d$icpd, cv_predict(d, f), d$spend))
  r2 <- c(r2, "Raw LCC-7D" = wr2(d$icpd, d$lcc7_pd, d$spend),
          "Calibration factor (1 RCT)" = calibration_factor_r2(d))
  print(round(r2, 3))
}
