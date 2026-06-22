# Discrete Choice Modeling & Bayesian Methods — PhD Seminar (Marketing)

A canonical full-semester (≈14-week) doctoral-seminar structure for **discrete choice modeling and Bayesian methods in marketing**, synthesized from the way top quantitative-marketing programs (Ohio State / Fisher, Chicago / Booth, Wharton, Columbia, Michigan / Ross, Rochester / Simon, NYU / Stern, Duke / Fuqua) organize this material. Each module gives a topic, subtopics, 3–6 **Crossref-verified** key readings (each with a one-line "why"), the methods taught, and the live debates.

**Verification protocol.** Every journal/proceedings reading below was matched against the Crossref REST API (`https://api.crossref.org/works?query.bibliographic=...`, polite pool via `&mailto=`), and each DOI, title, author list, year, container-title, volume/issue, and pages was checked against the returned version-of-record metadata. Published versions-of-record are preferred over SSRN/NBER/preprint DOIs. **Canonical books and book chapters that Crossref does not register with a resolvable DOI are listed under "Foundational Books" with verified publisher/year only, and never given an invented DOI.** Readings that could not be verified are quarantined at the bottom under **UNVERIFIED — do not cite**. Verified on **2026-06-21**.

**Sourcing note (important).** Live PhD-program syllabus pages and faculty reading lists were **not directly fetchable** in this environment (only the Crossref API was reachable; faculty/department pages were permission-blocked). Consistent with the repo's `seminar-inventory.md` caveat, the *module structure* below is built from stable, well-established field knowledge of how this seminar is taught, the *readings* are the field's canonical and frontier papers (each independently DOI-verified), and the **program URLs in "Sources consulted" are given as pointers for a human editor to confirm** — no course numbers or verbatim syllabus quotes are asserted from pages that could not be loaded.

Default chapter tag: `Chapter: choice-bayesian` (a.k.a. the modeling / Bayesian-data chapter). Cross-references to `preference-measurement` and `structural-models` are noted where a reading is shared.

---

## 1. Semester arc

The seminar is built as a single intellectual staircase from **theory of individual choice** up to **modern Bayesian computation and scale**. It opens with the micro-foundation that organizes everything else — random utility maximization (RUM) — and the workhorse it produces, the multinomial/conditional logit. The first third of the course exhausts what closed-form logit can and cannot do: the independence-of-irrelevant-alternatives (IIA) restriction, the substitution-pattern pathologies it implies, and the two classical escapes from it — *generalized extreme value* (nested logit, GEV) which keeps a closed form, and *probit*, which abandons closed form and forces the course into simulation (the GHK simulator, simulated maximum likelihood, method of simulated moments). By the time random-coefficients / mixed logit arrives, students see it as the field's preferred resolution: it relaxes IIA, accommodates unobserved heterogeneity, approximates any RUM, and is estimable either by simulation or by Bayesian MCMC.

The middle third pivots from estimators to the **Bayesian paradigm**, which is the distinctive emphasis of the marketing version of this seminar (as opposed to a pure econometrics version). Students learn the Bayesian logic of inference, conjugacy, and the two engines of modern practice — the Gibbs sampler and the Metropolis–Hastings algorithm — and then the idea that made Bayes the default tool of quantitative marketing: **hierarchical Bayes for consumer heterogeneity**. The hierarchical normal model that shrinks individual-level parameters toward a population distribution is presented as the conceptual heart of the course, because it simultaneously solves the small-data-per-consumer problem, delivers individual-level posteriors useful for targeting, and unifies choice modeling with conjoint/preference measurement.

The final third applies and extends the machinery: **conjoint and preference measurement** as the marketing-native application of HB choice models; **dynamics and state dependence** (Bayesian learning, structural state dependence vs. spurious persistence from heterogeneity, the central identification debate of the field); **aggregate-data demand** (BLP-style random-coefficients logit and its Bayesian counterpart, integrating out heterogeneity); **model comparison** (Bayes factors, marginal likelihoods, DIC/WAIC, cross-validation); and the computational frontier — **Hamiltonian Monte Carlo / Stan** and **scalable and variational methods** for the large, sparse, high-dimensional data that now dominate marketing. The arc ends where the field's frontier is: probabilistic programming and approximate inference at scale.

A typical assessment structure is weekly reading memos, two or three problem sets that build an estimator from scratch (a hand-coded Gibbs sampler for a hierarchical logit is the signature assignment), a referee report, and a replication-or-extension paper using a real choice dataset (scanner panel, conjoint, or aggregate market shares).

---

## Foundational Books

These are the books the seminar is built around. Crossref does **not** register resolvable top-level DOIs for them (some chapters carry DOIs under a book prefix; the canonical works themselves do not), so they are listed with verified publisher and year only.

- **Train, Kenneth E. (2009). *Discrete Choice Methods with Simulation*, 2nd ed. Cambridge University Press.** The standard graduate text for RUM, logit/GEV/probit, mixed logit, simulation-assisted estimation, and the Bayesian (Allenby–Train) approach to mixed logit. (Cambridge registers chapter-level DOIs under the prefix `10.1017/cbo9780511753930`, e.g. the "Logit" chapter `10.1017/cbo9780511753930.004` and "Mixed Logit" `10.1017/cbo9780511753930.007`; there is no resolvable book-level DOI.) *Foundational.* `Chapter: choice-bayesian`
- **Rossi, Peter E.; Allenby, Greg M.; McCulloch, Robert (2005). *Bayesian Statistics and Marketing*. Wiley (Wiley Series in Probability and Statistics).** The field's defining text on Bayesian/hierarchical methods for marketing — MCMC, hierarchical logit/probit, conjoint, and the `bayesm` R package. *Foundational.* `Chapter: choice-bayesian` (cross-ref `preference-measurement`)
- **Gelman, Andrew; Carlin, John B.; Stern, Hal S.; Dunson, David B.; Vehtari, Aki; Rubin, Donald B. (2013). *Bayesian Data Analysis*, 3rd ed. Chapman & Hall/CRC.** The general-statistics reference for Bayesian modeling, MCMC, model checking, and predictive evaluation used to supplement the marketing-specific text. *Foundational.* `Chapter: choice-bayesian`

> The DOI-bearing companion review for the Rossi/Allenby program is **Rossi & Allenby (2003), "Bayesian Statistics and Marketing," *Marketing Science* 22(3):304–328, `10.1287/mksc.22.3.304.17739`** (verified; already listed in `conjoint.md`). Cite this when a DOI is required for the Bayesian-marketing framing.

---

## Module 1 — Random utility theory & the choice-modeling worldview *(Foundational)*

**Topic.** The random-utility-maximization (RUM) foundation; why marketing models choice rather than continuous demand; utility, choice probabilities, identification of scale and level.
**Subtopics.** Deterministic vs. random components; additive RUM; the logit error (Type-I extreme value); welfare and the log-sum; observable vs. latent utility; normalization (only differences and scale identified).
**Methods.** Setting up a choice probability from a utility specification; deriving logit from i.i.d. extreme-value errors.
**Readings.**
- McFadden (1974), "Conditional Logit Analysis of Qualitative Choice Behavior," in *Frontiers in Econometrics* (Academic Press), pp. 105–142 — **no Crossref DOI (book chapter); cite by chapter/volume.** The origin of the RUM-based conditional logit; the Nobel-cited founding paper. `Chapter: choice-bayesian`
- Train (2009), *Discrete Choice Methods with Simulation*, ch. 1–3 (see Foundational Books) — the textbook RUM setup and logit derivation.
- **Chintagunta & Nair (2011)** — see Module 9; assigned here as the marketing-specific overview of why and how marketing uses discrete choice.
**Debates.** Is RUM a behavioral theory or just a flexible statistical container? What is genuinely identified (and the perennial student trap of interpreting levels/scale)?

---

## Module 2 — Logit: the workhorse *(Foundational)*

**Topic.** Multinomial/conditional logit; estimation, interpretation, elasticities, and willingness-to-pay.
**Subtopics.** Likelihood and concavity (global maximum); own/cross elasticities; the log-sum/inclusive value; aggregation; the value and limits of marginal effects.
**Methods.** Maximum likelihood; Newton-type optimization; delta-method standard errors for WTP and elasticities.
**Readings.**
- Train (2009), ch. 3 "Logit" (Foundational Books) — canonical treatment.
```bibtex
@article{guadagni1983logit,
  author  = {Guadagni, Peter M. and Little, John D. C.},
  title   = {A Logit Model of Brand Choice Calibrated on Scanner Data},
  journal = {Marketing Science},
  year    = {1983},
  volume  = {2},
  number  = {3},
  pages   = {203--238},
  doi     = {10.1287/mksc.2.3.203}
}
```
The foundational marketing application of logit to scanner-panel brand choice; introduced the loyalty variable and defined empirical choice modeling in marketing for a decade. `Chapter: choice-bayesian` (cross-ref `structural-models`)
**Debates.** When is logit "good enough"? The gap between statistical fit and the implausible substitution it can imply (motivates Modules 3–5).

---

## Module 3 — IIA, GEV & nested logit *(Foundational)*

**Topic.** The independence-of-irrelevant-alternatives property, its substitution-pattern consequences, the red-bus/blue-bus problem, and the closed-form escape via generalized extreme value (GEV) / nested logit.
**Subtopics.** IIA derivation; proportional substitution; nesting structure and the dissimilarity (nesting) parameter; testing IIA.
**Methods.** Nested-logit estimation; Hausman-type specification tests.
**Readings.**
```bibtex
@article{hausman1984specification,
  author  = {Hausman, Jerry and McFadden, Daniel},
  title   = {Specification Tests for the Multinomial Logit Model},
  journal = {Econometrica},
  year    = {1984},
  volume  = {52},
  number  = {5},
  pages   = {1219--1240},
  doi     = {10.2307/1910997}
}
```
The standard test for the IIA restriction; defines how students diagnose logit's central weakness. `Chapter: choice-bayesian`
- McFadden (1978), "Modelling the Choice of Residential Location," in *Spatial Interaction Theory and Planning Models* (North-Holland) — **no Crossref DOI (book chapter)**; the GEV/nested-logit foundation. `Chapter: choice-bayesian`
- Train (2009), ch. 4 "GEV" (Foundational Books) — textbook synthesis of nested and cross-nested logit.
**Debates.** IIA as bug vs. feature; whether nesting structure is theory-driven or data-mined; nested logit as a stopgap before mixed logit/probit.

---

## Module 4 — Probit & simulation: the GHK simulator *(Foundational)*

**Topic.** Multinomial probit (MNP), full correlation in errors, the absence of a closed form, and simulation-based estimation (GHK).
**Subtopics.** Identification in MNP (covariance normalization); the GHK (Geweke–Hajivassiliou–Keane) recursive simulator; simulated maximum likelihood (SML) vs. method of simulated moments (MSM); Bayesian (Gibbs/data-augmentation) MNP as the alternative path.
**Methods.** GHK simulation; SML/MSM; Gibbs sampling with latent-utility data augmentation.
**Readings.**
```bibtex
@article{mcculloch1994exactprobit,
  author  = {McCulloch, Robert and Rossi, Peter E.},
  title   = {An exact likelihood analysis of the multinomial probit model},
  journal = {Journal of Econometrics},
  year    = {1994},
  volume  = {64},
  number  = {1-2},
  pages   = {207--240},
  doi     = {10.1016/0304-4076(94)90064-7}
}
```
The Bayesian/data-augmentation route to MNP that became the marketing standard; bridges Modules 4 and 6. `Chapter: choice-bayesian`
```bibtex
@article{geweke1994probit,
  author  = {Geweke, John and Keane, Michael P. and Runkle, David},
  title   = {Alternative Computational Approaches to Inference in the Multinomial Probit Model},
  journal = {The Review of Economics and Statistics},
  year    = {1994},
  volume  = {76},
  number  = {4},
  pages   = {609--632},
  doi     = {10.2307/2109766}
}
```
The head-to-head of GHK/SML vs. Bayesian MCMC for MNP; defines the simulation toolkit and its trade-offs. `Chapter: choice-bayesian`
- Train (2009), ch. 5 "Probit" and ch. 9 "Simulation-Assisted Estimation" (Foundational Books) — textbook GHK and SML/MSM.
**Debates.** Probit's flexible correlation vs. its identification fragility and computational cost; classical simulation vs. Bayesian data augmentation as the more reliable estimator.

---

## Module 5 — Mixed / random-coefficients logit *(Foundational → bridges to frontier)*

**Topic.** Mixed (random-parameters) logit: heterogeneous tastes integrated over a mixing distribution; the field's preferred way to relax IIA and approximate any RUM.
**Subtopics.** Random vs. fixed coefficients; mixing distributions (normal, lognormal, bounded); panel/repeated-choice mixed logit; the McFadden–Train universal-approximation result; classical (simulated ML) vs. Bayesian (Allenby–Train) estimation.
**Methods.** Simulated maximum likelihood with Halton draws; hierarchical Bayes / Gibbs–MH estimation of the mixing distribution.
**Readings.**
```bibtex
@article{mcfadden2000mixedmnl,
  author  = {McFadden, Daniel and Train, Kenneth},
  title   = {Mixed MNL models for discrete response},
  journal = {Journal of Applied Econometrics},
  year    = {2000},
  volume  = {15},
  number  = {5},
  pages   = {447--470},
  doi     = {10.1002/1099-1255(200009/10)15:5<447::aid-jae570>3.0.co;2-1}
}
```
Proves mixed logit can approximate any random-utility model arbitrarily well; the theoretical license for the whole approach. `Chapter: choice-bayesian`
```bibtex
@article{revelt1998mixedlogit,
  author  = {Revelt, David and Train, Kenneth},
  title   = {Mixed Logit with Repeated Choices: Households' Choices of Appliance Efficiency Level},
  journal = {The Review of Economics and Statistics},
  year    = {1998},
  volume  = {80},
  number  = {4},
  pages   = {647--657},
  doi     = {10.1162/003465398557735}
}
```
The canonical panel/repeated-choice mixed-logit application; template for individual-level taste recovery. `Chapter: choice-bayesian`
```bibtex
@incollection{train2005boundedmixedlogit,
  author    = {Train, Kenneth and Sonnier, Garrett},
  title     = {Mixed Logit with Bounded Distributions of Correlated Partworths},
  booktitle = {Applications of Simulation Methods in Environmental and Resource Economics},
  publisher = {Springer},
  year      = {2005},
  pages     = {117--134},
  doi       = {10.1007/1-4020-3684-1_7}
}
```
Shows how to use bounded/correlated mixing distributions so estimated partworths stay economically sensible; standard refinement for applied mixed logit and conjoint. `Chapter: choice-bayesian` (cross-ref `preference-measurement`)
- Train (2009), ch. 6 "Mixed Logit" and ch. 12 (Bayesian procedures) (Foundational Books).
**Debates.** Choice of mixing distribution (normal vs. lognormal vs. nonparametric); whether random coefficients capture *taste* heterogeneity or absorb misspecification; simulated-ML vs. Bayesian estimation.

---

## Module 6 — Bayesian foundations & MCMC: Gibbs and Metropolis–Hastings *(Foundational)*

**Topic.** The Bayesian paradigm and the two computational engines that made it practical for choice models.
**Subtopics.** Prior, likelihood, posterior; conjugacy; data augmentation (latent utilities) for choice models; the Gibbs sampler; Metropolis–Hastings; convergence diagnostics and mixing.
**Methods.** Hand-coding a Gibbs sampler; MH proposals and acceptance; assessing convergence.
**Readings.**
```bibtex
@article{gelfand1990sampling,
  author  = {Gelfand, Alan E. and Smith, Adrian F. M.},
  title   = {Sampling-Based Approaches to Calculating Marginal Densities},
  journal = {Journal of the American Statistical Association},
  year    = {1990},
  volume  = {85},
  number  = {410},
  pages   = {398--409},
  doi     = {10.1080/01621459.1990.10476213}
}
```
The paper that launched modern applied MCMC by popularizing the Gibbs sampler for marginal-density computation. `Chapter: choice-bayesian`
```bibtex
@article{casella1992gibbs,
  author  = {Casella, George and George, Edward I.},
  title   = {Explaining the Gibbs Sampler},
  journal = {The American Statistician},
  year    = {1992},
  volume  = {46},
  number  = {3},
  pages   = {167--174},
  doi     = {10.1080/00031305.1992.10475878}
}
```
The pedagogically standard, intuition-first introduction to Gibbs sampling. `Chapter: choice-bayesian`
```bibtex
@article{chib1995metropolis,
  author  = {Chib, Siddhartha and Greenberg, Edward},
  title   = {Understanding the Metropolis-Hastings Algorithm},
  journal = {The American Statistician},
  year    = {1995},
  volume  = {49},
  number  = {4},
  pages   = {327--335},
  doi     = {10.1080/00031305.1995.10476177}
}
```
The companion intuition-first treatment of Metropolis–Hastings; together with Casella–George it is the canonical "learn MCMC" pair. `Chapter: choice-bayesian`
- Gelman et al. (2013), *Bayesian Data Analysis* (Foundational Books) — the reference text for the underlying theory.
**Debates.** Subjective vs. objective priors; how much prior matters in hierarchical models; diagnosing convergence honestly (autocorrelation, multiple chains).

---

## Module 7 — Hierarchical Bayes for heterogeneity *(Foundational — the heart of the course)*

**Topic.** Hierarchical (multilevel) Bayesian models of consumer heterogeneity; shrinkage; individual-level posteriors for targeting.
**Subtopics.** The hierarchical normal prior over individual coefficients; random-effects logit/probit; borrowing strength; the value of individual-level inference; scale-usage and related nuisance heterogeneity.
**Methods.** Two-stage Gibbs for hierarchical logit/probit; posterior summaries at the individual level.
**Readings.**
```bibtex
@article{allenby1998heterogeneity,
  author  = {Allenby, Greg M. and Rossi, Peter E.},
  title   = {Marketing models of consumer heterogeneity},
  journal = {Journal of Econometrics},
  year    = {1998},
  volume  = {89},
  number  = {1-2},
  pages   = {57--78},
  doi     = {10.1016/s0304-4076(98)00055-4}
}
```
The manifesto for hierarchical-Bayes heterogeneity in marketing; argues for individual-level inference over representative-agent models. `Chapter: choice-bayesian`
```bibtex
@article{rossi1996purchasehistory,
  author  = {Rossi, Peter E. and McCulloch, Robert E. and Allenby, Greg M.},
  title   = {The Value of Purchase History Data in Target Marketing},
  journal = {Marketing Science},
  year    = {1996},
  volume  = {15},
  number  = {4},
  pages   = {321--340},
  doi     = {10.1287/mksc.15.4.321}
}
```
The template HB application: individual-level posteriors (shrinkage toward the population) raise the value of household data for targeting. `Chapter: choice-bayesian` (cross-ref `preference-measurement`)
```bibtex
@article{allenby1995reassessing,
  author  = {Allenby, Greg M. and Lenk, Peter J.},
  title   = {Reassessing Brand Loyalty, Price Sensitivity, and Merchandising Effects on Consumer Brand Choice},
  journal = {Journal of Business \& Economic Statistics},
  year    = {1995},
  volume  = {13},
  number  = {3},
  pages   = {281--289},
  doi     = {10.1080/07350015.1995.10524602}
}
```
An early, influential hierarchical choice model showing how heterogeneity reshapes substantive conclusions about loyalty and price sensitivity. `Chapter: choice-bayesian`
```bibtex
@article{rossi2001scaleusage,
  author  = {Rossi, Peter E. and Gilula, Zvi and Allenby, Greg M.},
  title   = {Overcoming Scale Usage Heterogeneity: A Bayesian Hierarchical Approach},
  journal = {Journal of the American Statistical Association},
  year    = {2001},
  volume  = {96},
  number  = {453},
  pages   = {20--31},
  doi     = {10.1198/016214501750332668}
}
```
Shows how hierarchical Bayes cleanly removes a pervasive nuisance (respondents using rating scales differently), a model template beyond choice. `Chapter: choice-bayesian`
**Debates.** Continuous (HB) vs. discrete (latent-class/finite-mixture) heterogeneity; how much structure to put in the upper-level prior; whether individual posteriors are "real" or regularization artifacts.

---

## Module 8 — Conjoint & preference measurement *(Foundational application; frontier in design)*

**Topic.** Choice-based conjoint and preference measurement as the marketing-native application of HB choice models.
**Subtopics.** Partworth estimation via HB; reduced designs and borrowing strength; constrained/sign-restricted priors; heterogeneity-distribution choice; adaptive and efficient design (links to the `preference-measurement` set).
**Methods.** HB conjoint estimation; experimental design for choice; holdout prediction.
**Readings.**
```bibtex
@article{lenk1996hbconjoint,
  author  = {Lenk, Peter J. and DeSarbo, Wayne S. and Green, Paul E. and Young, Martin R.},
  title   = {Hierarchical Bayes Conjoint Analysis: Recovery of Partworth Heterogeneity from Reduced Experimental Designs},
  journal = {Marketing Science},
  year    = {1996},
  volume  = {15},
  number  = {2},
  pages   = {173--191},
  doi     = {10.1287/mksc.15.2.173}
}
```
Foundational HB conjoint: recovers heterogeneous partworths even when each respondent answers far fewer profiles than parameters. `Chapter: choice-bayesian` (primary in `preference-measurement`)
```bibtex
@article{allenby1995priorknowledge,
  author  = {Allenby, Greg M. and Arora, Neeraj and Ginter, James L.},
  title   = {Incorporating Prior Knowledge into the Analysis of Conjoint Studies},
  journal = {Journal of Marketing Research},
  year    = {1995},
  volume  = {32},
  number  = {2},
  pages   = {152--162},
  doi     = {10.1177/002224379503200203}
}
```
Shows how economically motivated (e.g., sign-constrained) priors improve partworth plausibility and prediction. `Chapter: choice-bayesian` (cross-ref `preference-measurement`)
```bibtex
@article{andrews2002hbvsmixture,
  author  = {Andrews, Rick L. and Ansari, Asim and Currim, Imran S.},
  title   = {Hierarchical Bayes versus Finite Mixture Conjoint Analysis Models: A Comparison of Fit, Prediction, and Partworth Recovery},
  journal = {Journal of Marketing Research},
  year    = {2002},
  volume  = {39},
  number  = {1},
  pages   = {87--98},
  doi     = {10.1509/jmkr.39.1.87.18936}
}
```
The standard HB-vs-finite-mixture comparison; ties Module 7's heterogeneity debate to a concrete conjoint application. `Chapter: choice-bayesian` (cross-ref `preference-measurement`)
- Train & Sonnier (2005) (see Module 5) — bounded/correlated partworth distributions for conjoint.
**Debates.** Continuous vs. discrete heterogeneity in conjoint; constrained vs. unconstrained partworths; whether better designs or better priors matter more for small per-respondent samples.

---

## Module 9 — Aggregate-data demand & integrating out heterogeneity *(Foundational → frontier)*

**Topic.** Random-coefficients logit demand from aggregate market shares (BLP); the Bayesian counterpart; the mechanics of integrating out heterogeneity and endogeneity.
**Subtopics.** The BLP contraction and GMM; the inversion from shares to mean utilities; instruments and price endogeneity; the Bayesian (Jiang–Manchanda–Rossi) approach; numerical reliability (MPEC).
**Methods.** GMM with the BLP contraction; MSM; Bayesian estimation from aggregate data; MPEC reformulation.
**Readings.**
```bibtex
@article{berry1994discretechoice,
  author  = {Berry, Steven T.},
  title   = {Estimating Discrete-Choice Models of Product Differentiation},
  journal = {The RAND Journal of Economics},
  year    = {1994},
  volume  = {25},
  number  = {2},
  pages   = {242--262},
  doi     = {10.2307/2555829}
}
```
Introduces the share-inversion that lets discrete-choice demand be estimated from aggregate data with endogenous prices. `Chapter: choice-bayesian` (cross-ref `structural-models`)
```bibtex
@article{berry1995automobile,
  author  = {Berry, Steven and Levinsohn, James and Pakes, Ariel},
  title   = {Automobile Prices in Market Equilibrium},
  journal = {Econometrica},
  year    = {1995},
  volume  = {63},
  number  = {4},
  pages   = {841--890},
  doi     = {10.2307/2171802}
}
```
The canonical BLP random-coefficients aggregate-demand model; the reference point for all market-share choice estimation. `Chapter: choice-bayesian` (cross-ref `structural-models`)
```bibtex
@article{jiang2009bayesianblp,
  author  = {Jiang, Renna and Manchanda, Puneet and Rossi, Peter E.},
  title   = {Bayesian analysis of random coefficient logit models using aggregate data},
  journal = {Journal of Econometrics},
  year    = {2009},
  volume  = {149},
  number  = {2},
  pages   = {136--148},
  doi     = {10.1016/j.jeconom.2008.12.010}
}
```
The Bayesian counterpart to BLP; shows how MCMC integrates out heterogeneity from aggregate shares, the natural bridge from this seminar's Bayesian core to demand estimation. `Chapter: choice-bayesian`
```bibtex
@article{chintagunta2011discretechoice,
  author  = {Chintagunta, Pradeep K. and Nair, Harikesh S.},
  title   = {Discrete-Choice Models of Consumer Demand in Marketing},
  journal = {Marketing Science},
  year    = {2011},
  volume  = {30},
  number  = {6},
  pages   = {977--996},
  doi     = {10.1287/mksc.1110.0674}
}
```
The marketing-specific synthesis of the whole discrete-choice demand toolkit; the natural anchor/overview citation. `Chapter: choice-bayesian` (cross-ref `structural-models`)
```bibtex
@article{petrin2002minivan,
  author  = {Petrin, Amil},
  title   = {Quantifying the Benefits of New Products: The Case of the Minivan},
  journal = {Journal of Political Economy},
  year    = {2002},
  volume  = {110},
  number  = {4},
  pages   = {705--729},
  doi     = {10.1086/340779}
}
```
Shows how BLP-style demand plus micro-moments yields welfare/counterfactual answers; a model application of the aggregate-choice machinery. `Chapter: choice-bayesian` (cross-ref `structural-models`)
**Debates.** GMM/BLP vs. Bayesian estimation of the same model; instrument validity and weak instruments; numerical fragility of the nested contraction (and MPEC as the fix — see Dubé–Fox–Su `10.3982/ecta8585` in `schools/chicago.md`).

---

## Module 10 — Dynamics & state dependence *(Foundational → frontier)*

**Topic.** Dynamic choice: Bayesian learning, structural state dependence, and the central identification problem of distinguishing genuine persistence from unobserved heterogeneity.
**Subtopics.** Forward-looking vs. myopic consumers; Bayesian learning about brand attributes; habit/inertia/loyalty; the heterogeneity-vs-state-dependence confound; initial-conditions problem.
**Methods.** Dynamic structural estimation; hierarchical Bayes with autocorrelated/lagged terms; careful identification design.
**Readings.**
```bibtex
@article{erdem1996learning,
  author  = {Erdem, T\"ulin and Keane, Michael P.},
  title   = {Decision-Making Under Uncertainty: Capturing Dynamic Brand Choice Processes in Turbulent Consumer Goods Markets},
  journal = {Marketing Science},
  year    = {1996},
  volume  = {15},
  number  = {1},
  pages   = {1--20},
  doi     = {10.1287/mksc.15.1.1}
}
```
The founding consumer-learning choice model: forward-looking Bayesian consumers learning brand quality from experience and advertising. `Chapter: choice-bayesian` (cross-ref `structural-models`)
```bibtex
@article{keane1997statedependence,
  author  = {Keane, Michael P.},
  title   = {Modeling Heterogeneity and State Dependence in Consumer Choice Behavior},
  journal = {Journal of Business \& Economic Statistics},
  year    = {1997},
  volume  = {15},
  number  = {3},
  pages   = {310--327},
  doi     = {10.1080/07350015.1997.10524709}
}
```
The methodological statement of the heterogeneity-vs-state-dependence identification problem; required reading for the debate. `Chapter: choice-bayesian`
- **Dubé, Hitsch & Rossi (2010), "State Dependence and Alternative Explanations for Consumer Inertia," *RAND J. Econ.* 41(3):417–445, `10.1111/j.1756-2171.2010.00106.x`** (verified; in `schools/chicago.md`) — the modern resolution isolating genuine state dependence from persistent heterogeneity. `Chapter: choice-bayesian` (cross-ref `structural-models`)
**Debates.** Structural state dependence vs. spurious persistence from heterogeneity; forward-looking vs. reduced-form dynamics; how much the initial-conditions assumption drives results.

---

## Module 11 — Model comparison: Bayes factors, DIC, WAIC, cross-validation *(Foundational)*

**Topic.** Comparing and checking Bayesian choice models.
**Subtopics.** Marginal likelihood and Bayes factors; sensitivity to priors (Lindley/Bartlett paradox); DIC and effective number of parameters; WAIC; leave-one-out cross-validation (PSIS-LOO); posterior predictive checks.
**Methods.** Computing marginal likelihoods (Chib's method); DIC/WAIC; LOO; posterior predictive checking.
**Readings.**
```bibtex
@article{kass1995bayesfactors,
  author  = {Kass, Robert E. and Raftery, Adrian E.},
  title   = {Bayes Factors},
  journal = {Journal of the American Statistical Association},
  year    = {1995},
  volume  = {90},
  number  = {430},
  pages   = {773--795},
  doi     = {10.1080/01621459.1995.10476572}
}
```
The definitive treatment of Bayes factors for model comparison; sets up the marginal-likelihood approach and its prior sensitivity. `Chapter: choice-bayesian`
```bibtex
@article{spiegelhalter2002dic,
  author  = {Spiegelhalter, David J. and Best, Nicola G. and Carlin, Bradley P. and van der Linde, Angelika},
  title   = {Bayesian Measures of Model Complexity and Fit},
  journal = {Journal of the Royal Statistical Society Series B: Statistical Methodology},
  year    = {2002},
  volume  = {64},
  number  = {4},
  pages   = {583--639},
  doi     = {10.1111/1467-9868.00353}
}
```
Introduces DIC and the effective number of parameters; the most-used hierarchical-model comparison criterion in applied marketing. `Chapter: choice-bayesian`
```bibtex
@article{gelman2014predictiveic,
  author  = {Gelman, Andrew and Hwang, Jessica and Vehtari, Aki},
  title   = {Understanding predictive information criteria for Bayesian models},
  journal = {Statistics and Computing},
  year    = {2014},
  volume  = {24},
  number  = {6},
  pages   = {997--1016},
  doi     = {10.1007/s11222-013-9416-2}
}
```
Unifies AIC/DIC/WAIC and predictive evaluation; the modern conceptual map for choosing a criterion. `Chapter: choice-bayesian`
```bibtex
@article{vehtari2017loo,
  author  = {Vehtari, Aki and Gelman, Andrew and Gabry, Jonah},
  title   = {Practical Bayesian model evaluation using leave-one-out cross-validation and WAIC},
  journal = {Statistics and Computing},
  year    = {2017},
  volume  = {27},
  number  = {5},
  pages   = {1413--1432},
  doi     = {10.1007/s11222-016-9696-4}
}
```
The current practical standard (PSIS-LOO + WAIC) with the `loo` package; what students should actually run today. `Chapter: choice-bayesian`
**Debates.** Bayes factors (and prior sensitivity) vs. predictive criteria (WAIC/LOO); DIC's known pathologies; in-sample fit vs. holdout prediction as the right target for marketing models.

---

## Module 12 — Hamiltonian Monte Carlo & Stan *(Frontier, now standard)*

**Topic.** Gradient-based MCMC and probabilistic programming as the modern default engine.
**Subtopics.** Why random-walk MH/Gibbs mix poorly in high dimensions; Hamiltonian dynamics; the No-U-Turn Sampler (NUTS); non-centered parameterization for hierarchical models; the Stan ecosystem.
**Methods.** Coding a hierarchical choice model in Stan; HMC/NUTS diagnostics (divergences, energy, R-hat, effective sample size); reparameterization.
**Readings.**
```bibtex
@article{carpenter2017stan,
  author  = {Carpenter, Bob and Gelman, Andrew and Hoffman, Matthew D. and Lee, Daniel and Goodrich, Ben and Betancourt, Michael and Brubaker, Marcus A. and Guo, Jiqiang and Li, Peter and Riddell, Allen},
  title   = {Stan: A Probabilistic Programming Language},
  journal = {Journal of Statistical Software},
  year    = {2017},
  volume  = {76},
  number  = {1},
  pages   = {1--32},
  doi     = {10.18637/jss.v076.i01}
}
```
The reference for Stan; the tool most students will use to fit hierarchical choice models going forward. `Chapter: choice-bayesian`
- Hoffman & Gelman (2014), "The No-U-Turn Sampler: Adaptively Setting Path Lengths in Hamiltonian Monte Carlo," *Journal of Machine Learning Research* 15:1593–1623 — **JMLR; no Crossref DOI (cite by volume/pages).** The NUTS algorithm underlying Stan's sampler. `Chapter: choice-bayesian`
- Gelman et al. (2013), *Bayesian Data Analysis*, HMC chapter (Foundational Books) — textbook treatment.
**Debates.** HMC/NUTS vs. problem-specific Gibbs samplers (speed vs. generality); when divergences signal a real modeling problem vs. a tuning problem; the centered/non-centered parameterization trade-off in hierarchical models.

---

## Module 13 — Scalable & variational methods *(Frontier)*

**Topic.** Approximate Bayesian inference for large, high-dimensional, sparse marketing data.
**Subtopics.** Mean-field and structured variational inference; the ELBO; automatic differentiation variational inference (ADVI); stochastic/streaming variants; accuracy-vs-speed trade-offs; where VI fails for choice models.
**Methods.** Variational inference; ADVI in Stan/PyMC; diagnostics for approximate posteriors.
**Readings.**
```bibtex
@article{blei2017variational,
  author  = {Blei, David M. and Kucukelbir, Alp and McAuliffe, Jon D.},
  title   = {Variational Inference: A Review for Statisticians},
  journal = {Journal of the American Statistical Association},
  year    = {2017},
  volume  = {112},
  number  = {518},
  pages   = {859--877},
  doi     = {10.1080/01621459.2017.1285773}
}
```
The standard statistician-facing introduction to variational inference; the conceptual anchor for the scalable-methods module. `Chapter: choice-bayesian`
```bibtex
@article{ansari2003ecustomization,
  author  = {Ansari, Asim and Mela, Carl F.},
  title   = {E-Customization},
  journal = {Journal of Marketing Research},
  year    = {2003},
  volume  = {40},
  number  = {2},
  pages   = {131--145},
  doi     = {10.1509/jmkr.40.2.131.19224}
}
```
A marketing exemplar of high-dimensional Bayesian modeling for personalization at scale; motivates why scalable inference matters for marketing. `Chapter: choice-bayesian`
```bibtex
@article{yang2003interdependent,
  author  = {Yang, Sha and Allenby, Greg M.},
  title   = {Modeling Interdependent Consumer Preferences},
  journal = {Journal of Marketing Research},
  year    = {2003},
  volume  = {40},
  number  = {3},
  pages   = {282--294},
  doi     = {10.1509/jmkr.40.3.282.19240}
}
```
A Bayesian spatial-autoregressive choice model — shows how richer dependence structures (and the computation they demand) extend the hierarchical-choice toolkit. `Chapter: choice-bayesian`
- Carpenter et al. (2017) (Module 12) — Stan also implements ADVI, the bridge from HMC to VI.
**Debates.** Variational approximation bias vs. MCMC accuracy; whether VI's posterior uncertainties can be trusted for inference (vs. only point prediction); the encroachment of ML/deep methods on Bayesian choice modeling.

---

## Module 14 — Synthesis, frontier & research design *(Frontier / craft)*

**Topic.** Pulling the threads together; designing a choice-modeling research paper; the open frontier.
**Subtopics.** Matching estimator to question (closed-form vs. simulation vs. MCMC vs. VI); identification storytelling; replication and reproducibility (`bayesm`, Stan, `loo`); current frontiers — ML/Bayesian hybrids, text/image as choice covariates, privacy-constrained estimation, scalable personalization.
**Methods.** Referee report; replication-or-extension project presentation.
**Readings.** Student-selected frontier papers + the field syntheses already assigned: Allenby & Rossi (1998), Chintagunta & Nair (2011), and the Bayesian-marketing review **Rossi & Allenby (2003), *Marketing Science*, `10.1287/mksc.22.3.304.17739`** (verified). `Chapter: choice-bayesian`
**Debates.** The whole-course tension: structural/behavioral interpretability vs. predictive flexibility; Bayesian vs. classical estimation of identical models; how much marketing's choice-modeling tradition will be absorbed into machine learning.

---

## Foundational vs. frontier — at a glance

| Module | Status |
|---|---|
| 1 RUM theory | Foundational |
| 2 Logit | Foundational |
| 3 IIA / GEV / nested | Foundational |
| 4 Probit & GHK simulation | Foundational |
| 5 Mixed / random-coefficients logit | Foundational (bridges to frontier) |
| 6 Bayesian foundations & MCMC | Foundational |
| 7 Hierarchical Bayes for heterogeneity | Foundational (course core) |
| 8 Conjoint / preference measurement | Foundational application; design is frontier |
| 9 Aggregate demand / integrating out heterogeneity | Foundational → frontier |
| 10 Dynamics & state dependence | Foundational → frontier |
| 11 Model comparison (Bayes factors / DIC / WAIC / LOO) | Foundational (LOO/WAIC are the modern frontier) |
| 12 HMC / Stan | Frontier, now standard |
| 13 Scalable & variational methods | Frontier |
| 14 Synthesis & research frontier | Frontier / craft |

The first 11 modules are the durable canon a chapter must cover; Modules 12–14 are where the chapter will date fastest and need the most active maintenance.

---

## How this chapter should expand over time

1. **Keep the spine fixed, refresh the engine.** Modules 1–11 (RUM → logit/GEV/probit → mixed logit → Bayesian/MCMC → HB → conjoint → aggregate demand → dynamics → model comparison) are stable for a generation and should remain the backbone. The *computation* modules (12–13) will turn over fastest; budget for revising them every edition as Stan, PyMC, JAX-based samplers, and normalizing-flow / amortized VI mature.
2. **Promote model comparison from afterthought to spine.** WAIC/PSIS-LOO (Module 11) have already displaced DIC/Bayes factors in practice; future editions should foreground predictive evaluation and posterior predictive checking rather than treating them as a single late week.
3. **Add a dedicated "ML × Bayesian choice" frontier module.** As deep generative models, embeddings, and amortized inference enter choice modeling, Module 13 will likely split into (a) classical scalable Bayes (VI) and (b) neural/ML-hybrid choice models. Watch for verified, DOI-bearing papers (e.g., deep choice / neural mixed logit, Bayesian neural demand) before promoting them out of UNVERIFIED.
4. **Grow the unstructured-data covariate strand.** Text, image, audio, and video as inputs to choice (the `Chapter: data` and special-topics strands in `seminar-inventory.md`) increasingly fuse with this seminar; a future module can connect representation learning to RUM covariates.
5. **Track the privacy/identification frontier.** Privacy-constrained and aggregated-data estimation (deprecation of individual tracking) pushes the field back toward aggregate-demand methods (Module 9) and differential-privacy-aware Bayes; this is a natural growth area.
6. **Maintain the cross-references.** This chapter shares readings with `preference-measurement` (conjoint) and `structural-models` (BLP, dynamics, MPEC). As those chapters grow, keep the shared entries synchronized rather than duplicated, and re-verify DOIs each edition.

---

## Sources consulted

**Method note repeated:** the program pages below could **not** be loaded in this environment and are provided as **verification pointers for a human editor**, not as the source of any course number or quotation. The module structure reflects established field knowledge of how the choice-modeling/Bayesian seminar is taught across these programs; all readings were verified independently via Crossref.

- Reading verification: **Crossref REST API** — `https://api.crossref.org/works` (polite pool, `&mailto=`), queried 2026-06-21.
- Ohio State University, Fisher College of Business — Marketing PhD (Allenby; the leading HB/Bayesian-marketing program): `https://fisher.osu.edu/departments/marketing` and `https://fisher.osu.edu/programs/phd`
- University of Chicago, Booth School of Business — Marketing PhD (Rossi/Bayesian; Chintagunta/structural): `https://www.chicagobooth.edu/doctoral/academic-experience/areas-of-study/marketing`
- The Wharton School, University of Pennsylvania — Marketing PhD: `https://marketing.wharton.upenn.edu/programs/phd/`
- Columbia Business School — Marketing PhD (Ansari/Bayesian): `https://business.columbia.edu/phd/academics/marketing`
- University of Michigan, Ross School of Business — Marketing PhD (Manchanda/structural; Feinberg/Bayesian): `https://michiganross.umich.edu/programs/phd/academics/marketing`
- University of Rochester, Simon Business School — Marketing PhD (quantitative tradition): `https://simon.rochester.edu/programs/phd/academics/areas-study/marketing`
- New York University, Stern School of Business — Marketing PhD: `https://www.stern.nyu.edu/programs-admissions/phd/academics/marketing`
- Duke University, Fuqua School of Business — Marketing PhD: `https://www.fuqua.duke.edu/programs/daytime-mba/phd/marketing`
- Internal cross-references in this repo: `.editorial/research/conjoint.md` (HB conjoint set), `.editorial/research/schools/chicago.md` (BLP/MPEC, state dependence), `.editorial/research/schools/michigan.md`, `.editorial/research/seminar-inventory.md` (track taxonomy and the web-access caveat).

---

## UNVERIFIED — do not cite

The following were sought for this seminar but **could not be matched to a published version-of-record with a resolvable DOI in Crossref** during this pass. Do not cite until verified.

- **McFadden (1974), "Conditional Logit Analysis of Qualitative Choice Behavior."** Book chapter in *Frontiers in Econometrics* (ed. Zarembka), Academic Press, pp. 105–142. No Crossref DOI located (pre-DOI book chapter); cite by chapter/volume, not a DOI.
- **McFadden (1978), "Modelling the Choice of Residential Location."** Book chapter in *Spatial Interaction Theory and Planning Models* (North-Holland), the GEV/nested-logit foundation. No Crossref DOI located; cite by chapter/volume.
- **Hoffman & Gelman (2014), "The No-U-Turn Sampler," *Journal of Machine Learning Research* 15:1593–1623.** JMLR does not register Crossref DOIs; the citation (volume/pages) is correct and stable but there is no DOI to verify. Cite by volume/pages.
- **Watanabe (2010/2013), WAIC / WBIC papers (JMLR).** The original WAIC source is JMLR (no DOI). Use the DOI-bearing secondary references instead: Gelman, Hwang & Vehtari (2014, `10.1007/s11222-013-9416-2`) and Vehtari, Gelman & Gabry (2017, `10.1007/s11222-016-9696-4`), both verified in Module 11.
- **Rossi, Allenby & McCulloch (2005), *Bayesian Statistics and Marketing* (Wiley).** Listed under Foundational Books with verified publisher/year. A candidate book-level DOI (`10.1002/0470863692`) returned **HTTP 404** on direct Crossref resolution and is therefore **not asserted**; cite the book by publisher/year, and use the *Marketing Science* 2003 review (`10.1287/mksc.22.3.304.17739`, verified) when a DOI is required.
- **Train (2009), *Discrete Choice Methods with Simulation* (Cambridge), book-level DOI.** Crossref returns chapter-level DOIs under prefix `10.1017/cbo9780511753930` but **no resolvable book-level DOI** (the candidate `10.1017/CBO9780511805271` returned HTTP 404). Cite the book by publisher/year; cite specific chapters by their chapter DOIs only if individually verified.

### Verification log (representative queries)

All journal/proceedings entries verified via `https://api.crossref.org/works?query.bibliographic=<terms>&rows=N&mailto=...` on 2026-06-21, cross-checking DOI, author list, year, container-title, volume/issue, and pages against returned version-of-record metadata. Where SSRN/NBER/preprint DOIs co-existed (e.g., BLP `10.3386/w4264` vs. Econometrica `10.2307/2171802`; Berry 1994 vs. RAND `10.2307/2555829`; Jiang–Manchanda–Rossi SSRN vs. *J. Econometrics* `10.1016/j.jeconom.2008.12.010`), the published version-of-record DOI was selected. Book-level DOIs for Train (2009) and Rossi/Allenby/McCulloch (2005) were tested by direct resolution and **failed (404)**, so those books are cited by publisher/year only.
