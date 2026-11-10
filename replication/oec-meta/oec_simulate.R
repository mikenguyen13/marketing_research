# Simulation study in the spirit of Section 5 of Huch et al. (2026).
#
# The paper simulates from a DPM fitted to 190 confidential Zillow tests. That
# fit is not public, so the data-generating process below is OURS: a six-cluster
# mixture over p = 5 effects (2 KPIs + 3 proxies) for T = 190 tests, with
# heavy-tailed heterogeneity in test precision. It reproduces the paper's design
# (methods, metrics, pairwise comparisons), not its numbers.
#
# Usage (from the repository root):
#   Rscript replication/oec-meta/oec_simulate.R [n_rep] [n_iter] [burn] [cores]
# Defaults: 40 replicates, 3,000 iterations, 1,000 warm-up, 10 cores.

args <- commandArgs(trailingOnly = TRUE)
n_rep  <- if (length(args) >= 1) as.integer(args[1]) else 40L
n_iter <- if (length(args) >= 2) as.integer(args[2]) else 3000L
burn   <- if (length(args) >= 3) as.integer(args[3]) else 1000L
cores  <- if (length(args) >= 4) as.integer(args[4]) else 10L
here <- "replication/oec-meta"

# ---- data-generating process ------------------------------------------------

oec_dgp <- function(T = 190, seed = 1) {
  set.seed(seed)
  p <- 5; r <- 2                         # y1, y2 | x1, x2, x3
  # Cross-test correlation of true effects: (y1, x1) and (y2, x2) move together,
  # the pairs are nearly unrelated, and x3 is a general engagement proxy.
  R <- matrix(c(1.00, 0.10, 0.75, 0.10, 0.50,
                0.10, 1.00, 0.10, 0.85, 0.50,
                0.75, 0.10, 1.00, 0.10, 0.50,
                0.10, 0.85, 0.10, 1.00, 0.50,
                0.50, 0.50, 0.50, 0.50, 1.00), p, p)
  clusters <- list(                      # weight, mean, sd of true effects
    list(w = .50, eta = c(0, 0, 0, 0, 0),                sd = .10),  # minor tweaks
    list(w = .20, eta = c(.05, .05, .10, .10, .10),      sd = .30),  # ordinary features
    list(w = .10, eta = c(.60, 0, .80, 0, .40),          sd = .25),  # line of business 1
    list(w = .08, eta = c(0, .50, 0, .70, .40),          sd = .25),  # line of business 2
    list(w = .07, eta = c(-.40, -.30, -.50, -.40, -.50), sd = .35),  # harmful redesigns
    list(w = .05, eta = c(1.2, 1.0, 1.5, 1.2, 1.5),      sd = .60))  # big wins
  cl <- sample(length(clusters), T, replace = TRUE,
               prob = sapply(clusters, `[[`, "w"))
  mu <- t(sapply(cl, function(k)
    clusters[[k]]$eta + clusters[[k]]$sd * drop(crossprod(chol(R), rnorm(p)))))
  # Sampling noise: KPIs are far noisier than proxies, tests differ widely in
  # size (log-normal scale), and customer-level outcomes are correlated.
  C <- matrix(c(1.0, 0.1, 0.5, 0.1, 0.3,
                0.1, 1.0, 0.1, 0.5, 0.3,
                0.5, 0.1, 1.0, 0.1, 0.3,
                0.1, 0.5, 0.1, 1.0, 0.3,
                0.3, 0.3, 0.3, 0.3, 1.0), p, p)
  noise_mult <- c(2.0, 2.5, 0.5, 0.5, 0.7)
  h <- rlnorm(T, log(0.12), 1.0)
  Sigma <- array(0, c(p, p, T)); z <- matrix(0, T, p)
  for (t in seq_len(T)) {
    s <- h[t] * noise_mult
    Sigma[, , t] <- diag(s) %*% C %*% diag(s)
    z[t, ] <- mu[t, ] + drop(crossprod(chol(Sigma[, , t]), rnorm(p)))
  }
  list(z = z, Sigma = Sigma, mu = mu, cl = cl, r = r, oec = rowSums(mu[, 1:r]))
}

# ---- performance metrics of Section 5.2 -------------------------------------

oec_metrics <- function(s, truth) {
  pick <- s$est > 0                      # ship B when the estimated OEC is positive
  c(correct  = mean(pick == (truth > 0)),
    regret   = mean(pmax(truth, 0) - truth * pick),
    overest  = mean((s$est - truth)[pick]),
    mae      = mean(abs(s$est - truth)),
    ci_len   = mean(s$hi - s$lo),
    coverage = mean(s$lo <= truth & truth <= s$hi))
}

one_rep <- function(rep, n_iter, burn, here) {
  source(file.path(here, "oec_samplers.R"), local = TRUE)
  d <- oec_dgp(seed = 1000 + rep)
  set.seed(5000 + rep)
  fits <- list(
    "N"   = oec_naive(d$z, d$Sigma, d$r),
    "G-0" = oec_summary(gibbs_re(d$z, d$Sigma, n_iter, burn, fix_eta = TRUE), d$r),
    "G"   = oec_summary(gibbs_re(d$z, d$Sigma, n_iter, burn), d$r),
    "T"   = oec_summary(gibbs_re(d$z, d$Sigma, n_iter, burn, model = "t"), d$r),
    "DPM" = oec_summary(gibbs_dpm(d$z, d$Sigma, n_iter, burn), d$r),
    "MR"  = oec_summary(gibbs_dpm(d$z, d$Sigma, n_iter, burn, fixed_c = d$cl), d$r))
  err <- sapply(fits, function(s) abs(s$est - d$oec))
  m <- t(sapply(fits, oec_metrics, truth = d$oec))
  data.frame(rep = rep, method = names(fits), m,
             win_vs_naive = colMeans(err < err[, "N"]),
             mleq_vs_naive = colMeans(log(err / err[, "N"])),
             row.names = NULL)
}

if (sys.nframe() == 0) {
  library(parallel)
  cl <- makeCluster(min(cores, n_rep))
  clusterExport(cl, c("oec_dgp", "oec_metrics"))
  t0 <- Sys.time()
  res <- do.call(rbind, parLapply(cl, seq_len(n_rep), one_rep,
                                  n_iter = n_iter, burn = burn, here = here))
  stopCluster(cl)
  cat("elapsed:", format(Sys.time() - t0), "\n")
  write.csv(res, file.path(here, "oec_simulation_reps.csv"), row.names = FALSE)

  meth <- c("N", "G-0", "G", "T", "DPM", "MR")
  metr <- setdiff(names(res), c("rep", "method"))
  agg <- do.call(rbind, lapply(meth, function(m) {
    x <- res[res$method == m, metr]
    data.frame(method = m, metric = metr, mean = colMeans(x),
               se = apply(x, 2, sd) / sqrt(nrow(x)), row.names = NULL)
  }))
  write.csv(agg, file.path(here, "oec_simulation_summary.csv"), row.names = FALSE)
  print(reshape(agg[, c("method", "metric", "mean")], idvar = "metric",
                timevar = "method", direction = "wide"), digits = 2)
}
