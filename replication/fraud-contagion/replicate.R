# Replication of Griffin, Kruger & Mahajan (2026, RFS) "Is Fraud Contagious?"
# Tables 4, 5 and 6 plus the Oster (2019) bound in footnote 45, translated from
# the authors' Stata code (Code/Stata/Tab4_TabIA2.do, Tab5.do, Tab6.do) to R.
#
# Data: Harvard Dataverse doi:10.7910/DVN/I6NAAZ (CC0), "Replication Package.7z".
# Extract it so that KIT points at the "Replication Package" folder.
#
# reghdfe -> fixest::feols with analytic weights = PPP loans, county fixed
# effects, county-clustered SEs, singletons dropped (reghdfe's default).

suppressPackageStartupMessages({
  library(haven)
  library(fixest)
})

KIT <- Sys.getenv("FRAUD_KIT", "replication/fraud-contagion/kit/Replication Package")
agg <- file.path(KIT, "Data", "AggregatedData")

# Stata's [aweight] standard deviation: weights rescaled to sum to N.
wstd <- function(x, w) {
  ok <- !is.na(x) & !is.na(w)
  m <- sum(w[ok] * x[ok]) / sum(w[ok])
  n <- sum(ok)
  s <- sqrt(sum(w[ok] * (x[ok] - m)^2) / sum(w[ok]) * n / (n - 1))
  (x - m) / s
}

fit <- function(fml, data) {
  feols(fml, data = data, weights = ~loans, cluster = ~county,
        fixef.rm = "singleton", notes = FALSE)
}

row_of <- function(m, var) {
  ct <- coeftable(m)
  c(coef = unname(ct[var, 1]), t = unname(ct[var, 3]), n = nobs(m),
    r2 = unname(r2(m, "r2")), ar2 = unname(r2(m, "ar2")),
    war2 = unname(r2(m, "war2")))
}

# ---- Table 4: social proximity to suspicious lending ------------------------
z <- read_dta(file.path(agg, "zip_code_main.dta"))
z$log_income <- log(z$average_household_income)

race <- "pct_black + pct_asian + pct_other_race + pct_hispanic_latino + pct_native"
ctrl <- paste("log_pop_density + log_income + poverty + unemployment +",
              "educ_attainment + share_within_50mi + share_within_150mi + lender_fintech")

# Sample = the column-(3) estimation sample (the do-file's `drop if e(sample)==0`).
m0 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_county +",
                           race, "+", ctrl, "| county")), z)
s4 <- z[obs(m0), ]
for (v in c("susp_at_least_one_metric_per_pop", "sci_susp_county",
            "sci_not_susp_county", "sci_loans_county")) {
  s4[[v]] <- wstd(s4[[v]], s4$loans)
}

t4c1 <- fit(susp_at_least_one_metric_per_pop ~ sci_susp_county | county, s4)
t4c2 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_county +",
                             "non_white +", ctrl, "| county")), s4)
t4c3 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_county +",
                             race, "+", ctrl, "| county")), s4)

# Panel B: incremental adjusted R^2 of social proximity (leave-one-out).
t4_drop_sp <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~",
                                   race, "+", ctrl, "| county")), s4)
t4_sp_only <- t4c1
inc_sp   <- r2(t4c3, "ar2") - r2(t4_drop_sp, "ar2")
inc_ctrl <- r2(t4c3, "ar2") - r2(t4_sp_only, "ar2")

# Extension (ours, not in the paper): a regressor-side placebo. If the measure
# only captured how PPP-intensive a ZIP code's friends are, social proximity to
# NON-suspicious lending (or to all lending) should do the same work.
ext_ns <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_county +",
                               "sci_not_susp_county + non_white +", ctrl, "| county")), s4)
# (Social proximity to all lending is the sum of the suspicious and
# non-suspicious measures, so adding it instead gives the same fit.)

# ---- Table 6: social versus physical proximity ------------------------------
m6 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp +",
                           race, "+", ctrl, "| county")), z)
s6 <- z[obs(m6), ]
for (v in c("susp_at_least_one_metric_per_pop", "dist_susp_county", "sci_susp_county",
            "sci_susp_100", "sci_susp_500")) {
  s6[[v]] <- wstd(s6[[v]], s6$loans)
}
c6 <- paste("non_white +", ctrl, "| county")
t6c1 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ dist_susp_county +", c6)), s6)
t6c2 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_county + dist_susp_county +", c6)), s6)
t6c5 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_100 +", c6)), s6)
t6c6 <- fit(as.formula(paste("susp_at_least_one_metric_per_pop ~ sci_susp_500 +", c6)), s6)

# ---- Table 5: 2020 social proximity predicts 2021 fraud ---------------------
s5 <- read_dta(file.path(agg, "SP_spread.dta"))
s5 <- s5[!(s5$lender_fintech == 0 | (s5$loans - s5$lender_fintech) == 0), ]
# Stata's log(0) is missing, not -Inf.
s5$ln_pop_density <- ifelse(s5$pop_density > 0, log(s5$pop_density), NA)
s5$ln_income <- ifelse(s5$average_household_income > 0, log(s5$average_household_income), NA)
# Unlike Table 4, Tab5.do standardizes on every remaining row (each variable's
# own non-missing values) BEFORE the regression drops incomplete rows.
for (v in c("susp_21_per_pop", "sci_susp_20_county", "susp_20_per_pop")) {
  s5[[v]] <- wstd(s5[[v]], s5$loans)
}
t5c1 <- fit(susp_21_per_pop ~ sci_susp_20_county + susp_20_per_pop + share_within_50mi +
              share_within_150mi + non_white + ln_pop_density + ln_income +
              educ_attainment + unemployment + poverty | county, s5)

# ---- Oster (2019) bound, footnote 45 -----------------------------------------
# delta = 1 bias-adjusted coefficient:
#   beta* = beta_ctrl - (beta_raw - beta_ctrl) * (Rmax - R_ctrl) / (R_ctrl - R_raw)
b_raw <- coef(t4c1)[["sci_susp_county"]];  r_raw <- r2(t4c1, "r2")
b_ctl <- coef(t4c2)[["sci_susp_county"]];  r_ctl <- r2(t4c2, "r2")
oster <- function(rmax) b_ctl - (b_raw - b_ctl) * (rmax - r_ctl) / (r_ctl - r_raw)
delta_zero <- function(rmax) b_ctl / ((b_raw - b_ctl) * (rmax - r_ctl) / (r_ctl - r_raw))

results <- list(
  table4 = rbind(c1 = row_of(t4c1, "sci_susp_county"),
                 c2 = row_of(t4c2, "sci_susp_county"),
                 c3 = row_of(t4c3, "sci_susp_county")),
  table4_incremental = c(sp = inc_sp, all_controls = inc_ctrl),
  table6 = rbind(c1_physical = row_of(t6c1, "dist_susp_county"),
                 c2_social   = row_of(t6c2, "sci_susp_county"),
                 c2_physical = row_of(t6c2, "dist_susp_county"),
                 c5_100mi    = row_of(t6c5, "sci_susp_100"),
                 c6_500mi    = row_of(t6c6, "sci_susp_500")),
  table5 = rbind(sp2020  = row_of(t5c1, "sci_susp_20_county"),
                 own2020 = row_of(t5c1, "susp_20_per_pop")),
  extension = rbind(sp_given_notsusp = row_of(ext_ns, "sci_susp_county"),
                    notsusp          = row_of(ext_ns, "sci_not_susp_county")),
  oster = c(b_raw = b_raw, r_raw = r_raw, b_ctl = b_ctl, r_ctl = r_ctl,
            rmax_090 = oster(0.90), rmax_13x = oster(1.3 * r_ctl), rmax_100 = oster(1),
            delta0_090 = delta_zero(0.90), delta0_13x = delta_zero(1.3 * r_ctl),
            delta0_100 = delta_zero(1))
)
print(lapply(results, function(x) round(x, 4)))
if (nzchar(Sys.getenv("FRAUD_DIGITS"))) print(signif(results$oster, 8))
