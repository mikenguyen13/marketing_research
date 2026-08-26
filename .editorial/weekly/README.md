# Weekly journal scan

Keeps the book current with new work from top marketing journals. Two stages, deliberately split: an automated scan that only *reports*, and a manual step that *writes*.

## Stage 1 — automated scan (Mondays, 07:37)

Scheduled task `weekly-marketing-journals-scan`
(`C:\Users\miken\.claude\scheduled-tasks\weekly-marketing-journals-scan\SKILL.md`).

It runs `scan-journals.R`, screens the results for genuine fit, works out which chapter each paper belongs in, drafts verified BibTeX, and writes `digest-<date>.md`. It never edits a chapter, never touches a `.bib`, and never renders.

Run it by hand any time:

```powershell
$env:R_LIBS="C:/Users/miken/r-libs-quarto"
& "C:\Program Files\R\R-4.4.3\bin\Rscript.exe" ".editorial\weekly\scan-journals.R" 10
```

The argument is the look-back window in days (default 10, giving a few days of overlap so a missed Monday loses nothing). Pass `--all` to ignore the ledger and re-report everything in the window.

R is used because there is no working python, jq, or node on this machine — R is the only JSON-capable runtime, and it is already required to render the book.

## Stage 2 — manual integration

`/integrate-research` in an interactive session. It reads the newest digest, re-verifies every DOI against Crossref, adds entries to `verified-additions.bib`, writes the chapter prose and any R replication, renders HTML, and checks the publish gate before committing.

Kept manual on purpose: the full render is slow and Mermaid/Chrome-fragile, and chapter prose is an editorial judgment that deserves a human in the loop.

## What the scanner does

Sweeps 14 journals through the Crossref API (`from-pub-date` filter, `journal-article` only):

Journal of Marketing · Journal of Marketing Research · Journal of Consumer Research · Marketing Science · Journal of the Academy of Marketing Science · IJRM · Journal of Retailing · Journal of Consumer Psychology · Quantitative Marketing and Economics · Journal of Service Research · Journal of Interactive Marketing · Journal of Public Policy & Marketing · Marketing Letters · Management Science

Then it filters in four passes:

1. **Editorial junk** — errata, corrigenda, editorials, book reviews, front matter.
2. **Broad-journal screen** — Management Science is mostly not marketing, so it gets a two-tier keyword screen: marketing-specific terms (`conjoint`, `brand`, `word-of-mouth`, …) pass on a single hit, while generic ones (`pricing`, `rating`, `platform`, …) need three, since finance and OM papers use those constantly. Tuned against a live pull: 20 of 51 kept, with the drops all genuinely non-marketing.
3. **Already cited** — drops any DOI already in a repo `.bib` (~1,600 of them) or pasted into chapter prose.
4. **Already surfaced** — drops anything logged in `seen-dois.txt` from an earlier week.

## Files

| File | Tracked | Purpose |
|---|---|---|
| `scan-journals.R` | yes | The scanner |
| `seen-dois.txt` | yes | Ledger of every DOI ever surfaced — **must persist**, or every week re-reports the same papers |
| `digest-<date>.md` | yes | The reviewed shortlist with placements and BibTeX |
| `candidates-<date>.tsv` / `.md` | no | Raw Crossref dump, regenerable |

To deliberately re-surface papers, delete the relevant lines from `seen-dois.txt` (or the whole file to reset).

## Adding a journal

Add a row to the `journals` data frame in `scan-journals.R`. Verify the ISSN resolves before trusting it — a wrong ISSN fails silently, returning zero results every week forever:

```bash
curl -s "https://api.crossref.org/journals/<ISSN>?mailto=nguyennghia1301@gmail.com" | grep -oE '"title":"[^"]+"'
```

Set `broad = TRUE` for any journal that is only partly marketing, so it goes through the keyword screen instead of being taken whole.
