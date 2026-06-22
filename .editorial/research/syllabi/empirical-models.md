# Empirical / Quantitative Models in Marketing — PhD Seminar Structure

Research note for chapter **27-empirical-models**. Purpose: synthesize how top
marketing PhD programs (Chicago Booth, Wharton, Stanford GSB, MIT Sloan, Columbia,
NYU Stern, Michigan Ross, Berkeley Haas, Yale SOM, Duke Fuqua, Kellogg) structure
the econometric-modeling doctoral seminar over a ~13–14 week semester, and a
canonical module skeleton with **verified-DOI** readings to anchor the chapter.

> Method/scope note. WebSearch and general WebFetch were unavailable in this
> environment (only the Crossref API host `api.crossref.org` was reachable), so
> live syllabus pages could not be fetched here. The module architecture below
> reflects the field's well-established and highly convergent seminar structure
> (the Chicago/Berkeley/Stanford "structural IO-flavored" demand-estimation
> tradition descending from Berry–Levinsohn–Pakes, the Ohio State/Wharton
> hierarchical-Bayes tradition descending from Allenby–Rossi, and the
> field-experiment/causal-inference turn of the 2010s). **Every reading below
> was verified against Crossref for author/title/year/DOI** (version-of-record
> DOIs preferred); any reading we could not verify was omitted. Real public
> syllabus URLs are listed under "Sources consulted" for the author to confirm.

---

## 1. Semester arc

The quantitative-models seminar is the methodological spine of an empirical
marketing PhD. Its arc moves from **what we measure** to **how we identify it** to
**how we model behavior over time**. The first third installs the discrete-choice
demand workhorse — the multinomial and nested logit on individual scanner-panel
data (Guadagni–Little), the aggregate random-coefficients logit on market shares
(Berry; BLP; Nevo) — because nearly every downstream question (pricing, promotion,
advertising, product line, welfare) is answered through a demand system. Students
learn to read a model as a set of identifying assumptions, not a regression: what
variation in the data pins down the price coefficient, and what would bias it.

The middle third confronts the two threats that define the field's empirical
standards: **unobserved heterogeneity** and **endogeneity**. Heterogeneity is
handled either by integrating it out (random coefficients, mixed logit) or by
estimating it hierarchically (hierarchical Bayes, the Allenby–Rossi program),
and the seminar treats the Bayesian and classical (GMM/simulated maximum
likelihood) camps as complementary toolkits rather than rival faiths. Endogeneity
— prices and marketing-mix variables set in response to demand shocks the
econometrician does not see — motivates instrumental variables, the BLP
contraction-and-GMM machinery, and control-function approaches, alongside a
candid, by-now-canonical critique of weak instruments in marketing (Rossi 2014).

The final third turns dynamic and causal. Students study **state dependence vs.
heterogeneity** (is brand loyalty real switching cost or just persistent taste?),
**forward-looking consumers and firms** (dynamic discrete choice à la Rust;
learning models à la Erdem–Keane; dynamic advertising), and the **field-experiment
/ design-based** turn that reframed advertising-effect measurement (Lewis–Rao,
Blake–Nosko–Tadelis) and pushed the field toward heterogeneous-treatment-effect
estimation and ML-assisted targeting. The course closes on applied syntheses —
attribution and customer-lifetime-value modeling — where the semester's tools
(choice models, dynamics, Bayes, experiments) are assembled into managerially
decision-relevant systems. Throughout, weekly problem sets are estimation-heavy:
students code a logit and a random-coefficients logit from scratch, run a Gibbs
sampler, solve a small dynamic program, and replicate a published result.

---

## 2. Weekly modules (13–14 weeks)

Legend: **[F]** foundational (stable canon, taught nearly everywhere) ·
**[Fr]** frontier (last ~10–15 yrs, more program-specific). Each reading carries a
Crossref-verified DOI and a one-line rationale.

### Week 1 — Foundations: the demand-estimation paradigm & identification thinking [F]
**Subtopics:** what "structural" means; demand systems as the organizing object;
identification vs. estimation; reading a paper for its identifying variation.
**Key readings**
- Berry (1994), *RAND J. Econ.* — DOI `10.2307/2555829`. The share-inversion idea that turns a demand model into a linear-in-mean-utility estimating equation; the conceptual hinge of the whole course.
- Nevo (2000), *J. Econ. & Mgmt. Strategy* — DOI `10.1111/j.1430-9134.2000.00513.x`. The "practitioner's guide" everyone assigns to make BLP estimable; sets the computational template.
- Rossi & Allenby (2003), *Marketing Sci.* — DOI `10.1287/mksc.22.3.304.17739`. Frames the Bayesian alternative early so students see the two estimation paradigms side by side.
**Methods/skills:** utility-maximization micro-foundations; the logit inversion; GMM vs. likelihood preview; how to extract assumptions from a paper.
**Central debate:** structural ("estimate primitives, do counterfactuals") vs. reduced-form/design-based ("estimate a credible causal effect") — introduced here, revisited all semester.

### Week 2 — Discrete choice I: logit/probit on individual panel data [F]
**Subtopics:** MNL and the IIA property; nested logit; the scanner-panel data
environment; loyalty/last-purchase variables.
**Key readings**
- Guadagni & Little (1983), *Marketing Sci.* — DOI `10.1287/mksc.2.3.203`. The paper that launched scanner-data choice modeling in marketing; the canonical MNL-with-loyalty specification.
- Chamberlain (1980), *Rev. Econ. Studies* — DOI `10.2307/2297110`. Conditional (fixed-effects) logit — how panel structure controls persistent unobserved heterogeneity; the econometric backbone.
**Methods/skills:** coding an MNL likelihood; IIA tests; conditional/fixed-effects logit; interpreting marginal effects and elasticities.
**Central debate:** is the Guadagni–Little loyalty variable capturing structural state dependence or merely soaking up heterogeneity? (Foreshadows Week 10.)

### Week 3 — Unobserved heterogeneity I: mixed logit & random coefficients [F]
**Subtopics:** the IIA problem and substitution patterns; random-coefficients
logit; simulated maximum likelihood; finite-mixture (latent-class) models.
**Key readings**
- Gönül & Srinivasan (1993), *Marketing Sci.* — DOI `10.1287/mksc.12.3.213`. Multiple sources of heterogeneity in MNL; the managerial-vs-methodological framing marketing students need.
- Allenby & Rossi (1998), *J. Econometrics* — DOI `10.1016/s0304-4076(98)00055-4`. The case for modeling continuous heterogeneity and its consequences for pricing/targeting.
**Methods/skills:** Monte Carlo integration / SML; latent-class EM; comparing fixed vs. random heterogeneity specifications.
**Central debate:** parametric mixing distribution vs. nonparametric/finite-mixture; how much heterogeneity is "real" vs. an artifact of misspecification.

### Week 4 — Hierarchical Bayes & MCMC estimation [F]
**Subtopics:** the hierarchical model; Gibbs sampling and data augmentation;
individual-level posterior estimates; shrinkage and borrowing strength.
**Key readings**
- Rossi, McCulloch & Allenby (1996), *Marketing Sci.* — DOI `10.1287/mksc.15.4.321`. The flagship demonstration that household-level Bayesian estimates have direct target-marketing value.
- Rossi & Allenby (2003), *Marketing Sci.* — DOI `10.1287/mksc.22.3.304.17739`. The agenda-setting review of Bayesian methods for marketing decision problems.
**Methods/skills:** writing a Gibbs sampler for a hierarchical multinomial logit/probit; convergence diagnostics; posterior predictive checks.
**Central debate:** Bayes vs. classical for heterogeneity — individual-level inference and decision-theoretic loss vs. frequentist guarantees.

### Week 5 — Aggregate demand: the BLP random-coefficients model [F]
**Subtopics:** demand from market shares; the contraction mapping; supply side and
markups; micro-moments / combining macro and micro data.
**Key readings**
- Berry, Levinsohn & Pakes (1995), *Econometrica* — DOI `10.2307/2171802`. The foundational aggregate random-coefficients model with endogenous prices; the field's most-imitated method.
- Nevo (2001), *Econometrica* — DOI `10.1111/1468-0262.00194`. The canonical applied BLP (ready-to-eat cereal) used to teach implementation and the market-power counterfactual.
- Nevo (2000), *J. Econ. & Mgmt. Strategy* — DOI `10.1111/j.1430-9134.2000.00513.x`. The estimation recipe students actually code against.
**Methods/skills:** the BLP contraction; nested GMM; computing own/cross price elasticities and implied markups.
**Central debate:** aggregate vs. individual data — what is gained/lost by estimating from shares; numerical fragility and the "BLP is hard to get right" literature.

### Week 6 — Endogeneity I: instrumental variables & control functions [F]
**Subtopics:** price endogeneity from unobserved product/demand shocks; cost-shifter
and Hausman/BLP instruments; the control-function alternative for nonlinear models.
**Key readings**
- Villas-Boas & Winer (1999), *Mgmt. Sci.* — DOI `10.1287/mnsc.45.10.1324`. The paper that put price endogeneity on the marketing field's agenda for brand-choice models.
- Petrin & Train (2010), *J. Marketing Res.* — DOI `10.1509/jmkr.47.1.3`. The control-function approach — the practical alternative to BLP-style IV inside choice models.
- Chintagunta, Dubé & Goh (2005), *Mgmt. Sci.* — DOI `10.1287/mnsc.1040.0323`. Endogeneity from unobserved brand characteristics at the household level; bridges micro and aggregate treatments.
**Methods/skills:** 2SLS/GMM with logit; control-function (residual-inclusion) estimation; instrument-relevance/validity diagnostics.
**Central debate:** IV vs. control function; what makes a credible marketing instrument.

### Week 7 — Endogeneity II: the IV critique & the credibility standard [F]/[Fr]
**Subtopics:** weak/invalid instruments; the bias–variance trade-off of IV; when to
prefer direct measurement or design over instrumenting.
**Key readings**
- Rossi (2014), *Marketing Sci.* — DOI `10.1287/mksc.2014.0860`. The influential critique ("Even the Rich Can Make Themselves Poor") arguing strong, valid instruments are rare in marketing.
- Hansen (1982), *Econometrica* — DOI `10.2307/1912775`. GMM foundations — the inferential machinery (and overidentification test) underneath IV and BLP.
**Methods/skills:** first-stage F-stats and weak-instrument diagnostics; overidentification (J) tests; sensitivity analysis.
**Central debate:** the "credibility revolution" reaches marketing — instrument-based identification vs. experimental/design-based identification; how much to trust structural counterfactuals built on weak IVs.

### Week 8 — Panel data, fixed effects & dynamic panels [F]
**Subtopics:** within vs. between variation; fixed vs. random effects; the
incidental-parameters problem; lagged-dependent-variable bias.
**Key readings**
- Chamberlain (1980), *Rev. Econ. Studies* — DOI `10.2307/2297110`. Conditional-likelihood estimation that differences out fixed effects in nonlinear panels.
- Keane (1997), *J. Business & Econ. Statistics* — DOI `10.1080/07350015.1997.10524709`. The reference treatment of heterogeneity vs. state dependence in panel choice data; the methodological heart of the course's dynamics half.
**Methods/skills:** FE/RE estimation and Hausman testing; handling initial-conditions and incidental-parameters problems; clustering/inference in panels.
**Central debate:** fixed effects (robust, costly in degrees of freedom) vs. random effects/hierarchical (efficient, requires distributional assumptions).

### Week 9 — State dependence vs. heterogeneity (consumer inertia) [F]/[Fr]
**Subtopics:** structural state dependence vs. persistent heterogeneity; loyalty as
switching cost; initial conditions; identification from price/promotion variation.
**Key readings**
- Keane (1997), *J. Business & Econ. Statistics* — DOI `10.1080/07350015.1997.10524709`. The framing paper: disentangling true state dependence from spurious persistence.
- Dubé, Hitsch & Rossi (2010), *RAND J. Econ.* — DOI `10.1111/j.1756-2171.2010.00106.x`. The modern reference distinguishing genuine switching costs from alternative explanations for inertia.
- Bronnenberg, Dubé & Gentzkow (2012), *Amer. Econ. Rev.* — DOI `10.1257/aer.102.6.2472`. Brand capital and persistent preferences identified from consumer migration — a clean natural-experiment take on "why preferences persist."
**Methods/skills:** specifying lagged-choice effects; controlling for unobserved heterogeneity while estimating state dependence; exploiting moves/shocks for identification.
**Central debate:** the field's signature identification problem — what variation separates habit/loyalty from taste, and why it matters for pricing and promotion policy.

### Week 10 — Dynamic discrete choice: forward-looking consumers & firms [F]/[Fr]
**Subtopics:** the dynamic-programming choice framework; conditional value
functions; nested fixed-point estimation; stockpiling and learning.
**Key readings**
- Rust (1987), *Econometrica* — DOI `10.2307/1911259`. The foundational dynamic-discrete-choice model (bus-engine replacement); the estimation template (NFXP) for forward-looking agents.
- Erdem & Keane (1996), *Marketing Sci.* — DOI `10.1287/mksc.15.1.1`. Brings dynamic decision-making under uncertainty (Bayesian learning) into marketing brand choice.
- Erdem, Keane & Sun (2008), *Marketing Sci.* — DOI `10.1287/mksc.1080.0362`. Price and advertising as quality signals in a dynamic learning model — frontier integration of dynamics, information, and marketing mix.
**Methods/skills:** solving a discrete DP by value-function iteration; the nested fixed-point algorithm; likelihood for forward-looking choices.
**Central debate:** myopic vs. forward-looking specifications; the heavy computational/identification cost of full-solution dynamics vs. two-step (CCP) estimators.

### Week 11 — Advertising & marketing-mix dynamics; aggregate response [F]/[Fr]
**Subtopics:** advertising carryover/goodwill stocks; dynamic firm advertising
policy; aggregate marketing-mix response; sponsored-search/digital dynamics.
**Key readings**
- Dubé, Hitsch & Manchanda (2005), *Quant. Marketing & Econ.* — DOI `10.1007/s11129-005-0334-2`. Estimating advertising goodwill dynamics and rationalizing pulsing — the modern dynamic-advertising reference.
- Yao & Mela (2011), *Marketing Sci.* — DOI `10.1287/mksc.1100.0626`. A dynamic structural model of sponsored-search advertising; ports dynamics to digital marketplaces.
**Methods/skills:** estimating Koyck/goodwill carryover; dynamic optimization of a marketing instrument; aggregate response identification.
**Central debate:** structural dynamic models of advertising vs. design-based field-experiment measurement (sets up Week 12).

### Week 12 — Causal inference & field experiments in marketing [Fr]
**Subtopics:** the experimental turn in advertising measurement; regression
discontinuity and natural experiments; selection and endogenous targeting in
observational ad data.
**Key readings**
- Lewis & Rao (2015), *Quarterly J. Econ.* — DOI `10.1093/qje/qjv023`. Why observational and even experimental advertising-ROI estimates are so noisy — recalibrated the field's expectations.
- Blake, Nosko & Tadelis (2015), *Econometrica* — DOI `10.3982/ecta12423`. The eBay paid-search field experiment showing large observational estimates collapse under randomization.
- Hartmann, Nair & Narayanan (2011), *Marketing Sci.* — DOI `10.1287/mksc.1110.0670`. Regression-discontinuity identification of marketing-mix effects — quasi-experimental design inside a marketing setting.
**Methods/skills:** designing/analyzing large field experiments; power analysis for ad effects; RD estimation and validity checks.
**Central debate:** experiments vs. structural models — internal validity and causal credibility vs. counterfactual richness and external extrapolation.

### Week 13 — Heterogeneous treatment effects, targeting & ML-meets-econometrics [Fr]
**Subtopics:** CATE estimation; causal forests / honest trees; ML for policy
targeting; robustness to real data challenges.
**Key readings**
- Wager & Athey (2018), *J. Amer. Statistical Assoc.* — DOI `10.1080/01621459.2017.1319839`. Causal forests for heterogeneous-treatment-effect estimation with valid inference — the bridge from ML to causal targeting.
- Simester, Timoshenko & Zoumpoulis (2020), *Mgmt. Sci.* — DOI `10.1287/mnsc.2019.3308`. Field-experiment evaluation of ML targeting methods under typical marketing-data pathologies.
**Methods/skills:** estimating CATEs; constructing and evaluating targeting policies; cross-fitting and honesty; out-of-sample policy value.
**Central debate:** prediction vs. causal targeting; can off-the-shelf ML deliver valid policies, and when does it break?

### Week 14 — Applied synthesis: attribution & customer-lifetime-value models [F]/[Fr]
**Subtopics:** buy-till-you-die / Pareto-NBD models; RFM and CLV; multichannel
attribution; carryover and spillover across touchpoints; social interactions as a
recurring identification challenge.
**Key readings**
- Schmittlein, Morrison & Colombo (1987), *Mgmt. Sci.* — DOI `10.1287/mnsc.33.1.1`. The Pareto/NBD "Counting Your Customers" model — foundation of probabilistic CLV.
- Fader, Hardie & Lee (2005), *J. Marketing Res.* — DOI `10.1509/jmkr.2005.42.4.415`. RFM-to-CLV via iso-value curves — the bridge from the academic model to managerial customer-base analysis.
- Li & Kannan (2014), *J. Marketing Res.* — DOI `10.1509/jmr.13.0050`. Multichannel attribution combining an empirical model with a field experiment — the capstone integrating choice, dynamics, and experiments.
- Hartmann et al. (2008), *Marketing Letters* — DOI `10.1007/s11002-008-9048-z`. Identification of social interactions — the reflection problem students must recognize whenever "network" effects appear.
**Methods/skills:** fitting Pareto/NBD and BG/NBD; computing CLV; estimating attribution with carryover/spillover; recognizing the reflection problem.
**Central debate:** correlation vs. causation in attribution and "viral" effects; model-based CLV vs. machine-learned churn/value scoring.

---

## 3. Foundational vs. frontier — quick map

| Theme | Foundational core (stable canon) | Frontier emphasis (program-specific) |
|---|---|---|
| Demand/choice | Logit/MNL (Guadagni–Little); Berry inversion; BLP; Nevo | Combining micro+macro data; ML demand |
| Heterogeneity | Random coefficients; hierarchical Bayes (Allenby–Rossi) | Nonparametric heterogeneity; deep models |
| Endogeneity | IV/GMM (Hansen); control functions (Petrin–Train) | IV critique (Rossi 2014); design-based ID |
| Panel/dynamics | FE/conditional logit (Chamberlain); state dependence (Keane); DDC (Rust) | Bayesian learning (Erdem–Keane); CCP estimators |
| Causal/experiments | — (newer to the canon) | Field experiments (Lewis–Rao; Blake et al.); RD; HTE/causal forests |
| Applied synthesis | Pareto/NBD (Schmittlein); CLV (Fader–Hardie–Lee) | Multichannel attribution; ML targeting |

The first ~8 weeks are highly stable across programs and decades; weeks 12–13 are
where syllabi differ most (Stanford/Berkeley/MIT lean experiments + ML; Ohio
State/Wharton lean Bayes; Chicago/Yale lean structural IO). A 13-week version
typically merges Weeks 6–7 (endogeneity) or Weeks 11–12 (dynamics/experiments).

---

## 4. How the chapter should expand over time

1. **Estimation walk-throughs as worked code.** Each foundational module should
   ship a reproducible estimator in the book's house style (base-R unless a method
   demands more): a hand-coded MNL log-likelihood, a random-coefficients logit via
   simulated ML, a Gibbs sampler for a hierarchical probit, a small value-function
   iteration for a Rust-style DP, and a BLP contraction. These are the chapter's
   highest-value, longest-lived assets.
2. **Identification call-outs.** For every model, add a boxed "what identifies the
   key parameter" note and a "what breaks it" note — this is the seminar's central
   skill and differentiates the chapter from a methods cookbook.
3. **The structural-vs-design debate as a through-line.** Rather than a single
   week, thread the tension (counterfactual richness vs. causal credibility) across
   demand, endogeneity, dynamics, and experiments; close with a synthesis on when
   each approach is decision-relevant.
4. **Frontier refresh cadence.** Weeks 12–13 (experiments, HTE/ML, targeting) and
   the digital-dynamics material (Yao–Mela, Goldfarb–Tucker) age fastest; budget a
   periodic pass to add the current top-4/QME work on platform/algorithmic
   demand, privacy-constrained measurement, and LLM/embedding-based demand models.
5. **Cross-references.** Wire to sibling chapters: conjoint/preference measurement
   (choice foundations), advertising and MMM (Weeks 11–12), CLV chapter (Week 14),
   structural-models chapter (Weeks 5, 10), and the data/modeling craft chapters
   (estimation and inference).
6. **Replication appendix.** Add a "replicate a classic" exercise (e.g., a
   teaching-scale BLP on public market-share data; a Pareto/NBD on the
   CDNOW-style dataset) so students leave having reproduced a published result.

---

## 5. Sources consulted

DOIs for all readings were verified via the Crossref REST API
(`https://api.crossref.org/works?query.bibliographic=...` and
`https://api.crossref.org/works/<doi>`) during this session; titles, authors,
years, and containers above match the Crossref records returned.

Public syllabi / reading lists for empirical-quantitative-marketing doctoral
seminars at the named programs are published on instructor pages (e.g., Chicago
Booth — Hitsch/Bronnenberg/Dubé; Berkeley Haas — Train; Stanford GSB — Nair;
Yale SOM — Sudhir; Ohio State Fisher — Allenby). These could not be live-fetched
in this environment (only `api.crossref.org` was reachable), so specific URLs are
left for the author to confirm against the then-current course pages rather than
cited from memory. The module architecture above reflects the convergent
structure of those public seminars and is intended as a starting skeleton to be
checked against any one program's current syllabus.

### Verified reading list (27 items, all DOIs confirmed via Crossref)

| Authors (year) | Container | DOI |
|---|---|---|
| Berry (1994) | RAND J. Econ. | 10.2307/2555829 |
| Berry, Levinsohn, Pakes (1995) | Econometrica | 10.2307/2171802 |
| Guadagni, Little (1983) | Marketing Sci. | 10.1287/mksc.2.3.203 |
| Chamberlain (1980) | Rev. Econ. Studies | 10.2307/2297110 |
| Gönül, Srinivasan (1993) | Marketing Sci. | 10.1287/mksc.12.3.213 |
| Allenby, Rossi (1998) | J. Econometrics | 10.1016/s0304-4076(98)00055-4 |
| Rossi, McCulloch, Allenby (1996) | Marketing Sci. | 10.1287/mksc.15.4.321 |
| Rossi, Allenby (2003) | Marketing Sci. | 10.1287/mksc.22.3.304.17739 |
| Nevo (2000) | J. Econ. & Mgmt. Strategy | 10.1111/j.1430-9134.2000.00513.x |
| Nevo (2001) | Econometrica | 10.1111/1468-0262.00194 |
| Villas-Boas, Winer (1999) | Mgmt. Sci. | 10.1287/mnsc.45.10.1324 |
| Petrin, Train (2010) | J. Marketing Res. | 10.1509/jmkr.47.1.3 |
| Chintagunta, Dubé, Goh (2005) | Mgmt. Sci. | 10.1287/mnsc.1040.0323 |
| Rossi (2014) | Marketing Sci. | 10.1287/mksc.2014.0860 |
| Hansen (1982) | Econometrica | 10.2307/1912775 |
| Chintagunta (1993) | Marketing Sci. | 10.1287/mksc.12.2.184 |
| Keane (1997) | J. Business & Econ. Statistics | 10.1080/07350015.1997.10524709 |
| Dubé, Hitsch, Rossi (2010) | RAND J. Econ. | 10.1111/j.1756-2171.2010.00106.x |
| Bronnenberg, Dubé, Gentzkow (2012) | Amer. Econ. Rev. | 10.1257/aer.102.6.2472 |
| Rust (1987) | Econometrica | 10.2307/1911259 |
| Erdem, Keane (1996) | Marketing Sci. | 10.1287/mksc.15.1.1 |
| Erdem, Keane, Sun (2008) | Marketing Sci. | 10.1287/mksc.1080.0362 |
| Dubé, Hitsch, Manchanda (2005) | Quant. Marketing & Econ. | 10.1007/s11129-005-0334-2 |
| Yao, Mela (2011) | Marketing Sci. | 10.1287/mksc.1100.0626 |
| Sudhir (2001) | Marketing Sci. | 10.1287/mksc.20.1.42.10196 |
| Petrin (2002) | J. Political Economy | 10.1086/340779 |
| Lewis, Rao (2015) | Quarterly J. Econ. | 10.1093/qje/qjv023 |
| Blake, Nosko, Tadelis (2015) | Econometrica | 10.3982/ecta12423 |
| Hartmann, Nair, Narayanan (2011) | Marketing Sci. | 10.1287/mksc.1110.0670 |
| Wager, Athey (2018) | J. Amer. Statistical Assoc. | 10.1080/01621459.2017.1319839 |
| Simester, Timoshenko, Zoumpoulis (2020) | Mgmt. Sci. | 10.1287/mnsc.2019.3308 |
| Schmittlein, Morrison, Colombo (1987) | Mgmt. Sci. | 10.1287/mnsc.33.1.1 |
| Fader, Hardie, Lee (2005) | J. Marketing Res. | 10.1509/jmkr.2005.42.4.415 |
| Li, Kannan (2014) | J. Marketing Res. | 10.1509/jmr.13.0050 |
| Goldfarb, Tucker (2011) | Marketing Sci. | 10.1287/mksc.1100.0583 |
| Hartmann et al. (2008) | Marketing Letters | 10.1007/s11002-008-9048-z |

*Omitted as unverifiable / no DOI:* McFadden (1974), "Conditional Logit Analysis
of Qualitative Choice Behavior" (book chapter in *Frontiers in Econometrics*,
ed. Zarembka) — Crossref returns no DOI; the conditional-logit foundation is
instead covered above via Chamberlain (1980), which has a verified DOI.
