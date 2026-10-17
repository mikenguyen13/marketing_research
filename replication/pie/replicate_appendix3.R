# Re-run the simulation tables of Gordon, Moakler & Zettelmeyer (2026), Appendix 3
# (Tables A-3 to A-7), with the paper's published parameter ranges. Parameters the
# paper leaves unstated: gamma = 0 in Tables A-3 to A-6 (full compliance, no
# latent-propensity effect); for Table A-7 the click process is not reported, so
# each row is run twice, with the low-click (CP ~ U[0, 0.1], beta_cp = 0.1) and the
# high-click (CP ~ U[0, 0.3], beta_cp = 0.5) settings of Table A-6. The label is
# expected incremental conversions per user in the label half ("expected"); the
# realized-draw version is also run for two Table A-3 rows to show how label noise
# lowers R^2. Runtime: 30-40 minutes on a laptop. Output: appendix3_results.csv
# Optional second argument: comma-separated tables to (re)run, e.g. "A-7"; their
# rows replace the matching rows of an existing CSV.
args <- commandArgs(TRUE)
here <- if (length(args)) args[1] else "replication/pie"
source(file.path(here, "pie_sim_functions.R"))
set.seed(20261017)

S <- list(
  # table, row label, params, R, n, reps, outcome, paper's full-model R^2
  list("A-3", "50 RCTs",          list(), 50,    10000, 100, "expected", 0.260),
  list("A-3", "100 RCTs",         list(), 100,   10000, 100, "expected", 0.368),
  list("A-3", "1,000 RCTs",       list(), 1000,  10000, 20,  "expected", 0.442),
  list("A-3", "10,000 RCTs",      list(), 10000, 10000, 3,   "expected", 0.448),
  list("A-3", "1,000 users",      list(), 1000,  1000,  50,  "expected", 0.190),
  list("A-3", "5,000 users",      list(), 1000,  5000,  20,  "expected", 0.392),
  list("A-3", "1,000 users (realized label)",  list(), 1000, 1000,  50, "realized", 0.190),
  list("A-3", "10,000 users (realized label)", list(), 1000, 10000, 20, "realized", 0.442),
  list("A-4", "alpha U[0.14,0.16]", list(alpha = c(.14, .16)), 1000, 10000, 20, "expected", 0.666),
  list("A-4", "alpha U[0.12,0.18]", list(alpha = c(.12, .18)), 1000, 10000, 20, "expected", 0.282),
  list("A-4", "tau U[0.03,0.05]",   list(tau = c(.03, .05)),   1000, 10000, 20, "expected", 0.152),
  list("A-4", "tau U[0.01,0.07]",   list(tau = c(.01, .07)),   1000, 10000, 20, "expected", 0.640),
  list("A-5", "rho = 0.45",  list(rho = 0.45),  1000, 10000, 20, "expected", 0.658),
  list("A-5", "rho = 0.90",  list(rho = 0.90),  1000, 10000, 20, "expected", 0.886),
  list("A-5", "rho = -0.45", list(rho = -0.45), 1000, 10000, 20, "expected", 0.228),
  list("A-5", "rho = -0.90", list(rho = -0.90), 1000, 10000, 20, "expected", 0.016),
  list("A-6", "low CP, delta U[0.01,0.09]",  list(delta = c(.01, .09)), 1000, 10000, 20, "expected", 0.464),
  list("A-6", "high CP, delta U[0.04,0.06]", list(delta = c(.04, .06), CP = c(0, .3), beta_cp = .5), 1000, 10000, 20, "expected", 0.513),
  list("A-6", "high CP, delta U[0.01,0.09]", list(delta = c(.01, .09), CP = c(0, .3), beta_cp = .5), 1000, 10000, 20, "expected", 0.657)
)
A7 <- function(lab, p, paper) list(
  list("A-7", paste0(lab, ", low click"),  c(p, list(CP = c(0, .1), beta_cp = .1)), 1000, 10000, 20, "expected", paper),
  list("A-7", paste0(lab, ", high click"), c(p, list(CP = c(0, .3), beta_cp = .5)), 1000, 10000, 20, "expected", paper))
S <- c(S,
  A7("pE U[0.70,0.90]", list(gamma = c(.1, .2), delta = c(.03, .07), pE = c(.7, .9)), 0.319),
  A7("pE U[0.40,0.60]", list(gamma = c(.1, .2), delta = c(.03, .07), pE = c(.4, .6)), 0.430),
  A7("pE U[0.10,0.30]", list(gamma = c(.1, .2), delta = c(.03, .07), pE = c(.1, .3)), 0.737),
  A7("delta = 0, pE U[0.40,0.60]", list(gamma = c(.1, .2), pE = c(.4, .6)), 0.252))
only <- if (length(args) > 1) strsplit(args[2], ",")[[1]] else NULL
if (!is.null(only)) S <- Filter(function(s) s[[1]] %in% only, S)

res <- do.call(rbind, lapply(S, function(s) {
  t0 <- Sys.time()
  r2 <- run_scenario(s[[3]], R = s[[4]], n = s[[5]], reps = s[[6]], outcome = s[[7]])
  message(sprintf("%s %-30s full=%.3f paper=%.3f (%.0fs)", s[[1]], s[[2]], r2["full"],
                  s[[8]], as.numeric(Sys.time() - t0, units = "secs")))
  data.frame(table = s[[1]], scenario = s[[2]], outcome = s[[7]],
             r2_y = r2["y_t"], r2_y_phi = r2["y_t_phi"], r2_y_phi_C = r2["y_t_phi_C"],
             r2_full = r2["full"], paper_full = s[[8]], row.names = NULL)
}))
out <- file.path(here, "appendix3_results.csv")
if (!is.null(only) && file.exists(out)) {
  old <- read.csv(out)
  res <- rbind(old[!old$table %in% only, ], res)
  res <- res[order(res$table), ]
}
write.csv(res, out, row.names = FALSE)
print(res, digits = 3)
