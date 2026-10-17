# Simulation DGP of Gordon, Moakler & Zettelmeyer (2026), "Predicted Incrementality
# by Experimentation (PIE) for Ad Measurement," Management Science, Appendix 3
# (arXiv:2304.06828v2). Each campaign r draws structural parameters; each user i
# draws a latent propensity U ~ U(0,1) that drives exposure, clicks, and the
# baseline conversion probability. Users are split in two halves: half 1 builds
# the outcome (the campaign's ATT), half 2 builds the test-group features, so
# features and outcome share no sampling noise (the paper's sample-splitting step).

draw_campaigns <- function(R, p = list()) {
  d <- modifyList(list(
    alpha = c(0.13, 0.17), tau = c(0.02, 0.06), rho = 0,
    gamma = c(0, 0), delta = c(0, 0), pE = c(1, 1),
    CP = c(0, 0.1), beta_cp = 0.1
  ), p)
  z1 <- rnorm(R); z2 <- d$rho * z1 + sqrt(1 - d$rho^2) * rnorm(R)  # Gaussian copula
  u  <- function(r) r[1] + (r[2] - r[1]) * runif(R)
  data.frame(
    alpha = d$alpha[1] + diff(d$alpha) * pnorm(z1),
    tau   = d$tau[1]   + diff(d$tau)   * pnorm(z2),
    gamma = u(d$gamma), delta = u(d$delta), pE = u(d$pE), CP = u(d$CP),
    beta_cp = d$beta_cp
  )
}

# One campaign: returns the label (from half 1) and four features (from half 2).
# outcome = "realized": mean of Y_t - Y_c, both Bernoulli draws taken with common
#           random numbers (one uniform per user), a realized treatment effect.
# outcome = "expected": mean of Prob_T - Prob_C, the expected treatment effect.
sim_campaign <- function(cp, n, outcome = c("realized", "expected")) {
  outcome <- match.arg(outcome)
  U  <- runif(n)
  D  <- as.numeric(U >= 1 - cp$pE)
  C  <- D * (runif(n) < pmin(1, cp$CP + cp$beta_cp * U))
  pc <- cp$alpha + cp$gamma * U
  pt <- pc + cp$tau * D + cp$delta * C
  e  <- runif(n)
  yt <- as.numeric(e < pt); yc <- as.numeric(e < pc)
  h1 <- seq_len(n) <= n %/% 2; h2 <- !h1
  # label = incremental conversions per user in half 1 (the paper's "observed
  # incremental conversions"); it equals ATT x exposure rate, and the ATT itself
  # under full compliance
  inc <- if (outcome == "realized") mean(yt[h1] - yc[h1]) else mean(pt[h1] - pc[h1])
  c(att = inc,
    y_t = mean(yt[h2]), phi = mean(D[h2]), clk = mean(C[h2]), lcc = mean(yt[h2] * C[h2]))
}

sim_rcts <- function(R, n, p = list(), outcome = "realized") {
  cps <- draw_campaigns(R, p)
  out <- t(vapply(seq_len(R), function(r) sim_campaign(cps[r, ], n, outcome), numeric(5)))
  as.data.frame(out)
}

# Out-of-sample R^2 of the four nested OLS specifications (50/50 campaign split).
pie_r2 <- function(dat) {
  tr <- sample(nrow(dat), nrow(dat) %/% 2); te <- setdiff(seq_len(nrow(dat)), tr)
  specs <- list(y_t = att ~ y_t, y_t_phi = att ~ y_t + phi,
                y_t_phi_C = att ~ y_t + phi + clk, full = att ~ y_t + phi + clk + lcc)
  sapply(specs, function(f) {
    fit <- lm(f, data = dat[tr, ])
    # rank-deficient columns (phi is constant under full compliance) predict as 0
    pred <- suppressWarnings(predict(fit, newdata = dat[te, ]))
    cbind(obs = dat$att[te], pred = pred)
  }, simplify = FALSE)
}

# Pool test-set predictions over reps, then compute one R^2 per spec (paper's rule).
run_scenario <- function(p = list(), R = 1000, n = 10000, reps = 20, outcome = "realized") {
  pooled <- NULL
  for (k in seq_len(reps)) {
    res <- pie_r2(sim_rcts(R, n, p, outcome))
    pooled <- if (is.null(pooled)) res else Map(rbind, pooled, res)
  }
  sapply(pooled, function(m) 1 - sum((m[, "obs"] - m[, "pred"])^2) /
                               sum((m[, "obs"] - mean(m[, "obs"]))^2))
}
