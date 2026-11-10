# Meta-analytic overall evaluation criteria (OEC) for A/B tests.
#
# R implementation of the estimators in
#   Huch, Nail, Melconian, Vongsathorn & Feinberg (2026), "Overall Evaluation
#   Criteria for A/B Tests: A Meta-Analytic Approach", Marketing Science,
#   doi:10.1287/mksc.2025.0164
# written from the paper's Section 4 and Appendix B. The authors' own code is
# Python; this is an independent reimplementation in base R (no packages).
#
# Data layout used throughout
#   z      T x p matrix of estimated treatment effects, one row per A/B test.
#          Columns 1..r are the KPIs (y), columns r+1..p the proxies (x).
#   Sigma  p x p x T array; Sigma[, , t] is the sampling covariance of z[t, ].
#   obs    optional T x p logical matrix; FALSE marks a metric not yet observed
#          for that test (paper eq. 6). Missing entries of z may hold anything.
#
# Every sampler returns posterior draws of mu_t (n_keep x T x p) so that any
# OEC f(mu_y) can be evaluated draw by draw.

# ---- small linear-algebra helpers -------------------------------------------

rmvn <- function(mean, cov) {
  drop(mean + crossprod(chol(cov), rnorm(length(mean))))
}

# Omega ~ inverse-Wishart(Psi, nu)  <=>  Omega^{-1} ~ Wishart(Psi^{-1}, nu)
riwish <- function(nu, Psi) {
  chol2inv(chol(rWishart(1, nu, chol2inv(chol(Psi)))[, , 1]))
}

# A' (A M A')^{-1} A for the selection matrix A that keeps the observed metrics:
# the precision contributed by a partially observed test (paper eq. 6, B.2).
prec_obs <- function(M, o) {
  out <- matrix(0, nrow(M), ncol(M))
  if (any(o)) out[o, o] <- chol2inv(chol(M[o, o, drop = FALSE]))
  out
}

# log density of a multivariate Student-t with location m, scale matrix S, df
ldmvt <- function(x, m, S, df) {
  p <- length(x)
  R <- chol(S)
  q <- sum(backsolve(R, x - m, transpose = TRUE)^2)
  lgamma((df + p) / 2) - lgamma(df / 2) - p / 2 * log(df * pi) -
    sum(log(diag(R))) - (df + p) / 2 * log1p(q / df)
}

# ---- the naive single-test benchmark (paper eq. 1-2) ------------------------

oec_naive <- function(z, Sigma, r) {
  u <- c(rep(1, r), rep(0, ncol(z) - r))
  est <- drop(z %*% u)
  se <- sqrt(apply(Sigma, 3, function(S) drop(t(u) %*% S %*% u)))
  data.frame(est = est, se = se, lo = est - qnorm(.975) * se,
             hi = est + qnorm(.975) * se)
}

# ---- conditional draw of every mu_t given its prior N(eta_t, Omega_t) -------
# eta: T x p matrix of prior means; Omega: list or array of prior covariances
# indexed by `idx` (length T). Implements eq. (5b) / (6).

draw_mu <- function(z, Sigma, obs, eta, Omega_inv, idx, scale = NULL) {
  T <- nrow(z); p <- ncol(z)
  mu <- matrix(0, T, p)
  for (t in seq_len(T)) {
    Oi <- Omega_inv[, , idx[t]]
    if (!is.null(scale)) Oi <- Oi / scale[t]          # prior cov = scale * Omega
    o <- obs[t, ]
    Si <- prec_obs(Sigma[, , t], o)
    V <- chol2inv(chol(Oi + Si))
    zt <- z[t, ]; zt[!o] <- 0
    m <- V %*% (Oi %*% eta[t, ] + Si %*% zt)
    mu[t, ] <- rmvn(drop(m), V)
  }
  mu
}

# collapsed draw of a location eta given z_t ~ N(eta, Omega_t + Sigma_t), t in S
# with prior N(m0, V0)  (paper eq. B.2 and B.5)
draw_eta <- function(z, Sigma, obs, S, Omega, m0, V0_inv, scale = NULL) {
  P <- V0_inv
  b <- V0_inv %*% m0
  for (t in S) {
    o <- obs[t, ]
    Om <- if (is.null(scale)) Omega else Omega * scale[t]
    W <- prec_obs(Om + Sigma[, , t], o)
    zt <- z[t, ]; zt[!o] <- 0
    P <- P + W
    b <- b + W %*% zt
  }
  V <- chol2inv(chol(P))
  rmvn(drop(V %*% b), V)
}

# ---- Gaussian and Student-t random-effects models (Appendix B.1, B.2) -------
#   mu_t ~ N(eta, Omega)                      model = "gaussian"
#   mu_t ~ t(eta, Omega, gamma)               model = "t"
#   fix_eta = TRUE pins eta at eta0: the paper's "Gaussian-0" variant.
# Priors: eta ~ N(eta0, Phi), Omega ~ IW(Psi, nu), log(gamma) ~ N(lg_mean, lg_sd).

gibbs_re <- function(z, Sigma, n_iter = 3000, burn = 1000, model = "gaussian",
                     fix_eta = FALSE, obs = NULL,
                     eta0 = rep(0, ncol(z)), Phi = diag(ncol(z)),
                     Psi = 8 * diag(ncol(z)), nu = 8,
                     lg_mean = 2, lg_sd = 1, lg_step = 0.4) {
  T <- nrow(z); p <- ncol(z)
  if (is.null(obs)) obs <- matrix(TRUE, T, p)
  Phi_inv <- chol2inv(chol(Phi))
  mu <- z; mu[!obs] <- 0
  eta <- if (fix_eta) eta0 else colMeans(mu)
  gam <- exp(lg_mean); d <- rep(gam, T)
  keep <- n_iter - burn
  out <- list(mu = array(0, c(keep, T, p)), eta = matrix(0, keep, p),
              Omega = array(0, c(keep, p, p)), gamma = numeric(keep))
  for (it in seq_len(n_iter)) {
    E <- sweep(mu, 2, eta)
    w <- if (model == "t") d / gam else rep(1, T)
    # Omega | mu, eta (, d)                                      eq. (B.1)
    Omega <- riwish(nu + T, Psi + crossprod(E * sqrt(w)))
    Omega_inv <- chol2inv(chol(Omega))
    if (model == "t") {
      q <- rowSums((E %*% Omega_inv) * E)
      # gamma | mu, eta, Omega with d integrated out: random-walk MH on log gamma
      ll <- function(g) sum(lgamma((g + p) / 2) - lgamma(g / 2) -
                              p / 2 * log(g) - (g + p) / 2 * log1p(q / g))
      lg <- log(gam); lg_new <- lg + rnorm(1, 0, lg_step)
      a <- ll(exp(lg_new)) + dnorm(lg_new, lg_mean, lg_sd, log = TRUE) -
        ll(gam) - dnorm(lg, lg_mean, lg_sd, log = TRUE)
      if (log(runif(1)) < a) gam <- exp(lg_new)
      # d_t | gamma, mu_t, eta, Omega
      d <- rgamma(T, (gam + p) / 2, rate = (1 + q / gam) / 2)
    }
    sc <- if (model == "t") gam / d else NULL
    # eta | Omega, z with mu integrated out                       eq. (B.2)
    if (!fix_eta)
      eta <- draw_eta(z, Sigma, obs, seq_len(T), Omega, eta0, Phi_inv, sc)
    # mu_t | eta, Omega, z_t                                      eq. (5)
    mu <- draw_mu(z, Sigma, obs, matrix(eta, T, p, byrow = TRUE),
                  array(Omega_inv, c(p, p, 1)), rep(1, T), sc)
    if (it > burn) {
      k <- it - burn
      out$mu[k, , ] <- mu; out$eta[k, ] <- eta
      out$Omega[k, , ] <- Omega; out$gamma[k] <- gam
    }
  }
  out
}

# ---- Dirichlet process mixture of Gaussians (Appendix B.3) ------------------
#   mu_t | c_t ~ N(eta_{c_t}, Omega_{c_t}),  (eta_k, Omega_k) ~ NIW(eta0, phi, Psi, nu)
# Collapsed sampler (Neal 2000, algorithm 3) for the cluster labels, then the
# paper's blocked updates for Omega_k, eta_k and mu_t.
#
# Hyperpriors: alpha0 ~ Gamma(a_alpha, b_alpha)  (Escobar & West 1995 update),
#   eta0 ~ N(0, I), phi ~ Gamma(1, 1), and Psi ~ Wishart(Psi_V, Psi_df).
# The paper puts an inverse-Wishart hyperprior on Psi, which needs a Metropolis
# step; a Wishart hyperprior with the same prior mean is conditionally conjugate
# and is what is used here. nu is fixed, as in the paper.
#
# fixed_c: supply known group labels to get the paper's "metaregression" (MR)
# variant, in which cluster membership is observed rather than inferred.

gibbs_dpm <- function(z, Sigma, n_iter = 3000, burn = 1000, obs = NULL,
                      fixed_c = NULL, nu = 10, a_alpha = 4, b_alpha = 4,
                      Psi_V = diag(ncol(z)) / 2, Psi_df = 8, K_init = 5,
                      keep_Omega = FALSE) {
  T <- nrow(z); p <- ncol(z)
  if (is.null(obs)) obs <- matrix(TRUE, T, p)
  mu <- z; mu[!obs] <- 0
  cl <- if (!is.null(fixed_c)) as.integer(factor(fixed_c)) else
    as.integer(kmeans(mu, K_init)$cluster)
  eta0 <- rep(0, p); phi <- 1; alpha0 <- a_alpha / b_alpha
  Psi <- Psi_V * Psi_df
  keep <- n_iter - burn
  out <- list(mu = array(0, c(keep, T, p)), cl = matrix(0L, keep, T),
              K = integer(keep), alpha0 = numeric(keep))
  if (keep_Omega) out$Om_t <- array(0, c(keep, T, p, p))

  niw_post <- function(n, s, SS) {            # paper eq. (B.4)
    if (n == 0) return(list(nu = nu, phi = phi, eta = eta0, Psi = Psi))
    mbar <- s / n
    S <- SS - n * tcrossprod(mbar)
    list(nu = nu + n, phi = phi + n, eta = (phi * eta0 + s) / (phi + n),
         Psi = Psi + S + phi * n / (phi + n) * tcrossprod(mbar - eta0))
  }
  lpred <- function(x, n, s, SS) {            # paper eq. (B.3)
    h <- niw_post(n, s, SS)
    df <- h$nu - p + 1
    ldmvt(x, h$eta, (1 + 1 / h$phi) * h$Psi / df, df)
  }

  for (it in seq_len(n_iter)) {
    K <- max(cl)
    n <- tabulate(cl, K)
    s <- rowsum(mu, cl, reorder = TRUE)                       # K x p
    SS <- array(0, c(p, p, K))
    for (k in seq_len(K)) SS[, , k] <- crossprod(mu[cl == k, , drop = FALSE])

    if (is.null(fixed_c)) {
      for (t in seq_len(T)) {
        k0 <- cl[t]; x <- mu[t, ]; xx <- tcrossprod(x)
        n[k0] <- n[k0] - 1; s[k0, ] <- s[k0, ] - x; SS[, , k0] <- SS[, , k0] - xx
        if (n[k0] == 0) {                     # drop the emptied cluster
          n <- n[-k0]; s <- s[-k0, , drop = FALSE]; SS <- SS[, , -k0, drop = FALSE]
          cl[cl > k0] <- cl[cl > k0] - 1L; K <- K - 1L
        }
        lp <- numeric(K + 1)
        for (k in seq_len(K)) lp[k] <- log(n[k]) + lpred(x, n[k], s[k, ], SS[, , k])
        lp[K + 1] <- log(alpha0) + lpred(x, 0, 0, 0)
        k1 <- sample.int(K + 1, 1, prob = exp(lp - max(lp)))
        if (k1 > K) {
          K <- K + 1L; n <- c(n, 0); s <- rbind(s, 0)
          SS <- array(c(SS, rep(0, p * p)), c(p, p, K))
        }
        cl[t] <- k1
        n[k1] <- n[k1] + 1; s[k1, ] <- s[k1, ] + x; SS[, , k1] <- SS[, , k1] + xx
      }
    }

    # Omega_k | mu, c  then  eta_k | Omega_k, z (mu integrated out)   eq. (B.5)
    Omega <- array(0, c(p, p, K)); Omega_inv <- Omega; eta <- matrix(0, K, p)
    for (k in seq_len(K)) {
      h <- niw_post(n[k], s[k, ], SS[, , k])
      Omega[, , k] <- riwish(h$nu, h$Psi)
      Omega_inv[, , k] <- chol2inv(chol(Omega[, , k]))
      eta[k, ] <- draw_eta(z, Sigma, obs, which(cl == k), Omega[, , k],
                           eta0, phi * Omega_inv[, , k])
    }
    # mu_t | eta_{c_t}, Omega_{c_t}, z_t                              eq. (5)
    mu <- draw_mu(z, Sigma, obs, eta[cl, , drop = FALSE], Omega_inv, cl)

    # hyperparameters
    if (is.null(fixed_c)) {
      kap <- rbeta(1, alpha0 + 1, T)
      odds <- (a_alpha + K - 1) / (T * (b_alpha - log(kap)))
      alpha0 <- rgamma(1, a_alpha + K - (runif(1) > odds / (1 + odds)),
                       rate = b_alpha - log(kap))
    }
    P <- diag(p); b <- rep(0, p); qsum <- 0; Oi_sum <- matrix(0, p, p)
    for (k in seq_len(K)) {
      P <- P + phi * Omega_inv[, , k]
      b <- b + phi * Omega_inv[, , k] %*% eta[k, ]
      Oi_sum <- Oi_sum + Omega_inv[, , k]
    }
    V <- chol2inv(chol(P)); eta0 <- rmvn(drop(V %*% b), V)
    for (k in seq_len(K)) {
      e <- eta[k, ] - eta0
      qsum <- qsum + drop(t(e) %*% Omega_inv[, , k] %*% e)
    }
    phi <- rgamma(1, 1 + K * p / 2, rate = 1 + qsum / 2)
    Psi <- rWishart(1, Psi_df + K * nu,
                    chol2inv(chol(chol2inv(chol(Psi_V)) + Oi_sum)))[, , 1]

    if (it > burn) {
      k <- it - burn
      out$mu[k, , ] <- mu; out$cl[k, ] <- cl; out$K[k] <- K
      out$alpha0[k] <- alpha0
      if (keep_Omega) for (t in seq_len(T)) out$Om_t[k, t, , ] <- Omega[, , cl[t]]
    }
  }
  out
}

# ---- posterior summaries ----------------------------------------------------

# OEC draws for the summed OEC of the paper's Example 2 (or any f of mu_y)
oec_draws <- function(fit, r, f = rowSums) {
  d <- dim(fit$mu)
  matrix(f(matrix(fit$mu[, , seq_len(r), drop = FALSE], d[1] * d[2], r)), d[1], d[2])
}

oec_summary <- function(fit, r, f = rowSums) {
  D <- oec_draws(fit, r, f)
  data.frame(est = colMeans(D), se = apply(D, 2, sd),
             lo = apply(D, 2, quantile, .025), hi = apply(D, 2, quantile, .975))
}

# Surrogacy measures of Section 4.1 for one prior covariance Omega and one
# test's sampling covariance Sigma_t, for the summed OEC over the first r metrics:
#   R2  share of prior OEC variance explained by the proxies          eq. (7)
#   TVR posterior variance / naive variance  (= PVR * SVR)
#   PVR variance ratio from the prior on the KPIs alone (proxies discarded)
#   SVR further ratio from adding the proxies
surrogacy <- function(Omega, Sigma_t, r) {
  p <- nrow(Omega); iy <- seq_len(r); ix <- (r + 1):p
  one <- rep(1, r); u <- c(one, rep(0, p - r))
  R2 <- drop(t(one) %*% Omega[iy, ix] %*% solve(Omega[ix, ix], Omega[ix, iy]) %*% one) /
    drop(t(one) %*% Omega[iy, iy] %*% one)
  v0 <- drop(t(u) %*% Sigma_t %*% u)
  vz <- drop(t(u) %*% solve(solve(Omega) + solve(Sigma_t)) %*% u)
  vy <- drop(t(one) %*% solve(solve(Omega[iy, iy]) + solve(Sigma_t[iy, iy])) %*% one)
  c(R2 = R2, TVR = vz / v0, PVR = vy / v0, SVR = vz / vy)
}
