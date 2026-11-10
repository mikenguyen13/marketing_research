# One simulated archive analysed the way Section 6.3 of Huch et al. (2026)
# analyses the Zillow archive: DPM fit, number of clusters, pairwise
# co-clustering, aggregate surrogacy measures (the paper's Table 5), and an
# early readout in which the KPIs of the 30 most recent tests are withheld
# (the paper's eq. 6).
#
# Usage (from the repository root):
#   Rscript replication/oec-meta/oec_full_data.R [n_iter] [burn]

here <- "replication/oec-meta"
source(file.path(here, "oec_samplers.R"))
src <- readLines(file.path(here, "oec_simulate.R"))
eval(parse(text = src[seq_len(grep("if (sys.nframe", src, fixed = TRUE) - 1)]))
# (the line above also runs the argument parsing of oec_simulate.R, so parse ours after it)
args <- commandArgs(trailingOnly = TRUE)
n_iter <- if (length(args) >= 1) as.integer(args[1]) else 4000L
burn   <- if (length(args) >= 2) as.integer(args[2]) else 1000L

d <- oec_dgp(seed = 1001); r <- d$r; T <- nrow(d$z)
set.seed(2026)
fit <- gibbs_dpm(d$z, d$Sigma, n_iter, burn, keep_Omega = TRUE)

# ---- latent structure -------------------------------------------------------
K <- c(mean = mean(fit$K), quantile(fit$K, c(.025, .975)))
co <- matrix(0, T, T)                    # posterior co-clustering probabilities
for (k in seq_len(nrow(fit$cl))) co <- co + outer(fit$cl[k, ], fit$cl[k, ], "==")
co <- co / nrow(fit$cl)
same <- outer(d$cl, d$cl, "=="); off <- upper.tri(co)
co_true <- c(same_cluster = mean(co[off & same]), diff_cluster = mean(co[off & !same]))

# ---- aggregate surrogacy (Table 5 analogue) ---------------------------------
# For each draw, average the test-specific measure over tests, then summarise
# over draws. Thinned to every 10th draw.
idx <- seq(1, nrow(fit$cl), by = 10)
sur_draws <- t(sapply(idx, function(k)
  rowMeans(sapply(seq_len(T), function(t)
    surrogacy(fit$Om_t[k, t, , ], d$Sigma[, , t], r)))))
sur <- t(apply(sur_draws, 2, function(x) c(mean = mean(x), quantile(x, c(.025, .975)))))

# ---- early readout: withhold the KPIs of the last 30 tests ------------------
late <- (T - 29):T
obs <- matrix(TRUE, T, ncol(d$z)); obs[late, seq_len(r)] <- FALSE
set.seed(2027)
fit_e <- gibbs_dpm(d$z, d$Sigma, n_iter, burn, obs = obs)
early <- oec_summary(fit_e, r)[late, ]
full  <- oec_summary(fit, r)[late, ]
naive <- oec_naive(d$z, d$Sigma, r)[late, ]
truth <- d$oec[late]
rd <- function(s) c(mae = mean(abs(s$est - truth)), ci_len = mean(s$hi - s$lo),
                    coverage = mean(s$lo <= truth & truth <= s$hi),
                    correct = mean((s$est > 0) == (truth > 0)))
readout <- rbind("Naive, KPIs observed" = rd(naive),
                 "DPM, KPIs observed" = rd(full),
                 "DPM, proxies only (early readout)" = rd(early))

print(round(K, 2)); print(round(co_true, 3)); print(round(sur, 3)); print(round(readout, 3))
write.csv(data.frame(measure = rownames(sur), sur), file.path(here, "oec_surrogacy.csv"),
          row.names = FALSE)
write.csv(data.frame(analysis = rownames(readout), readout),
          file.path(here, "oec_early_readout.csv"), row.names = FALSE)
writeLines(c(sprintf("clusters: mean %.2f, 95%% interval %g-%g", K[1], K[2], K[3]),
             sprintf("co-clustering prob: same true cluster %.3f, different %.3f",
                     co_true[1], co_true[2])),
           file.path(here, "oec_clusters.txt"))
