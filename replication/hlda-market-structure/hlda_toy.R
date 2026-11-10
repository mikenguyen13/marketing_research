# Toy reimplementation of the core idea in Qian, Che, Liu, Jiang & Shang (2026, POM),
# "Deriving competitive intelligence from multifaceted user behavior data".
# Not the authors' code (none is public) and not their data (autohome.com.cn scrape).
#
# Three signals per user, as in the paper:
#   favorites  : short lists of seriously considered products  -> product embeddings
#   comments   : products the user commented on (noisier, broader attention)
#   text       : words in those comments
# Four estimators, matching the paper's ablation logic:
#   C      LDA on commented products only                     (paper's HLDA-C)
#   C+T    C plus Correspondence-LDA link to the text          (paper's HLDA-noLF)
#   C+F    two-component mixture: LDA component + softmax over favorites embedding
#          (latent-feature LDA, Nguyen et al. 2015)            (paper's HLDA-noTC)
#   C+F+T  full model                                          (paper's HLDA)
# Outcome: how well each recovers the TRUE submarket of every product (adjusted Rand
# index), for popular products and for niche products separately.
#
# Simplifications relative to the paper: product embeddings come from PPMI + SVD on
# favorites co-occurrence (the closed-form cousin of word2vec); the mixture weight
# lambda is fixed at 0.7 (the paper's tuned value) rather than estimated; the text
# topics psi are sampled from their Dirichlet posterior each sweep (blocked Gibbs)
# rather than collapsed; tau_k is updated by a few gradient steps on the penalized
# log-likelihood after each sweep, as in the paper's Gibbs + regularized-ML scheme.

run_once <- function(seed, U = 1200, K = 6, per_k = 10, n_fav = 4, n_com = 4,
                     n_words = 6, p_text = 0.3, p_explore = 0.4, iters = 200, burn = 150,
                     lambda = 0.7, d = 10) {
  set.seed(seed)
  E <- K * per_k
  truth <- rep(1:K, each = per_k)
  rank_in_k <- rep(1:per_k, K)
  pop <- 1 / rank_in_k                      # Zipf popularity within submarket
  niche <- rank_in_k > per_k / 2

  # ---- simulate users -------------------------------------------------------
  V_k <- 8; V_bg <- 20; V <- K * V_k + V_bg
  main <- sample(K, U, replace = TRUE)
  second <- ifelse(runif(U) < 0.3, sample(K, U, replace = TRUE), main)
  fav <- com <- words <- slot <- vector("list", U)
  for (u in 1:U) {
    ks <- unique(c(main[u], second[u]))
    cand <- which(truth %in% main[u])
    fav[[u]] <- sample(cand, n_fav, prob = sqrt(pop[cand]))          # reaches niche
    cand2 <- which(truth %in% ks)
    c_u <- integer(n_com)
    for (n in 1:n_com) {
      c_u[n] <- if (runif(1) < p_explore) sample(E, 1, prob = pop^2)  # exploratory
                else cand2[sample(length(cand2), 1, prob = pop[cand2]^1.5)]
    }
    com[[u]] <- c_u
    sl <- sample(n_com, n_words, replace = TRUE)
    # Informative words come from a vocabulary block that submarket k SHARES with its
    # neighbour k + 1 (as battery/range talk spans adjacent EV submarkets), so text
    # alone cannot tell neighbouring submarkets apart.
    kk <- truth[c_u[sl]]
    blk <- ifelse(runif(n_words) < 0.5, kk, kk %% K + 1)
    w <- ifelse(runif(n_words) < p_text,
                (blk - 1) * V_k + sample(V_k, n_words, replace = TRUE),
                K * V_k + sample(V_bg, n_words, replace = TRUE))
    words[[u]] <- w; slot[[u]] <- sl
  }

  # ---- step 1: favorites embedding (PPMI + SVD) -----------------------------
  C <- matrix(0, E, E)
  for (u in 1:U) { f <- fav[[u]]; C[f, f] <- C[f, f] + 1 }
  diag(C) <- 0
  tot <- sum(C); rs <- rowSums(C)
  pmi <- log((C * tot) / outer(rs, rs) + 1e-12)
  pmi[!is.finite(pmi) | pmi < 0] <- 0
  sv <- svd(pmi, nu = d, nv = 0)
  W <- sv$u %*% diag(sqrt(sv$d[1:d]))
  W <- W / sqrt(rowSums(W^2) + 1e-12)                                  # unit rows

  softmax_rows <- function(M) { M <- M - apply(M, 1, max); P <- exp(M); P / rowSums(P) }

  fit <- function(use_F, use_T, alpha = 50 / K, beta = 0.01, beta_t = 0.01) {
    uid <- rep(1:U, each = n_com); e <- unlist(com); N <- length(e)
    f <- sample(K, N, replace = TRUE)
    s <- if (use_F) rbinom(N, 1, lambda) else integer(N)
    nuk <- matrix(0, U, K); nke <- matrix(0, K, E); nk <- numeric(K)
    for (i in 1:N) { nuk[uid[i], f[i]] <- nuk[uid[i], f[i]] + 1
      if (s[i] == 0) { nke[f[i], e[i]] <- nke[f[i], e[i]] + 1; nk[f[i]] <- nk[f[i]] + 1 } }
    tau <- matrix(rnorm(K * d, sd = 0.1), K, d)
    # word -> token index of the product slot it points to
    wtok <- unlist(lapply(1:U, function(u) (u - 1) * n_com + slot[[u]]))
    wv <- unlist(words)
    tok_words <- split(seq_along(wv), factor(wtok, levels = 1:N))
    keep_phi <- matrix(0, K, E); keep_sm <- matrix(0, K, E); keep_rho <- numeric(K); nkeep <- 0
    for (it in 1:iters) {
      SM <- softmax_rows(tau %*% t(W))                                 # K x E
      logpsi <- NULL
      if (use_T) {                                                     # blocked psi draw
        Nkv <- matrix(0, K, V)
        tw <- f[wtok]
        Nkv <- Nkv + as.matrix(table(factor(tw, 1:K), factor(wv, 1:V)))
        G <- matrix(rgamma(K * V, Nkv + beta_t), K, V)
        logpsi <- log(G / rowSums(G))
      }
      for (i in 1:N) {
        u <- uid[i]; k0 <- f[i]; ei <- e[i]
        nuk[u, k0] <- nuk[u, k0] - 1
        if (s[i] == 0) { nke[k0, ei] <- nke[k0, ei] - 1; nk[k0] <- nk[k0] - 1 }
        p0 <- (1 - if (use_F) lambda else 0) * (nke[, ei] + beta) / (nk + E * beta)
        p1 <- if (use_F) lambda * SM[, ei] else 0 * p0
        lik_t <- if (use_T && length(tok_words[[i]]))
          exp(rowSums(logpsi[, wv[tok_words[[i]]], drop = FALSE]) -
              max(rowSums(logpsi[, wv[tok_words[[i]]], drop = FALSE]))) else 1
        prior <- nuk[u, ] + alpha
        pr <- c(prior * p0 * lik_t, prior * p1 * lik_t)
        j <- sample.int(2 * K, 1, prob = pr)
        k1 <- if (j > K) j - K else j; s[i] <- as.integer(j > K); f[i] <- k1
        nuk[u, k1] <- nuk[u, k1] + 1
        if (s[i] == 0) { nke[k1, ei] <- nke[k1, ei] + 1; nk[k1] <- nk[k1] + 1 }
      }
      if (use_F) {                                    # regularized ML step for tau
        cnt <- matrix(0, K, E)
        idx <- which(s == 1)
        if (length(idx)) cnt <- cnt + as.matrix(table(factor(f[idx], 1:K), factor(e[idx], 1:E)))
        for (g in 1:5) {
          SM <- softmax_rows(tau %*% t(W))
          grad <- cnt %*% W - rowSums(cnt) * (SM %*% W) - 0.1 * tau
          tau <- tau + 0.05 * grad / pmax(1, rowSums(cnt))
        }
      }
      if (it > burn) {
        keep_phi <- keep_phi + (nke + beta) / (nk + E * beta)
        keep_sm <- keep_sm + softmax_rows(tau %*% t(W))
        keep_rho <- keep_rho + colSums((nuk + alpha) / rowSums(nuk + alpha)); nkeep <- nkeep + 1
      }
    }
    lam <- if (use_F) lambda else 0
    Phi <- (1 - lam) * keep_phi / nkeep + lam * keep_sm / nkeep        # paper's eq. (8)
    rho <- keep_rho / sum(keep_rho)                                    # paper's eq. (11)
    post <- Phi * rho                                                  # p(k | e) up to scale
    apply(post, 2, which.max)
  }

  ari <- function(a, b) {
    tab <- table(a, b); n <- sum(tab); c2 <- function(x) sum(x * (x - 1) / 2)
    idx <- c2(tab); ai <- c2(rowSums(tab)); bj <- c2(colSums(tab)); ex <- ai * bj / (n * (n - 1) / 2)
    (idx - ex) / ((ai + bj) / 2 - ex)
  }
  res <- list()
  for (m in list(c("C", 0, 0), c("C+T", 0, 1), c("C+F", 1, 0), c("C+F+T", 1, 1))) {
    a <- fit(as.logical(as.integer(m[2])), as.logical(as.integer(m[3])))
    res[[m[1]]] <- c(all = ari(a, truth), popular = ari(a[!niche], truth[!niche]),
                     niche = ari(a[niche], truth[niche]))
  }
  do.call(rbind, res)
}

reps <- lapply(1:5, function(r) { cat("rep", r, "\n"); run_once(seed = 2026 + r) })
arr <- simplify2array(reps)
mean_tab <- apply(arr, c(1, 2), mean); sd_tab <- apply(arr, c(1, 2), sd)
print(round(mean_tab, 3)); print(round(sd_tab, 3))
saveRDS(list(reps = reps, mean = mean_tab, sd = sd_tab), "hlda_toy_results.rds")
