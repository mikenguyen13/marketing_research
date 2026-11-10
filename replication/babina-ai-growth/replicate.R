# Babina, Fedyk, He & Hodson (2024, JFE) "Artificial intelligence, firm growth,
# and product innovation" -- what the public replication kit can and cannot reproduce.
#
# Kit: Mendeley Data doi:10.17632/s26kxvspn7.3 (CC BY 4.0, 381 MB). Compustat and
# CRSP inputs are confidential and replaced by pseudo data; the Open Academic Graph
# university panel, HERDS, IPEDS, and the derived university-level files are real.
# This script downloads only the five small files it needs (about 4 MB) into kit/
# (gitignored) and reproduces three published facts plus one negative check.
#
# Run from the repository root: Rscript replication/babina-ai-growth/replicate.R

suppressMessages({
  library(haven)
  library(fixest)
})

dir <- "replication/babina-ai-growth/kit"
dir.create(dir, showWarnings = FALSE, recursive = TRUE)
base <- "https://data.mendeley.com/public-files/datasets/s26kxvspn7/files"
files <- c(
  ai_cs_uni_panel.csv          = "727a302f-b61f-4909-b047-eddb2c7dc40c", # OAG
  Reseracher_IV_uni_level.dta  = "f0e93e7e-642c-4d19-a12e-d285f5aaa708", # OAG + US News
  instid_to_ipeds.dta          = "3f37de68-a003-407a-ac82-e52c62c4a07a", # HERDS-IPEDS
  herds_expenditure.dta        = "2b859183-7685-40eb-8ee2-9566ec812525", # NSF HERDS
  reg_sample_cognism.dta       = "c761ad7f-bbd2-4c35-9de8-8de89a8ff0ce"  # pseudo Compustat
)
for (f in names(files)) {
  p <- file.path(dir, f)
  if (!file.exists(p))
    download.file(file.path(base, files[[f]], "file_downloaded"), p, mode = "wb")
}

u <- read.csv(file.path(dir, "ai_cs_uni_panel.csv"), stringsAsFactors = FALSE)
r <- as.data.frame(read_dta(file.path(dir, "Reseracher_IV_uni_level.dta")))

# ---- 1. AI-strong universities (Appendix A) -------------------------------
# A university is AI-strong if, in at least one year 2005-2009, (i) its count of
# AI researchers is in the top 5% across universities, or (ii) the count is in the
# top 10% and the AI share of researchers is in the top 5%.
# Percentiles are taken over every university in the OAG panel (676), not only the
# 659 matched to HERDS; the matched-only universe drops one kit university.
pre <- subset(u, year >= 2005 & year <= 2009)
flag <- do.call(rbind, lapply(split(pre, pre$year), function(d) {
  q <- function(x, p) quantile(x, p, type = 7)
  data.frame(uni_name = d$uni_name,
             hub = d$num_ai > q(d$num_ai, .95) |
                   (d$num_ai > q(d$num_ai, .90) & d$prop_ai > q(d$prop_ai, .95)))
}))
mine <- aggregate(hub ~ uni_name, flag, any)
cmp  <- merge(mine, r[, c("inst_name_long", "aihub_uni", "top20", "top50")],
              by.x = "uni_name", by.y = "inst_name_long")
cat("Kit flag: ", sum(r$aihub_uni), "AI-strong of", nrow(r), "universities\n")
cat("Rule as stated:", sum(cmp$hub), "flagged; agree on", sum(cmp$hub == cmp$aihub_uni),
    "of", nrow(cmp), "\n")                       # 48 flagged; agree on 655 of 659
cat("Flagged by rule only:", cmp$uni_name[cmp$hub & cmp$aihub_uni == 0], "\n")
# Drexel, UC Riverside, Central Florida, Wisconsin-Madison: each just clears the
# top-5% count cut in one year. All 44 kit universities are recovered.

k <- r[r$aihub_uni == 1, ]
cat(sprintf("Top-20 (US News) that are AI-strong: %d of %d (%.0f%%)\n",
            sum(r$top20 & r$aihub_uni), sum(r$top20), 100 * mean(r$aihub_uni[r$top20 == 1])))
cat(sprintf("Top-50 that are AI-strong: %d of %d (%.0f%%)\n",
            sum(r$top50 & r$aihub_uni), sum(r$top50), 100 * mean(r$aihub_uni[r$top50 == 1])))
cat(sprintf("AI-strong that are top-20: %.1f%%; top-50: %.1f%%\n",
            100 * mean(k$top20), 100 * mean(k$top50)))  # paper: 50%, 39%, 25%, 56%
print(head(k[order(-k$num_ai), c("inst_name_long", "num_ai")], 6), row.names = FALSE)

# ---- 2. Figure A.1: OAG researcher counts track university R&D -------------
x <- as.data.frame(read_dta(file.path(dir, "instid_to_ipeds.dta")))
h <- as.data.frame(read_dta(file.path(dir, "herds_expenditure.dta")))
d <- merge(u, r[, c("inst_name_long", "university_herds")],
           by.x = "uni_name", by.y = "inst_name_long")
d <- merge(d, x[, c("inst_id", "ipeds_unitid")],
           by.x = "university_herds", by.y = "inst_id", all.x = TRUE)
d <- aggregate(cbind(num_ai, num_cs, num_other) ~ ipeds_unitid + year, d, sum)
d <- merge(d, h, by.x = c("ipeds_unitid", "year"), by.y = c("unitid", "year"))
d$lr <- log(d$num_ai + d$num_cs + d$num_other)
d$le <- log(d$expenditure_all)
ok <- is.finite(d$lr) & is.finite(d$le)
cat(sprintf("corr(log researchers, log R&D): %.3f pooled 2010-12 (n=%d); %.3f in 2010\n",
            cor(d$lr[ok], d$le[ok]), sum(ok),
            cor(d$lr[ok & d$year == 2010], d$le[ok & d$year == 2010])))  # paper: 0.83

# ---- 3. Table 3 on the kit's pseudo regression sample ------------------------
# Same specification as the do-file: standardized change in the AI-worker share,
# 2-digit NAICS fixed effects, weights = 2010 resume counts, clustered by NAICS-5.
s <- as.data.frame(read_dta(file.path(dir, "reg_sample_cognism.dta")))
s <- subset(s, include == 1)
s$ai <- as.numeric(scale(s$d_share_narrowai))
for (y in c("d_logsale", "d_logemp", "d_logmv")) {
  m <- feols(as.formula(paste(y, "~ ai | naics2")), s, weights = ~weight,
             cluster = ~naics5, notes = FALSE)
  cat(sprintf("%-10s pseudo: %6.3f (%.3f), n=%d\n", y, coef(m)["ai"], se(m)["ai"], nobs(m)))
}
# Published (Table 3, cols 1/3/5): 0.202, 0.239, 0.240 on 1,052 / 1,052 / 1,009 firms.
# Pseudo sample: -0.029, -0.170, 0.083 on 995 / 995 / 956. The code path runs; the
# numbers are not the paper's and should never be reported as a replication.
