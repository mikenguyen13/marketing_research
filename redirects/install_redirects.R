# Redirect stubs for the book's old bookdown.org URLs.
#
# Until 2026 the book was a bookdown site at bookdown.org/mike/marketing_research/.
# bookdown.org now 301-redirects every path to the same filename on Posit Connect
# Cloud, but the Quarto rebuild renamed every chapter (satisfaction.html ->
# 03-satisfaction.html), so the old URLs that Google still knew returned 404.
# Search Console listed 158 such URLs in Nov 2026.
#
# redirects/redirect_map.json maps each old filename to its new page, plus an
# optional #section. Sources: the Wayback Machine index of the old site and
# Search Console's 404 list; matched by chapter title, section title, or by hand.
#
# Runs as a Quarto post-render step (see project: post-render in _quarto.yml)
# and writes one small HTML page per old filename into the output dir:
# meta refresh + JS location.replace to the new page, and a canonical link to
# the GitHub Pages copy (the copy search engines should index). A stub never
# replaces a page the render produced.

base <- "https://mikenguyen13.github.io/marketing_research/"
out_dir <- Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR", "_book")
map_path <- file.path("redirects", "redirect_map.json")

esc <- function(x) {
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  x <- gsub(">", "&gt;", x, fixed = TRUE)
  gsub("\"", "&quot;", x, fixed = TRUE)
}

map <- jsonlite::read_json(map_path)
written <- 0L
for (old in names(map)) {
  dest <- file.path(out_dir, old)
  if (file.exists(dest) && !any(grepl('http-equiv="refresh"', readLines(dest, n = 12, warn = FALSE), fixed = TRUE))) {
    next  # a real page now uses this filename; it wins
  }
  to <- map[[old]]
  page <- sub("#.*$", "", to)
  if (!file.exists(file.path(out_dir, page))) {
    warning("redirect target missing from ", out_dir, ": ", old, " -> ", to)
  }
  canon <- paste0(base, sub("^index[.]html$", "", page))
  html <- c(
    "<!DOCTYPE html>",
    "<html lang=\"en\">",
    "<head>",
    "<meta charset=\"utf-8\">",
    "<title>Moved | Marketing Research</title>",
    paste0("<link rel=\"canonical\" href=\"", esc(canon), "\">"),
    paste0("<meta http-equiv=\"refresh\" content=\"0; url=", esc(to), "\">"),
    "<script>",
    "(function () {",
    paste0("  var to = ", jsonlite::toJSON(to, auto_unbox = TRUE), ";"),
    "  if (to.indexOf(\"#\") < 0 && location.hash) to += location.hash;",
    "  location.replace(to);",
    "})();",
    "</script>",
    "</head>",
    "<body>",
    paste0("<p>This page has moved to <a href=\"", esc(to), "\">", esc(to), "</a>.</p>"),
    "</body>",
    "</html>"
  )
  con <- file(dest, open = "wb")
  writeLines(html, con, sep = "\n", useBytes = TRUE)
  close(con)
  written <- written + 1L
}
cat("redirect stubs:", written, "written to", out_dir, "\n")
