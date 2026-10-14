# Replication of Donati, Rao, Orozco-Olvera & Munoz-Boudet, "Can Facebook Ads
# Prevent Malaria?" (World Bank PRWP 10967, 2024), from the World Bank
# reproducibility package RR_IND_2024_180 (Stata code, BSD-3). This script ports
# the package's cleaning do-files (01, 03, 05, 06) and the Table 2-5, 7 and D17
# do-files to R, then adds a Romano-Wolf adjustment, wild-cluster-bootstrap
# intervals, and cost-per-case intervals. It reads the package by path, runs
# nothing from it, and writes nothing to disk.
#
# Privacy: the survey files hold Messenger user IDs and free-text answers in which
# some respondents typed phone numbers. The script reads only the analysis columns,
# replaces the user ID with a row-group integer at once, and never reads free text.
#
# Usage: Rscript replicate_donati2024.R <path/to/RR_IND_2024_180> [B = 9999]
# Packages: data.table, fixest, readxl, haven. Runtime: about 3 minutes.
suppressPackageStartupMessages({
  library(data.table); library(fixest); library(readxl); library(haven)
})
setFixest_notes(FALSE)
args <- commandArgs(trailingOnly = TRUE)
raw  <- file.path(args[1], "Reproducibility package", "01_RawData")
B    <- if (length(args) > 1) as.integer(args[2]) else 9999L

# ---- Stata semantics ---------------------------------------------------------
num  <- function(x) suppressWarnings(as.numeric(gsub("[NA]", "", x)))  # destring, i("NA")
gtS  <- function(a, b) { a[is.na(a)] <- Inf; b[is.na(b)] <- Inf; a > b } # missing = +Inf
divS <- function(a, b) ifelse(!is.na(b) & b == 0, NA_real_, a / b)      # x/0 is missing
sday <- function(s) as.numeric(as.Date(substr(s, 1, 10), "%Y-%m-%d") - as.Date("1960-01-01"))
rd   <- function(f, cols) {        # read only the analysis columns, all as text
  d <- fread(file.path(raw, f), select = cols, colClasses = "character",
             na.strings = "__none__", encoding = "UTF-8")
  for (j in names(d)) set(d, which(is.na(d[[j]])), j, "")
  d
}
dummy <- function(x, lev) fifelse(x == "NA", NA_real_, as.numeric(x == lev))
covars <- function(d) {
  for (v in intersect(c("age", "familymembers", "pucca", "university", "unemployed",
                        "student", "female", "hasmosquitonet", "hasairconditioning",
                        "pregnantwoman", "treatment"), names(d))) set(d, j = v, value = num(d[[v]]))
  d[, `:=`(distance_15    = dummy(distancemedicalcenter, "Less than 15 minutes"),
           distance_15_30 = dummy(distancemedicalcenter, "Between 15 and 30 minutes"),
           distance_30_60 = dummy(distancemedicalcenter, "Between 30 and 60 minutes"),
           hindu = dummy(religion, "Hindu"), muslim = dummy(religion, "Muslim"),
           caste_obc = dummy(caste, "OBC"), caste_other = dummy(caste, "Other"),
           caste_scdalit = dummy(caste, "SC/Dalit"), caste_st = dummy(caste, "ST"),
           secondary = dummy(education, "Secondary"), primary = dummy(education, "Primary"))]
}
demog <- c("age", "familymembers", "pucca", "university", "unemployed", "student", "female",
           "caste", "education", "distancemedicalcenter", "religion", "hasairconditioning",
           "pregnantwoman", "hasmosquitonet")
ci_dta <- as.data.table(read_dta(file.path(raw, "cluster_info.dta")))  # written by 01_Clean_panel.do

# ---- Experiment 1 panel (01_Clean_panel.do) -----------------------------------
P <- rd("full_panel.csv", c("userid", "wave", "startTime", "stratumid", "treatment",
        "answer_time_90", "answer_time_min", "survey_start_time", "survey_end_time",
        demog, "malaria5year", "sleepundernet", "perc_membersbednet", "fever2weeks",
        "timeseekhelpfever"))
P[, uid := .GRP, by = userid][, userid := NULL]          # drop the platform ID at once
P[, `:=`(wave = num(wave), st = num(startTime))]
setorder(P, uid, wave, st, na.last = TRUE)
P <- P[!duplicated(P, by = c("uid", "wave"))]            # first response per wave
P <- merge(P, ci_dta[, !"cluster_population"], by = "stratumid", all.x = TRUE)
covars(P)
for (v in c("malaria5year", "sleepundernet", "perc_membersbednet", "fever2weeks"))
  set(P, j = v, value = num(P[[v]]))
P[, help24_fever := fifelse(timeseekhelpfever %in% c("", "NA"), NA_real_,
                            as.numeric(timeseekhelpfever == "Less than 24 hours"))]
r <- divS(num(P$answer_time_90), num(P$answer_time_min)); P <- P[!is.na(r) & r >= 3]
# time-invariant answers come from wave 0 (recode if wave>0, then carryforward)
ti <- c("caste_obc", "caste_other", "caste_scdalit", "caste_st", "distance_15", "distance_15_30",
        "distance_30_60", "hindu", "muslim", "age", "familymembers", "pucca", "university",
        "unemployed", "student", "female", "hasmosquitonet", "hasairconditioning", "pregnantwoman")
P[, base_malaria5year := malaria5year]
w0 <- P[wave == 0, c("uid", ti, "base_malaria5year"), with = FALSE]
P <- merge(P[, !c(ti, "base_malaria5year"), with = FALSE], w0, by = "uid", all.x = TRUE)
P <- P[!is.na(age) & age < 90 & age > 17 & !is.na(familymembers) & familymembers < 30 & !is.na(pucca)]
P[, `:=`(start = sday(survey_start_time), end = sday(survey_end_time))]
P <- P[!is.na(end) & end <= 22311]                       # completed by 2021-01-31
P[, post := as.numeric(is.na(start) | start > 22158)]    # started after 2020-08-31
P[post == 0 & end >= 22146, post := NA]
P <- P[!is.na(post) & !(wave == 1 & post == 0)]
setorder(P, uid, wave)
mn <- function(x) if (all(is.na(x))) NA_real_ else mean(x, na.rm = TRUE)
mx <- function(x) if (all(is.na(x))) NA_real_ else max(x, na.rm = TRUE)
Pc <- P[, c(list(w_net = sum(!is.na(sleepundernet) & !is.na(perc_membersbednet)),
                 w_fev = sum(!is.na(fever2weeks)), w_h24 = sum(!is.na(help24_fever)),
                 avg_sleepundernet = mn(sleepundernet), avg_perc_membersbednet = mn(perc_membersbednet),
                 fever2weeks = mx(fever2weeks), help24_fever = mx(help24_fever)),
               lapply(.SD, `[`, 1)), by = .(uid, post),
        .SDcols = c("state", "treatment", "stratumid", ti, "secondary", "primary",
                    "base_malaria5year", grep("^cluster_", names(P), value = TRUE))]
Pc <- Pc[!is.na(university) & state != ""][, treatment_pucca := treatment * pucca]

# ---- Experiment 1 cross-section (03_Clean_xsection.do) -------------------------
X <- rd("xsection.csv", c("stratumid", "treatment", "answer_time_90", "answer_time_min",
        "survey_end_time", demog, "malaria4months", "numbermalaria4months"))
X <- merge(X[stratumid != ""], ci_dta[, !"cluster_population"], by = "stratumid", all.x = TRUE)
covars(X)
r <- divS(num(X$answer_time_90), num(X$answer_time_min)); X <- X[!is.na(r) & r >= 3]
X <- X[!is.na(age) & age < 90 & age > 17 & !is.na(familymembers) & familymembers < 30 & !is.na(pucca)]
X <- X[!is.na(e <- sday(survey_end_time)) & e <= 22370]  # completed by 2021-03-31
X[, `:=`(malaria4months = num(malaria4months), nm4 = num(numbermalaria4months))]
X[malaria4months == 0 & is.na(nm4), nm4 := 0]
X[, share_malaria := divS(nm4, familymembers)]
X[gtS(share_malaria, 1), `:=`(share_malaria = NA, malaria4months = NA)]  # trims >1, incl. junk
X <- X[!is.na(university) & !is.na(share_malaria) & !is.na(hasmosquitonet) &
       !is.na(hasairconditioning) & state != ""][, treatment_pucca := treatment * pucca]

# ---- Experiment 2, individual retargeting (05_Clean_individual.do) -------------
I <- rd("individual_effect.csv", c("wave", "treatment", "ind_treatment", "answer_time_90",
        "answer_time_min", demog, "sleepundernet", "membersbednet"))
I <- I[!is.na(num(wave))]
covars(I)
r <- divS(num(I$answer_time_90), num(I$answer_time_min)); I <- I[!is.na(r) & r >= 2]
I <- I[!is.na(age) & age < 90 & age > 17 & !is.na(familymembers) & familymembers < 30 & !is.na(pucca)]
I[, `:=`(sleepundernet = num(sleepundernet), ind_treatment = num(ind_treatment),
         pm = divS(num(membersbednet), familymembers))]
I[gtS(pm, 1), pm := NA]
I <- I[!is.na(sleepundernet) & !is.na(pm)]
I <- I[!is.na(hasmosquitonet) & !is.na(university) & !is.na(hasairconditioning)]
I[, ind_treatment_pucca := ind_treatment * pucca]

# ---- HMIS facility records (06_Clean_subdistricts.do) ---------------------------
sec <- c("type", "M10 [Number of cases of Childhood Diseases (0-5 years)]", "M11 [NVBDCP]",
         "M16 [Details of deaths reported with probable causes:]")
lab <- c("Total [(A+B) or (C+D)]" = "total", "Public [A]" = "public", "Private [B]" = "private",
         "Urban [C]" = "urban", "Rural [D]" = "rural")
pos_t  <- c("MalariaMicroscopyTests-PlasmodiumFalciparumtestpositive",
            "MalariaMicroscopyTests-PlasmodiumVivaxtestpositive",
            "MalariaRDT-PlamodiumFalciparumtestpositive", "MalariaRDT-PlasmodiumVivaxtestpositive")
test_t <- c("TotalBloodSmearsExaminedforMalaria", "RDTconductedforMalaria")
strip <- function(s) {
  s <- gsub("[() */.]", "", s)
  for (p in list(c("ShaligramRamNarayanpur", ""), c("JhariaCumJorapokharCumSindri", "Jhariacumjorapokhar"),
                 c("DhanbadCumKenduadihCumJagata", "Dhanbadsadar"), c("NilambarPitambarpur", "Lesliganj")))
    s <- gsub(p[1], p[2], s, fixed = TRUE)
  s
}
proper <- function(s) gsub("(^|[^a-z])([a-z])", "\\1\\U\\2", tolower(s), perl = TRUE)
parse_hmis <- function(f, state) {
  x <- as.matrix(read_excel(f, col_names = FALSE, col_types = "text", .name_repair = "minimal"))
  x[is.na(x)] <- ""
  date <- gsub("-", "", substring(x[2, 1], nchar(x[2, 1]) - 7))
  A <- x[, 1]; A[7:8] <- "type"
  for (i in 2:length(A)) if (A[i] == "") A[i] <- A[i - 1]
  v <- x[A %in% sec, -c(1, 2, 4), drop = FALSE]
  # readxl renders numeric cells as "1262.0"; Stata renders "1262". The do-file
  # later strips every "." from every cell, so the rendering must match Stata's.
  isn <- grepl("^-?[0-9]+([.][0-9]+)?([eE][-+]?[0-9]+)?$", v)
  v[isn] <- sprintf("%.15g", as.numeric(v[isn]))
  v[v[, 1] == "", 1] <- "type"
  district <- gsub("[ -]", "", v[1, 2])
  m <- v[2, ] %in% names(lab); v[2, m] <- lab[v[2, m]]
  K <- ncol(v)
  for (i in 3:K) if (v[1, i] == "") v[1, i] <- v[1, i - 1]
  for (i in 2:K) v[1, i] <- gsub("[ -]", "", paste0(v[2, i], v[1, i]))
  v <- v[, -(2:6), drop = FALSE]; v[] <- strip(v)
  nm <- paste0("v", c(1, 7:K))                  # Stata's `cap rename`: legal, unused names only
  for (j in seq_along(nm)) {
    new <- v[1, j]
    if (nchar(new) <= 32 && grepl("^[A-Za-z_][A-Za-z0-9_]*$", new) && !(new %in% nm)) nm[j] <- new
  }
  v <- v[-(1:2), , drop = FALSE]
  rows <- v[, nm == "type"] %in% c(pos_t, test_t)
  st <- regmatches(nm, regexec("^(total|urban|rural)(.+)$", nm))
  ok <- lengths(st) == 3
  if (!any(rows) || !any(ok)) return(NULL)
  long <- rbindlist(lapply(which(ok), function(j)
    data.table(type = v[rows, nm == "type"], stub = st[[j]][2], sd = st[[j]][3],
               value = suppressWarnings(as.numeric(v[rows, j])))))
  long <- dcast(long, type + sd ~ stub, value.var = "value")
  long <- long[!sd %in% c("DistrictHQ", "DISTRICTHQ", "Urban", "Civildispensaries", "Districthospital")]
  long[, `:=`(state = state, district = district, subdistrict = proper(sd), date = date, sd = NULL)]
}
dirs <- c("Chhattisgarh2020_2021", "Chhattisgarh2021_2022", "Jharkhand2020_2021",
          "Jharkhand2021_2022", "UttarPradesh2020_2021", "UttarPradesh2021_2022")
H <- rbindlist(lapply(dirs, function(d) rbindlist(lapply(
  list.files(file.path(raw, d), "\\.xlsx$", full.names = TRUE),
  parse_hmis, state = sub("20.*", "", d)))), fill = TRUE)
H <- H[district != "Balrampur"][, outcome := fifelse(type %in% pos_t, "pos", "tests")]
H <- H[, lapply(.SD, function(z) sum(z, na.rm = TRUE)), .SDcols = c("total", "urban", "rural"),
       by = .(state, district, subdistrict, date, outcome)]
H <- dcast(H, state + district + subdistrict + date ~ outcome, value.var = c("total", "urban", "rural"))
mon <- match(substr(H$date, 1, 3), month.abb)
H[, `:=`(month = mon, year = as.integer(substr(date, 4, 7)))]
H[, dnum := as.numeric(as.Date(sprintf("%d-%02d-01", year, month)) - as.Date("1960-01-01"))]
sf <- as.data.table(read_dta(file.path(raw, "subdistricts_features.dta")))
ta <- as.data.table(read_dta(file.path(raw, "treatment_assignment.dta")))
D <- merge(H, sf[, !"disthash"], by = c("state", "district", "subdistrict"))
D <- merge(D, ta[, !c("disthash", "distname")], by = c("state", "district"))
# Cases per million residents of the subdistrict (urban and rural facilities alike
# are divided by the whole subdistrict population, popsum)
for (k in list(c("incidence_rate", "total"), c("uincidence_rate", "urban"), c("rincidence_rate", "rural"))) {
  pos <- D[[paste0(k[2], "_pos")]]; tst <- D[[paste0(k[2], "_tests")]]
  inc <- divS(pos, D$popsum) * 1e6
  z <- !is.na(tst) & tst == 0                    # recode (0=.) if tests == 0
  inc[z & inc %in% 0] <- NA; pos[z & pos %in% 0] <- NA
  inc[gtS(pos, tst)] <- NA                       # more positives than tests
  set(D, j = k[1], value = inc)
}
D[, post := as.numeric(dnum >= 22159)]           # September 2020 onward
D[, `:=`(share_urban = urbansum / popsum, lcluster_population = log(cluster_population))]
ctl_sub <- c("share_urban", "area", "elevation_mean", "elevation_sd", "distance_to_capital")
ctl_dis <- c("lcluster_population", "cluster_kutcha", "cluster_university", "cluster_malaria5year",
             "cluster_sleepundernet", "cluster_malaria2weeks")
for (v in c("treatment", ctl_sub, ctl_dis)) set(D, j = paste0(v, "_post"), value = D[[v]] * D$post)
D[, `:=`(state_id = .GRP), by = state][, district_id := .GRP, by = .(state, district)]
D[, subdistrict_id := .GRP, by = .(district, subdistrict)]

# ---- Estimation ----------------------------------------------------------------
ind  <- c("base_malaria5year", "familymembers", "age", "university", "secondary", "primary",
          "unemployed", "student", "female", "caste_obc", "caste_other", "caste_scdalit", "caste_st",
          "distance_15", "distance_15_30", "distance_30_60", "hasairconditioning", "pregnantwoman",
          "hindu", "muslim")
clus <- c("cluster_lpopulation", "cluster_university", "cluster_pucca", "cluster_unemployed",
          "cluster_malaria2weeks", "cluster_malaria5year", "cluster_cost_per_completion",
          "cluster_ctr", "cluster_cpm", "cluster_cost_per_message")
ind_x <- c(setdiff(ind, "base_malaria5year"), "hasmosquitonet")   # Tables 4 and 7
f  <- function(y, x) as.formula(paste(y, "~", paste(x, collapse = " + ")))
st <- "factor(state)"                     # state dummies as regressors (reghdfe noabsorb i.state_id)
ols <- function(y, x, d, w = NULL, vc = ~stratumid) {
  if (!is.null(w)) d <- d[d[[w]] > 0]     # Stata drops zero aweights
  m <- if (is.null(w)) feols(f(y, x), d, vcov = vc) else feols(f(y, x), d, weights = d[[w]], vcov = vc)
  m$g <- d$stratumid[obs(m)]; m
}
grab <- function(m, v, tab, col, stratum)
  data.table(table = tab, col = col, term = v, stratum = stratum, b = unname(coef(m)[v]),
             se = unname(se(m)[v]), p = unname(pvalue(m)[v]), N = nobs(m),
             G = if (is.null(m$g)) NA_integer_ else uniqueN(m$g))
R <- list(); M <- list()
survey_table <- function(tab, y, d, w, ctrl, ctrl2, col1_on_col2 = FALSE) {
  for (k in 1:2) {
    cc <- list(ctrl, ctrl2)[[k]]; wk <- w[k]
    m2 <- ols(y[k], c("treatment", "pucca", st, cc, clus), d, wk)
    d1 <- if (col1_on_col2) (if (is.null(wk)) d else d[d[[wk]] > 0])[obs(m2)] else d
    m1 <- ols(y[k], c("treatment", st), d1, wk)
    m3 <- ols(y[k], c("treatment", "treatment_pucca", "pucca", st, cc, clus), d, wk)
    m4 <- ols(y[k], c("treatment", st, cc, clus), d[pucca == 1], wk)
    c0 <- 4 * (k - 1)
    R[[length(R) + 1]] <<- rbind(grab(m1, "treatment", tab, c0 + 1, "all"),
      grab(m2, "treatment", tab, c0 + 2, "all"), grab(m3, "treatment", tab, c0 + 3, "non-solid"),
      grab(m3, "treatment_pucca", tab, c0 + 3, "interaction"), grab(m4, "treatment", tab, c0 + 4, "solid"))
    M[[y[k]]] <<- list(int = m3, solid = m4)
  }
}
T2d <- Pc[post == 1 & hasmosquitonet == 1]
survey_table("T2", c("avg_sleepundernet", "avg_perc_membersbednet"), T2d, c("w_net", "w_net"),
             ind, setdiff(ind, "familymembers"), col1_on_col2 = TRUE)
survey_table("T3", c("fever2weeks", "help24_fever"), Pc[post == 1], c("w_fev", "w_h24"),
             c(ind, "hasmosquitonet"), c(ind, "hasmosquitonet"))
survey_table("T4", c("malaria4months", "share_malaria"), X, NULL, ind_x, setdiff(ind_x, "familymembers"))
I7 <- I[hasmosquitonet == 1]                                        # Table 7, HC1 SEs
t7 <- list(c("ind_treatment", "treatment", "pucca"), c("ind_treatment", "treatment", "pucca", ind_x),
           c("ind_treatment", "ind_treatment_pucca", "treatment", "pucca", ind_x),
           c("ind_treatment", "treatment", ind_x), c("ind_treatment", "treatment", ind_x))
d7 <- list(I7, I7, I7, I7[pucca == 1], I7[pucca == 0])
t7 <- lapply(1:5, function(k) feols(f("sleepundernet", t7[[k]]), d7[[k]], vcov = "hc1"))
R[[length(R) + 1]] <- rbind(rbindlist(lapply(1:5, function(k) grab(t7[[k]], "ind_treatment", "T7", k,
  c("all", "all", "non-solid", "solid", "non-solid")[k]))), grab(t7[[3]], "ind_treatment_pucca", "T7", 3, "interaction"))
# Table 5 and Table D17: subdistrict, month and year FE; state x Post; clustered by district
hm <- function(y, ctl, thr = 0.5) {
  d <- D[gtS(share_pop, thr)]
  m <- feols(f(y, c("treatment_post", ctl, "i(state_id, post)")), d, cluster = ~district_id,
             fixef = c("subdistrict_id", "month", "year"), fixef.rm = "singleton")
  m$g <- d$district_id[obs(m)]; m$d <- d[obs(m)]; m
}
ctl3 <- list(character(0), paste0(ctl_dis, "_post"), paste0(c(ctl_sub, ctl_dis), "_post"))
ys <- c(overall = "incidence_rate", urban = "uincidence_rate", rural = "rincidence_rate")
for (k in 1:3) for (j in 1:3) {
  m <- hm(ys[k], ctl3[[j]]); M[[paste0("T5:", 3 * (k - 1) + j)]] <- m
  R[[length(R) + 1]] <- grab(m, "treatment_post", "T5", 3 * (k - 1) + j, names(ys)[k])
}
for (k in 1:3) for (thr in 1:5) {
  m <- hm(ys[k], ctl3[[3]], thr / 10); M[[paste0("D17:", names(ys)[k], thr * 10)]] <- m
  R[[length(R) + 1]] <- grab(m, "treatment_post", "D17", thr * 10, names(ys)[k])
}
R <- rbindlist(R)

# ---- Comparison with the working paper ---------------------------------------------
wp <- fread(text = "table,col,term,label,b,se,N
T2,4,treatment,Bed-net use (share of waves); solid,0.055,0.025,1789
T2,8,treatment,Household members under a net; solid,0.068,0.019,1789
T2,3,treatment_pucca,Bed-net use; T x solid,0.051,0.037,3900
T2,7,treatment_pucca,Household members under a net; T x solid,0.081,0.025,3900
T3,8,treatment,Help within 24h of a fever; solid,0.107,0.035,301
T3,7,treatment_pucca,Help within 24h; T x solid,0.107,0.058,724
T4,4,treatment,Any household malaria; solid,-0.024,0.011,1316
T4,8,treatment,Share of members with malaria; solid,-0.008,0.003,1316
T4,3,treatment_pucca,Any household malaria; T x solid,-0.038,0.018,3052
T5,1,treatment_post,HMIS overall; no controls,-3.12,6.37,1498
T5,3,treatment_post,HMIS overall; all controls,-4.68,5.37,1498
T5,4,treatment_post,HMIS urban; no controls,-6.10,3.41,791
T5,6,treatment_post,HMIS urban; all controls,-6.21,2.86,791
T5,9,treatment_post,HMIS rural; all controls,-2.24,5.79,1338
T7,1,ind_treatment,Exp. 2 bed-net use; all,0.075,0.029,1043
T7,3,ind_treatment_pucca,Exp. 2 bed-net use; individual T x solid,0.000,0.057,1043
D17,10,treatment_post,HMIS urban; threshold 10%,-6.64,2.64,1199
D17,20,treatment_post,HMIS urban; threshold 20%,-4.82,2.54,1155
D17,30,treatment_post,HMIS urban; threshold 30%,-4.00,2.60,1072
D17,40,treatment_post,HMIS urban; threshold 40%,-5.79,2.85,887")
cmp <- merge(wp, R[stratum %in% c("solid", "interaction", "all", "overall", "urban", "rural") &
                   !(table == "D17" & stratum != "urban") & !(table == "T7" & col == 3 & term == "ind_treatment")],
             by = c("table", "col", "term"), suffixes = c("_wp", "_r"), sort = FALSE)
dig <- function(x, t) ifelse(t %in% c("T5", "D17"), sprintf("%.2f", x), sprintf("%.3f", x))
cmp[, `:=`(match = dig(b_wp, table) == dig(b_r, table) & dig(se_wp, table) == dig(se_r, table) & N_wp == N_r)]
cat("\n== Replication vs WP 10967 ==\n")
print(cmp[, .(table, col, label, b_wp, b_r = dig(b_r, table), se_wp, se_r = dig(se_r, table), N_wp, N_r, G, match)])
# Every estimate in the six tables, in the order of R: Tables 2-4 (cols 1, 2, 3 T,
# 3 T x solid, 4, 5, 6, 7 T, 7 T x solid, 8), Table 7 (cols 1-5, 3 T x solid),
# Table 5 (cols 1-9), Table D17 (overall, urban, rural at 10-50 percent).
wp_b <- c(0.030, 0.031, 0.007, 0.051, 0.055, 0.025, 0.028, -0.010, 0.081, 0.068,
          0.007, 0.008, 0.016, -0.016, 0.008, 0.006, 0.019, -0.023, 0.107, 0.107,
          0.003, 0.001, 0.017, -0.038, -0.024, -0.002, -0.002, 0.003, -0.011, -0.008,
          0.075, 0.079, 0.079, 0.076, 0.081, 0.000,
          -3.12, -5.66, -4.68, -6.10, -6.96, -6.21, 0.99, -1.47, -2.24,
          -2.87, 2.24, 1.88, 2.37, -4.68, -6.64, -4.82, -4.00, -5.79, -6.21,
          -0.35, 6.30, 5.96, 6.58, -2.24)
wp_se <- c(0.019, 0.017, 0.024, 0.037, 0.025, 0.017, 0.014, 0.018, 0.025, 0.019,
           0.017, 0.014, 0.018, 0.028, 0.020, 0.030, 0.026, 0.040, 0.058, 0.035,
           0.011, 0.009, 0.013, 0.018, 0.011, 0.003, 0.003, 0.004, 0.005, 0.003,
           0.029, 0.029, 0.038, 0.043, 0.039, 0.057,
           6.37, 6.25, 5.37, 3.41, 2.92, 2.86, 6.02, 6.37, 5.79,
           7.94, 7.62, 7.11, 8.49, 5.37, 2.64, 2.54, 2.60, 2.85, 2.86, 8.81, 8.81, 8.39, 9.44, 5.79)
wp_N <- c(rep(3900, 4), 1789, rep(3900, 4), 1789, rep(5158, 4), 2381, rep(724, 4), 301,
          rep(3052, 4), 1316, rep(3052, 4), 1316, 1043, 1043, 1043, 513, 530, 1043,
          rep(1498, 3), rep(791, 3), rep(1338, 3),
          3337, 2784, 2328, 1812, 1498, 1199, 1155, 1072, 887, 791, 3102, 2563, 2131, 1641, 1338)
ok <- dig(R$b, R$table) == dig(wp_b, R$table) & dig(R$se, R$table) == dig(wp_se, R$table) & R$N == wp_N
cat("All estimates in Tables 2-5, 7 and D17 matching the WP to printed precision:",
    sum(ok), "of", nrow(R), "\n")
if (!all(ok)) print(R[!ok])

# ---- Extension 1: baselines for the urban effect -----------------------------------
u6 <- M[["T5:6"]]; o1 <- M[["T5:1"]]
base <- c(all_facility_mean_T5 = o1$d[post == 0, mean(incidence_rate)],
          urban_mean_same_sample = u6$d[post == 0, mean(uincidence_rate)],
          all_facility_mean_urban_sample = u6$d[post == 0, mean(incidence_rate, na.rm = TRUE)],
          subdistricts_overall = uniqueN(o1$d$subdistrict_id), districts_overall = uniqueN(o1$g),
          subdistricts_urban = uniqueN(u6$d$subdistrict_id), districts_urban = uniqueN(u6$g),
          districts_rural = uniqueN(M[["T5:9"]]$g),
          pop_share_urban_sample = sum(unique(u6$d[, .(subdistrict_id, popsum)])$popsum) /
                                   sum(unique(o1$d[, .(subdistrict_id, popsum)])$popsum))
cat("\n== Baselines (pre-campaign means, cases per million residents per month) ==\n")
print(round(base, 3))

# ---- Extension 2: Romano-Wolf across the six survey outcomes --------------------------
# Wild cluster bootstrap (Rademacher), one weight per district shared by every
# regression, so the dependence across outcomes and samples is preserved.
set.seed(20240901)
ids <- sort(unique(c(Pc$stratumid, X$stratumid)))
Vg  <- matrix(sample(c(-1, 1), length(ids) * B, TRUE), length(ids), B, dimnames = list(ids))
wild_t <- function(m, v) {               # observed t and B bootstrap t's (WCU, CR0 scale)
  Xm <- model.matrix(m); y <- drop(model.matrix(m, type = "lhs")); w <- weights(m)
  if (is.null(w)) w <- rep(1, length(y))
  A <- solve(crossprod(Xm, Xm * w), t(Xm * w)); k <- match(v, colnames(Xm))
  stopifnot(isTRUE(all.equal(drop(A %*% y), unname(coef(m)), check.attributes = FALSE)))
  u <- drop(y - Xm %*% (A %*% y)); g <- m$g
  t0 <- sum(A[k, ] * y) / sqrt(sum(rowsum(A[k, ] * u, g)^2))
  tb <- numeric(B)
  for (ch in split(seq_len(B), ceiling(seq_len(B) / 1000))) {
    U <- u * Vg[g, ch, drop = FALSE]; Bs <- A %*% U; E <- U - Xm %*% Bs
    tb[ch] <- Bs[k, ] / sqrt(colSums(rowsum(A[k, ] * E, g)^2))
  }
  list(t = t0, tb = tb)
}
romano_wolf <- function(tl) {
  t0 <- abs(sapply(tl, `[[`, "t")); Tb <- abs(sapply(tl, `[[`, "tb"))
  o <- order(t0, decreasing = TRUE); p <- numeric(length(t0))
  for (s in seq_along(o)) {
    mxb <- apply(Tb[, o[s:length(o)], drop = FALSE], 1, max)
    p[o[s]] <- max(mean(mxb >= t0[o[s]]), if (s > 1) p[o[s - 1]] else 0)
  }
  p
}
outc <- c(T2 = "avg_sleepundernet", T2 = "avg_perc_membersbednet", T3 = "fever2weeks",
          T3 = "help24_fever", T4 = "malaria4months", T4 = "share_malaria")
mt <- rbindlist(lapply(c(solid = "treatment", interaction = "treatment_pucca"), function(v) {
  mods <- lapply(outc, function(y) M[[y]][[if (v == "treatment") "solid" else "int"]])
  tl <- lapply(mods, wild_t, v = v)
  pc <- sapply(mods, function(m) pvalue(m)[v])
  data.table(term = v, outcome = outc, b = sapply(mods, function(m) coef(m)[v]), p_cluster = pc,
             p_holm = p.adjust(pc, "holm"), p_wild = sapply(tl, function(z) mean(abs(z$tb) >= abs(z$t))),
             p_romano_wolf = romano_wolf(tl))
}))
cat("\n== Multiple testing: six survey outcomes, solid-house effects and T x solid interactions ==\n")
print(mt[, lapply(.SD, function(z) if (is.numeric(z)) round(z, 3) else z)])

# ---- Extension 3: wild cluster bootstrap (WCR) for the HMIS estimates ------------------
# Null imposed, Rademacher weights by district, fixed effects projected out first.
# The interval inverts the bootstrap test; every bootstrap quantity is linear in the
# null value, so the inversion is exact for the given draws.
wcr <- function(m, v = "treatment_post", level = 0.95) {
  Xm <- model.matrix(m, type = "rhs"); y <- drop(model.matrix(m, type = "lhs"))
  Xm <- Xm[, colnames(Xm) %in% names(coef(m)), drop = FALSE]
  dd <- demean(cbind(y, Xm), as.data.frame(m$fixef_id)); yd <- dd[, 1]; Xd <- dd[, -1, drop = FALSE]
  k <- match(v, colnames(Xd)); qz <- qr(Xd[, -k, drop = FALSE]); qx <- qr(Xd)
  xt <- qr.resid(qz, Xd[, k]); ry <- qr.resid(qz, yd); ci <- xt / sum(xt^2)
  b <- sum(ci * yd); stopifnot(abs(b - coef(m)[v]) < 1e-8)
  g <- m$g; G <- sort(unique(g)); se0 <- sqrt(sum(rowsum(ci * qr.resid(qx, yd), g)^2))
  set.seed(20240902)
  Vd <- matrix(sample(c(-1, 1), length(G) * B, TRUE), length(G), B)
  sP <- sQ <- matrix(0, length(G), B); nP <- nQ <- numeric(B)
  for (ch in split(seq_len(B), ceiling(seq_len(B) / 1000))) {
    V <- Vd[match(g, G), ch, drop = FALSE]
    sP[, ch] <- rowsum(ci * qr.resid(qx, ry * V), g); sQ[, ch] <- rowsum(ci * qr.resid(qx, xt * V), g)
    nP[ch] <- colSums(ci * ry * V); nQ[ch] <- colSums(ci * xt * V)
  }
  pv <- function(b0) mean(abs((nP - b0 * nQ) / sqrt(colSums((sP - b0 * sQ)^2))) >= abs((b - b0) / se0))
  bound <- function(out, inn) { for (i in 1:50) { mid <- (out + inn) / 2
    if (pv(mid) > 1 - level) inn <- mid else out <- mid }; (out + inn) / 2 }
  c(b = b, se = unname(se(m)[v]), G = length(G), p_cluster = unname(pvalue(m)[v]), p_wcr = pv(0),
    lo_t = unname(confint(m, v, level = level)[[1]]), hi_t = unname(confint(m, v, level = level)[[2]]),
    lo_wcr = bound(b - 30 * se0, b), hi_wcr = bound(b + 30 * se0, b))
}
hk <- c("T5:1", "T5:3", "T5:4", "T5:6", "T5:9", paste0("D17:urban", c(10, 20, 30, 40)))
wb <- as.data.table(do.call(rbind, lapply(M[hk], wcr)), keep.rownames = "model")
wb[, model := hk]
cat("\n== HMIS estimates with wild-cluster-bootstrap (WCR) p-values and 95% intervals ==\n")
print(wb[, lapply(.SD, function(z) if (is.numeric(z)) round(z, 3) else z)])

# ---- Extension 4: cost per reported case averted, as an interval ----------------------
# Working paper, Section 7: USD 202,000 / (|monthly effect per million| x 9 months x 1,100 million).
cpc <- function(e) ifelse(e < 0, 202000 / (abs(e) * 9 * 1100), Inf)
cost <- wb[model %in% c("T5:1", "T5:3", "T5:4", "T5:6"),
           .(model, point = cpc(b), t_best = cpc(lo_t), t_worst = cpc(hi_t),
             wcr_best = cpc(lo_wcr), wcr_worst = cpc(hi_wcr))]
cost <- rbind(cost, cost[model %in% c("T5:4", "T5:6")][, `:=`(
  model = paste0(model, " scaled to subdistricts with urban facilities"),
  point = point / base[["pop_share_urban_sample"]], t_best = t_best / base[["pop_share_urban_sample"]],
  t_worst = t_worst / base[["pop_share_urban_sample"]], wcr_best = wcr_best / base[["pop_share_urban_sample"]],
  wcr_worst = wcr_worst / base[["pop_share_urban_sample"]])])
cat("\n== Cost per reported case averted (USD); Inf = interval reaches zero effect ==\n")
print(cost[, lapply(.SD, function(z) if (is.numeric(z)) round(z, 2) else z)])
cat("\nUrban effect (all controls) as % of the urban-facility mean:",
    round(100 * wb[model == "T5:6", c(b, lo_wcr, hi_wcr)] / base[["urban_mean_same_sample"]], 1),
    "\n... and as % of the all-facility mean in the same subdistrict-months:",
    round(100 * wb[model == "T5:6", b] / base[["all_facility_mean_urban_sample"]], 1), "\n")
