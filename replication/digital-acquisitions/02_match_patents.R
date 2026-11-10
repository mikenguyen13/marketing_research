# Step 2: link acquired startups to their pre-acquisition patents.
#
# Mirrors the rule-based match in Ederer, Seibel & Simcoe (NBER WP 35762,
# Sec. 3.2): lowercase, drop a leading article, punctuation, legal/industry
# suffixes and whitespace, then require EXACT equality (no fuzzy matching).
# The paper strips 26 suffixes but does not list them; the list below is ours.
#
# Inputs
#   deals.csv            acquirer, target, year (from 01_wiki_deals.R)
#   assignee.tsv         PatentsView granted-patent assignee table
#                        (patent_id, disambig_assignee_organization)
#   application.tsv      PatentsView application table (patent_id, filing_date)
# PatentsView moved to the USPTO Open Data Portal (data.uspto.gov) on
# 2026-03-20; check its data dictionary for current file and column names.
# The paper also matches PRE-GRANT publication assignees, because about a
# third of acquired patents were filed by the target but granted after the
# deal under the acquirer's name. Add that table here for a faithful rebuild.
#
# Usage: Rscript 02_match_patents.R <deals.csv> <assignee.tsv> <application.tsv> <outdir>

suppressMessages({library(dplyr); library(data.table)})

suffixes <- c("inc", "incorporated", "corp", "corporation", "co", "company",
              "llc", "ltd", "limited", "plc", "gmbh", "ag", "sa", "sas", "bv",
              "nv", "ab", "oy", "kk", "pty", "lp", "llp", "holdings", "group",
              "technologies", "technology", "systems", "labs", "software")

clean_name <- function(x) {
  x <- tolower(enc2utf8(x))
  x <- gsub("^(the|a|an)\\s+", "", x)
  x <- gsub("[[:punct:]]", " ", x)
  toks <- strsplit(trimws(x), "\\s+")
  x <- vapply(toks, function(t) {
    while (length(t) > 1 && t[length(t)] %in% suffixes) t <- t[-length(t)]
    paste(t, collapse = "")
  }, "")
  x
}

args <- commandArgs(TRUE)
if (length(args) == 1 && args[1] == "--selftest") {
  # Cheap check that the cleaning rule behaves as documented.
  stopifnot(identical(clean_name(c("The Nest Labs, Inc.", "DeepMind Technologies Ltd",
                                   "Instagram, LLC", "GitHub Inc")),
                      c("nest", "deepmind", "instagram", "github")))
  cat("clean_name self-test passed\n"); quit(save = "no")
}

deals <- read.csv(args[1], fileEncoding = "UTF-8") |>
  filter(year >= 1987, year <= 2020) |>          # the paper's deal window
  mutate(key = clean_name(target), acq_date = as.Date(paste0(year, "-12-31")))
asg <- fread(args[2], select = c("patent_id", "disambig_assignee_organization"),
             colClasses = "character")
app <- fread(args[3], select = c("patent_id", "filing_date"), colClasses = "character")
# Clean each distinct organization name once (millions of rows, far fewer names).
orgs <- unique(asg[disambig_assignee_organization != "", .(disambig_assignee_organization)])
orgs[, key := clean_name(disambig_assignee_organization)]
asg <- merge(asg, orgs, by = "disambig_assignee_organization")
# Explicit format: malformed dates (e.g. "1074-08-14" is fine, "" is not) become NA.
app[, filing_date := as.Date(filing_date, format = "%Y-%m-%d")]

m <- merge(asg[key != "" & key %in% deals$key], app, by = "patent_id")
m <- merge(m, as.data.table(deals)[, .(acquirer, target, year, key, acq_date)],
           by = "key", allow.cartesian = TRUE)
# Pre-acquisition portfolio only. The deal list carries years, not dates, so
# this keeps patents filed up to the end of the deal year: a looser rule than
# the paper's exact acquisition date.
m <- m[!is.na(filing_date) & filing_date <= acq_date]
# A patent matching several targets goes to the earliest acquisition.
setorder(m, patent_id, year)
m <- m[!duplicated(patent_id)]

out <- m[, .(n_patents = .N), by = .(acquirer, target, year)]
summ <- merge(as.data.table(deals)[, .(n_deals = .N), by = acquirer],
              out[, .(with_patents = .N, mean_patents = mean(n_patents)), by = acquirer],
              by = "acquirer", all.x = TRUE)
summ[is.na(with_patents), with_patents := 0L]
summ[, pr_any_patent := round(with_patents / n_deals, 2)]
summ[, mean_patents := round(mean_patents, 1)]
print(summ)
cat("Targets with >=1 matched patent:", nrow(out), "of", nrow(deals),
    "| matched pre-acquisition patents:", nrow(m), "\n")
cat("Largest portfolios (screen for non-startups / false matches):\n")
print(head(out[order(-n_patents)], 25))
fwrite(m, file.path(args[4], "target_patents.csv"))
