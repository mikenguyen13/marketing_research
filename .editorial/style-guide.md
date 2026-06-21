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
