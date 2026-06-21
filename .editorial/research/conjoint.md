# Preference Measurement (Conjoint) — Verified Bibliography

Curated, **Crossref-verified** literature on conjoint analysis and preference measurement, emphasizing the 2000s methodological wave (hierarchical Bayes, polyhedral / active-learning, choice-based, incentive-aligned, machine-learning, and self-explicated/hybrid methods).

**Verification protocol.** Every entry below was matched against the Crossref REST API (`https://api.crossref.org/works?query.bibliographic=...`). Each DOI, title, author list, year, journal, volume/issue, and page range was checked against the returned version-of-record metadata. Published versions-of-record (Marketing Science `10.1287/...`; JMR/JM `10.1509/...` and `10.1177/...`; others) are preferred over SSRN/preprint DOIs. Items that could not be verified are listed at the bottom under **UNVERIFIED — do not cite**.

Default chapter tag is `Chapter: preference-measurement`. A few entries are flagged as fitting the choice-modeling / Bayesian-methods (data) chapter better.

---

## Reviews, Handbooks & Canonical Background

```bibtex
@article{green1990conjoint,
  author  = {Green, Paul E. and Srinivasan, V.},
  title   = {Conjoint Analysis in Marketing: New Developments with Implications for Research and Practice},
  journal = {Journal of Marketing},
  year    = {1990},
  volume  = {54},
  number  = {4},
  pages   = {3--19},
  doi     = {10.1177/002224299005400402}
}
```
The field-defining review of the first three decades of conjoint analysis. Synthesizes alternative data-collection methods (full-profile, self-explicated, hybrid), estimation procedures, and reliability/validity evidence, and lays out a research agenda that the 2000s methods wave went on to address. Essential framing reference for the chapter.
Chapter: preference-measurement

```bibtex
@book{rao2014applied,
  author    = {Rao, Vithala R.},
  title     = {Applied Conjoint Analysis},
  publisher = {Springer Berlin Heidelberg},
  year      = {2014},
  doi       = {10.1007/978-3-540-87753-0}
}
```
The standard book-length treatment of conjoint analysis, covering experimental design, data collection, estimation (including hierarchical Bayes), and applications to product/service design, pricing, and product-line decisions. Useful as the comprehensive secondary reference anchoring the chapter.
Chapter: preference-measurement

```bibtex
@article{bradlow2005wishlist,
  author  = {Bradlow, Eric T.},
  title   = {Current Issues and a `Wish List' for Conjoint Analysis},
  journal = {Applied Stochastic Models in Business and Industry},
  year    = {2005},
  volume  = {21},
  number  = {4-5},
  pages   = {319--323},
  doi     = {10.1002/asmb.559}
}
```
A concise agenda-setting commentary identifying open problems in conjoint analysis circa the mid-2000s (e.g., design adaptivity, respondent behavior, missing data, model comparison). Useful for motivating why the methodological wave of the period took the directions it did.
Chapter: preference-measurement

---

## Hierarchical Bayes Conjoint & Consumer Heterogeneity

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
A foundational paper introducing hierarchical Bayes estimation of individual-level partworths in conjoint analysis. Shows that HB can recover heterogeneous partworths even when each respondent answers far fewer profiles than there are parameters, by borrowing strength across the population. This result underpins the entire subsequent HB-conjoint practice.
Chapter: preference-measurement

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
Demonstrates how Bayesian priors encoding managerial/economic constraints (e.g., monotonic or sign-constrained partworths) can be incorporated into conjoint estimation. An early and influential argument for constrained Bayesian conjoint that improves partworth plausibility and predictive validity.
Chapter: preference-measurement

```bibtex
@article{allenby1995extremes,
  author  = {Allenby, Greg M. and Ginter, James L.},
  title   = {Using Extremes to Design Products and Segment Markets},
  journal = {Journal of Marketing Research},
  year    = {1995},
  volume  = {32},
  number  = {4},
  pages   = {392--403},
  doi     = {10.1177/002224379503200402}
}
```
Shows that choice designs emphasizing extreme (high-information) profiles sharpen estimation of heterogeneous preferences, with implications for product design and segmentation. A key precursor to later adaptive/efficient-design work in conjoint.
Chapter: preference-measurement

```bibtex
@article{arora1998primarysecondary,
  author  = {Arora, Neeraj and Allenby, Greg M. and Ginter, James L.},
  title   = {A Hierarchical Bayes Model of Primary and Secondary Demand},
  journal = {Marketing Science},
  year    = {1998},
  volume  = {17},
  number  = {1},
  pages   = {29--44},
  doi     = {10.1287/mksc.17.1.29}
}
```
Develops a hierarchical Bayes model that jointly captures category (primary) and brand (secondary) demand, with respondent-level heterogeneity. An important demonstration of HB modeling flexibility that informed later conjoint and choice applications.
Chapter: preference-measurement (also relevant to modeling/choice-data)

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
A careful simulation-and-empirical comparison of hierarchical Bayes against finite-mixture (latent-class) conjoint models on fit, holdout prediction, and partworth recovery. Provides practical guidance on when continuous-heterogeneity HB outperforms discrete-segment approaches.
Chapter: preference-measurement

```bibtex
@article{rossi2003bayesianreview,
  author  = {Rossi, Peter E. and Allenby, Greg M.},
  title   = {Bayesian Statistics and Marketing},
  journal = {Marketing Science},
  year    = {2003},
  volume  = {22},
  number  = {3},
  pages   = {304--328},
  doi     = {10.1287/mksc.22.3.304.17739}
}
```
A high-level review article making the case for Bayesian methods in marketing, with hierarchical models of consumer heterogeneity (including conjoint partworths) as the central application. The companion conceptual reference for HB-conjoint estimation.
Chapter: preference-measurement (methodological background; also fits modeling/Bayesian-data chapter)

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
A canonical hierarchical Bayes application that quantifies how individual-level posterior inference (shrinkage toward the population) raises the value of household-level data. While framed around purchase history, it is the methodological template for individual-level HB partworth estimation used throughout conjoint. Better situated in the modeling/Bayesian-data chapter but included for HB lineage.
Chapter: modeling/Bayesian-data (cross-reference from preference-measurement)

---

## Polyhedral, Adaptive & Active-Learning Conjoint

```bibtex
@article{toubia2003polyhedral,
  author  = {Toubia, Olivier and Simester, Duncan I. and Hauser, John R. and Dahan, Ely},
  title   = {Fast Polyhedral Adaptive Conjoint Estimation},
  journal = {Marketing Science},
  year    = {2003},
  volume  = {22},
  number  = {3},
  pages   = {273--303},
  doi     = {10.1287/mksc.22.3.273.17743}
}
```
The seminal polyhedral conjoint paper. Treats the set of partworths consistent with a respondent's answers as a polyhedron and adaptively chooses each next question to shrink that polyhedron as fast as possible (interior-point geometry). Enables accurate metric-paired-comparison conjoint with very few questions. (Note a published erratum at `10.1287/mksc.22.4.544.erratum1`.)
Chapter: preference-measurement

```bibtex
@article{toubia2004polyhedralcbc,
  author  = {Toubia, Olivier and Hauser, John R. and Simester, Duncan I.},
  title   = {Polyhedral Methods for Adaptive Choice-Based Conjoint Analysis},
  journal = {Journal of Marketing Research},
  year    = {2004},
  volume  = {41},
  number  = {1},
  pages   = {116--131},
  doi     = {10.1509/jmkr.41.1.116.25082}
}
```
Extends the polyhedral adaptive approach to choice-based conjoint (CBC), where respondents choose among profiles rather than rate them. Designs each choice question to maximally reduce uncertainty about the partworth polyhedron, improving efficiency over fixed and aggregate-customization designs.
Chapter: preference-measurement

```bibtex
@article{toubia2007probabilistic,
  author  = {Toubia, Olivier and Hauser, John R. and Garcia, Rosanna},
  title   = {Probabilistic Polyhedral Methods for Adaptive Choice-Based Conjoint Analysis: Theory and Application},
  journal = {Marketing Science},
  year    = {2007},
  volume  = {26},
  number  = {5},
  pages   = {596--610},
  doi     = {10.1287/mksc.1060.0257}
}
```
Generalizes polyhedral CBC to a probabilistic framework that explicitly accounts for response error, combining the geometric question-selection idea with a statistically grounded posterior. Validated against benchmark methods, it improves robustness when respondents answer noisily.
Chapter: preference-measurement

```bibtex
@article{toubia2007managerial,
  author  = {Toubia, Olivier and Hauser, John R.},
  title   = {Research Note---On Managerially Efficient Experimental Designs},
  journal = {Marketing Science},
  year    = {2007},
  volume  = {26},
  number  = {6},
  pages   = {851--858},
  doi     = {10.1287/mksc.1060.0244}
}
```
Argues that statistically efficient designs are not always managerially efficient, and proposes design criteria aligned with the decisions (e.g., product/market choices) the conjoint study is meant to inform. A bridge between optimal experimental design theory and managerial use.
Chapter: preference-measurement

```bibtex
@article{hauser2005utilitybalance,
  author  = {Hauser, John R. and Toubia, Olivier},
  title   = {The Impact of Utility Balance and Endogeneity in Conjoint Analysis},
  journal = {Marketing Science},
  year    = {2005},
  volume  = {24},
  number  = {3},
  pages   = {498--507},
  doi     = {10.1287/mksc.1040.0108}
}
```
Shows that utility-balanced designs (a common efficiency heuristic) can induce endogeneity bias in partworth estimates because question selection depends on prior responses. An important cautionary result for adaptive conjoint design, clarifying when adaptivity helps versus distorts.
Chapter: preference-measurement

```bibtex
@article{abernethy2008robustadaptive,
  author  = {Abernethy, Jacob and Evgeniou, Theodoros and Toubia, Olivier and Vert, Jean-Philippe},
  title   = {Eliciting Consumer Preferences Using Robust Adaptive Choice Questionnaires},
  journal = {IEEE Transactions on Knowledge and Data Engineering},
  year    = {2008},
  volume  = {20},
  number  = {2},
  pages   = {145--155},
  doi     = {10.1109/tkde.2007.190632}
}
```
A machine-learning treatment of adaptive choice questionnaire design, framing preference elicitation as online/active learning with robustness to response error. Connects conjoint question design to regularization and statistical learning theory.
Chapter: preference-measurement

```bibtex
@article{dzyabura2011activeml,
  author  = {Dzyabura, Daria and Hauser, John R.},
  title   = {Active Machine Learning for Consideration Heuristics},
  journal = {Marketing Science},
  year    = {2011},
  volume  = {30},
  number  = {5},
  pages   = {801--819},
  doi     = {10.1287/mksc.1110.0660}
}
```
Uses active machine learning to adaptively select questions that efficiently identify each respondent's consideration-set decision rules (conjunctive/disjunctive heuristics). Extends adaptive preference measurement beyond compensatory partworths to non-compensatory heuristics.
Chapter: preference-measurement

---

## Optimization & Machine-Learning Estimation

```bibtex
@article{evgeniou2005robust,
  author  = {Evgeniou, Theodoros and Boussios, Constantinos and Zacharia, Giorgos},
  title   = {Generalized Robust Conjoint Estimation},
  journal = {Marketing Science},
  year    = {2005},
  volume  = {24},
  number  = {3},
  pages   = {415--429},
  doi     = {10.1287/mksc.1040.0100}
}
```
Recasts conjoint partworth estimation as a regularized (statistical-learning) optimization problem, trading off fit against complexity to control overfitting. Introduces support-vector-machine-style estimation to conjoint and improves predictive performance, especially with few questions.
Chapter: preference-measurement

```bibtex
@article{evgeniou2007convex,
  author  = {Evgeniou, Theodoros and Pontil, Massimiliano and Toubia, Olivier},
  title   = {A Convex Optimization Approach to Modeling Consumer Heterogeneity in Conjoint Estimation},
  journal = {Marketing Science},
  year    = {2007},
  volume  = {26},
  number  = {6},
  pages   = {805--818},
  doi     = {10.1287/mksc.1070.0291}
}
```
Models consumer heterogeneity via a convex (multi-task learning) optimization that shrinks individual partworths toward shared structure, an optimization-theoretic analog to hierarchical Bayes. Provides a scalable, regularization-based alternative for individual-level conjoint estimation.
Chapter: preference-measurement

```bibtex
@incollection{toubia2007optmlmethods,
  author    = {Toubia, Olivier and Evgeniou, Theodoros and Hauser, John R.},
  title     = {Optimization-Based and Machine-Learning Methods for Conjoint Analysis: Estimation and Question Design},
  booktitle = {Conjoint Measurement: Methods and Applications},
  publisher = {Springer},
  year      = {2007},
  pages     = {231--258},
  doi       = {10.1007/978-3-540-71404-0_12}
}
```
A handbook chapter synthesizing the optimization/machine-learning stream of conjoint research: regularized estimation, polyhedral and active-learning question design, and the connections among them. A compact survey ideal for orienting readers to this sub-method.
Chapter: preference-measurement

```bibtex
@article{hauser2010disjunctions,
  author  = {Hauser, John R. and Toubia, Olivier and Evgeniou, Theodoros and Befurt, Rene and Dzyabura, Daria},
  title   = {Disjunctions of Conjunctions, Cognitive Simplicity, and Consideration Sets},
  journal = {Journal of Marketing Research},
  year    = {2010},
  volume  = {47},
  number  = {3},
  pages   = {485--496},
  doi     = {10.1509/jmkr.47.3.485}
}
```
Introduces a machine-learning approach to estimate non-compensatory "disjunctions-of-conjunctions" decision rules that respondents use to form consideration sets, favoring cognitively simple rules. Broadens preference measurement to capture how consumers screen rather than compensate.
Chapter: preference-measurement

```bibtex
@article{bradlow2004learning,
  author  = {Bradlow, Eric T. and Hu, Ye and Ho, Teck-Hua},
  title   = {Modeling Behavioral Regularities of Consumer Learning in Conjoint Analysis},
  journal = {Journal of Marketing Research},
  year    = {2004},
  volume  = {41},
  number  = {4},
  pages   = {392--396},
  doi     = {10.1509/jmkr.41.4.392.47020}
}
```
Models how respondents learn and update during a conjoint task, addressing the assumption of stable preferences across questions. Provides a behaviorally grounded correction for order/learning effects in adaptive and sequential conjoint.
Chapter: preference-measurement

---

## Incentive-Aligned Conjoint

```bibtex
@article{ding2005incentivealigned,
  author  = {Ding, Min and Grewal, Rajdeep and Liechty, John},
  title   = {Incentive-Aligned Conjoint Analysis},
  journal = {Journal of Marketing Research},
  year    = {2005},
  volume  = {42},
  number  = {1},
  pages   = {67--82},
  doi     = {10.1509/jmkr.42.1.67.56890}
}
```
Introduces incentive alignment to conjoint: respondents face real economic consequences (a chance to receive a chosen product) so that truth-telling is in their interest. Shows substantially improved external/predictive validity over purely hypothetical conjoint.
Chapter: preference-measurement

```bibtex
@article{ding2007incentivemechanism,
  author  = {Ding, Min},
  title   = {An Incentive-Aligned Mechanism for Conjoint Analysis},
  journal = {Journal of Marketing Research},
  year    = {2007},
  volume  = {44},
  number  = {2},
  pages   = {214--223},
  doi     = {10.1509/jmkr.44.2.214}
}
```
Develops a truth-telling incentive mechanism that is implementable without knowing respondents' valuations in advance, making incentive-aligned conjoint practical. Strengthens the theoretical foundation for why incentive alignment elicits truthful preferences.
Chapter: preference-measurement

```bibtex
@article{dong2010simplemechanism,
  author  = {Dong, Songting and Ding, Min and Huber, Joel},
  title   = {A Simple Mechanism to Incentive-Align Conjoint Experiments},
  journal = {International Journal of Research in Marketing},
  year    = {2010},
  volume  = {27},
  number  = {1},
  pages   = {25--32},
  doi     = {10.1016/j.ijresmar.2009.09.004}
}
```
Proposes a simplified, easily fielded incentive-alignment mechanism for conjoint experiments and validates that it preserves the predictive-validity benefits while lowering implementation burden. Practical complement to the foundational incentive-aligned papers.
Chapter: preference-measurement

---

## Experimental Design for Choice-Based Conjoint

```bibtex
@article{sandor2001managerpriors,
  author  = {S\'andor, Zsolt and Wedel, Michel},
  title   = {Designing Conjoint Choice Experiments Using Managers' Prior Beliefs},
  journal = {Journal of Marketing Research},
  year    = {2001},
  volume  = {38},
  number  = {4},
  pages   = {430--444},
  doi     = {10.1509/jmkr.38.4.430.18904}
}
```
A Bayesian (D-optimal) design procedure that uses managers' prior beliefs about parameter values to construct more efficient choice-based conjoint designs, reporting markedly lower standard errors than locally optimal or orthogonal designs. A cornerstone of Bayesian-efficient CBC design.
Chapter: preference-measurement

```bibtex
@article{hauser2019scale,
  author  = {Hauser, John R. and Eggers, Felix and Selove, Matthew},
  title   = {The Strategic Implications of Scale in Choice-Based Conjoint Analysis},
  journal = {Marketing Science},
  year    = {2019},
  volume  = {38},
  number  = {6},
  pages   = {1059--1081},
  doi     = {10.1287/mksc.2019.1178}
}
```
Examines how response-scale (error-variance) heterogeneity affects choice-based conjoint estimates and the strategic/product decisions drawn from them. Clarifies a frequently overlooked confound in CBC and its managerial consequences. (Volume/issue/pages reflect the final version of record.)
Chapter: preference-measurement

---

## Self-Explicated & Hybrid Methods

```bibtex
@article{netzer2011adaptiveselfexplicated,
  author  = {Netzer, Oded and Srinivasan, V.},
  title   = {Adaptive Self-Explication of Multiattribute Preferences},
  journal = {Journal of Marketing Research},
  year    = {2011},
  volume  = {48},
  number  = {1},
  pages   = {140--156},
  doi     = {10.1509/jmkr.48.1.140}
}
```
Develops an adaptive self-explicated method that decomposes attribute-importance elicitation into a sequence of simpler constant-sum paired comparisons, reducing respondent burden and the well-known biases of direct importance ratings. A leading hybrid/self-explicated approach competitive with full conjoint for many attributes.
Chapter: preference-measurement

```bibtex
@article{srinivasan1988conjunctivecompensatory,
  author  = {Srinivasan, V.},
  title   = {A Conjunctive-Compensatory Approach to the Self-Explication of Multiattributed Preferences},
  journal = {Decision Sciences},
  year    = {1988},
  volume  = {19},
  number  = {2},
  pages   = {295--305},
  doi     = {10.1111/j.1540-5915.1988.tb00268.x}
}
```
Foundational self-explication method combining conjunctive screening (eliminating unacceptable levels) with compensatory partworth elicitation. The conceptual ancestor of later adaptive self-explicated and hybrid approaches.
Chapter: preference-measurement

---

## Product & Product-Line Design Applications (Conjoint-Based)

```bibtex
@article{luo2007channelacceptance,
  author  = {Luo, Lan and Kannan, P. K. and Ratchford, Brian T.},
  title   = {New Product Development Under Channel Acceptance},
  journal = {Marketing Science},
  year    = {2007},
  volume  = {26},
  number  = {2},
  pages   = {149--163},
  doi     = {10.1287/mksc.1060.0240}
}
```
Uses conjoint-based preference estimates to optimize new-product design while accounting for retail channel acceptance, integrating consumer-level partworths with channel constraints. A representative application of conjoint to the product-design/optimization problem (Lan Luo, USC).
Chapter: preference-measurement (application; also relevant to product-design/modeling)

```bibtex
@article{luo2008subjective,
  author  = {Luo, Lan and Kannan, P. K. and Ratchford, Brian T.},
  title   = {Incorporating Subjective Characteristics in Product Design and Evaluations},
  journal = {Journal of Marketing Research},
  year    = {2008},
  volume  = {45},
  number  = {2},
  pages   = {182--194},
  doi     = {10.1509/jmkr.45.2.182}
}
```
Extends conjoint-based product design to incorporate subjective (perceptual) attributes alongside objective ones, linking engineering design variables to consumer preference via measured perceptions. Bridges marketing conjoint and engineering design optimization.
Chapter: preference-measurement (application; also relevant to product-design/modeling)

---

## UNVERIFIED — do not cite

The following items were sought (per scope) but **could not be matched to a published version-of-record in Crossref** during this pass, so they are excluded from the citable list above. Do not cite until verified.

- **Liu & Dahan, menu-based / configurator conjoint.** A frequently mentioned "menu-based" or product-configurator conjoint paper attributed to Qing Liu and/or Ely Dahan did not return a matching version-of-record under multiple Crossref bibliographic queries (tried *Production and Operations Management*, *Marketing Science*, and generic menu-based/configurator queries). It may exist under a different exact title, author set, or venue; verify the precise citation directly before use. (For an adjacent, verified menu/efficient-design idea, see Sándor & Wedel 2001 above.)
- **Chintagunta / Hitsch / Misra choice-modeling work specific to conjoint.** No conjoint-specific paper by these authors was confirmed in this pass. Their relevant contributions are in aggregate/scanner choice modeling and demand estimation rather than conjoint preference measurement, so none is asserted here; if a specific paper is wanted, verify its DOI individually.
- **Liu, Otter & Allenby (2007), "Investigating Endogeneity Bias in Marketing," *Marketing Science* 26(5):642–650, DOI 10.1287/mksc.1060.0256.** This DOI/metadata *is* verified in Crossref, but the paper concerns endogeneity in choice/demand models rather than conjoint preference measurement per se. Cite it from the modeling/choice-data chapter if used, not as a conjoint method.

---

### Verification log (queries run)

All entries verified via `https://api.crossref.org/works?query.bibliographic=<terms>&rows=N` on 2026-06-21, cross-checking DOI, author list, year, journal, volume/issue, and pages against returned version-of-record metadata. Where SSRN/preprint DOIs co-existed (e.g., `10.2139/ssrn.*` for the Toubia/Hauser polyhedral papers and Rossi/Allenby), the published `10.1287/...`, `10.1509/...`, or `10.1177/...` version-of-record DOI was selected instead.
