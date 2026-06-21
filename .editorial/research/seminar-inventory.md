# Marketing PhD Seminar Inventory — Scoping for "Advanced Topics & Seminars"

**Purpose:** Inventory the doctoral (PhD) seminar tracks taught in marketing PhD programs at top schools, so the book's seminar coverage can be checked for comprehensiveness.

**Date:** 2026-06-21
**Author:** Editorial research (Claude)

---

## IMPORTANT METHODOLOGICAL CAVEAT — READ FIRST

The task asked me to use WebSearch/WebFetch to pull live PhD program pages and syllabi and to **cite a program URL for each claim** with **no fabricated course numbers or quotes**.

**In this environment both WebSearch and WebFetch were permission-denied** (confirmed for the main agent and for a delegated sub-agent). I therefore could **not** retrieve any live program page or syllabus, and I cannot honestly attribute specific course numbers or verbatim quotes to specific pages.

To stay within the "do not invent program details" instruction, this inventory is built from **stable, well-established field knowledge** about how marketing PhD curricula are organized (the canonical "behavioral vs. quantitative vs. modeling/strategy" division is a long-standing structural feature of the field, not a per-program detail). Where I name a program, I give the **public landing URL of its marketing PhD program** as a pointer for the human editor to verify — **I do NOT assert specific course numbers or quotes from those URLs**, because I could not load them.

**Action needed:** A human (or a future run with web access enabled) should open the program URLs in the reference list and confirm/extend the specifics (current course numbers, titles, instructor reading lists). The canonical taxonomy and the chapter-mapping/gap analysis below are reliable regardless and are the load-bearing deliverable for scoping.

---

## 1. Canonical Marketing PhD Seminar Tracks / Topics

Marketing PhD programs are almost universally organized along a primary split between a **behavioral (consumer behavior)** track and a **quantitative (modeling / empirical / analytical)** track, with **marketing strategy** sometimes a third track and sometimes folded into the quantitative side. Beneath that split, the recurring seminar topics are:

### A. Consumer Behavior (Behavioral) Seminar
Scope: psychological theory of consumer judgment, decision-making, attitudes, motivation, affect, social influence, and identity as applied to consumption. **Methods:** controlled lab and online experiments, process measures (mediation/moderation), increasingly field experiments and secondary behavioral data. Often split into two courses: a **behavioral decision theory / judgment-and-decision-making** seminar and a **social cognition / consumer psychology** seminar.

### B. Quantitative / Empirical Models in Marketing
Scope: statistical and econometric modeling of marketing phenomena — demand estimation, response models, customer/market data. **Methods:** regression, limited-dependent-variable models, panel data, endogeneity corrections, time series, often Bayesian estimation.

### C. Analytical / Game-Theoretic (Economic Theory) Modeling
Scope: formal, equilibrium-based theory of firm and consumer behavior — pricing, channels, advertising, competition, information, signaling. **Methods:** microeconomic theory, game theory, optimization, mechanism design.

### D. Structural Econometrics / Empirical Industrial Organization
Scope: estimation of models grounded in economic theory — discrete-choice demand (BLP-type), dynamic demand, supply-side/competition recovery, counterfactual policy/pricing simulation. **Methods:** discrete-choice (logit/nested/random-coefficients) demand, GMM, dynamic programming / dynamic discrete choice, simulation-based estimation.

### E. Choice Modeling / Discrete Choice & Bayesian Methods
Scope: individual-level choice and preference modeling, heterogeneity, conjoint/preference measurement. **Methods:** logit/probit, hierarchical Bayes, MCMC, mixture models, conjoint analysis.

### F. Causal Inference & Field Experiments
Scope: identification of causal effects from observational and experimental marketing data; large-scale online/field experiments (A/B testing). **Methods:** randomized field experiments, difference-in-differences, regression discontinuity, instrumental variables, synthetic control, matching.

### G. Marketing Strategy / Strategic Marketing
Scope: firm-level strategy — positioning, marketing-mix allocation, marketing capabilities/resources, marketing's link to firm performance and finance, competitive dynamics. **Methods:** mix of analytical modeling, empirical (often firm/secondary panel data), and conceptual/theory-building; marketing-finance and marketing metrics work sits here.

### H. "Marketing Models" / Marketing Science Classics (Foundations)
Scope: the canonical literature and modeling traditions of marketing science — diffusion/new-product models (Bass), advertising response, sales-force and resource allocation, market-response models. **Methods:** survey of classic models; often a first-year "models" survey seminar before specialization.

### I. Quantitative Marketing Special Topics (rotating frontier seminars)
These are the topics that vary by year/instructor and represent the current research frontier:
- **Platforms / two-sided markets / digital marketplaces** (analytical and empirical).
- **AI / Machine Learning in marketing** — ML for prediction, personalization, targeting, recommendation; deep learning.
- **Text, image, audio, and video as data** — NLP/embeddings and computer vision applied to unstructured marketing data (reviews, ads, social media).
- **Digital / online marketing, advertising, and attribution.**
- **Privacy, data, and the economics of information.**
- **Customer relationship management / CLV** as a modeling topic.

### J. Research-Craft / Professional Seminars (non-topic, but common)
Scope: how to do and publish research — research design, the review process, scientific writing, presenting. **Methods:** n/a (process seminars). The book already treats these in its "Research Craft" part.

---

## 2. Mapping: Canonical Seminar → Book Coverage

Book's relevant chapters (from `_bookdown.yml`):
- **Part 4 "Advanced Topics & Seminars":** `38-consumer-behavior-seminar`, `39-analytical-modeling-seminar`, `40-marketing-strategy-seminar` (plus `36-marketing-mix-models`, `37-strategic-dynamic-models`).
- **Part 3 "Methodology":** `25-modeling`, `26-analytical-models`, `27-empirical-models`, `28-model-building`, `29-structural-models`, `35-industrial-organization`, plus measurement/surveys/preference/qualitative/image chapters.

| # | Canonical seminar / topic | Book chapter(s) that cover it | Status |
|---|---|---|---|
| A | Consumer Behavior (behavioral) | `38-consumer-behavior-seminar` | **COVERED** |
| B | Quantitative / Empirical Models | `27-empirical-models` (+ `36-marketing-mix-models`) | **COVERED** |
| C | Analytical / Game-Theoretic Modeling | `39-analytical-modeling-seminar`, `26-analytical-models`, `37-strategic-dynamic-models` | **COVERED** |
| D | Structural Econometrics / Empirical IO | `29-structural-models`, `35-industrial-organization` | **COVERED** |
| E | Choice Modeling / Bayesian / Preference | `32-preference-measurement`, `30-measurement-scales`; choice/Bayes methods scattered | **PARTIAL** — preference/conjoint present; no dedicated discrete-choice + hierarchical-Bayes/MCMC methods seminar |
| F | Causal Inference & Field Experiments | scattered (no dedicated chapter found) | **MISSING / PARTIAL** — causal-inference toolkit (DiD, RDD, IV, synthetic control) and field-experiment design not consolidated into a seminar chapter |
| G | Marketing Strategy | `40-marketing-strategy-seminar` (+ `21-marketing-finance`) | **COVERED** |
| H | Marketing Models / MktSci classics | `25-modeling`, `28-model-building`, `36-marketing-mix-models` | **COVERED** (foundations); could be made a more explicit "classics survey" |
| I-1 | Platforms / two-sided markets | partially in `39-analytical-modeling-seminar` (platform papers) | **PARTIAL** |
| I-2 | AI / ML in marketing | not a dedicated chapter | **MISSING** |
| I-3 | Text / image / unstructured data as data | `34-image-processing` (images); text-as-data not consolidated | **PARTIAL** — image processing exists; NLP/text-as-data and a unified "unstructured data" seminar missing |
| I-4 | Digital / online advertising & attribution | `10-advertising`, `09-online-environments`, `22-privacy` (substantive, not a methods seminar) | **PARTIAL** |
| I-5 | Privacy / economics of information | `22-privacy` | **COVERED** (substantive) |
| J | Research craft (writing, review, design) | `41-scientific-writing`, `42-review-process`, `43-reporting` | **COVERED** |

---

## 3. Prioritized List of MISSING Topics to Add as Chapters

1. **Causal Inference & Field Experiments seminar (highest priority).** A consolidated methods chapter on identification — randomized field/online experiments (A/B testing at scale), difference-in-differences, regression discontinuity, instrumental variables, synthetic control, matching. This is now a core, expected component of every top quantitative marketing PhD sequence and is currently only scattered in the book.

2. **AI / Machine Learning in Marketing seminar.** ML for prediction, targeting, personalization, recommendation systems, and the ML-vs-causal-inference distinction; deep learning. A frontier seminar topic across top programs that the book lacks entirely.

3. **Text-as-Data / Unstructured Data seminar.** NLP, embeddings/LLMs, and (uniting with the existing image chapter) a "text, image, and audio as data" seminar. The book covers image processing but not text-as-data; consolidating these would match a now-standard frontier seminar.

4. **Choice Modeling & Bayesian Methods seminar.** Promote scattered discrete-choice / hierarchical-Bayes / MCMC content into a dedicated methods seminar to sit alongside conjoint/preference measurement (currently PARTIAL).

5. **Platforms / Two-Sided Markets seminar (lower priority).** Currently embedded as example papers inside the analytical-modeling seminar; could be elevated to its own special-topics chapter given how central digital platforms have become.

Items 1–3 are the clearest true gaps relative to current top-program curricula; 4–5 are consolidation/elevation of material that partly exists.

---

## 4. Program Reference URLs (for human verification — NOT fetched in this run)

These are the public marketing-PhD landing pages I would have fetched. **They were not retrievable here (web access denied); they are listed so a human or a web-enabled run can verify and extract exact current course numbers/titles.** No course numbers or quotes have been attributed to them in this document.

- Wharton (Penn): https://marketing.wharton.upenn.edu/programs/phd/
- Chicago Booth: https://www.chicagobooth.edu/phd/academic-experience/dissertation-areas/marketing
- Stanford GSB: https://www.gsb.stanford.edu/programs/phd/fields/marketing
- MIT Sloan: https://mitsloan.mit.edu/phd/program-overview/marketing
- Columbia Business School: https://students.business.columbia.edu/phd/academics/marketing
- NYU Stern: https://www.stern.nyu.edu/programs-admissions/phd/academics/marketing
- Michigan Ross: https://michiganross.umich.edu/programs/phd/academics/marketing
- Duke Fuqua: https://www.fuqua.duke.edu/programs/phd/fields-study/marketing
- Northwestern Kellogg: https://www.kellogg.northwestern.edu/programs/phd/academics/marketing.aspx
- Harvard Business School: https://www.hbs.edu/doctoral/areas-of-study/marketing/
- Berkeley Haas: https://haas.berkeley.edu/phd/fields-of-study/marketing/
- UCLA Anderson: https://www.anderson.ucla.edu/phd/academics/marketing
- USC Marshall: https://www.marshall.usc.edu/programs/phd-program/areas-study/marketing
- UT Austin (McCombs): https://www.mccombs.utexas.edu/phd/academics/marketing/
- Maryland (Smith): https://www.rhsmith.umd.edu/programs/phd/fields-study/marketing

**Status note:** Confidence is HIGH on the canonical taxonomy (Section 1), the chapter mapping (Section 2), and the gap analysis (Section 3), because the behavioral/quantitative/analytical/strategy structure is a stable, decades-old feature of the field. Confidence on any program-specific course number or syllabus detail is intentionally NOT asserted, because live pages could not be fetched in this environment.
