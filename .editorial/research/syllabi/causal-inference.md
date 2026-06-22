# Causal Inference & Field Experiments PhD Seminar (for Marketing) — Canonical Full-Semester Structure

**Purpose.** A synthesized, full-semester (≈14-week) module structure for the doctoral seminar in **causal inference and field experiments**, tuned to quantitative-marketing applications (advertising measurement, pricing, promotions, digital/platform experimentation). The structure is built to match how the topic is taught in the empirical track of top programs (MIT, Chicago Booth, Stanford GSB, Berkeley Haas/Econ, Wharton, Columbia, Kellogg, NYU Stern, and peer economics/statistics departments that marketing students cross-register into). This is the design document for the book's causal-inference seminar chapter.

**Date:** 2026-06-21
**Author:** Editorial research (Claude)

---

## METHODOLOGICAL NOTE — READ FIRST

The task asked me to (a) use the web to pull live public PhD syllabi (cite program + URL) and (b) verify every reading's DOI live against Crossref, never inventing a citation.

**In this run, `WebSearch` and general `WebFetch` (arbitrary web pages, including university syllabus pages and `doi.org`) were permission-denied, but the Crossref REST API (`api.crossref.org`) was reachable via `WebFetch`.** I therefore:

- **Could not** retrieve any live syllabus page. The weekly *structure* below reflects the stable field canon of how this seminar is taught; it is not transcribed from a fetched syllabus. The "Sources consulted" section lists the real, stable public program pages as **pointers for a web-enabled pass**, not as pages I fetched in this run.
- **Could** verify every cited reading's DOI live. **Each DOI below was confirmed in this run against the Crossref version-of-record** (title, authors, container, year, DOI), via `api.crossref.org` bibliographic-query and `/works/{doi}` lookups dated 2026-06-21. Where a candidate DOI failed to resolve (404) or matched a different work, it was discarded — not guessed.
- For canonical **textbooks** (no journal DOI) the work is listed under a "Books / canon" line with publisher and year, not a fabricated DOI.
- A handful of indisputably canonical works whose version-of-record I could not cleanly confirm via Crossref in this run (most notably the original Card & Krueger 1994 AER, an older AER record) are named in prose and flagged `[verify DOI]`, and are **not** given a DOI here. For Card–Krueger I cite instead the verified 2000 AER "Reply" record.

**Confidence:** module structure, subtopics, methods, debates, and foundational/frontier marking — HIGH. Cited readings — every DOI live-verified this run.

---

## 1. Semester arc

The seminar teaches students to **answer "what is the causal effect of X on Y?" credibly**, and to recognize when a design *cannot* answer it. It opens not with techniques but with a framework: the potential-outcomes (Neyman–Rubin) model, the assignment mechanism as the central object, and Holland's "no causation without manipulation." Everything that follows is organized around a single question — *what makes the treatment as-good-as-randomly assigned, conditional on what we observe and how we designed the study?* The first third establishes the gold standard (randomized experiments and large-scale A/B testing) and then confronts the realistic case where randomization is absent (selection on observables, and why regression is not magic). This ordering is deliberate: students must internalize the experimental ideal before they can judge how far an observational design falls short of it.

The middle of the semester is a **tour of quasi-experimental designs**, each motivated by a different source of as-good-as-random variation: instrumental variables (variation in an instrument), difference-in-differences (variation in timing of a policy/launch), regression discontinuity (variation around a threshold), synthetic control and panel/event-study methods (variation across units and time), and matching/weighting (reweighting to balance observables). A recurring theme is that the past decade has *re-litigated the workhorses* — the two-way fixed-effects DiD estimator, long the default, was shown to be badly biased under staggered adoption and heterogeneous effects, spawning a whole modern literature (Goodman-Bacon; Callaway–Sant'Anna; de Chaisemartin–d'Haultfœuille; Sun–Abraham; Borusyak–Jaravel–Spiess; Roth et al.). The seminar treats this episode as the central methodological cautionary tale of the field: a method can be standard, published thousands of times, and still wrong.

The final third turns to the **machine-learning and marketing-platform frontier**: ML for heterogeneous treatment effects (causal forests, double/debiased ML, recursive partitioning), and then the applied core that distinguishes a *marketing* seminar from a generic econometrics one — measuring advertising effectiveness when effects are tiny relative to sales noise (Lewis–Rao's "unfavorable economics"), the experimental designs platforms actually use (ghost ads, PSA holdouts, geo experiments, intent-to-treat at scale), the comparison of experimental vs. observational ad measurement (Gordon–Zettelmeyer), targeting-policy evaluation, and the interference/spillover problems that break SUTVA in marketplaces and social networks. The course closes on the question every marketing dissertation must answer: *given that the effect is real but small and the platform is non-stationary, what is the credible research design, and can it scale?* Assessment is typically a **referee report + an original experimental or quasi-experimental design proposal** (sometimes with a power/MDE calculation and a pre-analysis plan), because the terminal skill is designing credible studies, not just reading them.

---

## 2. Weekly modules (≈14 weeks)

Format per module: **Topic → subtopics → key readings (live-verified DOIs, with one-line why) → methods/skills → central debates.** Foundational vs. frontier is marked per module. Books appear under a **Books / canon** line. Works named without a DOI are flagged `[verify DOI]`.

**Standing textbooks for the whole course (Books / canon, no DOI):**
- Imbens, G. W. & Rubin, D. B., *Causal Inference for Statistics, Social, and Biomedical Sciences*, Cambridge University Press, 2015. (The potential-outcomes spine.)
- Angrist, J. D. & Pischke, J.-S., *Mostly Harmless Econometrics*, Princeton University Press, 2009. (The applied quasi-experimental workhorse.)
- Cunningham, S., *Causal Inference: The Mixtape*, Yale University Press, 2021. (Modern, code-forward synthesis incl. DiD/RDD/synth.)
- Wooldridge, J. M., *Econometric Analysis of Cross Section and Panel Data*, 2nd ed., MIT Press, 2010. (Panel/FE reference.)

---

### Week 1 — Potential Outcomes & the Assignment Mechanism
**Foundational.**

**Subtopics:** the Neyman–Rubin potential-outcomes model; the fundamental problem of causal inference; SUTVA; estimands (ATE, ATT, CATE); the assignment mechanism as the central object; "no causation without manipulation"; causal vs. predictive questions.

**Key readings:**
- Rubin, D. B., "Estimating Causal Effects of Treatments in Randomized and Nonrandomized Studies," *Journal of Educational Psychology* 66(5), 688–701, 1974. doi:10.1037/h0037350 — the founding statement of the potential-outcomes framework.
- Holland, P. W., "Statistics and Causal Inference," *Journal of the American Statistical Association* 81(396), 945–960, 1986. doi:10.1080/01621459.1986.10478354 — formalizes the framework and the "no causation without manipulation" doctrine; the field's conceptual touchstone.
- Imbens, G. W. & Rubin, D. B., *Causal Inference for Statistics, Social, and Biomedical Sciences* (Books / canon, 2015), Part I — potential outcomes and the assignment mechanism.

**Methods/skills:** writing an estimand precisely; distinguishing estimand / identification / estimation / inference; recognizing when a question is causal vs. descriptive.
**Central debates:** is "manipulation" required for causality (immutable characteristics)? ATE vs. ATT vs. policy-relevant estimands; design-based vs. model-based inference.

---

### Week 2 — Randomized Experiments & A/B Testing at Scale
**Foundational (randomization inference) → Frontier (platform A/B testing).**

**Subtopics:** randomization as the assignment mechanism that identifies the ATE; Fisher's sharp null and randomization inference vs. Neyman's repeated-sampling inference; covariate balance and stratification/blocking; CUPED-style variance reduction; the engineering of web experimentation, sample-ratio mismatch, peeking/optional stopping, and the experimentation platform as an organizational artifact.

**Key readings:**
- Kohavi, R., Longbotham, R., Sommerfield, D. & Henne, R. M., "Controlled Experiments on the Web: Survey and Practical Guide," *Data Mining and Knowledge Discovery* 18(1), 140–181, 2009. doi:10.1007/s10618-008-0114-1 — the practitioner canon for industrial-scale A/B testing; pitfalls students will actually hit.
- Bojinov, I. & Shephard, N., "Time Series Experiments and Causal Estimands: Exact Randomization Tests and Trading," *Journal of the American Statistical Association* 114(528), 1665–1682, 2019. doi:10.1080/01621459.2018.1527225 — extends design-based randomization inference to single-unit, switchback-style time-series experiments (directly relevant to one-market pricing/ad tests).
- Imbens, G. W. & Rubin, D. B., *Causal Inference...* (Books / canon, 2015), Part II — classical randomized experiments, Fisher and Neyman inference.

**Methods/skills:** running Fisherian permutation tests; computing Neyman variance; designing stratified/clustered assignment; variance reduction; diagnosing SRM.
**Central debates:** Fisher vs. Neyman inference; fixed-horizon vs. sequential/always-valid testing; how much can web A/B testing actually learn given non-stationarity and short windows?

---

### Week 3 — Regression & Selection on Observables
**Foundational.**

**Subtopics:** the conditional-independence (unconfoundedness) assumption; regression as a weighting/comparison estimator and what it estimates under heterogeneity; "bad controls" and collider bias; the overlap/common-support condition; omitted-variable bias and sensitivity.

**Key readings:**
- Angrist, J. D. & Pischke, J.-S., *Mostly Harmless Econometrics* (Books / canon, 2009), chs. 3 — regression and the conditional-independence assumption; the "bad control" problem.
- Athey, S. & Imbens, G. W., "The State of Applied Econometrics: Causality and Policy Evaluation," *Journal of Economic Perspectives* 31(2), 3–32, 2017. doi:10.1257/jep.31.2.3 — modern map of identification strategies and where selection-on-observables sits among them; assigned here as the course's strategic overview.
- Imbens, G. W. & Rubin, D. B., *Causal Inference...* (Books / canon, 2015), Part III — unconfoundedness and regression.

**Methods/skills:** specifying a credible conditioning set; drawing causal DAGs to spot bad controls/colliders; checking overlap; OVB sensitivity bounds.
**Central debates:** when is "control for everything" self-defeating? How much faith can selection-on-observables ever earn without a design?

---

### Week 4 — Instrumental Variables
**Foundational.**

**Subtopics:** the IV/2SLS estimator; the LATE theorem and the monotonicity/exclusion/relevance assumptions; compliers and what LATE is the effect *for*; weak instruments; judge/examiner and shift-share designs; IV in marketing (price endogeneity, demand estimation).

**Key readings:**
- Imbens, G. W. & Angrist, J. D., "Identification and Estimation of Local Average Treatment Effects," *Econometrica* 62(2), 467–475, 1994. doi:10.2307/2951620 — the LATE theorem; redefines what IV identifies under heterogeneity.
- Angrist, J. D., Imbens, G. W. & Rubin, D. B., "Identification of Causal Effects Using Instrumental Variables," *Journal of the American Statistical Association* 91(434), 444–455, 1996. doi:10.1080/01621459.1996.10476902 — embeds IV in potential outcomes; the canonical compliers/defiers exposition.
- Angrist, J. D. & Pischke, J.-S., *Mostly Harmless Econometrics* (Books / canon, 2009), ch. 4 — applied IV and weak-instrument diagnostics.

**Methods/skills:** 2SLS and its LATE interpretation; first-stage F / weak-IV diagnostics; reasoning about exclusion and monotonicity in a real application.
**Central debates:** is LATE a "policy-relevant" estimand or an artifact of the instrument? Are most instruments' exclusion restrictions defensible?

---

### Week 5 — Difference-in-Differences I: Foundations & the 2×2
**Foundational.**

**Subtopics:** the canonical 2×2 DiD and the parallel-trends assumption; event-study/pre-trend plots; clustered/serially correlated standard errors; placebo and pre-trend tests; DiD for marketing launches, entry, and policy/regulatory shocks.

**Key readings:**
- Bertrand, M., Duflo, E. & Mullainathan, S., "How Much Should We Trust Differences-in-Differences Estimates?," *The Quarterly Journal of Economics* 119(1), 249–275, 2004. doi:10.1162/003355304772839588 — exposes serial-correlation underestimation of DiD standard errors; the inference cautionary tale.
- Card, D. & Krueger, A. B., "Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New Jersey and Pennsylvania: Reply," *American Economic Review* 90(5), 1397–1420, 2000. doi:10.1257/aer.90.5.1397 — the verified record for the canonical minimum-wage DiD program (the original 1994 AER article is `[verify DOI]`); the design that made DiD a default tool.
- Angrist, J. D. & Pischke, J.-S., *Mostly Harmless Econometrics* (Books / canon, 2009), ch. 5 — DiD and fixed effects, the classical treatment.

**Methods/skills:** building event-study plots; testing parallel pre-trends; clustering and wild-cluster bootstrap; placebo tests.
**Central debates:** is parallel trends testable or only falsifiable on pre-periods? How much should inference (not point estimates) drive DiD credibility?

---

### Week 6 — Difference-in-Differences II: Staggered Adoption & the TWFE Critique
**Frontier (the field's central recent methodological episode).**

**Subtopics:** why two-way fixed-effects (TWFE) is biased under staggered timing + heterogeneous/dynamic effects ("forbidden comparisons," negative weights); decomposition diagnostics; the new family of robust estimators (group-time ATTs, interaction-weighted event studies, imputation); choosing among them; honest pre-trends.

**Key readings:**
- Goodman-Bacon, A., "Difference-in-Differences with Variation in Treatment Timing," *Journal of Econometrics* 225(2), 254–277, 2021. doi:10.1016/j.jeconom.2021.03.014 — the decomposition showing TWFE is a weighted average of all 2×2s, including "forbidden" already-treated comparisons.
- de Chaisemartin, C. & d'Haultfœuille, X., "Two-Way Fixed Effects Estimators with Heterogeneous Treatment Effects," *American Economic Review* 110(9), 2964–2996, 2020. doi:10.1257/aer.20181169 — proves TWFE can put negative weights on treatment effects; offers a robust alternative.
- Callaway, B. & Sant'Anna, P. H. C., "Difference-in-Differences with Multiple Time Periods," *Journal of Econometrics* 225(2), 200–230, 2021. doi:10.1016/j.jeconom.2020.12.001 — the group-time ATT estimator that is now a default robust DiD.
- Sun, L. & Abraham, S., "Estimating Dynamic Treatment Effects in Event Studies with Heterogeneous Treatment Effects," *Journal of Econometrics* 225(2), 175–199, 2021. doi:10.1016/j.jeconom.2020.09.006 — fixes contamination of event-study coefficients; interaction-weighted estimator.
- Borusyak, K., Jaravel, X. & Spiess, J., "Revisiting Event-Study Designs: Robust and Efficient Estimation," *Review of Economic Studies* 92(5), 3253–3285, 2024. doi:10.1093/restud/rdae007 — the imputation (efficient) estimator and a unifying view of event-study designs.
- Roth, J., Sant'Anna, P. H. C., Bilinski, A. & Poe, J., "What's Trending in Difference-in-Differences? A Synthesis of the Recent Econometrics Literature," *Journal of Econometrics* 235(2), 2218–2244, 2023. doi:10.1016/j.jeconom.2023.03.008 — the synthesis/decision guide assigned as the week's anchor.

**Methods/skills:** running Goodman-Bacon decompositions; estimating CS/SA/BJS estimators and reconciling them; honest pre-trend (HonestDiD-style) sensitivity.
**Central debates:** which robust estimator when? Is the efficient imputation estimator's stronger modeling worth it? How much published DiD work is invalidated?

---

### Week 7 — Regression Discontinuity Designs
**Foundational (sharp/fuzzy) → Frontier (robust bias-corrected inference).**

**Subtopics:** sharp and fuzzy RDD; continuity-based vs. local-randomization views; bandwidth/kernel choice and the bias–variance tradeoff; manipulation/sorting tests (density discontinuity); RDD in marketing (loyalty-tier thresholds, ad auction reserve prices, eligibility cutoffs).

**Key readings:**
- Imbens, G. W. & Lemieux, T., "Regression Discontinuity Designs: A Guide to Practice," *Journal of Econometrics* 142(2), 615–635, 2008. doi:10.1016/j.jeconom.2007.05.001 — the practitioner's guide that standardized RDD practice.
- Calonico, S., Cattaneo, M. D. & Titiunik, R., "Robust Nonparametric Confidence Intervals for Regression-Discontinuity Designs," *Econometrica* 82(6), 2295–2326, 2014. doi:10.3982/ecta11757 — robust bias-corrected inference and data-driven bandwidths; the modern default.

**Methods/skills:** local-polynomial estimation; MSE-optimal and CER-optimal bandwidths; density (McCrary-style) manipulation tests; placebo cutoffs.
**Central debates:** continuity vs. local-randomization framing; how local is "local," and external validity at the cutoff; robustness to bandwidth.

---

### Week 8 — Synthetic Control
**Foundational (Abadie et al.) → Frontier (synthetic DiD, generalized SC).**

**Subtopics:** the synthetic-control estimator as a data-driven weighted comparison; placebo/permutation inference; pre-treatment fit and donor-pool selection; extensions — generalized synthetic control (interactive fixed effects), synthetic DiD, and Bayesian structural-time-series "CausalImpact" (geo/ad applications).

**Key readings:**
- Abadie, A., Diamond, A. & Hainmueller, J., "Synthetic Control Methods for Comparative Case Studies: Estimating the Effect of California's Tobacco Control Program," *Journal of the American Statistical Association* 105(490), 493–505, 2010. doi:10.1198/jasa.2009.ap08746 — the canonical synthetic-control method and placebo inference.
- Abadie, A., "Using Synthetic Controls: Feasibility, Data Requirements, and Methodological Aspects," *Journal of Economic Literature* 59(2), 391–425, 2021. doi:10.1257/jel.20191450 — the authoritative how-to/when-not-to review.
- Arkhangelsky, D., Athey, S., Hirshberg, D. A., Imbens, G. W. & Wager, S., "Synthetic Difference-in-Differences," *American Economic Review* 111(12), 4088–4118, 2021. doi:10.1257/aer.20190159 — unifies SC and DiD; the frontier estimator for panel comparisons.
- Xu, Y., "Generalized Synthetic Control Method: Causal Inference with Interactive Fixed Effects Models," *Political Analysis* 25(1), 57–76, 2017. doi:10.1017/pan.2016.2 — SC ⇄ factor-model bridge for multiple treated units.
- Brodersen, K. H., Gallusser, F., Koehler, J., Remy, N. & Scott, S. L., "Inferring Causal Impact Using Bayesian Structural Time-Series Models," *The Annals of Applied Statistics* 9(1), 247–274, 2015. doi:10.1214/14-aoas788 — the "CausalImpact" approach used widely for ad/geo impact at platforms.

**Methods/skills:** constructing donor pools and weights; permutation/placebo inference; choosing among SC / SDiD / gsynth / CausalImpact for a marketing case.
**Central debates:** is placebo inference valid with few units? Convex-weight restriction vs. regression-based panel methods; overfitting pre-treatment fit.

---

### Week 9 — Panel & Event-Study Methods
**Foundational → Frontier.**

**Subtopics:** fixed-effects and first-difference panel estimators and their causal content; event-study specification and dynamic treatment effects; the finite-population, design-based view of panel/switchback experiments; matrix-completion / factor approaches to panel causal inference; serial-correlation-robust inference.

**Key readings:**
- Bojinov, I., Rambachan, A. & Shephard, N., "Panel Experiments and Dynamic Causal Effects: A Finite Population Perspective," *Quantitative Economics* 12(4), 1171–1196, 2021. doi:10.3982/qe1744 — design-based estimands for panel/switchback experiments; ties experiments to event studies (directly relevant to platform rollouts).
- Athey, S. & Imbens, G. W., "The State of Applied Econometrics: Causality and Policy Evaluation," *Journal of Economic Perspectives* 31(2), 3–32, 2017. doi:10.1257/jep.31.2.3 — situates panel/matrix-completion approaches within the broader toolkit (reprise from Wk 3, now read for the panel sections).
- Wooldridge, J. M., *Econometric Analysis of Cross Section and Panel Data* (Books / canon, 2010), panel chapters — the FE/FD reference treatment.

**Methods/skills:** specifying dynamic event studies correctly (cf. Wk 6); design-based vs. model-based panel inference; matrix-completion estimation.
**Central debates:** when is FE identifying a causal effect vs. an artifact? Design-based vs. model-based panel inference; overlap with the staggered-DiD literature.

---

### Week 10 — Matching & Weighting
**Foundational (propensity score) → Frontier (high-dimensional balancing).**

**Subtopics:** the propensity score and its balancing property; matching, subclassification, and inverse-propensity weighting; doubly robust / AIPW estimation; covariate-balancing and entropy/approximate-residual balancing in high dimensions; observational ad-effect estimation and its failure modes.

**Key readings:**
- Rosenbaum, P. R. & Rubin, D. B., "The Central Role of the Propensity Score in Observational Studies for Causal Effects," *Biometrika* 70(1), 41–55, 1983. doi:10.1093/biomet/70.1.41 — defines the propensity score and the balancing theorem.
- Hirano, K., Imbens, G. W. & Ridder, G., "Efficient Estimation of Average Treatment Effects Using the Estimated Propensity Score," *Econometrica* 71(4), 1161–1189, 2003. doi:10.1111/1468-0262.00442 — efficient IPW; why the *estimated* score helps.
- Abadie, A. & Imbens, G. W., "Matching on the Estimated Propensity Score," *Econometrica* 84(2), 781–807, 2016. doi:10.3982/ecta11293 — correct inference for propensity-score matching (a long-standing error).
- Athey, S., Imbens, G. W. & Wager, S., "Approximate Residual Balancing: Debiased Inference of Average Treatment Effects in High Dimensions," *Journal of the Royal Statistical Society Series B* 80(4), 597–623, 2018. doi:10.1111/rssb.12268 — frontier balancing for many covariates; bridges to ML (Wk 11).

**Methods/skills:** estimating/diagnosing propensity scores; assessing overlap and balance; AIPW/doubly-robust estimation; balancing weights.
**Central debates:** matching vs. weighting vs. doubly-robust; can balancing ever substitute for a design? The "propensity-score paradox" (over-trimming).

---

### Week 11 — Machine Learning for Heterogeneous Treatment Effects
**Frontier.**

**Subtopics:** the CATE and policy learning; causal trees/forests and honest splitting; double/debiased ML (Neyman-orthogonal moments, cross-fitting) for treatment-effect and nuisance separation; generalized random forests; targeting and best-linear-projection summaries of heterogeneity.

**Key readings:**
- Athey, S. & Imbens, G., "Recursive Partitioning for Heterogeneous Causal Effects," *Proceedings of the National Academy of Sciences* 113(27), 7353–7360, 2016. doi:10.1073/pnas.1510489113 — the "causal tree" with honest estimation; foundation of the HTE-by-ML program.
- Wager, S. & Athey, S., "Estimation and Inference of Heterogeneous Treatment Effects Using Random Forests," *Journal of the American Statistical Association* 113(523), 1228–1242, 2018. doi:10.1080/01621459.2017.1319839 — causal forests with valid pointwise confidence intervals.
- Athey, S., Tibshirani, J. & Wager, S., "Generalized Random Forests," *The Annals of Statistics* 47(2), 1148–1178, 2019. doi:10.1214/18-aos1709 — the general forest-as-local-estimator framework behind `grf`.
- Chernozhukov, V., Chetverikov, D., Demirer, M., Duflo, E., Hansen, C., Newey, W. & Robins, J., "Double/Debiased Machine Learning for Treatment and Structural Parameters," *The Econometrics Journal* 21(1), C1–C68, 2018. doi:10.1111/ectj.12097 — orthogonalization + cross-fitting; the dominant ML-for-causal-inference recipe.
- Athey, S. & Imbens, G. W., "Machine Learning Methods That Economists Should Know About," *Annual Review of Economics* 11, 685–725, 2019. doi:10.1146/annurev-economics-080217-053433 — the survey assigned as the week's bridge from prediction to causal ML.

**Methods/skills:** fitting causal forests / DML with cross-fitting; estimating CATEs and BLP-of-CATE; constructing and validating targeting policies.
**Central debates:** inference after model selection; do flexible HTE estimates replicate? Heterogeneity discovery vs. confirmatory testing; orthogonality vs. plug-in bias.

---

### Week 12 — Experimentation in Platforms & Marketing I: Advertising Measurement
**Frontier (the marketing-specific core).**

**Subtopics:** why advertising effects are tiny relative to sales variance (the "unfavorable economics"); intent-to-treat designs, PSA/holdout controls, and ghost ads; selection/endogeneity in ad delivery; experiments vs. observational methods for ad ROI; advertising-as-signal and as-information measured experimentally.

**Key readings:**
- Lewis, R. A. & Rao, J. M., "The Unfavorable Economics of Measuring the Returns to Advertising," *The Quarterly Journal of Economics* 130(4), 1941–1973, 2015. doi:10.1093/qje/qjv023 — shows that even huge experiments struggle to detect ad effects; sets the statistical-power agenda for the field.
- Johnson, G. A., Lewis, R. A. & Nubbemeyer, E. I., "Ghost Ads: Improving the Economics of Measuring Online Ad Effectiveness," *Journal of Marketing Research* 54(6), 867–884, 2017. doi:10.1509/jmr.15.0297 — the ghost-ads design: a clean, low-cost counterfactual for would-be-exposed users.
- Gordon, B. R., Zettelmeyer, F., Bhargava, N. & Chapsky, D., "A Comparison of Approaches to Advertising Measurement: Evidence from Big Field Experiments at Facebook," *Marketing Science* 38(2), 193–225, 2019. doi:10.1287/mksc.2018.1135 — observational methods badly mismeasure ad lift vs. RCT benchmarks.
- Gordon, B. R., Moakler, R. & Zettelmeyer, F., "Close Enough? A Large-Scale Exploration of Non-Experimental Approaches to Advertising Measurement," *Marketing Science* 42(4), 768–793, 2023. doi:10.1287/mksc.2022.1413 — when (rarely) observational ad measurement gets "close enough."
- Sahni, N. S., Zou, D. & Chintagunta, P. K., "Do Targeted Discount Offers Serve as Advertising? Evidence from 70 Field Experiments," *Management Science* 63(8), 2688–2705, 2017. doi:10.1287/mnsc.2016.2450 — promotions have advertising-like (information) effects beyond redemption; bridges to Wk 13.

**Methods/skills:** powering ad experiments / MDE calculations; ITT vs. exposure effects and the ghost-ad/PSA logic; benchmarking observational estimators against RCTs.
**Central debates:** can advertising ROI ever be measured precisely enough to manage? Are platform-run experiments trustworthy/replicable? Lift vs. attribution.

---

### Week 13 — Experimentation in Platforms & Marketing II: Incrementality, Geo & Pricing/Promotion Experiments
**Frontier.**

**Subtopics:** incrementality vs. last-touch attribution; geo experiments and matched-market/synthetic-control designs for measuring incremental lift; pricing field experiments and price-ending effects; coupon/promotion experiments; bandit "learning-and-earning" pricing; targeting-policy *evaluation* from experiments.

**Key readings:**
- Blake, T., Nosko, C. & Tadelis, S., "Consumer Heterogeneity and Paid Search Effectiveness: A Large-Scale Field Experiment," *Econometrica* 83(1), 155–174, 2015. doi:10.3982/ecta12423 — eBay's brand-keyword experiment: paid search was largely non-incremental for known customers; the incrementality cautionary tale.
- Anderson, E. T. & Simester, D. I., "Effects of $9 Price Endings on Retail Sales: Evidence from Field Experiments," *Quantitative Marketing and Economics* 1(1), 93–110, 2003. doi:10.1023/a:1023581927405 — clean pricing field experiment isolating a behavioral price-ending effect.
- Simester, D., Timoshenko, A. & Zoumpoulis, S. I., "Efficiently Evaluating Targeting Policies: Improving on Champion vs. Challenger Experiments," *Management Science* 66(8), 3412–3424, 2020. doi:10.1287/mnsc.2019.3379 — how to evaluate many targeting policies from a single experiment.
- Simester, D., Timoshenko, A. & Zoumpoulis, S. I., "Targeting Prospective Customers: Robustness of Machine-Learning Methods to Typical Data Challenges," *Management Science* 66(6), 2495–2522, 2020. doi:10.1287/mnsc.2019.3308 — how ML targeting from experimental data holds up under real data pathologies.

**Methods/skills:** designing geo/matched-market experiments and CausalImpact-style readouts (cf. Wk 8); incrementality test design; off-policy/targeting-policy evaluation; power for pricing/promo tests.
**Central debates:** geo experiments (few large units, interference) vs. user-level randomization; attribution vs. incrementality in industry practice; can targeting policies be both learned and validated on the same data?

---

### Week 14 — Interference, Spillovers & SUTVA Violations (Synthesis + Research Craft)
**Frontier.**

**Subtopics:** SUTVA violations in marketplaces and social networks; partial-interference and exposure-mapping estimands; cluster/graph-cluster randomization to bound bias; the reflection problem and identifying peer/social effects; marketplace equilibrium effects (treatment "cannibalizes" control); **research craft** — designing a feasible study under interference, pre-analysis plans, and refereeing experimental work.

**Key readings:**
- Aronow, P. M. & Samii, C., "Estimating Average Causal Effects Under General Interference, with Application to a Social Network Experiment," *The Annals of Applied Statistics* 11(4), 1912–1947, 2017. doi:10.1214/16-aoas1005 — design-based estimation under interference via exposure mappings.
- Sävje, F., Aronow, P. M. & Hudgens, M. G., "Average Treatment Effects in the Presence of Unknown Interference," *The Annals of Statistics* 49(2), 673–701, 2021. doi:10.1214/20-aos1973 — what experiments still estimate when interference is present but unmodeled.
- Eckles, D., Karrer, B. & Ugander, J., "Design and Analysis of Experiments in Networks: Reducing Bias from Interference," *Journal of Causal Inference* 5(1), 20150021, 2017. doi:10.1515/jci-2015-0021 — graph-cluster randomization to cut interference bias in social/ad experiments.
- Blake, T. & Coey, D., "Why Marketplace Experimentation Is Harder Than It Seems: The Role of Test-Control Interference," *Proceedings of the Fifteenth ACM Conference on Economics and Computation (EC '14)*, 567–582, 2014. doi:10.1145/2600057.2602837 — marketplace interference biases naive A/B tests (eBay); the applied motivation.
- Manski, C. F., "Identification of Endogenous Social Effects: The Reflection Problem," *The Review of Economic Studies* 60(3), 531–542, 1993. doi:10.2307/2298123 — the foundational impossibility result for separating endogenous from contextual peer effects.

**Methods/skills:** specifying exposure mappings; cluster/graph-cluster randomization design; partial-interference estimands; writing a referee report and a pre-analysis plan.
**Central debates:** when does interference bias dominate, and is cluster randomization worth the power loss? Can peer effects ever be point-identified? How should marketing referee non-replicable platform experiments?

---

## 3. Foundational vs. frontier — summary map

| Block | Foundational core (the "must-know") | Frontier extensions (active research) |
|---|---|---|
| Framework (Wk 1) | Rubin 1974; Holland 1986; Imbens–Rubin | design- vs. model-based inference debates |
| Experiments / A/B (Wk 2) | Fisher/Neyman randomization inference; Kohavi | time-series/switchback experiments; always-valid inference |
| Selection on observables (Wk 3) | CIA, bad controls, overlap (MHE) | sensitivity analysis; Athey–Imbens overview |
| IV (Wk 4) | Imbens–Angrist LATE; AIR 1996 | weak-IV, judge/shift-share designs |
| DiD I (Wk 5) | Card–Krueger; Bertrand–Duflo–Mullainathan | wild-cluster inference |
| DiD II — staggered (Wk 6) | (the *critique itself* is now foundational) | Goodman-Bacon; CS; dCDH; Sun–Abraham; BJS; Roth et al. |
| RDD (Wk 7) | Imbens–Lemieux guide | Calonico–Cattaneo–Titiunik robust inference |
| Synthetic control (Wk 8) | Abadie–Diamond–Hainmueller; Abadie JEL | synthetic DiD; gsynth; CausalImpact |
| Panel/event-study (Wk 9) | FE/FD (Wooldridge) | design-based panel experiments; matrix completion |
| Matching/weighting (Wk 10) | Rosenbaum–Rubin; Hirano–Imbens–Ridder | approximate residual balancing; PS-matching inference |
| ML for HTE (Wk 11) | Athey–Imbens causal trees | causal forests; GRF; double/debiased ML |
| Ad measurement (Wk 12) | Lewis–Rao unfavorable economics | ghost ads; experiments-vs-observational (Gordon et al.) |
| Incrementality/geo/pricing (Wk 13) | Blake–Nosko–Tadelis; Anderson–Simester | targeting-policy evaluation; bandit pricing |
| Interference (Wk 14) | Manski reflection problem | Aronow–Samii; Sävje et al.; graph-cluster designs |

**Reading the map.** The left column is qualifying-exam material; the right column is where dissertations are written. The marketing-specific value-add over a generic econometrics course is concentrated in Weeks 12–14 (advertising measurement, incrementality/geo/pricing experiments, marketplace interference) and in the framing of every method around small effects, non-stationary platforms, and policy/targeting decisions. Note that Week 6 is the rare case where a *critique* has itself become foundational: no student can use DiD today without knowing the staggered-adoption failure of TWFE.

---

## 4. How the chapter should expand over time

1. **Pull real syllabi (highest priority for the next web-enabled pass).** Fetch the program/instructor pages in Section 5 — especially MIT 14.387/14.771 (Angrist), Chicago Booth's causal-inference and quant-marketing sequences, Stanford GSB/Econ (Athey, Wager), Berkeley (Tadelis-style digital-experiments), and Wharton/Columbia/Kellogg marketing-methods seminars — and reconcile this canonical ordering against actual week-by-week reading lists. Cite program + URL.
2. **Track Week 6 (staggered DiD), which moves fastest.** The robust-DiD literature is still consolidating (continuous treatment, non-absorbing treatment, triple-difference, design-based DiD); refresh every revision and watch for the field settling on default estimators.
3. **Deepen the marketing-platform core (Wk 12–14).** Add incrementality/geo-experiment methodology with version-of-record DOIs as they appear (much of it currently lives in working papers and platform tech reports — e.g., Google's geo-experiment papers — and should be promoted only once a citable record exists), plus the growing experimentation-under-interference literature for marketplaces and recommender systems.
4. **Add a power/design appendix.** A compact reference on MDE/power for small-lift ad experiments, variance reduction (CUPED), cluster-randomization power loss, and sequential testing — the practical skills these seminars increasingly grade.
5. **Add a software/replication appendix.** Map methods to canonical packages (`grf`, `DoubleML`/`econml`, `did`, `fixest`/`sunab`, `rdrobust`, `Synth`/`synthdid`/`gsynth`, `CausalImpact`) so the chapter is usable as a methods reference, consistent with the code-forward Cunningham/Mixtape tradition.
6. **Maintain the foundational/frontier marking** as the load-bearing pedagogical device; promote a paper from "frontier" to "foundational" only once it is standard qualifying-exam material (the staggered-DiD critique is the current example mid-transition).

---

## 5. Sources consulted

**Crossref (live, this run):** every DOI cited above was verified against the Crossref version-of-record via `api.crossref.org` (bibliographic-query and `/works/{doi}` endpoints), dated 2026-06-21. Candidate DOIs that returned 404 or matched a different work were discarded rather than cited.

**Program / instructor pages (NOT fetched in this run — general web access was denied; listed as pointers for a web-enabled verification pass; no course numbers, week orderings, or quotes are attributed to them here):**
- MIT Economics — Angrist's graduate applied econometrics (14.387 "Applied Econometrics") and development/field-experiments materials — https://economics.mit.edu/
- MIT Sloan (marketing PhD) — https://mitsloan.mit.edu/phd/program-overview/marketing
- J-PAL course materials (field-experiments pedagogy, Duflo/Banerjee/Glennerster) — https://www.povertyactionlab.org/
- Chicago Booth (marketing & econometrics PhD) — https://www.chicagobooth.edu/phd/academic-experience/dissertation-areas/marketing
- Stanford GSB (marketing PhD; Athey/Wager causal-ML courses) — https://www.gsb.stanford.edu/programs/phd/fields/marketing
- Stanford — Wager & Athey, "Stats 361 / Machine Learning & Causal Inference" course notes — https://web.stanford.edu/~swager/
- Berkeley Haas / Economics (digital experiments; Tadelis) — https://haas.berkeley.edu/phd/fields-of-study/marketing/
- Wharton (Penn) marketing PhD — https://marketing.wharton.upenn.edu/programs/phd/
- Columbia Business School marketing PhD — https://students.business.columbia.edu/phd/academics/marketing
- Northwestern Kellogg marketing PhD — https://www.kellogg.northwestern.edu/programs/phd/academics/marketing.aspx
- NYU Stern marketing PhD — https://www.stern.nyu.edu/programs-admissions/phd/academics/marketing
- Cunningham, S., *Causal Inference: The Mixtape* (open companion) — https://mixtape.scunning.com/
- Roth/Sant'Anna and the "Difference-in-Differences" reading-group resources — https://www.jonathandroth.com/

**Project-internal context (not a source for the DOIs above, which are live-verified):**
- `.editorial/research/seminar-inventory.md` — track taxonomy and program URL list.
- `.editorial/research/syllabi/analytical-modeling.md` — house style/format template for these syllabus documents.

---

## 6. Verification status

- **Every DOI above was verified live against Crossref in this run (2026-06-21)** via `api.crossref.org`. None was invented; failed candidates were discarded.
- **No live syllabus page was fetched** (general WebFetch/WebSearch were denied in this run). The weekly structure reflects the stable field canon, not a transcribed syllabus; program pages in Section 5 are pointers for a future web-enabled pass.
- **Textbooks** (Imbens–Rubin, Angrist–Pischke, Cunningham, Wooldridge) are listed with publisher/year under "Books / canon" — no fabricated DOIs.
- **Flagged `[verify DOI]`:** the original Card & Krueger 1994 *AER* article (an older AER record not cleanly resolvable via Crossref in this run); the verified 2000 AER "Reply" is cited in its place in Week 5.
