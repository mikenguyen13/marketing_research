# Rewrite progress tracker

Status legend: ⬜ not started · 🟧 in progress · ✅ done (compiles, cited, code runs)

## Phase 0 — structure
- ✅ Renumber + manifest + integrate drafts + .gitignore (commit 0a53422)

## STATUS SNAPSHOT (Quarto branch)
- ✅ 31 chapters rewritten + verified (0 invented cites): Branding + wave 1 (22) + wave 2 mega (7)
- ✅ School research batch 1 committed: Michigan, WashU, Chicago, USC, UCSD (~103 verified)
- 🔄 School research batch 2 running: UCLA, Berkeley, Wharton, Stanford/MIT/Kellogg, Columbia/NYU/Duke/Harvard
- ⬜ NEXT: merge ALL verified cites (169 + school ~250) into .bib; controlled weaving pass;
     stubs/thin chapters; front matter (intro+history body); seminar gap chapters; build/render fixes

## Phase 1 — strongest chapters (exemplars)
- ✅ 08-branding — full rewrite (synthesized, formal); base-R code only; copyright
     screenshots removed; flags in citation-flags.md. Pending full-book render check.
- ⬜ 10-advertising
- ⬜ 23-metrics
- ⬜ 27-empirical-models
- ⬜ 26-analytical-models

## Phase 2 — remaining substantive chapters
- ⬜ 03-satisfaction, 04-innovation, 06-virality, 09-online-environments,
     11-communication, 13-clv, 15-influencer-marketing, 21-marketing-finance, 22-privacy

## Phase 3 — methodology + advanced + craft
- ⬜ 24-data, 25-modeling, 28-model-building, 29-structural-models, 31-surveys,
     32-preference-measurement, 33-qualitative-research, 36-mmm, 37-strategic-dynamic,
     38-cb-seminar, 39-washu, 40-pitt, 42-review-process

## Phase 4 — stubs to build from scratch
- ⬜ 46-case-advertising, 07-sarcasm, 30-measurement-scales, 43-reporting,
     34-image-processing, 05-market-entry, 02-construct-vs-variable, 16-nudges,
     28-model-building, 14-celebrity-endorsement, 41-scientific-writing
- ⬜ Integrated drafts needing expansion: 17-pricing, 18-service, 19-health, 20-gaming
- ⬜ under_construction/: _empirical_io, _political_marketing (decide: integrate or drop)

## Front matter
- ⬜ index (Preface), 01-introduction (incl. master notation table)
- 🟧 01b-history-of-marketing-thought (scaffold + verified sources gathered)

## Research gathered (DOI-verified, in .editorial/research/) — to integrate
- ✅ tellis.md (27), marinova.md (21), conjoint.md (26), branding-frontier.md (30),
     history-of-marketing.md (23 + 2 books), seminar-inventory.md
- ✅ advertising.md (24, top-4 + causal/measurement frontier)
- Spot-check (main thread, 3/3 DOIs resolved exactly) — pipeline trusted.
- NOTE: subagents could use WebFetch→Crossref but WebSearch was sometimes blocked;
  treat agent DOIs as verified-against-Crossref, still spot-check on integration.

## Seminar gaps to ADD as chapters (from seminar-inventory.md)
- ⬜ Causal Inference & Field Experiments (HIGH priority)
- ⬜ AI / Machine Learning in Marketing
- ⬜ Text/Image/Audio as Data (merge with 34-image-processing)
- ⬜ Choice Modeling & Bayesian Methods (promote scattered content)
- ⬜ Platforms / Two-Sided Markets (lower priority)

## Toolchain + hosting decision (CONFIRMED)
- Migrate bookdown → **Quarto** (native Mermaid in HTML/PDF/EPUB + R chunks + figures).
- **Host: Posit Connect** (NOT bookdown.org — that only hosts bookdown). The old
  rsconnect record (rsconnect/bookdown.org/mike/marketing_research.dcf →
  https://bookdown.org/mike/marketing_research/) will be retired/redirected.
- **Publish ONLY after a clean build** (CI green + local). Never push a half-done
  book to the live URL.
- NEEDED FROM USER for Connect deploy: Connect server URL + API key (as GitHub
  Actions secrets CONNECT_SERVER / CONNECT_API_KEY, or for local `quarto publish connect`).
- Pushed to GitHub master (ee44a56). Commits stripped of Claude co-author trailer;
  do NOT add it going forward.

## Migration steps (next focused effort, on a branch, CI-verified)
1. _quarto.yml (book: parts+chapters from manifest; formats html/pdf/epub; bibliography
   list; crossref). Retire _bookdown.yml/_output.yml.
2. git mv *.Rmd -> *.qmd; remove 7 part-*.qmd dividers (parts go in _quarto.yml).
3. Convert syntax: \@ref(x)->@sec-x (+ {#sec-x} on headings), eq env -> $$...$$ {#eq-x},
   index.Rmd header -> index.qmd + _quarto.yml.
4. .github/workflows/ CI: Quarto + R + TinyTeX render all 3 formats; deploy to Connect
   on main after green (gated on secrets).
