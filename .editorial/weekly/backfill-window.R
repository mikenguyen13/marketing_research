#!/usr/bin/env Rscript
# ---------------------------------------------------------------------------
# backfill-window.R -- one-off Crossref sweep over an ARBITRARY, BOUNDED window.
#
# Why this exists separately from scan-journals.R: the weekly scanner takes a
# lower bound only (`from-pub-date`) and pulls `rows=100` per journal with no
# paging. That is fine for a 10-day window, where no marketing journal comes
# close to 100 articles -- but it silently TRUNCATES over a multi-month window,
# and the truncation is invisible (you just get 100 rows and no warning).
#
# So this script adds the two things a backfill needs:
#   1. an upper bound (`until-pub-date`), so windows can be disjoint
#   2. cursor paging, so a journal with 400 articles yields 400 rows
#
# Screening, cleaning, and dedup logic are deliberately kept identical to
# scan-journals.R so the two produce comparable output.
#
# Usage:  Rscript .editorial/weekly/backfill-window.R <from> <until> [--dry]
#   e.g.  Rscript .editorial/weekly/backfill-window.R 2026-01-01 2026-06-30
#         --dry  = do not append to the seen-dois ledger
# Output: .editorial/weekly/candidates-backfill-<from>_<until>.tsv / .md
# ---------------------------------------------------------------------------

suppressPackageStartupMessages({
  library(jsonlite)
})

args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 2) stop("usage: backfill-window.R <from YYYY-MM-DD> <until YYYY-MM-DD> [--dry]")
from_date  <- args[1]
until_date <- args[2]
dry_run    <- "--dry" %in% args
mailto     <- "nguyennghia1301@gmail.com"

stopifnot(grepl("^\\d{4}-\\d{2}-\\d{2}$", from_date),
          grepl("^\\d{4}-\\d{2}-\\d{2}$", until_date))

repo_root <- normalizePath(file.path(dirname(sub("^--file=", "", grep("^--file=",
  commandArgs(trailingOnly = FALSE), value = TRUE)[1])), "..", ".."), mustWork = FALSE)
if (is.na(repo_root) || !dir.exists(repo_root)) repo_root <- normalizePath(".")

out_dir <- file.path(repo_root, ".editorial", "weekly")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

# --- journals (same list as scan-journals.R) --------------------------------
journals <- rbind(
  data.frame(issn = "0022-2429", name = "Journal of Marketing",                        broad = FALSE),
  data.frame(issn = "0022-2437", name = "Journal of Marketing Research",               broad = FALSE),
  data.frame(issn = "0093-5301", name = "Journal of Consumer Research",                broad = FALSE),
  data.frame(issn = "0732-2399", name = "Marketing Science",                           broad = FALSE),
  data.frame(issn = "0092-0703", name = "Journal of the Academy of Marketing Science", broad = FALSE),
  data.frame(issn = "0167-8116", name = "International Journal of Research in Marketing", broad = FALSE),
  data.frame(issn = "0022-4359", name = "Journal of Retailing",                        broad = FALSE),
  data.frame(issn = "1057-7408", name = "Journal of Consumer Psychology",              broad = FALSE),
  data.frame(issn = "1570-7156", name = "Quantitative Marketing and Economics",        broad = FALSE),
  data.frame(issn = "1094-6705", name = "Journal of Service Research",                 broad = FALSE),
  data.frame(issn = "1094-9968", name = "Journal of Interactive Marketing",            broad = FALSE),
  data.frame(issn = "0743-9156", name = "Journal of Public Policy & Marketing",        broad = FALSE),
  data.frame(issn = "0923-0645", name = "Marketing Letters",                           broad = FALSE),
  data.frame(issn = "0025-1909", name = "Management Science",                          broad = TRUE),
  stringsAsFactors = FALSE
)

strong_terms <- c(
  "marketing", "consumer", "\\bbrand", "advertis", "\\bretail",
  "word.of.mouth", "social media", "influencer", "conjoint",
  "assortment", "e.?commerce", "recommender", "recommendation",
  "willingness to pay", "shopper",
  "customer (acquisition|retention|loyalt|lifetime|satisfaction|churn)",
  "\\bchurn", "\\bloyalt", "discrete choice", "choice model",
  "price discrimination", "dynamic pricing", "personaliz",
  "targeted (ad|market|promot)", "new product (development|introduction)",
  "product line", "salesforce", "sales force", "online review",
  "product review", "user.generated", "purchase (intention|decision|behavio)"
)
weak_terms <- c(
  "customer", "platform", "\\bpricing\\b", "\\brating", "\\breview",
  "purchas", "\\bdemand\\b", "promotion", "subscription", "product design",
  "\\bsearch\\b", "adoption", "diffusion", "engagement", "satisfaction"
)

screen_marketing <- function(title, abstract) {
  hay <- tolower(paste(title, abstract))
  s <- vapply(hay, function(h) sum(vapply(strong_terms, function(p) grepl(p, h, perl = TRUE), logical(1))), integer(1))
  w <- vapply(hay, function(h) sum(vapply(weak_terms,   function(p) grepl(p, h, perl = TRUE), logical(1))), integer(1))
  unname(s >= 1 | w >= 3)
}

`%||%` <- function(a, b) if (is.null(a) || length(a) == 0 || all(is.na(a))) b else a

flatten_txt <- function(x) {
  if (is.null(x) || length(x) == 0) return(NA_character_)
  x <- unlist(x); x <- x[!is.na(x)]
  if (length(x) == 0) return(NA_character_)
  paste(x, collapse = " ")
}

# Crossref ships JATS XML in titles and abstracts, plus raw newlines that would
# split a record across TSV lines. Squish at parse time, same as the weekly scan.
clean_txt <- function(x, drop_lead_abstract = FALSE) {
  if (is.null(x) || length(x) == 0 || is.na(x)) return(NA_character_)
  x <- gsub("<[^>]+>", " ", x)
  x <- gsub("&[a-zA-Z]+;|&#[0-9]+;", " ", x)
  if (drop_lead_abstract) x <- gsub("^\\s*Abstract\\s*", "", x)
  x <- gsub("[\r\n\t]+", " ", x)
  x <- gsub("\\s+", " ", x)
  x <- trimws(x)
  if (!nzchar(x)) NA_character_ else x
}

fmt_authors <- function(a) {
  if (is.null(a) || !is.data.frame(a) || nrow(a) == 0) return(NA_character_)
  fam <- a$family %||% rep(NA_character_, nrow(a))
  fam <- fam[!is.na(fam)]
  if (length(fam) == 0) return(NA_character_)
  if (length(fam) <= 3) paste(fam, collapse = ", ") else paste0(fam[1], " et al.")
}

pub_year <- function(dp) {
  if (is.null(dp) || length(dp) == 0) return(NA_integer_)
  suppressWarnings(as.integer(unlist(dp)[1]))
}
pub_date <- function(dp) {
  if (is.null(dp) || length(dp) == 0) return(NA_character_)
  p <- unlist(dp); p <- p[!is.na(p)]
  if (length(p) == 0) return(NA_character_)
  paste(sprintf("%02d", as.integer(p)), collapse = "-")
}

# --- paged fetch ------------------------------------------------------------
# Cursor paging (`cursor=*`, then next-cursor) rather than offset: Crossref caps
# deep offsets, and cursors are the documented way to walk a full result set.
fetch_journal <- function(issn, name) {
  cursor <- "*"
  parts  <- list()
  total  <- NA_integer_
  repeat {
    url <- sprintf(
      paste0("https://api.crossref.org/journals/%s/works",
             "?filter=from-pub-date:%s,until-pub-date:%s,type:journal-article",
             "&rows=100&cursor=%s",
             "&select=DOI,title,author,published,abstract,URL,volume,issue,page,container-title",
             "&mailto=%s"),
      issn, from_date, until_date, utils::URLencode(cursor, reserved = TRUE), mailto
    )
    res <- try(jsonlite::fromJSON(url, simplifyVector = TRUE), silent = TRUE)
    if (inherits(res, "try-error")) {
      message(sprintf("  !! %s (%s): request failed", name, issn))
      break
    }
    if (is.na(total)) total <- res$message$`total-results` %||% NA_integer_
    items <- res$message$items
    if (is.null(items) || length(items) == 0 || nrow(items) == 0) break

    n <- nrow(items)
    parts[[length(parts) + 1]] <- data.frame(
      journal  = name,
      doi      = items$DOI %||% rep(NA_character_, n),
      title    = vapply(seq_len(n), function(i) clean_txt(flatten_txt(items$title[i])), character(1)),
      authors  = vapply(seq_len(n), function(i) {
                   a <- if (!is.null(items$author)) items$author[[i]] else NULL
                   fmt_authors(a)
                 }, character(1)),
      year     = vapply(seq_len(n), function(i) {
                   y <- pub_year(items$published$`date-parts`[[i]]); if (is.na(y)) NA_integer_ else y
                 }, integer(1)),
      date     = vapply(seq_len(n), function(i) pub_date(items$published$`date-parts`[[i]]), character(1)),
      volume   = as.character(items$volume %||% rep(NA, n)),
      issue    = as.character(items$issue  %||% rep(NA, n)),
      pages    = as.character(items$page   %||% rep(NA, n)),
      url      = items$URL %||% rep(NA_character_, n),
      abstract = vapply(seq_len(n), function(i) {
                   clean_txt(flatten_txt(if (!is.null(items$abstract)) items$abstract[i] else NA),
                             drop_lead_abstract = TRUE)
                 }, character(1)),
      stringsAsFactors = FALSE
    )
    nxt <- res$message$`next-cursor`
    if (is.null(nxt) || !nzchar(nxt) || n < 100) break
    cursor <- nxt
    Sys.sleep(0.3)
  }
  if (length(parts) == 0) {
    message(sprintf("  -- %s: 0", name))
    return(NULL)
  }
  df <- do.call(rbind, parts)
  message(sprintf("  ok %s: %d fetched (Crossref reports %s total)", name, nrow(df),
                  ifelse(is.na(total), "?", total)))
  df
}

# --- fetch ------------------------------------------------------------------
message(sprintf("Crossref BACKFILL sweep: published %s .. %s\n", from_date, until_date))

all_rows <- list()
for (i in seq_len(nrow(journals))) {
  j  <- journals[i, ]
  df <- fetch_journal(j$issn, j$name)
  if (!is.null(df) && nrow(df) > 0) {
    if (isTRUE(j$broad)) {
      keep <- screen_marketing(df$title, df$abstract)
      message(sprintf("     (broad journal: kept %d/%d on marketing screen)", sum(keep), nrow(df)))
      df <- df[keep, , drop = FALSE]
    }
    all_rows[[length(all_rows) + 1]] <- df
  }
  Sys.sleep(0.4)
}

if (length(all_rows) == 0) {
  message("\nNo results from any journal.")
  quit(status = 0)
}
cands <- do.call(rbind, all_rows)
n_raw <- nrow(cands)

# --- drop non-research content ----------------------------------------------
junk <- paste("^erratum", "^corrigendum", "^correction", "^editorial",
              "^book review", "^front matter", "^back matter", "^call for papers",
              "^retraction", "^acknowledg", "^index to volume", "^in this issue",
              "^from the editor", "^introduction to the special",
              sep = "|")
tt    <- tolower(gsub("^express:\\s*", "", cands$title))
cands <- cands[!grepl(junk, tt) & !is.na(cands$title) & nchar(cands$title) > 12, , drop = FALSE]

# --- drop anything already cited in the book --------------------------------
bib_files <- list.files(repo_root, pattern = "\\.bib$", full.names = TRUE)
known_doi <- character(0)
for (f in bib_files) {
  txt <- tryCatch(readLines(f, warn = FALSE, encoding = "UTF-8"), error = function(e) character(0))
  m   <- unlist(regmatches(txt, gregexpr("(?i)doi\\s*=\\s*[{\"]\\s*([^}\"]+)", txt, perl = TRUE)))
  if (length(m)) known_doi <- c(known_doi, tolower(trimws(sub("(?i)^doi\\s*=\\s*[{\"]\\s*", "", m, perl = TRUE))))
}
qmd <- list.files(repo_root, pattern = "\\.qmd$", full.names = TRUE)
for (f in qmd) {
  txt <- tryCatch(readLines(f, warn = FALSE, encoding = "UTF-8"), error = function(e) character(0))
  m   <- unlist(regmatches(txt, gregexpr("10\\.[0-9]{4,9}/[^ )\\]\"'>,;]+", txt, perl = TRUE)))
  if (length(m)) known_doi <- c(known_doi, tolower(sub("[.,;]+$", "", m)))
}
known_doi <- unique(known_doi[nzchar(known_doi)])

dup   <- tolower(cands$doi) %in% known_doi
n_dup <- sum(dup)
cands <- cands[!dup, , drop = FALSE]
cands <- cands[!duplicated(tolower(cands$doi)), , drop = FALSE]

# --- drop anything a previous sweep already surfaced ------------------------
ledger <- file.path(out_dir, "seen-dois.txt")
seen   <- if (file.exists(ledger)) tolower(trimws(readLines(ledger, warn = FALSE))) else character(0)
seen   <- seen[nzchar(seen)]

n_seen <- sum(tolower(cands$doi) %in% seen)
cands  <- cands[!(tolower(cands$doi) %in% seen), , drop = FALSE]

if (nrow(cands) > 1) {
  yr <- suppressWarnings(as.integer(cands$year)); yr[is.na(yr)] <- 0L
  cands <- cands[order(cands$journal, -yr), , drop = FALSE]
}

if (!dry_run && nrow(cands) > 0) {
  cat(tolower(cands$doi), file = ledger, sep = "\n", append = file.exists(ledger))
  cat("\n", file = ledger, append = TRUE)
}

message(sprintf("\n%d fetched -> %d new candidates (%d already cited, %d surfaced in an earlier sweep)",
                n_raw, nrow(cands), n_dup, n_seen))
message(sprintf("Repo has %d known DOIs.%s", length(known_doi),
                if (dry_run) "  [--dry: ledger NOT updated]" else ""))

# --- write ------------------------------------------------------------------
tag <- sprintf("backfill-%s_%s", from_date, until_date)
tsv <- file.path(out_dir, sprintf("candidates-%s.tsv", tag))
write.table(cands, tsv, sep = "\t", row.names = FALSE, quote = TRUE, fileEncoding = "UTF-8")

md  <- file.path(out_dir, sprintf("candidates-%s.md", tag))
con <- file(md, open = "w", encoding = "UTF-8")
writeLines(c(
  sprintf("# Crossref backfill candidates -- %s to %s", from_date, until_date),
  "",
  sprintf("%d articles fetched across %d journals; **%d new candidates** after removing %d already cited and %d surfaced in an earlier sweep.",
          n_raw, nrow(journals), nrow(cands), n_dup, n_seen),
  "",
  "This window predates the weekly scanner's baseline, so nothing here had been seen before.",
  "Raw Crossref output -- not yet screened for fit; that is the reviewing step.",
  ""
), con)
for (jn in unique(cands$journal)) {
  sub <- cands[cands$journal == jn, , drop = FALSE]
  writeLines(c(sprintf("## %s (%d)", jn, nrow(sub)), ""), con)
  for (k in seq_len(nrow(sub))) {
    r  <- sub[k, ]
    ti <- gsub("^EXPRESS:\\s*", "", r$title)
    ab <- if (is.na(r$abstract)) "_(no abstract in Crossref)_"
          else paste0(substr(r$abstract, 1, 700), if (nchar(r$abstract) > 700) "..." else "")
    writeLines(c(
      sprintf("### %s", ti),
      sprintf("- **Authors:** %s", r$authors %||% "?"),
      sprintf("- **DOI:** [%s](https://doi.org/%s)", r$doi, r$doi),
      sprintf("- **Published:** %s", r$date %||% "?"),
      sprintf("- **Abstract:** %s", ab),
      ""
    ), con)
  }
}
close(con)

message(sprintf("\nWrote:\n  %s\n  %s", tsv, md))
