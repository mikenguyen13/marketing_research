# Manual batch — 2026-08-26

Not a scanner output. Sixteen papers hand-supplied by the user in one session and
integrated via `/integrate-research`. Recorded here so a later Monday scan does not
re-litigate them; all sixteen DOIs appended to `seen-dois.txt`.

Every DOI Crossref-verified (HTTP 200) before any prose was written. All sixteen are
INFORMS Articles in Advance (2026): no volume, issue, or page numbers exist yet, so
the BibTeX entries carry `note = {Articles in Advance}` and a DOI only.

## Integrated this session

| Paper | Journal | DOI | Landed in |
|---|---|---|---|
| D'Acunto, Tate & Yang — Entrepreneurial Teams: Prior Industry Experience and Early-Stage Growth | Mgmt Sci | 10.1287/mnsc.2023.00773 | `05b-entrepreneurship.qmd` §Founding Teams (+ R replication) |
| Greminger — Trade-Offs Between Ranking Objectives | Mgmt Sci | 10.1287/mnsc.2025.00782 | `51-platforms.qmd` §Governance (+ R replication) |
| Gutt, Mehta & Quinn — Hit the GAS | Inf Sys Res | 10.1287/isre.2025.2329 | `51-platforms.qmd` §sec-platform-gas (new, + R replication) |
| Zhao, Mehta & Shi — Release Strategy for Serialized Content | Mktg Sci | 10.1287/mksc.2023.0308 | `51-platforms.qmd` §sec-platform-release (new) |
| Huber, Kude, Lepoutre & Malaurent — Counter-Orchestration | Inf Sys Res | 10.1287/isre.2023.0491 | `51-platforms.qmd` §Governance |
| Liu & Ma — Media Sentiment on Foreign Countries | Mgmt Sci | 10.1287/mnsc.2024.05504 | `49-text-as-data.qmd` §sec-49-tone-attention (new) |
| Smith, Shulman & Kim — My Fair AI | Mktg Sci | 10.1287/mksc.2024.0900 | `48-ai-ml-marketing.qmd` §sec-aiml-parity-disclosure (new) |
| Lakhiwal, Liu, Bala & Suen — From Opacity to Transparency | Inf Sys Res | 10.1287/isre.2023.0579 | `48-ai-ml-marketing.qmd` §sec-aiml-anchoring (new) |
| Yu, Mayya & Ghose — Nonmonetary Virtual Gifts | Inf Sys Res | 10.1287/isre.2024.0902 | `20-gaming.qmd` §Engagement-to-Revenue Loop |
| Zhou & Sun — Ripples of Emotion | Inf Sys Res | 10.1287/isre.2023.0724 | `19-health.qmd` §sec-health-communities (new) |
| Malhotra, Ringel, Zhao & Cui — BANE brand alliances | Inf Sys Res | 10.1287/isre.2025.1792 | `08-branding.qmd` §Co-branding |
| Li, Wang, Xu, Ghose & Li — In-Store Video Analytics | Inf Sys Res | 10.1287/isre.2023.0432 | `55-clickstream.qmd` §sec-click-offline (new) |
| Liu, Yang, Pelster & Tan — Social Trading / Crypto Adoption | Inf Sys Res | 10.1287/isre.2024.1300 | `06-virality.qmd` §Contractuality |
| Gordetzki, Blohm, Clegg, Schakols & Hofstetter — Agency Configurations in GenAI Ideation | Inf Sys Res | 10.1287/isre.2024.0952 | `04-innovation.qmd` §sec-innovation-genai-ideation (new) |

## Already integrated by an earlier uncommitted session — no action

Both were found in `verified-additions.bib` under keys that would not have been
guessed, and both were already cited in chapter prose. Duplicate entries drafted this
session were deleted.

| Paper | DOI | Existing key | Already cited in |
|---|---|---|---|
| Borwankar et al. — ChatGPT's Exclusion from Stack Overflow | 10.1287/isre.2024.1235 | `borwankar2026chatgpt` | `49-text-as-data.qmd`, `51-platforms.qmd` |
| Fang et al. — Postadoption Usage Dynamics | 10.1287/isre.2024.0868 | `fang2026postadoption` | `03d-engagement-constructs.qmd`, `55-clickstream.qmd` |

**Process note.** The near-miss here was checking only the first four DOIs against the
repo `.bib` files before drafting entries. The dedup has to run over *every* DOI in the
batch, against every `.bib`, matching on DOI rather than on a guessed citation key —
especially when papers arrive by hand rather than through the scanner, since the
uncommitted working tree may already contain a previous session's integrations.

## Source-access limits worth recording

INFORMS (`pubsonline.informs.org`) and SSRN both return HTTP 403 to `WebFetch`, so full
texts were not reachable. Integrations are built on Crossref abstracts, which for
INFORMS are usually the complete author abstract. Three exceptions:

- **Smith, Shulman & Kim** — Crossref carries only a one-line teaser. The chapter text
  therefore describes the model's *structure* (strategic disclosure × recommendation ×
  AI learning investment) and explicitly defers the equilibrium characterization to the
  paper rather than asserting findings that were not read.
- **Zhao, Mehta & Shi** — Crossref teaser only; the hybrid-release result (first ~50%
  simultaneous, remainder sequential) comes from the authors' SSRN abstract.
- **Lakhiwal et al.** — the Crossref abstract is truncated at source, beginning
  mid-sentence. The setting (algorithmically evaluated asynchronous video interviews)
  was confirmed against the SSRN title and the authors' own description.

## Pre-existing issues found, not fixed here

Two duplicate cross-reference anchors exist in `HEAD` and are unrelated to this batch:
`{#eq-koyck}` in both `10-advertising.qmd` and `23-metrics.qmd`, and `{#sec-conjoint}`
in both `31-surveys.qmd` and `32-preference-measurement.qmd`.

## Open gap raised by the user

The book has no unified treatment of **mechanism design**, despite having the pieces
scattered across chapters: second-degree price discrimination and incentive
compatibility in `17-pricing.qmd`, principal–agent and salesforce compensation in
`26-analytical-models.qmd`, incentive-compatible elicitation in
`32-preference-measurement.qmd`, ad auctions in `09-online-environments.qmd` and
`35-industrial-organization.qmd`. Nothing in the corpus mentions the revelation
principle, Myerson's optimal auction, or VCG. The new `sec-platform-gas` section is the
first place the framework is named as such. A dedicated chapter or long section remains
to be written.
