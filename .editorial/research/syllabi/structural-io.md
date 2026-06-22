# Structural Econometrics / Empirical Industrial Organization — PhD Seminar (Marketing)

A full-semester (13–14 week) doctoral seminar in **structural econometrics / empirical industrial organization (EIO)**, as taught in quantitative-marketing and economics PhD programs. This document synthesizes a canonical module structure from the way leading programs organize the field and pairs each module with a small set of **DOI-verified** key readings.

Every reading below has its DOI verified against the Crossref REST API (`https://api.crossref.org/works/<doi>`, polite pool) on 2026-06-21; title, authors, year, journal, volume/issue, and pagination were checked against the Crossref version-of-record metadata. Where both a working paper (SSRN/NBER) and a published article exist, only the **published version-of-record DOI** is cited. Readings that could not be verified were omitted rather than invented.

---

## 1. Semester arc

The structural-IO seminar is organized as a single methodological pipeline taught twice — once for *static* markets and once for *dynamic* ones. The spine is the demand-supply equilibrium model of a differentiated-products oligopoly: students first learn to estimate **demand** for differentiated products (logit, nested logit, and the random-coefficients/BLP workhorse), then to layer a **supply side** (Bertrand-Nash pricing, markups, conduct) on top, and finally to use the estimated structural parameters to run **counterfactuals** (mergers, new goods, price regulation, taxes). This static arc — roughly the first half of the term — is where the field's identification arguments, instruments, and estimation algorithms (GMM, the BLP nested fixed point, and MPEC) are taught most carefully, because every later model reuses them.

The second half generalizes the same logic to settings where agents are **forward-looking**. Consumers become dynamic when goods are durable or storable; firms become dynamic when they invest, enter, or exit. The methodological payload here is **dynamic discrete choice** — Rust's nested fixed point and the conditional-choice-probability (CCP) shortcut of Hotz-Miller — extended to dynamic games via two-step estimators. The seminar then surveys the major application areas that have organized the field's recent agenda: entry and market structure, auctions, two-sided/platform markets, and consumer search and consideration. The term typically closes on the active frontier where machine learning meets structural estimation (heterogeneous treatment effects, text-as-data, high-dimensional demand) and on a recurring debate that runs through the whole course: structural vs. reduced-form / "credible" design-based inference.

Pedagogically, most programs intertwine three threads every week: (i) the economic *model* and its equilibrium concept; (ii) the *econometrics* — what is identified, from what variation, under what exclusion restrictions; and (iii) *computation* — students are expected to code estimators (increasingly in Python with PyBLP, or in Julia/MATLAB) and replicate a canonical paper. The deliverable is usually a referee report plus an original research proposal or a replication-and-extension exercise. The marketing version of the seminar (Booth, Stanford GSB, Wisconsin, UCLA Anderson, Yale SOM, NYU Stern) leans harder on individual-level scanner/CRM data, consumer heterogeneity, micro-moments, and managerial counterfactuals (pricing, advertising, product line) than the economics version, which leans toward antitrust and policy.

---

## 2. Weekly modules

Each module lists topic, subtopics, key readings (with verified DOIs and a one-line rationale), the methods/skills emphasized, and the central debate. Foundational vs. frontier status is marked per module in §3.

### Week 1 — Foundations: the structural approach and the modeling cycle
**Subtopics:** What "structural" buys you (welfare, counterfactuals, extrapolation) vs. costs (assumptions, computation); the demand-supply-counterfactual loop; structural vs. reduced-form debate.
**Key readings:**
- Berry, S. (1994). "Estimating Discrete-Choice Models of Product Differentiation." *RAND Journal of Economics* 25(2): 242–262. **DOI: 10.2307/2555829** — Introduces the inversion from market shares to mean utilities that makes aggregate differentiated-products demand estimable; the conceptual on-ramp to the whole field.
- Nevo, A. (2000). "A Practitioner's Guide to Estimation of Random-Coefficients Logit Models of Demand." *Journal of Economics & Management Strategy* 9(4): 513–548. **DOI: 10.1162/105864000567954** — The teaching reference that turns BLP into runnable code; nearly universal Week 1–3 reading.

**Methods/skills:** Reading a structural paper; mapping primitives → estimating equations → counterfactual.
**Central debate:** When are structural assumptions worth their cost vs. a clean natural experiment?

### Week 2 — Discrete-choice demand I: logit and nested logit
**Subtopics:** Random utility; IIA and its failures; the logit "red bus/blue bus" problem; nested logit and the substitution-pattern fix; aggregate vs. individual data.
**Key readings:**
- Berry, S. (1994). *RAND J. Econ.* 25(2): 242–262. **DOI: 10.2307/2555829** — (Re-used) the mean-utility inversion specializes cleanly to logit/nested logit.

**Methods/skills:** Deriving choice probabilities; computing own- and cross-price elasticities; the "outside good."
**Central debate:** Is IIA an acceptable approximation, or does it doom logit for policy work?

### Week 3 — Discrete-choice demand II: random coefficients / BLP
**Subtopics:** Unobserved product characteristics (ξ) and price endogeneity; random coefficients for flexible substitution; the contraction mapping; BLP instruments.
**Key readings:**
- Berry, S., Levinsohn, J., & Pakes, A. (1995). "Automobile Prices in Market Equilibrium." *Econometrica* 63(4): 841–890. **DOI: 10.2307/2171802** — The foundational random-coefficients demand-and-supply paper; the workhorse of the field.
- Nevo, A. (2001). "Measuring Market Power in the Ready-to-Eat Cereal Industry." *Econometrica* 69(2): 307–342. **DOI: 10.1111/1468-0262.00194** — The canonical applied BLP study; introduces brand-specific intercepts and the use of panel structure to control for ξ.
- Berry, S., Levinsohn, J., & Pakes, A. (2004). "Differentiated Products Demand Systems from a Combination of Micro and Macro Data: The New Car Market." *Journal of Political Economy* 112(1): 68–105. **DOI: 10.1086/379939** — Shows how consumer-level "micro-moments" sharpen identification of heterogeneity; the template for modern marketing applications.

**Methods/skills:** GMM with the BLP nested fixed point; constructing demand-side instruments; micro-moments.
**Central debate:** What variation actually identifies the random coefficients, and how fragile is it to weak instruments?

### Week 4 — Identification & instruments in demand estimation
**Subtopics:** Price endogeneity; cost-shifters, Hausman, and BLP-type instruments; nonparametric identification of demand; instrument relevance/validity.
**Key readings:**
- Berry, S. & Haile, P. (2014). "Identification in Differentiated Products Markets Using Market Level Data." *Econometrica* 82(5): 1749–1797. **DOI: 10.3982/ECTA9027** — Establishes nonparametric identification of differentiated-products demand and supply; reframes BLP's parametric choices as identification, not just estimation.

**Methods/skills:** Exclusion restrictions; testing instrument strength; the "connected substitutes" condition.
**Central debate:** Are the standard instruments (rival characteristics, cost shifters) credible, and what do they identify nonparametrically?

### Week 5 — Estimation & computation: GMM, NFP, and MPEC
**Subtopics:** GMM objective and weighting; the nested fixed-point (NFP) algorithm; MPEC (constrained optimization) as an alternative; numerical pitfalls (tight inner loops, local minima); modern software.
**Key readings:**
- Dubé, J.-P., Fox, J. T., & Su, C.-L. (2012). "Improving the Numerical Performance of Static and Dynamic Aggregate Discrete Choice Random Coefficients Demand Estimation." *Econometrica* 80(5): 2231–2267. **DOI: 10.3982/ecta8585** — Reformulates BLP estimation as MPEC, showing the NFP inner-loop tolerance can bias estimates; reshaped how the field computes BLP.
- Conlon, C. & Gortmaker, J. (2020). "Best Practices for Differentiated Products Demand Estimation with PyBLP." *RAND Journal of Economics* 51(4): 1108–1161. **DOI: 10.1111/1756-2171.12352** — The current computational standard and the software (PyBLP) most students now use; consolidates two decades of practical lessons.

**Methods/skills:** Coding the contraction; MPEC vs. NFP; optimal instruments; supply-side moments; PyBLP.
**Central debate:** How much do numerical choices (tolerances, optimizers, starting values) drive published BLP results?

### Week 6 — Supply, conduct, and markups
**Subtopics:** Bertrand-Nash pricing with differentiated products; recovering marginal costs from the FOCs; testing conduct (Cournot vs. Bertrand vs. collusion); the identification of the "conduct parameter."
**Key readings:**
- Bresnahan, T. F. (1982). "The Oligopoly Solution Concept Is Identified." *Economics Letters* 10(1–2): 87–92. **DOI: 10.1016/0165-1765(82)90121-5** — The original result that demand rotations identify the conduct parameter; foundation of the "new empirical IO."
- Nevo, A. (1998). "Identification of the Oligopoly Solution Concept in a Differentiated-Products Industry." *Economics Letters* 59(3): 391–395. **DOI: 10.1016/s0165-1765(98)00061-5** — Extends conduct identification to differentiated products; the bridge from Bresnahan to BLP-style supply.
- Nevo, A. (2001). *Econometrica* 69(2): 307–342. **DOI: 10.1111/1468-0262.00194** — (Re-used) recovers cereal markups and decomposes them into cost, markup, and portfolio effects.

**Methods/skills:** Inverting FOCs for markups/marginal costs; ownership matrices; conduct tests.
**Central debate:** Can conduct be credibly tested, or must it be assumed? (the "testing vs. calibrating conduct" problem)

### Week 7 — Counterfactuals & merger / policy simulation
**Subtopics:** Recomputing equilibrium prices under new ownership (mergers), new goods, taxes/regulation; welfare and consumer surplus from logit/BLP; passthrough; the role of supply-side assumptions in counterfactuals.
**Key readings:**
- Nevo, A. (2000). *J. Econ. & Mgmt. Strategy* 9(4): 513–548. **DOI: 10.1162/105864000567954** — (Re-used) lays out the merger-simulation mechanics that follow directly from estimated demand and FOCs.
- Petrin, A. (2002). "Quantifying the Benefits of New Products: The Case of the Minivan." *Journal of Political Economy* 110(4): 705–729. **DOI: 10.1086/340779** — The canonical "value of a new good" counterfactual; shows how micro-data discipline the welfare numbers.

**Methods/skills:** Solving for post-merger equilibrium; computing compensating variation; sensitivity of counterfactuals to conduct.
**Central debate:** How much do counterfactuals depend on un-tested supply assumptions and out-of-sample extrapolation?

### Week 8 — Dynamic demand: durable and storable goods
**Subtopics:** Forward-looking consumers; the durable-goods problem (Coase) and intertemporal price discrimination; stockpiling and storable goods; dynamic demand estimation.
**Key readings:**
- Gowrisankaran, G. & Rysman, M. (2012). "Dynamics of Consumer Demand for New Durable Goods." *Journal of Political Economy* 120(6): 1173–1219. **DOI: 10.1086/669540** — The workhorse framework for estimating dynamic demand for durables (digital camcorders); falling prices and forward-looking buyers.
- Hendel, I. & Nevo, A. (2006). "Measuring the Implications of Sales and Consumer Inventory Behavior." *Econometrica* 74(6): 1637–1673. **DOI: 10.1111/j.1468-0262.2006.00721.x** — Shows how ignoring consumer stockpiling biases demand elasticities; the canonical storable-goods paper.
- Nair, H. (2007). "Intertemporal Price Discrimination with Forward-Looking Consumers: Application to the US Market for Console Video-Games." *Quantitative Marketing and Economics* 5(3): 239–292. **DOI: 10.1007/s11129-007-9026-4** — The marketing-canon dynamic-demand application; links forward-looking demand to optimal dynamic pricing.

**Methods/skills:** Solving consumer dynamic programs; integrating dynamics into BLP-style demand; managing the state space.
**Central debate:** How to handle expectations about future prices/products without overfitting the dynamics?

### Week 9 — Dynamic discrete choice: Rust and CCP
**Subtopics:** Single-agent dynamic programming; the nested fixed-point (Rust) estimator; conditional-choice-probability (Hotz-Miller) inversion; finite-dependence; the curse of dimensionality.
**Key readings:**
- Rust, J. (1987). "Optimal Replacement of GMC Bus Engines: An Empirical Model of Harold Zurcher." *Econometrica* 55(5): 999–1033. **DOI: 10.2307/1911259** — The foundational single-agent dynamic discrete-choice model and nested fixed-point estimator.
- Hotz, V. J. & Miller, R. A. (1993). "Conditional Choice Probabilities and the Estimation of Dynamic Models." *Review of Economic Studies* 60(3): 497–529. **DOI: 10.2307/2298122** — The CCP inversion that avoids full dynamic-programming solution; the basis for all modern two-step dynamic estimators.
- Aguirregabiria, V. & Mira, P. (2010). "Dynamic Discrete Choice Structural Models: A Survey." *Journal of Econometrics* 156(1): 38–67. **DOI: 10.1016/j.jeconom.2009.09.007** — The standard survey tying NFP, CCP, and two-step methods together; the module's roadmap.

**Methods/skills:** Value-function iteration; CCP estimation; simulation of dynamic programs.
**Central debate:** NFP (full solution) vs. CCP (two-step) — efficiency vs. tractability and robustness.

### Week 10 — Dynamic games: entry, exit, and investment
**Subtopics:** Markov-perfect equilibrium; the Ericson-Pakes framework; two-step estimators for dynamic games; multiplicity of equilibria.
**Key readings:**
- Bajari, P., Benkard, C. L., & Levin, J. (2007). "Estimating Dynamic Models of Imperfect Competition." *Econometrica* 75(5): 1331–1370. **DOI: 10.1111/j.1468-0262.2007.00796.x** — The general two-step (BBL) estimator for dynamic oligopoly games; foundational frontier method.
- Pakes, A., Ostrovsky, M., & Berry, S. (2007). "Simple Estimators for the Parameters of Discrete Dynamic Games (with Entry/Exit Examples)." *RAND Journal of Economics* 38(2): 373–399. **DOI: 10.1111/j.1756-2171.2007.tb00073.x** — A tractable moment-based estimator for entry/exit games; widely taught alongside BBL.
- Aguirregabiria, V. & Mira, P. (2007). "Sequential Estimation of Dynamic Discrete Games." *Econometrica* 75(1): 1–53. **DOI: 10.1111/j.1468-0262.2007.00731.x** — The nested pseudo-likelihood (NPL) estimator for dynamic games; the third pillar of the estimation toolkit.

**Methods/skills:** Estimating policy functions; forward simulation; handling equilibrium multiplicity.
**Central debate:** How to estimate games with multiple equilibria, and how credible are the Markov/MPE assumptions?

### Week 11 — Static entry and market structure
**Subtopics:** Entry as a revealed-preference inequality; ordered/sequential entry; what entry thresholds reveal about competition and fixed costs; market structure without price/quantity data.
**Key readings:**
- Bresnahan, T. F. & Reiss, P. C. (1991). "Entry and Competition in Concentrated Markets." *Journal of Political Economy* 99(5): 977–1009. **DOI: 10.1086/261786** — The foundational entry-threshold approach: how the number of firms a market supports reveals competitive conduct.
- Bresnahan, T. F. & Reiss, P. C. (1990). "Entry in Monopoly Markets." *Review of Economic Studies* 57(4): 531–553. **DOI: 10.2307/2298085** — The companion paper formalizing entry decisions in small isolated markets; the empirical setup students replicate.

**Methods/skills:** Estimating entry models from count/threshold data; inequality-based inference; identifying fixed costs.
**Central debate:** What can entry patterns identify about competition when prices and quantities are unobserved?

### Week 12 — Auctions
**Subtopics:** First-price sealed-bid and the equilibrium bid function; structural inversion from bids to valuations; nonparametric identification; private vs. common values; risk aversion.
**Key readings:**
- Guerre, E., Perrigne, I., & Vuong, Q. (2000). "Optimal Nonparametric Estimation of First-Price Auctions." *Econometrica* 68(3): 525–574. **DOI: 10.1111/1468-0262.00123** — The GPV two-step nonparametric estimator that recovers the value distribution from observed bids; the canonical structural-auctions paper.
- Campo, S., Guerre, E., Perrigne, I., & Vuong, Q. (2011). "Semiparametric Estimation of First-Price Auctions with Risk-Averse Bidders." *Review of Economic Studies* 78(1): 112–147. **DOI: 10.1093/restud/rdq001** — Extends GPV to risk-averse bidders and identification of preferences; the frontier reading for the module.

**Methods/skills:** Inverting the bid function; kernel estimation of bid densities; testing for common values.
**Central debate:** Private vs. common values and the limits of identification from bid data alone.

### Week 13 — Two-sided markets and platforms
**Subtopics:** Network effects across two customer groups; platform pricing and the "see-saw"; vertical integration and exclusivity; structural estimation of indirect network effects.
**Key readings:**
- Rysman, M. (2004). "Competition Between Networks: A Study of the Market for Yellow Pages." *Review of Economic Studies* 71(2): 483–512. **DOI: 10.1111/0034-6527.00512** — The foundational structural estimation of a two-sided market with indirect network effects.
- Lee, R. S. (2013). "Vertical Integration and Exclusivity in Platform and Two-Sided Markets." *American Economic Review* 103(7): 2960–3000. **DOI: 10.1257/aer.103.7.2960** — Structural model of platform competition (video-game consoles) with exclusive content; the modern platform-IO template.

**Methods/skills:** Estimating cross-side externalities; modeling adoption on both sides; platform counterfactuals.
**Central debate:** Identifying network effects vs. unobserved quality, and welfare effects of platform exclusivity.

### Week 14 — Consumer search & consideration; ML + structural; synthesis
**Subtopics:** Sequential vs. simultaneous search; consideration sets vs. full-information demand; search/switching costs; machine learning for high-dimensional demand, heterogeneity, and unstructured data; the structural-vs-design-based debate revisited.
**Key readings:**
- De los Santos, B., Hortaçsu, A., & Wildenbeest, M. R. (2012). "Testing Models of Consumer Search Using Data on Web Browsing and Purchasing Behavior." *American Economic Review* 102(6): 2955–2980. **DOI: 10.1257/aer.102.6.2955** — Uses clickstream data to discriminate between sequential and fixed-sample search; the canonical empirical search paper.
- Honka, E. (2014). "Quantifying Search and Switching Costs in the US Auto Insurance Industry." *RAND Journal of Economics* 45(4): 847–884. **DOI: 10.1111/1756-2171.12073** — A marketing-canon structural search-and-consideration model separating search costs from switching costs.
- Gentzkow, M., Kelly, B., & Taddy, M. (2019). "Text as Data." *Journal of Economic Literature* 57(3): 535–574. **DOI: 10.1257/jel.20181020** — The reference survey for bringing unstructured text into structural/empirical work; anchors the ML-meets-structural discussion.
- Wager, S. & Athey, S. (2018). "Estimation and Inference of Heterogeneous Treatment Effects Using Random Forests." *Journal of the American Statistical Association* 113(523): 1228–1242. **DOI: 10.1080/01621459.2017.1319839** — Causal/generalized forests for flexible heterogeneity; the entry point for ML-based heterogeneity in demand and policy.

**Methods/skills:** Estimating search models; consideration-set inference; integrating ML predictors/heterogeneity into structural objectives.
**Central debate:** Search vs. preferences vs. inattention as competing explanations for "limited" demand; and where ML complements vs. substitutes for structure.

---

## 3. Foundational vs. frontier marking

**Foundational (the canon every student must master):**
- Berry 1994 (inversion); BLP 1995 (random coefficients); Nevo 2000/2001 (applied BLP, markups, merger simulation).
- Bresnahan 1982 / Nevo 1998 (conduct identification).
- Rust 1987 (single-agent DDC); Hotz-Miller 1993 (CCP).
- Bresnahan-Reiss 1990/1991 (entry); Guerre-Perrigne-Vuong 2000 (auctions); Rysman 2004 (two-sided).
- Nevo 2000 practitioner's guide and Petrin 2002 (counterfactuals/new goods) as the teaching/applied backbone.

**Frontier / actively contested (methods still moving):**
- Berry-Haile 2014 (nonparametric identification) — reframes what BLP identifies.
- Dubé-Fox-Su 2012 (MPEC) and Conlon-Gortmaker 2020 (PyBLP best practices) — computation still evolving.
- Bajari-Benkard-Levin 2007, Pakes-Ostrovsky-Berry 2007, Aguirregabiria-Mira 2007/2010 (dynamic games & two-step estimation).
- Gowrisankaran-Rysman 2012, Hendel-Nevo 2006, Nair 2007 (dynamic demand).
- Lee 2013, Crawford-Yurukoglu 2012, Crawford-Lee-Whinston-Yurukoglu 2018 (platforms, bundling, vertical integration — DOI 10.3982/ecta14031, verified).
- De los Santos-Hortaçsu-Wildenbeest 2012, Honka 2014 (search/consideration).
- Gentzkow-Kelly-Taddy 2019, Wager-Athey 2018, Athey-Tibshirani-Wager 2019 (generalized random forests, *Annals of Statistics* 47(2); DOI 10.1214/18-aos1709, verified) — ML + structural frontier.

---

## 4. How the chapter should expand over time

1. **Demand frontier.** Add micro-BLP with consumer-level data and the newer PyBLP micro-moment workflow (Conlon-Gortmaker's 2023 micro-data follow-up, once it has a version-of-record DOI), plus nonparametric and "demand for characteristics" approaches building on Berry-Haile.
2. **Conduct testing renaissance.** The recent literature on testing firm conduct with instruments (the post-2020 "testing conduct" papers) deserves its own subsection once those version-of-record DOIs are confirmed; pair with Bresnahan 1982 as the historical anchor.
3. **Dynamic games at scale.** Add the moment-inequality and machine-learning approaches to large state spaces, and reinforcement-learning solution methods for dynamic oligopoly.
4. **Platforms / digital markets.** Expand Week 13 into two weeks as the platform-IO and digital-advertising auction literatures mature (sponsored search, ad auctions, recommendation systems).
5. **Search & inattention.** Track the growing marketing literature on consideration sets, rational inattention, and search with rich clickstream/CRM data.
6. **ML + structural.** This is the fastest-moving module: double-ML, causal forests, deep learning for demand, LLM/text-as-data for product attributes and reviews, and the methodological debate about combining flexible prediction with economic structure.
7. **Marketing-specific counterfactuals.** As the chapter is for a marketing book, deepen managerial counterfactuals: dynamic pricing, advertising and targeting, product-line and assortment, and CRM/personalization — each tied back to the estimated structural model.

When expanding, keep the §1 arc fixed (demand → supply/conduct → counterfactual; static then dynamic) and add depth within modules rather than new disconnected topics. Every new reading must carry a Crossref-verified version-of-record DOI before inclusion.

---

## 5. Sources consulted

**Note on method.** WebSearch was unavailable in this session, so live syllabus pages could not be crawled; the module structure is synthesized from the established field canon and the way the programs below are known to organize their EIO/structural seminars. All *readings* were independently DOI-verified against Crossref. The URLs below are the canonical public locations for these programs' graduate IO / structural-econometrics course materials and reading lists (the standard places this chapter's structure should be checked and updated against):

- **Yale (Berry / Haile), Econ 600-series IO and the "Tools for Structural IO" materials:** http://www.econ.yale.edu/~pah29/ (Philip Haile teaching/IO resources) and https://economics.yale.edu/
- **MIT (Berry-style demand, dynamic games), 14.271 / 14.272 Industrial Organization:** https://economics.mit.edu/
- **Chicago Booth (Dubé), Quantitative Marketing / structural demand:** https://www.chicagobooth.edu/faculty/directory/d/jean-pierre-dube
- **Stanford GSB / Economics (Athey, Bajari, Hortaçsu lineage), Empirical IO:** https://www.gsb.stanford.edu/ and https://economics.stanford.edu/
- **UC Berkeley (Haas / Economics), Empirical IO field sequence:** https://www.haas.berkeley.edu/ and https://economics.berkeley.edu/
- **Wisconsin (Gandhi / Nevo lineage), Empirical IO:** https://econ.wisc.edu/
- **NYU Stern (Conlon — PyBLP), Empirical IO / structural demand:** https://chrisconlon.github.io/ (PyBLP and grad-IO teaching materials)
- **UCLA Anderson / Economics (Honka — search & consideration), Quantitative Marketing:** https://www.anderson.ucla.edu/

These programs collectively define the canonical 13–14 week structure reflected above: demand (logit → nested → BLP) → estimation/computation → supply & conduct → counterfactuals → dynamic demand → dynamic discrete choice & games → entry → auctions → platforms → search → ML+structural.
