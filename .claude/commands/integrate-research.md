---
description: Integrate the latest weekly research digest into the book (citations, chapter prose, render, commit)
---

Apply the most recent weekly research digest to the book. The weekly scan (`weekly-marketing-journals-scan`) only researches and reports; this command does the actual writing.

## 1. Load the digest

Read the newest `.editorial/weekly/digest-*.md`. If the user named specific papers in `$ARGUMENTS`, integrate only those; otherwise work the full "Recommended additions" list. If no digest exists, run the scanner first:

```
$env:R_LIBS="C:/Users/miken/r-libs-quarto"; & "C:\Program Files\R\R-4.4.3\bin\Rscript.exe" ".editorial\weekly\scan-journals.R" 10
```

(PowerShell only — there is no working python/jq/node on this machine.)

## 2. Re-verify before writing

For each paper, confirm the DOI resolves and the metadata matches what the digest claims:

```
curl -s "https://api.crossref.org/works/<DOI>?mailto=nguyennghia1301@gmail.com"
```

**Never fabricate a citation.** If a DOI does not resolve, drop the paper and say so — do not guess volume, pages, or year. Read the actual abstract (and the paper where reachable) before writing about it; the digest's one-liner is a pointer, not a substitute for knowing what the paper found.

## 3. Add bibliography entries

New entries go in `verified-additions.bib` (already wired into `_quarto.yml`). Key style: `lastnameYYYYkeyword`. Before adding, check the key and DOI are not already present in **any** `.bib` in the repo — several papers are already cited under keys you would not guess:

```
grep -rin "<doi>" *.bib
grep -rin "^@.*{<proposed-key>," *.bib
```

Reuse an existing key rather than defining a second entry for the same DOI.

## 4. Write the chapter content

House pattern, matching how the eleven 2026 papers landed in commit `1817956`:

- Weave the citation into existing prose where it sharpens or updates a claim — do not bolt on a "recent research" paragraph.
- Where a paper earns two homes (a substantive chapter and a methodology/seminar chapter), cite it in both, from the angle each chapter cares about.
- In code-heavy chapters, a worked **R replication** of the paper's core idea is the house standard — a small, self-contained, runnable chunk, not pseudocode.
- Add a replication-package callout only when you have a **real, verified URL**. If there is no public package, say so plainly; the repo's rule is honesty over invented links.

**Quarto conventions that will break the build if missed:**
- `#sec-` / `#eq-` / `#fig-` / `#tbl-` anchors must be globally unique — namespace per chapter (e.g. `#sec-17-bandits`).
- knitr chunk labels must be globally unique too.
- Equation anchors must sit on the **same line** as the closing `$$`.
- Table anchors go on the **caption line** of a markdown table.
- Part pages (`parts/*.qmd`) do not resolve `@sec-`/`@fig-`/`@tbl-` cross-references — use plain prose there. Citations do work.

**Known hazard:** an external editor/linter on this machine has repeatedly stripped `{#tbl-...}` / `{#eq-...}` anchors from `.qmd` files mid-session. Right before rendering, verify nothing was silently dropped from each file you touched:

```bash
comm -23 <(git show HEAD:$f | grep -oE '\{#(eq|tbl|fig|sec)-[a-zA-Z0-9-]+\}' | sort -u) <(grep -oE '\{#(eq|tbl|fig|sec)-[a-zA-Z0-9-]+\}' $f | sort -u)
```

Anything printed was stripped and must be restored.

## 5. Render

HTML only, via **PowerShell** (the bash sandbox breaks Mermaid/Chrome):

```
$env:R_LIBS="C:/Users/miken/r-libs-quarto"
$env:PATH="C:\Program Files\R\R-4.4.3\bin;$env:PATH"
quarto render --to html
```

Kill any zombie `quarto`/`deno` processes first. A single chapter re-renders with `quarto render <file>.qmd --to html`. Do not attempt PDF/EPUB here — that path is slow and Mermaid/Chrome-fragile, and is a separate deliberate exercise.

## 6. Publish gate

Do not commit unless all three hold:

- `_book/*.html` count is **>= 75** (current baseline; it should not drop)
- render reported **0 errors**
- **0 unresolved cross-references:**

```bash
grep -rhoE '\?@?(fig|tbl|sec|eq)-[a-z0-9-]+' _book/*.html | sort -u | wc -l    # must be 0
```

Note that `code-tools: true` embeds each chapter's raw source into its HTML, so grepping `_book/*.html` for `@cite` or `:::` finds source-view copies, not body bugs. Check for `ref-<key>` anchors and `#sec-` hrefs instead.

## 7. Commit

Follow the established message shape: a one-line subject naming the count and journals, then a body listing each paper and the chapter it landed in. End with:

```
Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
```

Push to `master` (the single publish branch; Posit serves the committed `_book/`) only once the gate passes — and confirm with the user before pushing, since it publishes.

## 8. Close the loop

Append an "Integrated" section to the digest file recording what actually landed and what was skipped, so a later week does not re-litigate the same papers. The scanner's ledger (`.editorial/weekly/seen-dois.txt`) already prevents re-surfacing; the digest note explains the decision.
