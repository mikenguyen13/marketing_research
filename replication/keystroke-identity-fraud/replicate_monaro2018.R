# replicate_monaro2018.R
# Replication and extension of Monaro et al. (2018), "Covert lie detection using keyboard
# dynamics", Scientific Reports 8:1976 -- the open-data analogue used in the book's
# keystroke-dynamics section (ch. 57, sec-bio-keystroke) for Kim et al. (2026, ISR),
# whose data and code are not public.
#
# Data: github.com/SPRITZ-Research-Group/Covert_lie_detection_using_keyboard_dynamics
# (downloaded to a temp dir on first run; nothing is redistributed here).
# Needs: R >= 4.1, readxl, RWeka (and a Java runtime). RWeka ships WEKA 3.9.3; the authors
# used WEKA 3.8/3.9 with default settings, so the deterministic learners reproduce exactly
# and the randomized ones (RandomForest, 10-fold CV) come within a few points.
#
# Usage: Rscript replicate_monaro2018.R [data-dir]

suppressPackageStartupMessages({ library(readxl); library(RWeka) })

## ---- 0. data -------------------------------------------------------------------------
args <- commandArgs(trailingOnly = TRUE)
dir  <- if (length(args)) args[1] else file.path(tempdir(), "monaro2018")
dir.create(dir, showWarnings = FALSE, recursive = TRUE)
base <- paste0("https://raw.githubusercontent.com/SPRITZ-Research-Group/",
               "Covert_lie_detection_using_keyboard_dynamics/master/data_analysis/")
files <- c(desc = "Data for descriptive statistical analysis - 40 subjects.txt",
           raw  = "Raw data - 60 subjects.xlsx",
           tr   = "ML Training data - 40 subjects.arff",
           t20  = "ML Test data - 20 subjects.arff",
           t151 = "ML Test data - 151 online subjects.csv.arff")
path <- setNames(file.path(dir, files), names(files))
for (k in names(files)) if (!file.exists(path[k]))
  download.file(paste0(base, utils::URLencode(files[k])), path[k], mode = "wb", quiet = TRUE)

desc <- read.delim(path["desc"], check.names = FALSE)          # 40 lab subjects, 62 features
raw  <- as.data.frame(read_excel(path["raw"]))                 # 60 lab subjects x 18 answers
tr   <- read.arff(path["tr"]); t20 <- read.arff(path["t20"]); t151 <- read.arff(path["t151"])
# In the ARFF files mind_condition is True for truth-tellers and False for liars.

## ---- 1. Table 2: Welch t-tests and Cohen's d (40 lab subjects) ------------------------
cohen_d <- function(a, b) (mean(a) - mean(b)) /
  sqrt(((length(a) - 1) * var(a) + (length(b) - 1) * var(b)) / (length(a) + length(b) - 2))
tab2 <- do.call(rbind, lapply(
  c("errors", "prompted-firstdigit", "Prompted-firstdigit_adjusted_GULPEASE", "prompted-enter"),
  function(v) {
    tt <- t.test(desc[[v]] ~ factor(desc$mind_condition), var.equal = FALSE)  # truth (0) - liar (1)
    data.frame(feature = v, df = round(unname(tt$parameter)), t = round(unname(tt$statistic), 2),
               d = round(cohen_d(desc[[v]][desc$mind_condition == 1],
                                 desc[[v]][desc$mind_condition == 0]), 2))
  }))
cat("Table 2 (paper: t(21)=-10.57 d=3.34; t(31)=-6.34 d=2.00; t(30)=-6.48 d=2.05; t(26)=-5.46 d=1.73)\n")
print(tab2, row.names = FALSE)

## ---- 2. Table 3: conceptual errors by question type ----------------------------------
# The descriptive file numbers subjects 1-40, the raw file 1-60; match on per-subject means.
agg <- aggregate(cbind(wt = `writing time`, pfd = `prompted-firstdigit`) ~ n_subject, raw, mean)
train_ids <- sapply(seq_len(nrow(desc)), function(i)
  agg$n_subject[which.min(abs(agg$wt - desc$writing_time[i]) +
                          abs(agg$pfd - desc$`prompted-firstdigit`[i]))])
lab40 <- raw[raw$n_subject %in% train_ids, ]
tab3 <- with(lab40, tapply(errors, list(condition, ifelse(mind_condition == "False", "liars", "truth")), sum))
n3   <- with(lab40, tapply(errors, list(condition, ifelse(mind_condition == "False", "liars", "truth")), length))
cat("\nTable 3 (paper: control 0/80 vs 0/80; expected 0/160 vs 3/160; unexpected 3/120 vs 81/120)\n")
print(matrix(paste0(tab3, "/", n3), 3, dimnames = dimnames(tab3))[, c("truth", "liars")])

## ---- 3. Tables 5 and 7: four WEKA classifiers, default settings ----------------------
learners <- list(
  Logistic     = make_Weka_classifier("weka/classifiers/functions/Logistic"),
  SMO          = make_Weka_classifier("weka/classifiers/functions/SMO"),
  LMT          = make_Weka_classifier("weka/classifiers/trees/LMT"),
  RandomForest = make_Weka_classifier("weka/classifiers/trees/RandomForest"))
summ <- function(e) {                       # accuracy and WEKA's class-weighted ROC area
  w <- rowSums(e$confusionMatrix) / sum(e$confusionMatrix)
  c(acc = unname(e$details["pctCorrect"]), roc = sum(w * e$detailsClass[, "areaUnderROC"]))
}
tab57 <- t(sapply(learners, function(L) {
  m <- L(mind_condition ~ ., data = tr)
  c(cv   = summ(evaluate_Weka_classifier(m, numFolds = 10, seed = 1, class = TRUE)),
    t20  = summ(evaluate_Weka_classifier(m, newdata = t20,  class = TRUE)),
    t151 = summ(evaluate_Weka_classifier(m, newdata = t151, class = TRUE)))
}))
cat("\nTables 5 and 7 (accuracy %, ROC area): 10-fold CV on 40 lab, test on 20 lab, test on 151 online\n")
print(round(tab57, 3))

## ---- 4. Extension A: how much rests on the content check? ----------------------------
names(tr) <- names(t20) <- names(t151) <-
  c("errors", "latency", "first_to_enter", "writing_time", "before_enter", "truth")
tr$liar <- factor(tr$truth == "False"); t151$liar <- factor(t151$truth == "False")
y <- t151$liar == "TRUE"
auc <- function(s, y) { r <- rank(s); n1 <- sum(y); n0 <- sum(!y)
  (sum(r[y]) - n1 * (n1 + 1) / 2) / (n1 * n0) }
score_online <- function(f) {
  m <- learners$Logistic(f, data = tr)
  predict(m, newdata = t151, type = "probability")[, "TRUE"]
}
s <- list(
  `All five features (paper)`     = score_online(liar ~ errors + latency + first_to_enter + writing_time + before_enter),
  `Timing only (no error count)`  = score_online(liar ~ latency + first_to_enter + writing_time + before_enter),
  `Error count only`              = score_online(liar ~ errors),
  `Response latency only`         = score_online(liar ~ latency))
extA <- data.frame(model = names(s), accuracy = sapply(s, function(p) mean((p > 0.5) == y)),
                   auc = sapply(s, auc, y = y), row.names = NULL)
cat("\nExtension A: Logistic trained on 40 lab subjects, scored on 151 online subjects\n")
print(extA, digits = 3, row.names = FALSE)
cat("Distinct score values, all-five model:", length(unique(round(s[[1]], 6))),
    "| liars at p > .999:", round(mean(s[[1]][y] > .999), 3),
    "| truth-tellers at p > .999:", round(mean(s[[1]][!y] > .999), 3), "\n")

## ---- 5. Extension B: where the signal lives (subject-level AUC by question type) -----
raw$liar <- raw$mind_condition == "False"
fx <- c(errors = "errors", latency = "Prompted-firstdigit adjusted GULPEASE",
        typing = "writing time", before_enter = "time_key_before_enter_down",
        deletions = "number_del")
extB <- t(sapply(c("control", "expected", "unexpected"), function(q) {
  d <- raw[raw$condition == q, ]
  a <- aggregate(d[, unname(fx)], by = list(id = d$n_subject, liar = d$liar), FUN = mean)
  sapply(unname(fx), function(v) auc(a[[v]], a$liar))
}))
colnames(extB) <- names(fx)
cat("\nExtension B: subject-level AUC by question type (60 lab subjects)\n"); print(round(extB, 3))
cat("Median response latency (ms, readability-adjusted):\n")
print(round(with(raw, tapply(`Prompted-firstdigit adjusted GULPEASE`,
                             list(condition, ifelse(liar, "liar", "truth")), median))))

## ---- 6. Extension C: a detector that never sees a fraudster --------------------------
# Calibrate on the 20 lab truth-tellers only (log scale, z-scored), score the 151 online.
one_class <- function(ref, X, f) {
  L <- log(pmax(as.matrix(ref[, f, drop = FALSE]), 1))
  z <- sweep(sweep(log(pmax(as.matrix(X[, f, drop = FALSE]), 1)), 2, colMeans(L)), 2,
             apply(L, 2, sd), "/")
  rowMeans(z)
}
truth_lab <- tr[tr$liar == "FALSE", ]
tf <- c("latency", "first_to_enter", "writing_time", "before_enter")
cat("\nExtension C: one-class AUC on 151 online -- latency only",
    round(auc(one_class(truth_lab, t151, "latency"), y), 3),
    "| all four timing features", round(auc(one_class(truth_lab, t151, tf), y), 3), "\n")
cat("Single-feature AUC on 151 online:",
    paste(c("errors", tf), round(sapply(c("errors", tf), function(v) auc(t151[[v]], y)), 3),
          sep = " = ", collapse = "; "), "\n")

## ---- 7. Extension D: the step-up budget -----------------------------------------------
# ROC points do not depend on prevalence; at fraud prevalence pi the share of applicants
# flagged is pi*TPR + (1-pi)*FPR. Ties are broken at random (linear interpolation).
roc <- function(s, y) { th <- sort(unique(s), decreasing = TRUE)
  data.frame(fpr = c(0, sapply(th, function(t) mean(s[!y] >= t))),
             tpr = c(0, sapply(th, function(t) mean(s[y] >= t)))) }
caught <- function(r, pi, k) approx(pi * r$tpr + (1 - pi) * r$fpr, r$tpr, xout = k,
                                    ties = max, rule = 2)$y
R <- lapply(s[1:2], roc, y = y)
extD <- expand.grid(flag_rate = c(0.05, 0.10, 0.20), prevalence = c(0.02, 0.10))
extD$caught_all5   <- mapply(function(p, k) caught(R[[1]], p, k), extD$prevalence, extD$flag_rate)
extD$caught_timing <- mapply(function(p, k) caught(R[[2]], p, k), extD$prevalence, extD$flag_rate)
extD$precision_all5   <- extD$prevalence * extD$caught_all5 / extD$flag_rate
extD$precision_timing <- extD$prevalence * extD$caught_timing / extD$flag_rate
cat("\nExtension D: share of fraud caught when the riskiest k% are sent to step-up verification\n")
print(extD[, c(2, 1, 3:6)], digits = 3, row.names = FALSE)
grid <- seq(0, 0.30, by = 0.02)
cat("Curve at 2% prevalence, flag rate", paste(grid, collapse = ", "), "\n all five:",
    paste(round(sapply(grid, caught, r = R[[1]], pi = 0.02), 3), collapse = ", "), "\n timing:  ",
    paste(round(sapply(grid, caught, r = R[[2]], pi = 0.02), 3), collapse = ", "), "\n")
