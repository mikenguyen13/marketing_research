# Customer Lifetime Value: A Citation-Verified, Production-Aware Map

A comprehensive, demonstrable research note for massively expanding the Customer
Lifetime Value chapter (`13-clv.qmd`, `{#sec-clv}`). It covers the foundational
probabilistic ("buy-till-you-die") tradition, the contractual/non-contractual
taxonomy, econometric/hierarchical-Bayes CLV, the machine-learning and deep-learning
frontier (2015–2026), causal/decision-focused CLV, the full set of adjacent
constructs (customer equity, CAC, RFM, churn/retention, NRR/GRR, CRV, CEV,
CLV→firm-value), **how industry actually computes and uses CLV across company types**,
and a list of ~13 runnable R code demonstrations on simulated data.

**Verification protocol.** Every DOI in this note was queried against the Crossref
REST API (`https://api.crossref.org/works/<doi>` for exact-DOI confirmation;
`https://api.crossref.org/works?query.bibliographic=...` for discovery). The title,
container-title (journal/proceedings), issued year, and first-author family name
returned by the Crossref *version-of-record* record were confirmed before an entry
was admitted to the **Verified DOI ledger**. Several plausible-looking DOIs were
guessed, **failed** verification (404 or resolved to the *wrong* paper), and were
corrected — these are logged in **Verification incidents** as a guardrail against
silent citation rot. Monographs, working papers, conference talks, software papers,
preprints, trade-press pieces, and HBR articles that genuinely carry **no journal
DOI** are flagged as such — **no DOI was invented**.

**Relation to the existing chapter.** `13-clv.qmd` already develops (a) the
discounted-margin definition `@eq-clv-general`, (b) the geometric/margin-multiple
special case, (c) the **shifted-beta-geometric** retention model with reproducible
sBG estimation code, (d) **customer referral value** with the type-one/type-two
split, and (e) an identification section. It cites `schmittlein1982`, `fader2005`
(implicitly via the BG/NBD discussion), `gupta2006modeling`, `Kumar_2008`,
`kumar2010`, `kumar_2007`, `sunder2016measuring`, `mccarthy2017`. This note is the
*expansion map*: it supplies the foundational probabilistic models the chapter
references but does not yet formalize (Pareto/NBD, BG/NBD, Gamma-Gamma), the
econometric/HB and ML/deep-learning traditions the chapter currently omits, the
decision-focused/causal layer, the adjacent constructs, and an entire
**industry-practice** section the chapter lacks. It does **not** edit any `.qmd` or
`.bib` file.

> **Bib-key cautions (verified against the repo's `.bib` files; do not silently
> reuse these keys).** Three existing keys are easy to misread:
> - `schmittlein1982` = Schmittlein & Mahajan (1982), a *different* paper from the
>   canonical Pareto/NBD origin, which is **Schmittlein, Morrison & Colombo (1987)**,
>   *Management Science* (DOI `10.1287/mnsc.33.1.1`). The 1987 paper is the
>   "buy-till-you-die" foundation and is **not yet in the repo** under its own key.
> - `kumar_2007` resolves in `references.bib` to "How Valuable Is Word of Mouth?"
>   (Kumar, Petersen & Leone), **not** to a CRV/Driving-Profitability paper. The
>   formal CRV model is Kumar, Petersen & Leone (2010) JM, `10.1509/jmkg.74.5.001`.
> - `rust2002customer` in `references1.bib` is Rust, Kannan & Peng, "The Customer
>   Economics of Internet Privacy" — **not** the Rust/Lemon/Zeithaml customer-equity
>   paper. "Return on Marketing" is `10.1509/jmkg.68.1.109.24030`.
> Adding any of the new references below requires new keys; the maintainer edits the
> `.bib` (this note does not).

---

## Block 1 — Foundational probabilistic / "Buy-Till-You-Die" (BTYD) models

The probabilistic tradition posits a small generative model for two latent processes
— a **purchase process** while the customer is "alive" and a **dropout (death)
process** that ends the relationship at an unobserved time — and derives expected
future transactions and value in closed form from **recency–frequency** sufficient
statistics. These are the workhorse of *non-contractual* customer-base analysis
(retail, e-commerce), where churn is never observed and must be inferred. The chapter
already motivates the latent-attrition idea; this block supplies the actual models.

| Model | What it adds | Latent death process | Reference (DOI status) |
|---|---|---|---|
| **Pareto/NBD** | The origin BTYD model. Poisson purchasing while alive (rate λ ~ Gamma across customers); lifetime exponential (rate μ ~ Gamma). Infers P(alive) and E[transactions] from recency (last purchase) + frequency. | Continuous (exponential) | Schmittlein, Morrison & Colombo (1987), *Mgmt Sci* — **VERIFIED** |
| **BG/NBD** | "Counting Your Customers the *Easy* Way." Replaces the analytically awkward Pareto death process with a **beta-geometric**: a customer flips a coin to "die" *immediately after each purchase*. Far easier to estimate; nearly identical fit. The single most-used BTYD model. | Discrete-after-purchase (geometric) | Fader, Hardie & Lee (2005), *Mktg Sci* — **VERIFIED** |
| **Gamma-Gamma monetary value** | Models *spend per transaction* (not timing). Average transaction value ~ Gamma; the customer's latent mean ~ Gamma across the population; spend assumed independent of transaction frequency. Multiply E[transactions] × E[spend] for a monetary CLV. | n/a (value model) | Introduced/operationalized in Fader, Hardie & Lee (2005), "RFM and CLV," *JMR* — **VERIFIED**; technical-note derivation by Fader & Hardie has **NO journal DOI** (working note) |
| **RFM-and-CLV / iso-value curves** | Shows RFM and the BTYD models are two views of the same thing; introduces **iso-value curves** grouping customers with different histories but equal future value. | — | Fader, Hardie & Lee (2005), *JMR* — **VERIFIED** |
| **MBG/NBD** | "Modified BG/NBD." Fixes a BG/NBD edge case: lets customers with **zero repeat purchases** also have a dropout opportunity (BG/NBD forces a customer to be alive until their first repeat). Better for sparse data. | Geometric (incl. at time 0) | Batislam et al. / Hoppe & Wagner — secondary literature; **NO single canonical top-journal DOI** (flag; implemented in BTYDplus/CLVTools) |
| **CBG/NBD** | "Contractual-ish" BG variant allowing dropout at the start of each interval. | Geometric | Hoppe & Wagner (2007), working/secondary — **NO verified journal DOI** (flag; implemented in BTYDplus) |
| **Pareto/NBD (HB)** | Hierarchical-Bayes Pareto/NBD with individual-level posteriors and covariates (see Block 3). | Exponential | Abe (2009), *Mktg Sci* — **VERIFIED** |
| **Periodic Death Opportunity (PDO)** | Discrete-time death-opportunity model bridging BG/NBD (death any time) and contractual (death only at renewal); death checked on a *periodic* grid. | Discrete grid | Jerath, Fader & Hardie — secondary/working; **NO verified journal DOI** (flag) |

**R tooling for Block 1.** Three packages implement these:
- **`BTYD`** (CRAN) — the original: Pareto/NBD, BG/NBD, BG/BB (discrete contractual),
  plus Gamma-Gamma spend. Mature, well-documented, slower.
- **`BTYDplus`** (CRAN) — extends `BTYD` with **MBG/NBD, MBG/CNBD-k, Pareto/NBD (HB)
  via MCMC, Pareto/GGG** and data-simulation utilities. The package to reach for when
  the basic models underfit.
- **`CLVTools`** (CRAN) — the modern, fastest, most actively maintained option:
  Pareto/NBD (incl. **time-invariant and time-varying covariates**), BG/NBD,
  GGompertz/NBD, Gamma-Gamma spending, a tidy `clvdata()` data pipeline, and built-in
  holdout validation. Package paper: Meierer, Bachmann, Näf, Schilter & Algesheimer,
  "Estimating Individual Customer Lifetime Values with R: The CLVTools Package" —
  **software paper / preprint (arXiv 2602.09845), NO journal DOI yet** (flag; cite as
  software + arXiv).
- Python parallels (Block 7): **`lifetimes`** (now community-maintained as
  `pymc-marketing`'s CLV module) and **`lifelines`** (survival).

---

## Block 2 — Contractual vs non-contractual; discrete vs continuous time

This 2×2 is the *organizing taxonomy* of the entire field; it tells you which model
class is even admissible. The chapter's sBG section sits in the
**contractual × discrete** cell; the BTYD models above sit in **non-contractual**.

| | **Discrete time** | **Continuous time** |
|---|---|---|
| **Contractual** (churn *observed*: subscriptions, insurance, B2B SaaS) | **shifted-beta-geometric (sBG)** for retention; BG/BB for transactions. *This is the chapter's worked example.* | Survival models (exponential/Weibull/Cox) on time-to-churn |
| **Non-contractual** (churn *latent*: retail, e-commerce, DTC) | **BG/BB** (discrete BTYD) | **Pareto/NBD, BG/NBD, Gamma-Gamma** |

- **shifted-beta-geometric (sBG)** — each customer has a fixed latent per-period churn
  probability θ ~ Beta(α,β); aggregate retention *rises with tenure* purely through
  sorting (heterogeneity), not duration dependence. **Fader & Hardie (2007), "How to
  Project Customer Retention," *J. Interactive Marketing*** — **VERIFIED**
  (`10.1002/dir.20074`). *This is the paper the chapter's sBG code implements; it
  should be cited explicitly there.*
- **Probability Models for Customer-Base Analysis** — Fader & Hardie's unifying
  tutorial mapping the whole taxonomy. **VERIFIED** (`10.1016/j.intmar.2008.11.003`).
- The taxonomy framing itself is canonical in Fader & Hardie's body of work and in
  Gupta et al. (2006) "Modeling CLV" (Block 6).

---

## Block 3 — Econometric / regression / hierarchical-Bayes CLV

Where BTYD models are deliberately covariate-light, the econometric tradition predicts
the *components* of `@eq-clv-general` (incidence, frequency, spend, churn) with
regression/HB machinery and rich covariates (demographics, marketing touches, channel,
macro). Strength: targeting and what-if on marketing levers. Weakness: many models to
maintain and validate.

- **Abe (2009), "'Counting Your Customers' One by One: A Hierarchical Bayes Extension
  to the Pareto/NBD Model," *Mktg Sci*** — **VERIFIED** (`10.1287/mksc.1090.0502`).
  Recasts Pareto/NBD as HB, yielding individual-level posteriors, **covariate effects**
  on the purchase/dropout rates, and honest uncertainty. The bridge between BTYD and
  regression CLV.
- **Venkatesan & Kumar (2004), "A Customer Lifetime Value Framework for Customer
  Selection and Resource Allocation Strategy," *JM*** — **VERIFIED**
  (`10.1509/jmkg.68.4.106.42728`). Component-model CLV with covariates, used to *rank
  and select* customers and allocate contact across channels.
- **Reinartz & Kumar (2003), "The Impact of Customer Relationship Characteristics on
  Profitable Lifetime Duration," *JM*** — **VERIFIED** (`10.1509/jmkg.67.1.77.18589`).
  Hazard/duration model of *profitable* lifetime — the econometric face of retention.
- **Schweidel, Fader & Bradlow (2008), "Understanding Service Retention Within and
  Across Cohorts Using Limited Information," *JM*** — **VERIFIED**
  (`10.1509/jmkg.72.1.082`). Hierarchical retention with duration dependence,
  promotional effects, and cross-cohort pooling — directly relevant to the chapter's
  "fit on the first *i* months" identification demonstration.
- **Schweidel, Fader & Bradlow (2008), "A Bivariate Timing Model of Customer
  Acquisition and Retention," *Mktg Sci*** — **VERIFIED** (`10.1287/mksc.1070.0328`).
  Jointly models *when* a customer is acquired and *how long* they stay (acquisition
  and retention are correlated; ignoring the link biases CLV).
- **Donkers, Verhoef & de Jong (2007), "Modeling CLV: A Test of Competing Models in the
  Insurance Industry," *Quant. Mktg. & Econ.*** — **VERIFIED**
  (`10.1007/s11129-006-9016-y`). A model *tournament* — finds that simple status-quo
  and Markov models often match or beat elaborate ones out-of-sample. The empirical
  humility check.
- **Pfeifer & Carraway (2000), "Modeling Customer Relationships as Markov Chains," *J.
  Interactive Marketing*** — **VERIFIED**
  (`10.1002/(sici)1520-6653(200021)14:2<43::aid-dir4>3.0.co;2-h`). The **Markov-chain
  migration** approach: define states (active/lapsed/lost), transition matrix, reward
  per state; CLV is the discounted expected reward. The bridge to MDP/decision models.
- **Berger & Nasr (1998), "Customer Lifetime Value: Marketing Models and
  Applications," *J. Interactive Marketing*** — **VERIFIED**
  (`10.1002/(SICI)1520-6653(199824)12:1<17::AID-DIR3>3.0.CO;2-K`). The early
  closed-form CLV formulas the managerial tradition built on.

---

## Block 4 — Machine-learning & deep-learning CLV (the frontier)

The production frontier has shifted from closed-form probability models to supervised
ML and deep learning on rich feature sets and raw event sequences. Recurring design
patterns:

1. **Two-stage churn × spend ("propensity × value").** Stage 1: a classifier
   (logistic, GBM, random forest) predicts P(active / repeat-purchase) over the
   horizon. Stage 2: a regressor predicts conditional spend. CLV = P(active) ×
   E[spend] × margin, discounted. This is the dominant *production* pattern (Block 7)
   and mirrors the BTYD frequency×monetary decomposition, but with covariates and
   nonlinearity.
2. **Probabilistic deep heads — Zero-Inflated LogNormal (ZILN).** A single neural net
   with three outputs (churn logit, lognormal μ, lognormal σ) trained on a **ZILN
   loss**, predicting churn *and* the full spend distribution jointly with calibrated
   uncertainty. Handles the spike-at-zero + heavy right tail of LTV directly. Wang,
   Liu & Miao, "A Deep Probabilistic Model for Customer Lifetime Value Prediction"
   (Google) — **arXiv:1912.07753, NO journal DOI** (flag; widely used, code at
   `google/lifetime_value`).
3. **Sequence models (RNN/LSTM/seq2seq, transformers).** Feed the raw chronological
   transaction/event stream; the network learns temporal patterns that hand-built RFM
   features miss. Bauer & Jannach (2021), "Improved Customer Lifetime Value Prediction
   With Sequence-to-Sequence Learning and Feature-Based Models," *ACM TKDD* —
   **VERIFIED** (`10.1145/3441444`). Seq2seq on event logs, combined with feature-based
   models, beats both BTYD and flat-feature ML on e-commerce data.
4. **Customer embeddings.** Learn dense vector representations of customers (from
   product/category/event co-occurrence) and feed them to a CLV head; transfers
   information across sparse customers. Chamberlain, Cardoso, Liu, Pagliari &
   Deisenroth (2017), "Customer Lifetime Value Prediction Using Embeddings," *KDD
   2017* — **VERIFIED** (`10.1145/3097983.3098123`). The ASOS production system.
5. **Graph neural networks (very recent).** Model the customer–item (and
   customer–customer) graph for ad/marketplace LTV. Recent applied work (e.g.
   hyper-temporal GNNs for ad LTV) appears as 2025–2026 **arXiv preprints — flag, no
   journal DOI**.
6. **Gradient boosting / random forests for churn.** The pragmatic default for
   contractual churn and the two-stage stage-1 classifier. The methodological
   benchmark for *whether the modeling effort pays off* is the churn-model tournament:
   Neslin, Gupta, Kamakura, Lu & Mason (2006), "Defection Detection: Measuring and
   Understanding the Predictive Accuracy of Customer Churn Models," *JMR* —
   **VERIFIED** (`10.1509/jmkr.43.2.204`). "Methods matter": modest accuracy gains
   move campaign profit by six figures.
7. **Game/app early-LTV prediction.** Predict lifetime value from the first hours/days
   of play; identify "whales." Sifa, Drachen et al. (2015), "Predicting Purchase
   Decisions in Mobile Free-to-Play Games," *AAAI AIIDE* — **VERIFIED**
   (`10.1609/aiide.v11i1.12788`).

> **Caveat on the ML frontier.** Most cutting-edge CLV ML lives in
> KDD/RecSys/AAAI/arXiv and **industry engineering blogs**, *not* the top marketing
> journals. The top-journal contribution is mostly on the **decision** side (Block 5)
> rather than raw predictive ML. Treat arXiv/blog items as flagged (no DOI) and lean
> on the verified KDD/TKDD/JMR anchors above.

---

## Block 5 — Causal & decision-focused CLV

Predicting CLV is not the same as *acting* on it. The top-journal frontier here is
about **incremental** value and resource allocation, not point prediction. The
chapter's "endogenous marketing" identification point lives in this block.

- **Ascarza (2018), "Retention Futility: Targeting High-Risk Customers Might Be
  Ineffective," *JMR*** — **VERIFIED** (`10.1509/jmr.16.0163`). The landmark result:
  the highest-churn-risk customers are often *not* the most *persuadable*; targeting on
  predicted churn (or predicted CLV) wastes spend. Target on **uplift / treatment
  effect**, validated in two field experiments.
- **Simester, Timoshenko & Zoumpoulis (2020), "Efficiently Evaluating Targeting
  Policies: Improving on Champion vs. Challenger Experiments," *Mgmt Sci*** —
  **VERIFIED** (`10.1287/mnsc.2019.3379`). Machine-learning-based off-policy
  evaluation: assign customers to *actions*, then evaluate *any* targeting policy
  (including CLV-maximizing ones) without re-running experiments.
- **Reinartz, Thomas & Kumar (2005), "Balancing Acquisition and Retention Resources to
  Maximize Customer Profitability," *JM*** — **VERIFIED**
  (`10.1509/jmkg.69.1.63.55511`). Jointly optimizes acquisition *and* retention spend
  to a CLV objective — the canonical resource-allocation-to-CLV paper.
- **Venkatesan & Kumar (2004)** (Block 3) doubles as the decision paper that uses CLV
  to *select* customers and *allocate* contact.
- **Uplift modeling** generally: estimate the *individual treatment effect* of a
  marketing action on CLV (T-learner / S-learner / causal forests / two-model
  difference), then target the high-uplift, not the high-risk/high-value. Most uplift
  method papers are in *Decision Support Systems / EJOR / Information Sciences* — useful
  but secondary; the marketing-journal anchors are Ascarza and Simester above.

---

## Block 6 — Adjacent / related constructs (the full set)

| Construct | One-line definition | Anchor reference (DOI status) |
|---|---|---|
| **Customer equity (CE)** | Sum of all customers' CLV; the demand-side "asset" on a quasi-balance-sheet. | Rust, Lemon & Zeithaml (2004), *JM* — **VERIFIED** (`10.1509/jmkg.68.1.109.24030`) |
| **Valuing customers → valuing firms** | CE drives firm value; lets you value high-growth, negative-earnings firms off their customer base. | Gupta, Lehmann & Stuart (2004), "Valuing Customers," *JMR* — **VERIFIED** (`10.1509/jmkr.41.1.7.25084`) |
| **CLV modeling synthesis** | The review that defines and surveys implementable CLV. | Gupta et al. (2006), "Modeling CLV," *J. Service Research* — **VERIFIED** (`10.1177/1094670506293810`) |
| **CLV → market capitalization** | Aggregated CLV tracks/forecasts shareholder value; "customer-based corporate valuation." | Kumar & Shah (2009), *JM* — **VERIFIED** (`10.1509/jmkg.73.6.119`) |
| **Customer-based corporate valuation (CBCV), contractual** | Value a public *subscription* firm from disclosed customer metrics. | McCarthy, Fader & Hardie (2017), *JM* — **VERIFIED** (`10.1509/jm.15.0519`); already in repo as `mccarthy2017` |
| **CBCV, non-contractual** | Same, for non-subscription public firms, from a BTYD model fit to disclosed data. | McCarthy & Fader (2018), *JMR* — **VERIFIED** (`10.1177/0022243718802843`) |
| **Customer referral value (CRV)** | Value a customer creates by *referring* others; type-one (incremental) vs type-two (would-have-joined). | Kumar, Petersen & Leone (2010), *JM* — **VERIFIED** (`10.1509/jmkg.74.5.001`). *NB: the chapter's CRV math currently cites `kumar_2007`, which is a different paper.* |
| **Customer engagement value (CEV)** | CLV + CRV + customer *influencer* value + customer *knowledge* value — the "total" engagement asset. | Kumar et al. (2010), "Undervalued or Overvalued Customers," *J. Service Research* — **VERIFIED** (`10.1177/1094670510375602`) |
| **Negative CLV / unprofitable customers / "mismanagement of loyalty"** | Loyal ≠ profitable; some long-tenured customers destroy value. | Reinartz & Kumar (2002), "The Mismanagement of Customer Loyalty," *HBR* — **NO DOI** (HBR, flag; cite vol. 80(7), 86–94) |
| **CAC, LTV:CAC ratio, payback period** | Practitioner unit economics (Block 7). | Practitioner/VC literature — **NO DOI** (flag; see Block 7) |
| **RFM (recency, frequency, monetary)** | The classic scoring heuristic; shown equivalent to a BTYD view by Fader/Hardie/Lee (Block 1). | Fader, Hardie & Lee (2005), *JMR* — **VERIFIED** (`10.1509/jmkr.2005.42.4.415`) |
| **Churn / retention prediction** | The predictive substrate of CLV; methods-matter tournament. | Neslin et al. (2006), *JMR* — **VERIFIED** (`10.1509/jmkr.43.2.204`) |
| **Share of wallet (SOW)** | Fraction of a customer's category spend captured; complements CLV. | Practitioner + scattered academic; treat as concept — no single canonical DOI here (flag) |
| **Cohort / retention-curve analysis; NRR/GRR; logo vs dollar retention** | The SaaS operating metrics (Block 7). | Practitioner — **NO DOI** (flag) |
| **Structural CLV (CPG)** | CLV from a utility/budget model with multiple-discreteness and brand switching. | Sunder, Kumar & Zhao (2016), *JMR* — **VERIFIED** (`10.1509/jmr.14.0641`); already in repo as `sunder2016measuring` |

---

## Block 7 — Industry & production practice (how companies actually compute CLV)

Academic CLV and *operational* LTV diverge sharply. In practice, the formula a company
uses is dictated by its **business model** and **data**, and most production LTV is
computed with far cruder tools than the journals describe — which is exactly why the
production pitfalls below recur.

### 7.1 The formulas practitioners actually use

**(a) The "naive" SaaS LTV formula** (ubiquitous, and dangerous):
$$\text{LTV} = \frac{\text{ARPA} \times \text{gross margin \%}}{\text{churn rate}}$$
where ARPA = average revenue per account per period, and `1/churn` is the (geometric)
expected lifetime. Equivalent to the chapter's `@eq-clv-geometric` with **r = 0** and
**constant retention**. **Pitfalls:** (i) assumes a single constant churn rate — but
real retention curves flatten with tenure (the sBG sorting effect), so this *under*-
estimates LTV for survivors and is unstable when churn is small (divide-by-near-zero);
(ii) ignores discounting; (iii) ignores expansion revenue (NRR > 100%); (iv) blends
heterogeneous cohorts.

**(b) Discounted / DCF LTV** (the correct version, = chapter `@eq-clv-from-survivor`):
$$\text{LTV} = \sum_{t=0}^{N} \frac{m \cdot S(t)}{(1+r)^t}$$
with $S(t)$ from a **cohort retention curve** (or sBG/survival fit) and $m$ = period
margin. This is what the chapter teaches; most companies *should* use it and don't.

**(c) Unit-economics ratios** (board-level, not customer-level):
- **CAC** = total sales & marketing spend in a period ÷ new customers acquired.
- **LTV:CAC ratio** — rule of thumb **≥ 3:1** healthy; < 1 means you lose money per
  customer; > 5 may mean *under*-investment in growth. (VC heuristic; no DOI.)
- **CAC payback period** = CAC ÷ (monthly margin per customer) = months to recoup
  acquisition cost. < 12 months is the common SaaS target.
- **Magic number** = (ΔARR this quarter × 4) ÷ prior-quarter S&M spend — sales-
  efficiency proxy.

**(d) SaaS retention metrics (cohort-level):**
- **GRR (Gross Revenue Retention)** = (start MRR − churn − contraction) ÷ start MRR;
  caps at 100%. Measures pure leakage.
- **NRR / NDR (Net Revenue / Dollar Retention)** = (start MRR − churn − contraction +
  expansion) ÷ start MRR; **can exceed 100%** when expansion (upsell/seat growth)
  outpaces churn. NRR > 100% means the existing base grows *without* new logos — the
  single most-watched SaaS metric.
- **Logo (count) retention** vs **dollar retention**: a firm can lose many small logos
  yet grow dollars (or vice versa). Always report both.

### 7.2 Company-type playbooks

| Company type | Contract? | Data | How CLV is computed in production | Standard tooling |
|---|---|---|---|---|
| **SaaS / B2B subscription** | Contractual | Billing/CRM, MRR by cohort | Cohort retention curves + NRR/GRR; LTV:CAC and payback; sometimes sBG/survival on logo churn. Board reports unit economics, not per-customer CLV. | Looker/dbt/SQL cohorts; Python `lifelines`; spreadsheets |
| **E-commerce / DTC** | Non-contractual | Order logs (id, date, amount) | **BTYD**: BG/NBD for transactions + **Gamma-Gamma** for spend → predicted **pLTV** per customer; feed segmentation & paid-acquisition bids. | R `CLVTools`/`BTYD`; Python `lifetimes`/`pymc-marketing`; ML two-stage |
| **Retail / CPG** | Non-contractual | Loyalty-card panels, basket data | Panel + loyalty BTYD or structural (Sunder et al.); share-of-wallet; category CLV. Hard without identified customers. | Panel econometrics; HB; warehouse |
| **Telecom / Insurance / Banking** | Contractual | Tenure, usage, claims | **Survival/churn** (Cox, GBM, survival forests) → retention curve → discounted CLV; uplift for save-desk targeting. | `lifelines`; XGBoost/LightGBM; SAS |
| **Mobile gaming / apps** | Non-contractual, freemium | Event telemetry | **Early-LTV / pLTV** with ML from first hours/days; whale identification; ZILN/two-stage heads; ad-LTV for UA bidding. | TensorFlow/`google/lifetime_value`; GBM; feature stores |
| **Media / streaming** | Contractual (subs) + ad | Viewing + subscription | Cohort retention + content-engagement covariates; survival on subscription; ad-supported tiers blend ARPU models. | Warehouse cohorts; survival; ML |

### 7.3 Standard production stack & the recurring pitfalls

**Stack.** Event/transaction data in a warehouse (BigQuery/Snowflake/Redshift) →
feature engineering in **dbt/SQL** → CLV model in **R `CLVTools`/`BTYD`** or **Python
`lifetimes`/`lifelines` + XGBoost/LightGBM/TensorFlow** → predictions written back for
segmentation, paid-media bidding (Google/Meta value-based bidding consume pLTV), CRM
suppression/targeting, and finance (CBCV).

**The pitfalls that recur in every production CLV system:**
1. **Naive constant-churn formula** (§7.1a) — biases LTV and explodes as churn → 0.
2. **Survivorship bias** — fitting retention only on customers who *survived* to the
   present inflates retention; you must include the censored/churned.
3. **Look-ahead / target leakage** — using post-prediction-window information (e.g.,
   features computed over the same window you're predicting) inflates offline metrics
   and collapses in production. Strict temporal train/validation splits are mandatory.
4. **Ignoring discounting** — undiscounted multi-year LTV overstates present value;
   pick $r$ at the data's period frequency (the chapter's 15%/year → 7.238%/half-year).
5. **Cohort blending** — mixing acquisition cohorts (different channels/vintages) hides
   that paid cohorts churn faster than organic; always analyze by cohort.
6. **Treating predicted CLV/churn as a targeting policy** — Ascarza's result: target
   *uplift*, not level (Block 5).
7. **Extrapolating a short calibration window** — the chapter's
   `@fig-retention-projected` warning: don't commit to LTV from one early cohort
   snapshot.
8. **Endogenous marketing spend** — observed retention is a response to targeted spend;
   the spend→retention correlation is not causal.

---

## Proposed code demonstrations (~13 runnable R chunks on simulated data)

All on **simulated** data (no proprietary inputs), reproducible with `set.seed`,
consistent with the chapter's tidyverse style. Each is self-contained.

1. **Simulate a non-contractual transaction log.** Draw per-customer Poisson purchase
   rate λ ~ Gamma and exponential lifetime μ ~ Gamma (the Pareto/NBD data-generating
   process); emit a `(customer_id, date, amount)` event log. Foundation for chunks 2–5.
2. **Fit BG/NBD + Gamma-Gamma with `CLVTools`.** `clvdata()` → `pnbd()`/`bgnbd()` →
   `gg()` → `predict()` for expected transactions and predicted **pLTV** per customer;
   plot the predicted-vs-actual holdout.
3. **Fit the same with `BTYD`** for cross-check (`bgnbd.EstimateParameters`,
   `bgnbd.ConditionalExpectedTransactions`, `spend.EstimateParameters`); show the two
   packages agree → builds trust in the estimate.
4. **P(alive) heatmap over recency × frequency.** Compute and contour-plot
   P(customer is still active) across the RFM grid — the BTYD intuition made visual.
5. **Iso-value curves.** Reproduce Fader/Hardie/Lee: contour predicted future value
   over the recency–frequency plane; show customers with different histories but equal
   future value.
6. **Cohort retention curves + sBG projection (extends the chapter).** Simulate
   monthly cohorts, build the retention triangle, fit sBG (reuse the chapter's
   `neg_loglik`), and overlay projected vs observed — generalizing the existing single-
   case demo to a full cohort grid.
7. **Survival churn model (contractual).** Simulate tenure with Weibull churn +
   covariates; fit Kaplan–Meier and a Cox model (`survival`); convert the survivor
   curve into discounted CLV — the telecom/insurance playbook.
8. **LTV:CAC and payback dashboard.** Simulate acquisition cohorts with channel-varying
   CAC and retention; compute LTV, **LTV:CAC**, and **payback period** per channel;
   `ggplot` a small "unit-economics" panel.
9. **NRR / GRR cohort waterfall.** Simulate MRR with churn, contraction, and expansion;
   compute **GRR** and **NRR** per cohort; render the expansion-vs-churn waterfall that
   shows NRR crossing 100%.
10. **Two-stage churn × spend ML pLTV.** Simulate customer features; stage 1 = GBM/logit
    churn classifier, stage 2 = lognormal spend regressor; combine to pLTV; compare
    against the BTYD pLTV from chunk 2 (ML vs probabilistic on the same data).
11. **Zero-Inflated LogNormal (ZILN) value head.** Fit a ZILN model (churn spike + heavy
    tail) to simulated spend; show calibrated predictive intervals — the modern deep-
    learning loss, demonstrated in a few lines without a GPU.
12. **Uplift vs. level targeting (Ascarza demonstration).** Simulate a retention
    treatment with heterogeneous *effect* uncorrelated with churn *risk*; show that
    targeting high predicted-churn customers underperforms targeting high-uplift —
    making the Block-5 point concrete.
13. **DCF of a CLV stream + discounting/horizon sensitivity.** Take a projected
    retention/margin stream and tabulate CLV across discount rates $r$ and horizons $N$;
    show how much of lifetime value sits beyond year one (the chapter's "half the asset"
    claim, quantified).
14. *(optional)* **Markov-chain migration CLV (Pfeifer & Carraway).** Define
    active/lapsed/lost states, a transition matrix, and per-state reward; compute CLV as
    discounted expected reward via `(I − γP)⁻¹ r` — links CLV to the MDP/decision view.

---

## Verified DOI ledger

Every DOI below returned a Crossref *version-of-record* match on title, journal, year,
and first-author family name.

| Key topic | Reference | DOI | Status |
|---|---|---|---|
| Pareto/NBD origin | Schmittlein, Morrison & Colombo (1987), *Mgmt Sci* | `10.1287/mnsc.33.1.1` | **VERIFIED** |
| BG/NBD | Fader, Hardie & Lee (2005), *Mktg Sci* | `10.1287/mksc.1040.0098` | **VERIFIED** |
| RFM-and-CLV / Gamma-Gamma | Fader, Hardie & Lee (2005), *JMR* | `10.1509/jmkr.2005.42.4.415` | **VERIFIED** |
| sBG retention | Fader & Hardie (2007), *J. Interactive Mktg* | `10.1002/dir.20074` | **VERIFIED** |
| Customer-base analysis tutorial | Fader & Hardie (2009), *J. Interactive Mktg* | `10.1016/j.intmar.2008.11.003` | **VERIFIED** |
| HB Pareto/NBD | Abe (2009), *Mktg Sci* | `10.1287/mksc.1090.0502` | **VERIFIED** |
| Markov-chain CLV | Pfeifer & Carraway (2000), *J. Interactive Mktg* | `10.1002/(sici)1520-6653(200021)14:2<43::aid-dir4>3.0.co;2-h` | **VERIFIED** |
| Early CLV formulas | Berger & Nasr (1998), *J. Interactive Mktg* | `10.1002/(SICI)1520-6653(199824)12:1<17::AID-DIR3>3.0.CO;2-K` | **VERIFIED** |
| CLV framework / resource allocation | Venkatesan & Kumar (2004), *JM* | `10.1509/jmkg.68.4.106.42728` | **VERIFIED** |
| Profitable lifetime duration | Reinartz & Kumar (2003), *JM* | `10.1509/jmkg.67.1.77.18589` | **VERIFIED** |
| Acquisition × retention balance | Reinartz, Thomas & Kumar (2005), *JM* | `10.1509/jmkg.69.1.63.55511` | **VERIFIED** |
| Service retention (cohorts) | Schweidel, Fader & Bradlow (2008), *JM* | `10.1509/jmkg.72.1.082` | **VERIFIED** |
| Acquisition/retention bivariate timing | Schweidel, Fader & Bradlow (2008), *Mktg Sci* | `10.1287/mksc.1070.0328` | **VERIFIED** |
| CLV model tournament (insurance) | Donkers, Verhoef & de Jong (2007), *QME* | `10.1007/s11129-006-9016-y` | **VERIFIED** |
| Churn-model tournament | Neslin et al. (2006), *JMR* | `10.1509/jmkr.43.2.204` | **VERIFIED** |
| Retention futility / uplift | Ascarza (2018), *JMR* | `10.1509/jmr.16.0163` | **VERIFIED** |
| Targeting-policy evaluation | Simester, Timoshenko & Zoumpoulis (2020), *Mgmt Sci* | `10.1287/mnsc.2019.3379` | **VERIFIED** |
| Customer equity / ROM | Rust, Lemon & Zeithaml (2004), *JM* | `10.1509/jmkg.68.1.109.24030` | **VERIFIED** |
| Valuing customers → firms | Gupta, Lehmann & Stuart (2004), *JMR* | `10.1509/jmkr.41.1.7.25084` | **VERIFIED** |
| Modeling CLV (review) | Gupta et al. (2006), *J. Service Research* | `10.1177/1094670506293810` | **VERIFIED** |
| CE → market cap | Kumar & Shah (2009), *JM* | `10.1509/jmkg.73.6.119` | **VERIFIED** |
| CBCV — contractual | McCarthy, Fader & Hardie (2017), *JM* | `10.1509/jm.15.0519` | **VERIFIED** (repo key `mccarthy2017`) |
| CBCV — non-contractual | McCarthy & Fader (2018), *JMR* | `10.1177/0022243718802843` | **VERIFIED** |
| Customer referral value | Kumar, Petersen & Leone (2010), *JM* | `10.1509/jmkg.74.5.001` | **VERIFIED** |
| Customer engagement value | Kumar et al. (2010), *J. Service Research* | `10.1177/1094670510375602` | **VERIFIED** |
| CLV embeddings (ASOS) | Chamberlain et al. (2017), *KDD* | `10.1145/3097983.3098123` | **VERIFIED** |
| Seq2seq CLV | Bauer & Jannach (2021), *ACM TKDD* | `10.1145/3441444` | **VERIFIED** |
| Game early-LTV | Sifa, Drachen et al. (2015), *AAAI AIIDE* | `10.1609/aiide.v11i1.12788` | **VERIFIED** |
| Structural CLV (CPG) | Sunder, Kumar & Zhao (2016), *JMR* | `10.1509/jmr.14.0641` | **VERIFIED** (repo key `sunder2016measuring`) |

### Flagged — NO journal DOI (do not invent one)

| Item | Why no DOI / how to cite |
|---|---|
| Gamma-Gamma technical note (Fader & Hardie) | Working/technical note; cite the 2005 *JMR* paper (`10.1509/jmkr.2005.42.4.415`) for the version-of-record. |
| MBG/NBD, CBG/NBD, Pareto/GGG, PDO | Secondary/working-paper variants; no single top-journal DOI. Cite the **software** (`BTYDplus`, `CLVTools`) and original working papers; do not assign a journal DOI. |
| ZILN deep model (Wang, Liu & Miao, Google) | **arXiv:1912.07753**, no journal DOI. Cite as arXiv + `google/lifetime_value` repo. |
| CLVTools package paper (Meierer et al.) | Software paper, **arXiv:2602.09845**, no journal DOI yet. Cite as software + arXiv. |
| Recent GNN/ad-LTV CLV (2025–2026) | arXiv preprints only — flag, no DOI. |
| "The Mismanagement of Customer Loyalty" (Reinartz & Kumar 2002) | *Harvard Business Review*, no DOI. Cite vol. 80(7), 86–94. |
| CAC, LTV:CAC, payback, magic number, NRR/GRR | Practitioner/VC and SaaS-operator literature; **no academic DOI**. Define operationally (§7.1). |

### Verification incidents (guessed DOIs that FAILED and were corrected)

1. **Gamma-Gamma / RFM-CLV.** Guessed `10.1509/jmkr.42.4.415` → **404**. Correct DOI
   via bibliographic query: `10.1509/jmkr.2005.42.4.415` (the year is part of the DOI
   stem). Corrected and re-verified.
2. **Abe HB Pareto/NBD.** Guessed `10.1287/mnsc.1080.0921` → **resolved to the WRONG
   paper** ("Team Familiarity, Role Experience, and Performance," Huckman, *Mgmt Sci*
   2009). Correct DOI: `10.1287/mksc.1090.0502` (it is in *Marketing Science*, not
   *Management Science*). Corrected and re-verified.
3. **"Valuing Customers" (Gupta, Lehmann & Stuart).** Guessed `10.1509/jmkg.68.1.106.24036`
   (assumed *JM*) → **404**. The paper is in *JMR*, not *JM*; correct DOI
   `10.1509/jmkr.41.1.7.25084`. Corrected and re-verified.
4. **Crossref rate-limiting (HTTP 429)** was hit during burst bibliographic queries;
   affected lookups (Berger & Nasr, Pfeifer & Carraway, Donkers et al.) were retried
   singly and all subsequently verified.
5. **Sunder, Kumar & Zhao (CPG CLV).** Guessed `10.1509/jmr.13.0151` → **resolved to the
   WRONG paper** ("A 'Wide' Variety," Deng et al., *JMR* 2016). Correct DOI via
   bibliographic query: `10.1509/jmr.14.0641`. Corrected and re-verified. (The repo's
   existing `sunder2016measuring` key should carry this DOI.)

---

## How to wire this into `13-clv.qmd` (suggested, non-binding)

- **New section "Probabilistic Models for Customer-Base Analysis"** between the current
  sBG section and "From Retention to Value": formalize **Pareto/NBD** and **BG/NBD**
  (the chapter mentions them but never states them), add the **Gamma-Gamma** monetary
  layer, and add demo chunks 1–5 (`CLVTools`). This fills the chapter's biggest gap —
  it teaches contractual sBG thoroughly but leaves the non-contractual workhorses
  informal.
- **New section "Machine-Learning and Decision-Focused CLV"**: two-stage ML, ZILN, and
  the **uplift vs. level** point (Ascarza; Simester et al.), with demo chunks 10–12.
- **New section "CLV in Industry Practice"**: §7 formulas, the company-type table, and
  the pitfalls, with demo chunks 8–9 (LTV:CAC dashboard, NRR/GRR waterfall). This is
  entirely absent from the current chapter and is what the user explicitly wants.
- **Fix the two existing citation mismatches** noted at the top (the CRV math should
  cite Kumar, Petersen & Leone 2010 `10.1509/jmkg.74.5.001`; confirm `rust2002customer`
  vs. the customer-equity paper). *Bib edits are out of scope for this note.*
- The **CLV → firm value** thread (Gupta/Lehmann/Stuart; Kumar & Shah; McCarthy/Fader)
  is the natural bridge to `@sec-marketing-finance`, which the chapter already gestures
  at.
