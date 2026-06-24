# Advances in Construct Conceptualization and Measurement

**Research brief for the construct-vs-variable keystone chapter (02) and the measurement chapters (30, 32).**

Scope: a citation-verified, demonstrable map of advances spanning social-science psychometrics and marketing, organized so each advance can be turned into runnable R code. Every DOI in the **Verified DOI Ledger** at the bottom was checked against the Crossref REST API (`api.crossref.org/works/<DOI>`) on 2026-06-23 and the returned title/authors/year/venue matched. Classic monographs that genuinely have no DOI are flagged explicitly with publisher and year rather than given a fabricated identifier.

A note on DOIs that *moved*: a couple of "obvious" DOIs in circulation are wrong. The widely-pasted `10.1177/0049124192021002005` resolves to Browne & Cudeck (1992), **not** Gerbing & Anderson (1988); the correct Gerbing & Anderson DOI is `10.1177/002224378802500207`. These are noted inline.

---

## 1. Construct validity foundations

**Explanation.** A *construct* is an unobservable attribute (brand attitude, satisfaction, materialism) posited to explain patterns in observable indicators; a *variable* is the observed, recorded number. Construct validity is the question of whether the variable's scores can stand in for the construct. Three waves define the field:

- **Nomological net (Cronbach & Meehl 1955).** A construct is defined by its lawful relations ("the nomological network") to other constructs and to observables. Validity accrues as the predicted web of relations is confirmed. This reframed validity from "does the test correlate with a criterion" to "does the construct behave as theory says it should."
- **Construct representation vs. theory testing (Loevinger 1957).** Argued that *all* validity is construct validity and that test construction should be driven by substantive theory, not just empirical item selection — an early statement of the "unified" view.
- **Unified validity / validity-as-argument (Messick 1995).** Six aspects (content, substantive, structural, generalizability, external, consequential); validity is a single evaluative judgment about the appropriateness of inferences, including the *consequences* of test use.
- **Ontological turn (Borsboom, Mellenbergh & van Heerden 2004).** "A test is valid for measuring an attribute if the attribute exists and variation in it causes variation in test scores." Shifts validity from an epistemic property of inferences to a causal claim about a measurement process — directly relevant to the reflective-vs-formative debate (Topic 5).

**Seminal references (DOIs verified).**
- Cronbach, L. J., & Meehl, P. E. (1955). Construct validity in psychological tests. *Psychological Bulletin*. DOI `10.1037/h0040957`.
- Loevinger, J. (1957). Objective tests as instruments of psychological theory. *Psychological Reports*. DOI `10.2466/pr0.1957.3.3.635`.
- Messick, S. (1995). Validity of psychological assessment. *American Psychologist*. DOI `10.1037/0003-066X.50.9.741`.
- Borsboom, D., Mellenbergh, G. J., & van Heerden, J. (2004). The concept of validity. *Psychological Review*. DOI `10.1037/0033-295X.111.4.1061`.

**R packages.** No single package "implements" validity theory; the nomological-net idea is operationalized via correlation/SEM tooling (`lavaan`, `psych`).

**Demo idea.** Simulate a small nomological net: a latent construct `X` with known correlations to two antecedents and two consequences. Generate data, then show that the *observed* correlations recover the theory-predicted pattern (positive with consequences, near-zero with a construct theory says is unrelated). Use it to make the construct-vs-variable distinction concrete: print the latent correlation matrix next to the observed one.

---

## 2. Reliability

**Explanation.** Reliability is the proportion of observed-score variance that is true-score (non-error) variance.

- **Cronbach's alpha (1951).** The workhorse internal-consistency coefficient. Well-known critiques: alpha is a *lower bound* on reliability only under (essential) tau-equivalence; it is neither necessary nor sufficient for unidimensionality; it rises mechanically with the number of items; and it is biased when item loadings differ (Revelle & Zinbarg 2009; Sijtsma's "glb" critique).
- **McDonald's omega (omega-total, omega-hierarchical).** Model-based reliability from a factor solution; does not assume tau-equivalence and, in the bifactor form, separates general-factor reliability (omega_h) from total reliability (omega_t). Revelle & Zinbarg (2009) is the canonical "use omega, not alpha" statement.
- **Composite reliability (CR) & Average Variance Extracted (AVE) (Fornell & Larcker 1981).** The SEM/marketing-standard reliability and convergent-validity indices computed from CFA loadings; AVE > .50 and AVE > squared inter-construct correlation (the Fornell-Larcker discriminant criterion) are the canonical thresholds.
- **Generalizability theory (Cronbach, Gleser, Nanda & Rajaratnam 1972).** Decomposes error into multiple facets (raters, items, occasions) via random-effects ANOVA, yielding a generalizability coefficient and decision (D) studies. The natural extension of classical test theory to multifaceted measurement.

**Seminal references.**
- Cronbach, L. J. (1951). Coefficient alpha and the internal structure of tests. *Psychometrika*. DOI `10.1007/BF02310555`.
- Revelle, W., & Zinbarg, R. E. (2009). Coefficients alpha, beta, omega, and the glb: Comments on Sijtsma. *Psychometrika*. DOI `10.1007/s11336-008-9102-z`.
- Fornell, C., & Larcker, D. F. (1981). Evaluating structural equation models with unobservable variables and measurement error. *Journal of Marketing Research*. DOI `10.2307/3151312`.
- **Cronbach, L. J., Gleser, G. C., Nanda, H., & Rajaratnam, N. (1972). *The Dependability of Behavioral Measurements: Theory of Generalizability for Scores and Profiles.* New York: Wiley. — MONOGRAPH, NO DOI (flagged).**

**R packages.** `psych` (`alpha`, `omega`); `semTools` (`reliability()`/`compRelSEM()` for CR/omega, AVE); `MBESS` (`ci.reliability` for alpha/omega CIs, CRAN DOI `10.32614/cran.package.mbess`; primary methods paper Kelley & Lai, see ledger); generalizability theory via `gtheory` or `lme4` random-effects variance components.

**Demo idea.** Simulate a unidimensional set of items with *unequal* loadings (violating tau-equivalence). Show alpha *underestimates* reliability relative to omega_total computed from the true factor model — quantify the gap. Then add a small second factor and show omega_hierarchical drops while alpha barely moves, illustrating why alpha "doesn't see" multidimensionality.

---

## 3. Dimensionality / factor analysis

**Explanation.** Determining how many latent dimensions underlie a set of items, and whether the hypothesized structure holds.

- **EFA vs CFA.** EFA is exploratory (no fixed loading pattern); CFA tests an a-priori structure. Fabrigar et al. (1999) is the standard "how to do EFA properly" reference (extraction method, rotation, factor-number decisions).
- **Number of factors.** Kaiser's eigenvalue>1 and scree are superseded by **Horn's parallel analysis (1965)** — compare observed eigenvalues to those from random data of the same size — and Velicer's MAP. Parallel analysis is the current default recommendation.
- **Two-step approach (Anderson & Gerbing 1988).** Establish a satisfactory measurement model (CFA) *before* estimating the structural model, so that structural misfit is not confounded with measurement misfit. Gerbing & Anderson (1988) complements this with a unidimensionality-focused scale-development paradigm.

**Seminal references.**
- Fabrigar, L. R., Wegener, D. T., MacCallum, R. C., & Strahan, E. J. (1999). Evaluating the use of exploratory factor analysis in psychological research. *Psychological Methods*. DOI `10.1037/1082-989X.4.3.272`.
- Horn, J. L. (1965). A rationale and test for the number of factors in factor analysis. *Psychometrika*. DOI `10.1007/BF02289447`.
- Anderson, J. C., & Gerbing, D. W. (1988). Structural equation modeling in practice: A review and recommended two-step approach. *Psychological Bulletin*. DOI `10.1037/0033-2909.103.3.411`.
- Gerbing, D. W., & Anderson, J. C. (1988). An updated paradigm for scale development incorporating unidimensionality and its assessment. *Journal of Marketing Research*. DOI `10.1177/002224378802500207`. *(Note: the often-cited `10.1177/0049124192021002005` is wrong — it is Browne & Cudeck 1992.)*

**R packages.** `psych` (`fa`, `fa.parallel`, `vss`, `nfactors`); `lavaan` (`cfa`); `EFAtools` for modern parallel-analysis variants.

**Demo idea.** Simulate data from a known 2-factor model. Run `fa.parallel` and show it recovers 2 factors while eigenvalue>1 over-extracts. Then fit a *correct* 2-factor CFA and a *misspecified* 1-factor CFA in `lavaan`; contrast fit indices to show how CFA detects the wrong dimensionality that EFA's naive rules miss.

---

## 4. Structural Equation Modeling (SEM)

**Explanation.** SEM unifies measurement (CFA) and structural (path) models with latent variables, estimating both simultaneously while accounting for measurement error. Key threads:

- **Foundational text (Bollen 1989).** The standard reference for the LISREL-style covariance-structure framework.
- **Evaluation practice in marketing (Bagozzi & Yi 1988; 2012).** The two most-cited marketing guides to specifying, estimating, and *reporting* SEM — fit, construct reliability, what reviewers expect.
- **Fit indices (Hu & Bentler 1999).** The source of the now-ubiquitous (and frequently over-applied) cutoffs: CFI/TLI >= .95, RMSEA <= .06, SRMR <= .08. The paper itself warns against mechanical use; the chapter should reproduce that caution.

**Seminal references.**
- **Bollen, K. A. (1989). *Structural Equations with Latent Variables.* New York: Wiley. — MONOGRAPH, NO DOI (flagged). The book has no Crossref DOI; cite as Wiley, 1989, ISBN 978-0-471-01171-2.**
- Bagozzi, R. P., & Yi, Y. (1988). On the evaluation of structural equation models. *Journal of the Academy of Marketing Science*. DOI `10.1007/BF02723327`.
- Bagozzi, R. P., & Yi, Y. (2012). Specification, evaluation, and interpretation of structural equation models. *Journal of the Academy of Marketing Science*. DOI `10.1007/s11747-011-0278-x`.
- Hu, L., & Bentler, P. M. (1999). Cutoff criteria for fit indexes in covariance structure analysis. *Structural Equation Modeling*. DOI `10.1080/10705519909540118`.

**R packages.** `lavaan` (Rosseel 2012, JSS, DOI `10.18637/jss.v048.i02`) is the standard; `semTools` for add-ons; `lavaanPlot`/`semPlot` for diagrams.

**Demo idea.** Simulate a full latent model (two latent predictors -> one latent outcome) with `lavaan::simulateData()` from a known population model. Fit the correct model, print the fit indices against Hu-Bentler cutoffs, then introduce a deliberately omitted cross-loading and show RMSEA/CFI degrade. Emphasize that "passing" cutoffs is necessary, not sufficient.

---

## 5. Reflective vs formative measurement

**Explanation.** The single most consequential measurement-specification decision.

- **Reflective:** indicators are *effects* of the latent construct (arrows point from construct to items); items should be interchangeable and internally consistent. Classical psychometrics (alpha, AVE, CFA) assumes this.
- **Formative/composite:** indicators *cause* or compose the construct (arrows point from items to construct); items need not correlate, dropping one changes the construct's meaning. Internal-consistency logic does *not* apply.
- **Why it matters (Bollen & Lennox 1991; Jarvis, MacKenzie & Podsakoff 2003).** Mis-specifying a formative construct as reflective (or vice versa) biases structural estimates and is *common* in published marketing work — Jarvis et al. found a large fraction of constructs in top journals were mis-specified.
- **Construction & identification (Diamantopoulos & Winklhofer 2001; MacKenzie, Podsakoff & Podsakoff 2011).** How to build and validate formative indices; MACKENZIE et al. is the integrative procedural guide.
- **The ongoing debate (Bollen & Diamantopoulos 2017).** A defense of *causal-formative* indicators against critics who argue formative constructs are under-identified or theoretically incoherent.

**Seminal references.**
- Bollen, K., & Lennox, R. (1991). Conventional wisdom on measurement: A structural equation perspective. *Psychological Bulletin*. DOI `10.1037/0033-2909.110.2.305`.
- Diamantopoulos, A., & Winklhofer, H. M. (2001). Index construction with formative indicators. *Journal of Marketing Research*. DOI `10.1509/jmkr.38.2.269.18845`.
- Jarvis, C. B., MacKenzie, S. B., & Podsakoff, P. M. (2003). A critical review of construct indicators and measurement model misspecification. *Journal of Consumer Research*. DOI `10.1086/376806`.
- MacKenzie, S. B., Podsakoff, P. M., & Podsakoff, N. P. (2011). Construct measurement and validation procedures in MIS and behavioral research. *MIS Quarterly*. DOI `10.2307/23044045`.
- Bollen, K. A., & Diamantopoulos, A. (2017). In defense of causal-formative indicators: A minority report. *Psychological Methods*. DOI `10.1037/met0000056`.

**R packages.** `lavaan` (formative blocks via composites/MIMIC specification); `seminr` and `cSEM` for PLS-SEM (the default estimator for composite/formative models in marketing/IS).

**Demo idea.** Simulate the same five indicators under (a) a reflective generating model and (b) a formative generating model. Show that under reflective generation the items are highly inter-correlated (high alpha), while under formative generation they need not be — so applying alpha to a formative block is meaningless. Then fit a MIMIC model in `lavaan` (formative indicators -> latent -> reflective indicators for identification) and recover the formative weights.

---

## 6. Item Response Theory (IRT)

**Explanation.** IRT models the probability of an item response as a function of a latent trait (theta) and item parameters, rather than treating the sum score as the measure.

- **Rasch / 1PL.** One item parameter (difficulty); the only model with sufficient-statistic and specific-objectivity properties. Rasch (1960) is the origin.
- **2PL / 3PL.** Add discrimination (2PL) and guessing (3PL) parameters (Birnbaum). 2PL is the IRT analogue of a one-factor model with item-specific loadings.
- **Synthesis for non-specialists (Embretson & Reise 2000).** The standard bridge text translating IRT into psychological-measurement language; contrasts IRT with classical test theory (e.g., reliability is conditional on theta via the information function, not a single number).

**Seminal references.**
- **Rasch, G. (1960). *Probabilistic Models for Some Intelligence and Attainment Tests.* Copenhagen: Danish Institute for Educational Research. — MONOGRAPH, NO DOI (flagged). (Reissued 1980, University of Chicago Press.)**
- **Embretson, S. E., & Reise, S. P. (2000). *Item Response Theory for Psychologists.* Mahwah, NJ: Lawrence Erlbaum. — original edition has NO DOI (flagged); the 2nd ed. (2025, Routledge) chapters carry DOIs under `10.4324/9781315726557`.**
- (Birnbaum's 2PL/3PL appears as chapters in Lord & Novick 1968, *Statistical Theories of Mental Test Scores*, Addison-Wesley — MONOGRAPH, NO DOI.)

**R packages.** `mirt` (Chalmers 2012, JSS, DOI `10.18637/jss.v048.i06`) for uni/multidimensional IRT; `ltm` (Rizopoulos 2006, JSS, DOI `10.18637/jss.v017.i05`) for Rasch/2PL/3PL on dichotomous and polytomous data; `eRm` for conditional-ML Rasch.

**Demo idea.** Simulate dichotomous responses from a known 2PL model (varying difficulty and discrimination). Fit with `mirt`, recover the item parameters, and plot item characteristic curves and the test information function. Show that information (hence conditional reliability) peaks at different theta values for different items — the headline IRT insight that "reliability is not one number."

---

## 7. Measurement invariance / DIF

**Explanation.** Before comparing groups (countries, segments, time points) on a construct, one must show the measurement model means the same thing across groups — otherwise group differences are confounded with measurement artifacts.

- **Levels (Meredith 1993).** Configural (same pattern) -> metric/weak (equal loadings) -> scalar/strong (equal intercepts; required for latent-mean comparison) -> strict (equal residuals).
- **Practice & reviews (Vandenberg & Lance 2000; Putnick & Bornstein 2016).** The standard syntheses of how to test and report invariance, including the chi-square-difference vs. dCFI/dRMSEA debate for nested-model comparison.
- **Cross-national marketing (Steenkamp & Baumgartner 1998).** The canonical marketing treatment, introducing *partial* invariance (allowing a minority of non-invariant parameters) so cross-cultural comparison is not abandoned at the first failed equality constraint.
- **DIF.** The item-level analogue in the IRT tradition: an item shows differential item functioning if respondents with equal theta but different group membership have different response probabilities.

**Seminal references.**
- Meredith, W. (1993). Measurement invariance, factor analysis and factorial invariance. *Psychometrika*. DOI `10.1007/BF02294825`.
- Vandenberg, R. J., & Lance, C. E. (2000). A review and synthesis of the measurement invariance literature. *Organizational Research Methods*. DOI `10.1177/109442810031002`.
- Steenkamp, J.-B. E. M., & Baumgartner, H. (1998). Assessing measurement invariance in cross-national consumer research. *Journal of Consumer Research*. DOI `10.1086/209528`.
- Putnick, D. L., & Bornstein, M. H. (2016). Measurement invariance conventions and reporting. *Developmental Review*. DOI `10.1016/j.dr.2016.06.004`.

**R packages.** `semTools` (`measEq.syntax`, `compareFit`; the older `measurementInvariance()` is deprecated in favor of `measEq.syntax`); `lavaan` (`cfa(..., group=, group.equal=)`); `mirt`/`lordif` for IRT-based DIF.

**Demo idea.** Simulate two groups where one item's intercept differs (a "DIF" item). Fit the configural, metric, and scalar invariance models with `measEq.syntax`; show metric holds but scalar fails, and that the failure localizes (via modification indices) to the planted item. Then demonstrate *partial* scalar invariance freeing that one intercept restores comparability of latent means.

---

## 8. Common method bias (CMB)

**Explanation.** When predictor and criterion are measured with the same method (e.g., one self-report survey), shared method variance can inflate or deflate observed correlations, threatening validity.

- **Diagnosis & remedies (Podsakoff et al. 2003; 2012).** The two definitive reviews: procedural remedies (separate sources, temporal/proximal separation) and statistical remedies (Harman's single-factor test — now discouraged as too weak; unmeasured latent method factor; **CFA marker technique**).
- **Marker-variable technique (Lindell & Whitney 2001).** Use a marker variable theoretically unrelated to the substantive constructs; its smallest correlation estimates method variance, which is then partialled out — a simple, pre-registrable correction.

**Seminal references.**
- Podsakoff, P. M., MacKenzie, S. B., Lee, J.-Y., & Podsakoff, N. P. (2003). Common method biases in behavioral research. *Journal of Applied Psychology*. DOI `10.1037/0021-9010.88.5.879`.
- Podsakoff, P. M., MacKenzie, S. B., & Podsakoff, N. P. (2012). Sources of method bias in social science research and recommendations on how to control it. *Annual Review of Psychology*. DOI `10.1146/annurev-psych-120710-100452`.
- Lindell, M. K., & Whitney, D. J. (2001). Accounting for common method variance in cross-sectional research designs. *Journal of Applied Psychology*. DOI `10.1037/0021-9010.86.1.114`.

**R packages.** Base R for the simulation/correction; `lavaan` for the CFA-marker and unmeasured-latent-method-factor models; `semTools` helpers.

**Demo idea.** Simulate two constructs with a known true correlation, then add a shared method factor that inflates all observed correlations. Show (a) the naive correlation is biased upward, (b) the marker-variable correction (subtract the marker correlation, rescale) moves the estimate back toward truth, and (c) a CFA model with a latent method factor recovers the true structural correlation. Print true vs. naive vs. corrected side by side.

---

## 9. Marketing scale-development paradigm

**Explanation.** The procedural canon for building reflective multi-item scales in marketing.

- **Churchill (1979).** The founding "paradigm": domain specification -> item generation -> data collection -> purification (alpha, item-total correlations) -> reliability/validity assessment. Essentially every marketing scale paper cites it.
- **Gerbing & Anderson (1988).** Upgrades Churchill by inserting *confirmatory* unidimensionality assessment (CFA) into purification.
- **C-OAR-SE (Rossiter 2002).** A deliberately contrarian alternative — Construct definition (Object, Attribute, Rater Entity), content-validity-first, rejecting reliance on alpha and reflective assumptions; a useful foil for classroom debate.
- **Compendia (Netemeyer, Bearden & Sharma 2003; DeVellis).** The two standard book-length how-to references; sources of worked examples and item banks.

**Seminal references.**
- Churchill, G. A. (1979). A paradigm for developing better measures of marketing constructs. *Journal of Marketing Research*. DOI `10.2307/3150876`.
- Gerbing, D. W., & Anderson, J. C. (1988). An updated paradigm for scale development. *Journal of Marketing Research*. DOI `10.1177/002224378802500207`.
- Rossiter, J. R. (2002). The C-OAR-SE procedure for scale development in marketing. *International Journal of Research in Marketing*. DOI `10.1016/S0167-8116(02)00097-6`.
- **Netemeyer, R. G., Bearden, W. O., & Sharma, S. (2003). *Scaling Procedures: Issues and Applications.* Thousand Oaks: Sage. — MONOGRAPH, NO DOI (flagged).**
- **DeVellis, R. F. (latest ed. with Thorpe). *Scale Development: Theory and Applications.* Sage. — MONOGRAPH, NO DOI (flagged); cite the specific edition/year used.**

**R packages.** `psych` (item analysis, EFA, alpha/omega); `lavaan` (CFA purification); `careless` for screening inattentive responding during purification.

**Demo idea.** Walk Churchill's loop on simulated data end to end in <30 lines: generate a 6-item pool where 2 items load weakly, compute item-total correlations and alpha, drop the weak items, re-estimate alpha, and confirm unidimensionality with a one-factor CFA. The "before/after" alpha and CFI make the purification step tangible.

---

## 10. Measurement error & attenuation

**Explanation.** Random measurement error in observed variables biases statistics — most famously, it *attenuates* (shrinks toward zero) observed correlations relative to true-score correlations.

- **Spearman attenuation (1904).** r_observed = r_true * sqrt(rel_X * rel_Y); the disattenuation formula divides out the square roots of the reliabilities to estimate the true-score correlation.
- **Errors-in-variables / regression.** In regression, predictor measurement error biases the slope toward zero ("regression dilution"); SEM with latent variables is the structural fix.
- **SIMEX (Cook & Stefanski 1994).** Simulation-extrapolation: add increasing known error, observe how the estimate degrades, and extrapolate back to the zero-error case — a general, simulation-based correction usable when a full latent-variable model is impractical.

**Seminal references.**
- Spearman, C. (1904). The proof and measurement of association between two things. *The American Journal of Psychology*. DOI `10.2307/1412159`.
- Cook, J. R., & Stefanski, L. A. (1994). Simulation-extrapolation estimation in parametric measurement error models. *Journal of the American Statistical Association*. DOI `10.1080/01621459.1994.10476871`.

**R packages.** `psych` (`correct.cor` for disattenuation); `simex` (CRAN DOI `10.32614/cran.package.simex`; intro: Lederer & Kuchenhoff 2006, *R News* 6(4)) for SIMEX correction in GLMs; `lavaan` as the latent-variable alternative.

**Demo idea.** Simulate a true score `T` and an outcome with a known true correlation. Add Gaussian noise of varying reliability to make observed `X`. Show the observed correlation shrinks as reliability drops, then apply the Spearman disattenuation formula and recover the true correlation. Optional second panel: fit `simex` to a regression and show the slope correction.

---

## 11. Modern / computational measurement

**Explanation.** Four contemporary frontiers the chapter should at least gesture at:

- **Bifactor models (Reise 2012).** A general factor plus orthogonal group factors; lets one quantify how "essentially unidimensional" a multidimensional scale is (via omega_h and the explained-common-variance ECV statistic) — the modern answer to "can I sum these items?"
- **Network psychometrics (Borsboom & Cramer 2013; Epskamp et al.).** Reconceptualizes constructs not as latent causes but as *systems of mutually reinforcing observables* (e.g., symptoms that activate each other). Estimation via regularized partial-correlation networks; stability assessed by bootstrapping.
- **Bayesian measurement (Merkle & Rosseel 2018).** `blavaan` fits CFA/SEM in a Bayesian framework — priors on loadings, full posterior for every parameter, principled small-sample inference, and Bayesian fit (PPP, DIC/WAIC).
- **ML / text-based construct measurement & computational construct validity.** Using embeddings/LLMs to score open-ended text (e.g., brand sentiment, construct presence) and the emerging literature on validating such automated measures against human-rated gold standards — directly relevant to the book's multimodal-data chapter.

**Seminal references.**
- Reise, S. P. (2012). The rediscovery of bifactor measurement models. *Multivariate Behavioral Research*. DOI `10.1080/00273171.2012.715555`.
- Borsboom, D., & Cramer, A. O. J. (2013). Network analysis: An integrative approach to the structure of psychopathology. *Annual Review of Clinical Psychology*. DOI `10.1146/annurev-clinpsy-050212-185608`.
- Epskamp, S., Cramer, A. O. J., Waldorp, L. J., Schmittmann, V. D., & Borsboom, D. (2012). qgraph: Network visualizations of relationships in psychometric data. *Journal of Statistical Software*. DOI `10.18637/jss.v048.i04`.
- Epskamp, S., Borsboom, D., & Fried, E. I. (2018). Estimating psychological networks and their accuracy: A tutorial paper. *Behavior Research Methods*. DOI `10.3758/s13428-017-0862-1`.
- Merkle, E. C., & Rosseel, Y. (2018). blavaan: Bayesian structural equation models via parameter expansion. *Journal of Statistical Software*. DOI `10.18637/jss.v085.i04`.

**R packages.** `psych`/`lavaan` (bifactor via `omega`/`bifactor()` and `lavaan` syntax); `qgraph` + `bootnet` (+ `IsingFit`, `mgm`) for networks; `blavaan` for Bayesian SEM; `text`/`reticulate`-bridged transformer pipelines for text-based measurement.

**Demo idea.** (a) Bifactor: simulate a general + 2 group factors, fit `psych::omega`, and report omega_h and ECV to argue a total score is interpretable. (b) Network: simulate from a known sparse partial-correlation structure, estimate with `bootnet::estimateNetwork(..., default="EBICglasso")`, plot with `qgraph`, and bootstrap edge stability — show the network recovers the planted edges. (c) Bayesian: refit a small CFA from Topic 4 in `blavaan` and compare the posterior loading credible intervals to the frequentist SEs.

---

## Verified DOI Ledger

All entries below returned `status: ok` from `https://api.crossref.org/works/<DOI>` on 2026-06-23 with matching title/authors/year/venue.

| # | Citation (short) | DOI | Venue | Year |
|---|---|---|---|---|
| 1 | Cronbach & Meehl, Construct validity | `10.1037/h0040957` | Psychological Bulletin | 1955 |
| 2 | Loevinger, Objective tests as instruments | `10.2466/pr0.1957.3.3.635` | Psychological Reports | 1957 |
| 3 | Campbell & Fiske, MTMM | `10.1037/h0046016` | Psychological Bulletin | 1959 |
| 4 | Messick, Validity of psychological assessment | `10.1037/0003-066X.50.9.741` | American Psychologist | 1995 |
| 5 | Borsboom, Mellenbergh & van Heerden, Concept of validity | `10.1037/0033-295X.111.4.1061` | Psychological Review | 2004 |
| 6 | Cronbach, Coefficient alpha | `10.1007/BF02310555` | Psychometrika | 1951 |
| 7 | Revelle & Zinbarg, alpha/omega/glb | `10.1007/s11336-008-9102-z` | Psychometrika | 2009 |
| 8 | Fornell & Larcker, AVE/CR | `10.2307/3151312` | Journal of Marketing Research | 1981 |
| 9 | Fabrigar et al., EFA in psych research | `10.1037/1082-989X.4.3.272` | Psychological Methods | 1999 |
| 10 | Horn, Parallel analysis | `10.1007/BF02289447` | Psychometrika | 1965 |
| 11 | Anderson & Gerbing, Two-step SEM | `10.1037/0033-2909.103.3.411` | Psychological Bulletin | 1988 |
| 12 | Gerbing & Anderson, Updated paradigm / unidimensionality | `10.1177/002224378802500207` | Journal of Marketing Research | 1988 |
| 13 | Bagozzi & Yi, On the evaluation of SEM | `10.1007/BF02723327` | J. Academy of Marketing Science | 1988 |
| 14 | Bagozzi & Yi, Specification/evaluation/interpretation | `10.1007/s11747-011-0278-x` | J. Academy of Marketing Science | 2012 |
| 15 | Hu & Bentler, Fit-index cutoffs | `10.1080/10705519909540118` | Structural Equation Modeling | 1999 |
| 16 | Bollen & Lennox, Conventional wisdom on measurement | `10.1037/0033-2909.110.2.305` | Psychological Bulletin | 1991 |
| 17 | Diamantopoulos & Winklhofer, Formative index construction | `10.1509/jmkr.38.2.269.18845` | Journal of Marketing Research | 2001 |
| 18 | Jarvis, MacKenzie & Podsakoff, Misspecification | `10.1086/376806` | Journal of Consumer Research | 2003 |
| 19 | MacKenzie, Podsakoff & Podsakoff, Construct measurement & validation | `10.2307/23044045` | MIS Quarterly | 2011 |
| 20 | Bollen & Diamantopoulos, In defense of causal-formative | `10.1037/met0000056` | Psychological Methods | 2017 |
| 21 | Meredith, Measurement invariance | `10.1007/BF02294825` | Psychometrika | 1993 |
| 22 | Vandenberg & Lance, Invariance review | `10.1177/109442810031002` | Organizational Research Methods | 2000 |
| 23 | Steenkamp & Baumgartner, Cross-national invariance | `10.1086/209528` | Journal of Consumer Research | 1998 |
| 24 | Putnick & Bornstein, Invariance conventions | `10.1016/j.dr.2016.06.004` | Developmental Review | 2016 |
| 25 | Podsakoff et al., Common method biases | `10.1037/0021-9010.88.5.879` | Journal of Applied Psychology | 2003 |
| 26 | Podsakoff, MacKenzie & Podsakoff, Sources of method bias | `10.1146/annurev-psych-120710-100452` | Annual Review of Psychology | 2012 |
| 27 | Lindell & Whitney, Marker-variable CMV | `10.1037/0021-9010.86.1.114` | Journal of Applied Psychology | 2001 |
| 28 | Churchill, Paradigm for measures | `10.2307/3150876` | Journal of Marketing Research | 1979 |
| 29 | Rossiter, C-OAR-SE | `10.1016/S0167-8116(02)00097-6` | Int. J. of Research in Marketing | 2002 |
| 30 | Spearman, Proof and measurement of association | `10.2307/1412159` | American Journal of Psychology | 1904 |
| 31 | Cook & Stefanski, SIMEX | `10.1080/01621459.1994.10476871` | J. American Statistical Association | 1994 |
| 32 | Reise, Rediscovery of bifactor models | `10.1080/00273171.2012.715555` | Multivariate Behavioral Research | 2012 |
| 33 | Borsboom & Cramer, Network analysis | `10.1146/annurev-clinpsy-050212-185608` | Annual Review of Clinical Psychology | 2013 |
| 34 | Epskamp et al., qgraph | `10.18637/jss.v048.i04` | Journal of Statistical Software | 2012 |
| 35 | Epskamp, Borsboom & Fried, bootnet tutorial | `10.3758/s13428-017-0862-1` | Behavior Research Methods | 2018 |
| 36 | Merkle & Rosseel, blavaan | `10.18637/jss.v085.i04` | Journal of Statistical Software | 2018 |
| 37 | Rosseel, lavaan | `10.18637/jss.v048.i02` | Journal of Statistical Software | 2012 |
| 38 | Chalmers, mirt | `10.18637/jss.v048.i06` | Journal of Statistical Software | 2012 |
| 39 | Rizopoulos, ltm | `10.18637/jss.v017.i05` | Journal of Statistical Software | 2006 |
| 40 | Kelley, MBESS methods paper | `10.3758/BF03192993` | Behavior Research Methods | 2007 |

**Verified package/CRAN DOIs** (Crossref `10.32614/cran.package.*` entries returned ok):
`10.32614/cran.package.psych` (psych, Revelle), `10.32614/cran.package.semtools` (semTools), `10.32614/cran.package.mbess` (MBESS), `10.32614/cran.package.simex` (simex). These are stable but generic CRAN identifiers; prefer the JSS/journal DOI when one exists (lavaan, mirt, ltm above).

**Flagged — genuinely NO DOI (cite as book; do not invent an identifier):**
- Cronbach, Gleser, Nanda & Rajaratnam (1972). *The Dependability of Behavioral Measurements.* Wiley. — generalizability theory.
- Bollen, K. A. (1989). *Structural Equations with Latent Variables.* Wiley. ISBN 978-0-471-01171-2.
- Rasch, G. (1960/1980). *Probabilistic Models for Some Intelligence and Attainment Tests.* Danish Inst. for Educational Research / Univ. of Chicago Press.
- Lord, F. M., & Novick, M. R. (1968). *Statistical Theories of Mental Test Scores.* Addison-Wesley. (Birnbaum 2PL/3PL chapters.)
- Embretson, S. E., & Reise, S. P. (2000). *Item Response Theory for Psychologists.* Lawrence Erlbaum. (Original ed. no DOI; 2nd ed. 2025 Routledge chapters carry `10.4324/9781315726557-*`.)
- Netemeyer, Bearden & Sharma (2003). *Scaling Procedures.* Sage.
- DeVellis, R. F. *Scale Development: Theory and Applications.* Sage (cite the specific edition used).

**Corrections to common-but-wrong DOIs (do not use):**
- `10.1177/0049124192021002005` is **Browne & Cudeck (1992)**, *not* Gerbing & Anderson (1988). Use `10.1177/002224378802500207` for Gerbing & Anderson.
- Lindell & Whitney's marker technique is sometimes mis-attributed to Steenkamp & Baumgartner; the marker-variable paper is Lindell & Whitney (2001), DOI `10.1037/0021-9010.86.1.114`.

---

## Proposed code demonstrations (runnable chapter chunks)

Each is designed as a self-contained, base-R-simulation-first chunk of <=30 lines using only the packages above. Numbered for cross-reference; they map onto chapters 02 (constructs), 30 and 32 (measurement).

1. **Construct vs. variable (nomological net).** Simulate a latent `X` with theory-specified correlations to 2 consequences and 1 unrelated construct; print latent vs. observed correlation matrices to show the variable standing in for the construct. *(base R; Topic 1)*
2. **Alpha underestimates reliability under unequal loadings.** Simulate congeneric items; compare `psych::alpha` to `psych::omega` omega_total; print the gap. *(psych; Topic 2)*
3. **CR and AVE from CFA.** Fit a one-factor `lavaan` model on simulated data; compute `semTools::compRelSEM()` and AVE; check the Fornell-Larcker discriminant criterion against a second construct. *(lavaan + semTools; Topic 2)*
4. **Parallel analysis vs. Kaiser rule.** Simulate a 2-factor structure; `psych::fa.parallel` recovers 2 while eigenvalue>1 over-extracts; print both. *(psych; Topic 3)*
5. **EFA vs CFA / right vs wrong dimensionality.** Fit correct 2-factor and misspecified 1-factor CFA in `lavaan`; tabulate CFI/RMSEA/SRMR side by side. *(lavaan; Topics 3-4)*
6. **SEM fit and Hu-Bentler cutoffs.** `lavaan::simulateData` from a latent population model; fit correct vs. omitted-cross-loading models; print fit against cutoffs. *(lavaan; Topic 4)*
7. **Reflective vs formative data-generating processes.** Simulate the same 5 indicators reflectively then formatively; show inter-item correlation (and alpha) is high only under reflective generation; fit a MIMIC model to recover formative weights. *(base R + lavaan; Topic 5)*
8. **2PL IRT recovery and information.** Simulate dichotomous 2PL data; fit with `mirt`; recover parameters; plot ICCs and the test information function. *(mirt; Topic 6)*
9. **Measurement invariance ladder + partial invariance.** Two-group simulation with one DIF intercept; test configural/metric/scalar via `semTools::measEq.syntax`; localize and free the offending intercept. *(lavaan + semTools; Topic 7)*
10. **Common-method-bias inflation and marker correction.** Inject a shared method factor; show inflated correlation, then marker-variable correction and a CFA latent-method-factor model recovering the true structural correlation. *(base R + lavaan; Topic 8)*
11. **Churchill purification loop.** 6-item pool with 2 weak items; item-total correlations -> drop -> re-estimate alpha -> one-factor CFA confirms unidimensionality; report before/after. *(psych + lavaan; Topic 9)*
12. **Attenuation and disattenuation.** Add noise of varying reliability to a true score; show correlation shrinks; apply the Spearman formula to recover the true-score correlation. *(base R; Topic 10)*
13. **SIMEX slope correction (optional companion to #12).** Regress with a mismeasured predictor; fit `simex` and show the slope corrected toward the true value. *(simex; Topic 10)*
14. **Bifactor / essential unidimensionality.** Simulate general + 2 group factors; `psych::omega`; report omega_h and ECV to justify (or reject) a total score. *(psych; Topic 11)*
15. **Network psychometrics + bootstrap stability.** Simulate from a sparse partial-correlation structure; `bootnet::estimateNetwork(default="EBICglasso")`; plot with `qgraph`; bootstrap edge stability to show the planted edges are recovered. *(qgraph + bootnet; Topic 11)*

*(Optional 16th, if a Bayesian appetite exists: refit chunk #6's CFA in `blavaan` and compare posterior credible intervals to frequentist SEs — Topic 11.)*

---

### Verification provenance

DOIs were resolved one-by-one against `api.crossref.org/works/<DOI>` (and, where the input DOI was uncertain, via `api.crossref.org/works?query.bibliographic=...` and then confirming the returned DOI). Forty journal DOIs plus four CRAN package DOIs returned matching metadata. Seven works are flagged as having no DOI (books/monographs) with publisher and year given. Two circulating-but-incorrect DOIs are documented so they are not reused. Nothing in the ledger is unverified; any reference not in the ledger is explicitly a flagged monograph.
