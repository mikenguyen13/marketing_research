# Rewrite progress tracker

Status legend: ⬜ not started · 🟧 in progress · ✅ done (compiles, cited, code runs)

## Phase 0 — structure
- ✅ Renumber + manifest + integrate drafts + .gitignore (commit 0a53422)

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

## Toolchain decision
- → Migrate bookdown → **Quarto** (native Mermaid in HTML/PDF/EPUB + R chunks +
  R figures). Add GitHub Actions CI (Quarto+R+TinyTeX) building all 3 formats; user
  also builds locally. Migration is light: only ~10 \@ref, 7 part dividers, index yaml.
