# Overlap violation under algorithmic ad allocation, and a matrix-completion fix.
# Companion to the ch10 section on Rafieian (2026, Marketing Science).
#
# Part 1 re-runs the known-propensity simulation of the 2023 working paper
# (Table 1): three regions -- deterministic no-assignment (pi = 0), probabilistic
# (0 < pi < 1), deterministic assignment (pi = 1) -- each with its own CATE.
# Part 2 is a toy version of the paper's cross-campaign idea: a low-rank
# user-by-campaign CATE matrix, cells with pi in {0, 1} masked, the rest
# observed with noise, and softImpute used to fill the masked cells.

# ---- Part 1: bias from deterministic assignment -----------------------------

sim_regions <- function(N, tau, alpha, sigma = 3) {
  # tau = c(tau0, tau1, taur); alpha = c(alpha0, alpha1, alphar)
  region <- sample(c("0", "1", "r"), N, replace = TRUE, prob = alpha)
  pi <- ifelse(region == "0", 0, ifelse(region == "1", 1, runif(N)))
  W <- rbinom(N, 1, pi)
  tau_i <- ifelse(region == "0", tau[1], ifelse(region == "1", tau[2], tau[3]))
  Y <- W * tau_i + rnorm(N, 0, sigma)
  data.frame(Y, W, pi, region)
}

estimate_ate <- function(d) {
  md <- mean(d$Y[d$W == 1]) - mean(d$Y[d$W == 0])
  # Robinson partialling-out with the known propensity: the residual W - pi is
  # exactly zero wherever pi is 0 or 1, so those rows drop out of the slope.
  k <- d$pi > 0 & d$pi < 1
  plr <- NA
  if (any(k)) {
    dk <- d[k, ]
    r <- dk$W - dk$pi
    m_hat <- fitted(lm(Y ~ splines::ns(pi, 4), data = dk))
    plr <- sum(r * (dk$Y - m_hat)) / sum(r^2)
  }
  # Inverse-propensity weighting, trimming the rows where a weight is undefined
  ips <- if (any(k)) mean(d$Y[k] * (d$W[k] / d$pi[k] - (1 - d$W[k]) / (1 - d$pi[k]))) else NA
  c(md = md, plr = plr, ips = ips)
}

table1_rows <- list(
  list(N = 1e5, tau = c(1, 8, 2),   alpha = c(0.25, 0.25, 0.50)),
  list(N = 1e5, tau = c(1, 8, 2),   alpha = c(0.50, 0.50, 0.00)),
  list(N = 1e5, tau = c(1, 6, 2),   alpha = c(0.40, 0.10, 0.50)),
  list(N = 1e5, tau = c(-1, -8, 2), alpha = c(0.10, 0.10, 0.80)),
  list(N = 1e3, tau = c(1, 8, 2),   alpha = c(0.25, 0.25, 0.50))
)

run_table1 <- function(seed = 2026) {
  set.seed(seed)
  do.call(rbind, lapply(table1_rows, function(p) {
    est <- estimate_ate(sim_regions(p$N, p$tau, p$alpha))
    data.frame(
      N = format(p$N, scientific = TRUE),
      tau = paste0("{", paste(p$tau, collapse = ", "), "}"),
      alpha = paste0("{", paste(format(p$alpha, nsmall = 2), collapse = ", "), "}"),
      true_ate = sum(p$alpha * p$tau),
      tau_r = p$tau[3],
      md = est[["md"]], plr = est[["plr"]], ips = est[["ips"]]
    )
  }))
}

# ---- Part 2: toy cross-campaign matrix completion ----------------------------

run_completion <- function(N = 2000, J = 40, rank = 2, share_never = 0.4,
                           share_always = 0.1, noise_sd = 0.5, seed = 2026) {
  set.seed(seed)
  # Low-rank CATE matrix: user factors times campaign loadings, plus a
  # campaign-specific mean effect.
  U <- matrix(rnorm(N * rank), N, rank)
  V <- matrix(rnorm(J * rank, sd = 0.7), J, rank)
  tau <- U %*% t(V) + matrix(runif(J, 0.5, 2), N, J, byrow = TRUE)

  # The allocation algorithm scores users on a noisy prediction of their effect
  # (Proposition 3 of the paper: assignment correlated with the CATE). The top
  # share_always of scores always win the impression; the bottom share_never
  # never do. The two shares differ, as they do when most users are outbid.
  score <- tau + matrix(rnorm(N * J, sd = 0.5), N, J)
  F_mat <- matrix(TRUE, N, J)
  for (j in seq_len(J)) {
    q <- quantile(score[, j], c(share_never, 1 - share_always))
    F_mat[score[, j] <= q[1] | score[, j] >= q[2], j] <- FALSE
  }

  # Identifiable cells get an unbiased but noisy CATE estimate; the rest are NA.
  tau_hat <- tau + matrix(rnorm(N * J, sd = noise_sd), N, J)
  tau_hat[!F_mat] <- NA

  fit <- softImpute::softImpute(tau_hat, rank.max = rank + 2, lambda = 1,
                                type = "als", maxit = 200)
  tau_complete <- softImpute::complete(tau_hat, fit)

  data.frame(
    campaign = seq_len(J),
    true_ate = colMeans(tau),
    overlap_only = colSums(tau_hat, na.rm = TRUE) / colSums(F_mat),
    completed = colMeans(tau_complete)
  )
}
