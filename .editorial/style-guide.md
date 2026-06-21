# Editorial Style Guide — *Marketing Research*

Target: a production book a top academic/technical publisher would accept. Two
audiences read every chapter: **PhD researchers** (want rigor, derivations,
citations, identification assumptions) and **senior technical industry readers**
(want intuition, worked code, decisions, trade-offs). Write so both are served:
intuition first, formalism close behind, always reproducible.

## Chapter template
Every substantive chapter follows this skeleton:

1. **`# Title`** — single H1, matches the manifest.
2. **Opening framing** (2–4 paragraphs, no heading): what the construct/method
   is, why it matters commercially and scientifically, what the reader will be
   able to do by the end. No bullet dump as the first thing on the page.
3. **Body sections** (`##`/`###`): concepts → formal model → estimation/
   measurement → worked example with code → pitfalls/identification.
4. **Closing**: "Key takeaways" or "Further reading" where useful.
5. Cross-reference other chapters with `\@ref(label)`, never "see the chapter on…".

## Depth (house decision)
- **Lean PhD/formal.** Prefer derivations, explicit models, and identification
  detail over hand-waving. Every substantive construct gets a formal definition;
  every method gets its estimator, assumptions, and what breaks identification.
  Intuition still leads each idea, but formalism follows immediately and in full.

## Citations (house decision)
- **Weave, don't list.** Integrate citations into the argument; never a bare run of
  `[@key]` + bullets.
- **Prune** off-topic or duplicative citations; keep the strongest evidence per point.
- **Flag what can't be verified.** When a claim cannot be confirmed from the source
  text available, record it in `.editorial/citation-flags.md` (per chapter) so the
  author can check the source before publication. Do not silently keep or drop it.

## Literature scope (house decision)
- **Primary venues:** the top-4 — *Journal of Marketing* (JM), *Journal of Marketing
  Research* (JMR), *Marketing Science*, *Journal of Consumer Research* (JCR). Also
  draw on JCP, JAMS, *Marketing Letters*, IJRM, QME, JPP&M, and the relevant
  finance/econ/management/CS outlets when a topic demands it.
- Cover both the **frontier** (last ~10 years) and the **seminal** work. When a
  chapter is thin on recent work, that is a gap to fill, not a stylistic choice.
- **Advisor corpora to weave in where topically appropriate** (not gratuitously):
  **Gerard J. Tellis** (advertising, innovation/new-product growth, market entry,
  virality, international diffusion) and **Detelina Marinova** (frontline/service,
  sales, customer engagement, AI in marketing, text analytics).

## Citation integrity (HARD RULE — house decision)
- **Every cited paper must carry a verified `doi` field in the `.bib`.** No DOI →
  do not cite until verified.
- **Verify before citing.** Confirm author/title/year/DOI against Crossref
  (`https://api.crossref.org/works?query.bibliographic=...`) or `https://doi.org/<doi>`.
  Never reconstruct a citation from memory; never invent a DOI.
- When adding a paper, add a clean BibTeX entry **with `doi`** to `references.bib`
  (new house bib) and cite by that key.
- Backfill DOIs onto already-cited entries that lack them (`references1.bib`,
  parts of `references.bib`/`book1.bib`). `packages.bib` is exempt (R packages).
- Anything unverifiable goes to `.editorial/citation-flags.md`, never into the book.

## Figures (HARD RULE — house decision)
- **All figures are our own.** No reproduced third-party figures or journal
  screenshots — we never want to clear permissions.
- **Default to Mermaid** for conceptual/flow/relationship diagrams (renders crisply
  in the HTML book). Use **R-generated** figures (DiagrammeR, ggplot2, base) when a
  diagram must also render in PDF/EPUB or when it is data-driven.
- Every figure has a caption and is referenced from the text.

## Texture / variety
- Vary the page: block quotes for landmark definitions or statements, callout notes
  and footnotes for asides and caveats, tables for comparisons, figures for
  processes and relationships. Avoid long unbroken runs of prose *or* of bullets.

## Voice
- Third person, present tense, precise and economical. No marketing fluff.
- Define every term on first use. Expand acronyms once: "customer lifetime value (CLV)".
- Prefer prose that explains *why* over bullet lists that merely enumerate. Bullets
  are for genuinely parallel items, not for paragraphs in disguise.
- State assumptions explicitly before results. Flag causal vs. correlational claims.

## Math & notation
- LaTeX for all math: inline `$x_i$`, display `$$ ... $$` or `equation` envs.
- Conventions: scalars italic $x$; vectors bold lower $\mathbf{x}$; matrices bold
  upper $\mathbf{X}$; estimators hatted $\hat\beta$; expectations $\mathbb{E}[\cdot]$.
- Number displayed equations that are referenced; label with `(\#eq:name)`.
- Keep one notation across the book (a master table lives in the Introduction).

## Citations & references
- Every empirical claim, effect, or method gets a `[@key]` citation. No naked claims.
- Use the existing `.bib` files; add missing keys rather than inventing prose-only refs.
- Author–year (`apalike`/natbib) is the house style.

## Code chunks
- All code is runnable and reproducible. Prefer `tidyverse`/base R unless a method
  demands a specific package; load packages in a visible setup chunk per chapter.
- `echo=TRUE` for pedagogical code; `message=FALSE, warning=FALSE` to keep output clean.
- Seed every stochastic example: `set.seed(...)`. Caption every figure and table.
- No dead code, no commented-out blocks shipped in the build.

## Tables & figures
- Tables via `knitr::kable()` (+ `kableExtra` when needed); never raw ASCII tables
  in the build output.
- Every figure/table has a caption and is referenced from the text.

## Status markers (temporary, during the rewrite)
- A chapter is "done" only when it compiles, has no TODO/`<!-- -->` stubs, every
  claim is cited, and every code chunk runs.
