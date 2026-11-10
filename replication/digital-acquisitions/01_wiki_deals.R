# Pull Big Tech acquisition lists from Wikipedia via the MediaWiki parse API,
# keep rows with a parseable year and a target name, then summarise coverage.
suppressMessages({library(rvest); library(xml2); library(jsonlite); library(dplyr)})
pages <- c(
  Google    = "List_of_mergers_and_acquisitions_by_Alphabet",
  Apple     = "List_of_mergers_and_acquisitions_by_Apple",
  Amazon    = "List_of_mergers_and_acquisitions_by_Amazon",
  Facebook  = "List_of_mergers_and_acquisitions_by_Meta_Platforms",
  Microsoft = "List_of_mergers_and_acquisitions_by_Microsoft",
  Cisco     = "List_of_acquisitions_by_Cisco",
  Intel     = "List_of_mergers_and_acquisitions_by_Intel",
  Qualcomm  = "Qualcomm")
outdir <- commandArgs(TRUE)[1]
get_tables <- function(page) {
  url <- paste0("https://en.wikipedia.org/w/api.php?action=parse&format=json&prop=text&formatversion=2&page=", page)
  # Wikimedia rate-limits generic clients (HTTP 429): send a descriptive
  # User-Agent, cache each page, and pause between calls.
  cache <- file.path(outdir, paste0(page, ".json"))
  if (!file.exists(cache)) {
    h <- curl::new_handle(useragent = "academic-replication-script/0.1 (R curl)")
    curl::curl_download(url, cache, handle = h); Sys.sleep(3)
  }
  txt <- fromJSON(cache)$parse$text
  html_table(html_elements(read_html(txt), "table.wikitable"), fill = TRUE)
}
pick <- function(nm, pattern) { i <- grep(pattern, nm, ignore.case = TRUE); if (length(i)) i[1] else NA }
rows <- list()
for (acq in names(pages)) {
  tabs <- get_tables(pages[[acq]]); Sys.sleep(1)
  for (tb in tabs) {
    nm <- names(tb)
    # Skip minority-stake and divestiture tables: they are not acquisitions.
    if (any(grepl("stake|^acquirer$", nm, ignore.case = TRUE))) next
    ci <- pick(nm, "^(company|acquired company|target|name)")
    di <- pick(nm, "date|year|acquired on")
    if (is.na(ci) || is.na(di)) next
    yr <- as.integer(sub(".*?((19|20)[0-9]{2}).*", "\\1", as.character(tb[[di]]), perl = TRUE))
    rows[[length(rows) + 1]] <- data.frame(acquirer = acq, target = as.character(tb[[ci]]), year = yr)
  }
}
deals <- bind_rows(rows) |> filter(!is.na(year), year >= 1980, year <= 2026, nchar(target) > 1) |>
  mutate(target = trimws(gsub("[[][^]]*[]]", "", target))) |> distinct(acquirer, target, year)
write.csv(deals, file.path(outdir, "wiki_deals.csv"), row.names = FALSE, fileEncoding = "UTF-8")
summ <- deals |> group_by(acquirer) |>
  summarise(all_years = n(), y1987_2020 = sum(year >= 1987 & year <= 2020), first = min(year), last = max(year))
print(as.data.frame(summ)); cat("TOTAL 1987-2020:", sum(summ$y1987_2020), "\n")
