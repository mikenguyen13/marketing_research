# Digital (killer?) acquisitions: rebuilding the data from open sources

This folder backs `marketing-strategy.qmd` (`sec-ms-corpdev-killer`) and
`47-causal-inference.qmd` (`sec-causal-did-pretrend-selection`). Both sections discuss
Ederer, Seibel & Simcoe, "Digital (Killer?) Acquisitions," NBER Working Paper 35762
(September 2026). The authors have not posted a replication package. These scripts
rebuild the paper's open-data layers, so a reader can see how far public sources go.

| Script | What it does | Status |
|---|---|---|
| `01_wiki_deals.R` | Pulls each acquirer's acquisition table from Wikipedia through the MediaWiki parse API. Drops minority-stake and divestiture tables, parses years, and writes `wiki_deals.csv`. | Run on 2026-11-10. 1,342 deals in all, 1,191 of them in 1987–2020. |
| `02_match_patents.R` | Cleans names the way the paper describes (lowercase, drop a leading article, strip punctuation and suffixes, then exact match). Links targets to PatentsView granted-patent assignees and keeps patents filed by the end of the deal year. | Run on 2026-11-10 against the November 2025 PatentsView release. About 3 minutes; output in `out/match_log.txt`. |
| `03_compare.R` | Drops portfolios above 504 patents (the paper's largest retained target) and compares the result with the paper's Table 1. | Run on 2026-11-10. 374 patent-holding targets and 5,744 patents, against 458 and 8,070 in the paper. |

```bash
Rscript 01_wiki_deals.R ./out
Rscript 02_match_patents.R ./out/wiki_deals.csv data/g_assignee_disambiguated.tsv data/g_application.tsv ./out
Rscript 03_compare.R ./out
```

## Getting the PatentsView tables (`data/`, gitignored)

The old bucket (`s3.amazonaws.com/data.patentsview.org/download/`) now returns 403. The
USPTO Open Data Portal API needs a registered key. The Internet Archive holds complete
captures of the November 2025 release:

```bash
curl -L -o data/g_assignee_disambiguated.tsv.zip \
  "https://web.archive.org/web/20260109004426id_/https://s3.amazonaws.com/data.patentsview.org/download/g_assignee_disambiguated.tsv.zip"  # 359 MB
curl -L -o data/g_application.tsv.zip \
  "https://web.archive.org/web/20260109180227id_/https://s3.amazonaws.com/data.patentsview.org/download/g_application.tsv.zip"            # 71 MB
```

The pre-grant assignee table (`pg_assignee_disambiguated`) has no archive capture. Without
it, the rebuild misses patents that a target filed but that were granted after the deal
under the acquirer's name. The paper puts these at about a third of acquired patents.

## Known false matches (exact match on cleaned names)

Exact matching on cleaned names produces these false matches:

- "Case Technology" becomes `case` and matches Case GmbH (251 patents).
- Orion (the search startup) matches Orion Corporation, a pharmaceutical firm patenting since 1976.
- NICE Software matches NICE Systems.
- Microsoft's 1999 AT&T stake appears on Wikipedia as an acquisition.

Before trusting a match, flag targets whose first matched filing is decades before the
deal, and flag one-word names.

## Other notes

- Wikimedia returns HTTP 429 to R's default user agent. The script sends a descriptive
  `User-Agent`, caches each page as JSON and sleeps between calls.
- Qualcomm has no acquisition table on Wikipedia.
- Wikipedia pages change over time, so a rerun will not reproduce the counts exactly.
  Wikipedia text is CC BY-SA. Only the derived deal list in `out/` is kept locally.
- The paper's workforce layer comes from Revelio Labs, which is commercial. No open
  substitute is scripted here.
