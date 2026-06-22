# Analytical / Game-Theoretic Modeling PhD Seminar — Canonical Full-Semester Structure

**Purpose.** A synthesized, full-semester (≈14-week) module structure for the doctoral seminar in **analytical / game-theoretic (economic-theory) modeling in marketing**, as taught in the quantitative-theory track of top programs (Stanford GSB, Chicago Booth, Berkeley Haas, Washington University Olin, Yale SOM, NYU Stern, Rochester Simon, Wharton, USC Marshall, UCLA Anderson, and peers). This is the design document for the book's `39-analytical-modeling-seminar` chapter.

**Date:** 2026-06-21
**Author:** Editorial research (Claude)

---

## IMPORTANT METHODOLOGICAL CAVEAT — READ FIRST

The task asked me to (a) use WebFetch/WebSearch to pull live public PhD syllabi and cite program + URL, and (b) verify every reading's DOI live against Crossref.

**In this environment WebSearch, WebFetch, and outbound `curl` (Bash network access) were all permission-denied** — confirmed by repeated attempts. I therefore could **not** retrieve any live syllabus page and could **not** issue live Crossref queries during this run. This matches the constraint already documented in `seminar-inventory.md`.

To honor the "NEVER invent — omit if unverifiable" rule without live verification, every reading cited below is drawn **only** from DOIs already verified against the Crossref version-of-record within this project's own research files (the `schools/*.md` set and the topical bibliographies), each of which states an explicit Crossref verification protocol and a 2026-06-21 verification date. I have re-used those verified BibTeX records verbatim and noted the provenance file for each. **No DOI in this document was invented, and no reading is cited whose DOI I could not confirm from an already-verified project file.** Where a canonical work belongs in the syllabus but is not present in a verified project file, it is named in prose **without** a DOI and flagged for later verification, rather than guessed.

Consequently:
- The **module structure, subtopics, methods, debates, and foundational/frontier marking** reflect the stable field canon and are the load-bearing deliverable. Confidence is HIGH.
- The **specific cited readings** are a verified subset, deliberately skewed toward the marketing-theory papers this project has already vetted. A web-enabled future run should (i) confirm the named-but-uncited canonical works (Moorthy, Spence/Nelson signaling, Jeuland–Shugan channel coordination, Lal promotions, Narasimhan–Coughlan salesforce, Rao–Bass dynamics, etc.) against Crossref and add their DOIs, and (ii) pull current course numbers/reading lists from the program URLs in the Sources section.

---

## 1. Semester arc

The analytical-modeling seminar trains students to *build and solve equilibrium models of marketing phenomena* — to take a managerial puzzle (Why do firms randomize discounts? When does a manufacturer want its retailers to compete? Why might personalization hurt the firm doing it?), strip it to a tractable game, solve for equilibrium, and extract a testable, often counterintuitive comparative-static result. The semester therefore opens with **tools** before **topics**: a fast, demanding refresher in non-cooperative game theory and the solution concepts the literature actually uses (Nash, subgame perfection, Perfect Bayesian Equilibrium, and the mechanism-design / information-design vocabulary). Students who arrive from a first-year microeconomic-theory sequence will find weeks 1–2 a consolidation; those from a more empirical background will find them the steepest climb of the course.

The middle of the semester walks the **canonical application areas in the order theory developed them**: price competition and promotions; vertical channels and distribution; advertising as persuasion and as information; product line, quality, and signaling; information, disclosure, and reviews; and salesforce / principal–agent contracting. This ordering is pedagogically deliberate — each block reuses and sharpens the tools introduced earlier (the promotions block motivates mixed strategies; channels motivate the double-marginalization and contracting machinery; signaling motivates PBE; salesforce motivates moral hazard and the revelation principle). Throughout, the seminar insists on the distinction between *modeling for insight* (the marketing-science tradition: simple models whose comparative statics overturn a managerial intuition) and *modeling for measurement* (the structural / empirical-IO tradition, which is the subject of the adjacent seminar). The recurring methodological refrain is Wernerfelt's and Moorthy's question: *what is the simplest model that produces this effect, and is the effect robust to the obvious extensions?*

The final third turns to **dynamics and frontier structure**: dynamic pricing and durable-goods / forward-looking-consumer models; behavior-based price discrimination and customer recognition; network effects, platforms, and two-sided markets; and behavioral industrial organization (models with reference dependence, limited attention, fairness, and naïveté on the consumer side). The course closes with a synthesis week on research craft — how to find a modeling question, how to know when a model is "done," how analytical and empirical work speak to each other, and how to referee theory. Assessment in these seminars is uniformly a **referee report + an original model proposal** (often a "prove a small new result or extend an existing model" problem set sequence), because the terminal skill is not reading theory but producing it.

---

## 2. Weekly modules (≈14 weeks)

Format per module: **Topic → subtopics → key readings (verified DOIs, with provenance + one-line why) → methods/skills → central debates.** "Foundational" vs. "frontier" is marked per module and, where useful, per reading. Readings named **without** a DOI are canonical works not present in a verified project file; they are flagged `[verify DOI]` for a future web-enabled pass and must not be cited until confirmed.

---

### Week 1 — Game-Theory Tools I: Static games, Nash, and the marketing-modeling stance
**Foundational.**

**Subtopics:** normal-form games and Nash equilibrium; pure vs. mixed strategies; best-response and reaction functions; Bertrand vs. Cournot as the two workhorses of marketing competition; the "modeling for insight" philosophy and what makes a good marketing-theory question.

**Key readings:**
- *Course-pack microeconomics/game-theory chapters* (Tirole, *The Theory of Industrial Organization*, ch. 0–5; Fudenberg & Tirole, *Game Theory*, selected). Books; standard background. `[verify DOI / use ISBN]`
- Moorthy, K. S., "Using Game Theory to Model Competition," *JMR* 1985. The field's manifesto for analytical marketing modeling. `[verify DOI]`

**Methods/skills:** writing down a game (players, actions, payoffs, timing, information); solving for pure- and mixed-strategy Nash; comparative statics.
**Central debates:** insight vs. realism; the role of functional-form assumptions; when a "result" is an artifact of the demand specification.

---

### Week 2 — Game-Theory Tools II: Dynamic games, information, and equilibrium refinement
**Foundational.**

**Subtopics:** extensive form and backward induction; subgame perfection; games of incomplete information and Bayesian Nash equilibrium; Perfect Bayesian Equilibrium and sequential equilibrium; signaling and belief refinements (intuitive criterion); a first look at mechanism/information design as the modern theory toolkit.

**Key readings:**
- Fudenberg & Tirole, *Game Theory* (dynamic games, PBE, refinements). Book. `[verify DOI / ISBN]`
- Iyer, G. and Singh, S., "Persuasion Contest: Disclosing Own and Rival Information," *Marketing Science* 41(4), 682–709, 2022. doi:10.1287/mksc.2021.1333. *(provenance: schools/berkeley.md)* — **frontier** illustration of how Bayesian-persuasion / information-design ideas enter competitive marketing; used here as the "where the tools are going" capstone reading.

**Methods/skills:** solving signaling games; constructing and refining off-path beliefs; reading an information-design argument.
**Central debates:** multiplicity of equilibria and the legitimacy of refinements; whether information design is a genuinely new toolkit or a repackaging of signaling.

---

### Week 3 — Price Competition and Differentiation
**Foundational.**

**Subtopics:** Bertrand paradox and its resolutions; horizontal differentiation (Hotelling / spatial competition) and the principle of (minimum/maximum) differentiation; vertical differentiation and quality; the strategic value of *softening* price competition.

**Key readings:**
- Hotelling, H., "Stability in Competition," *Economic Journal* 1929. The origin of spatial differentiation. `[verify DOI]`
- Iyer, G. and Kuksov, D., "Competition in Consumer Shopping Experience," *Marketing Science* 31(6), 913–933, 2012. doi:10.1287/mksc.1120.0734. *(provenance: schools/berkeley.md)* — **frontier**; shows when a non-price instrument (experience) differentiates vs. triggers escalation.
- Pazgal, A., Soberman, D., and Thomadsen, R., "Profit-Increasing Asymmetric Entry," *IJRM* 33(1), 107–122, 2016. doi:10.1016/j.ijresmar.2015.08.002. *(provenance: schools/washu.md)* — counterintuitive: entry can raise incumbent profit by relaxing price competition.

**Methods/skills:** solving location-then-price two-stage games; deriving differentiation as an equilibrium device.
**Central debates:** do firms differentiate to avoid competition or to match heterogeneous tastes? Is "minimum differentiation" robust?

---

### Week 4 — Promotions, Price Discrimination, and Mixed-Strategy Pricing
**Foundational (Narasimhan) → Frontier (price-matching, fairness).**

**Subtopics:** why competing firms randomize discounts (loyal vs. switcher segments); temporal price discrimination and Hi-Lo vs. EDLP; price-matching guarantees as discrimination vs. collusion; behavioral limits on price discrimination.

**Key readings:**
- Narasimhan, C., "Competitive Promotional Strategies," *Journal of Business* 61(4), 427–449, 1988. doi:10.1086/296442. *(provenance: schools/washu.md)* — **foundational**; the mixed-strategy rationale for randomized promotions.
- Chen, Y., Narasimhan, C., and Zhang, Z. J., "Consumer Heterogeneity and Competitive Price-Matching Guarantees," *Marketing Science* 20(3), 300–314, 2001. doi:10.1287/mksc.20.3.300.9766. *(provenance: schools/washu.md)* — reframes a common practice as price discrimination, not collusion.
- Feinberg, F. M., Krishna, A., and Zhang, Z. J., "Do We Care What Others Get? A Behaviorist Approach to Targeted Promotions," *JMR* 39(3), 277–291, 2002. doi:10.1509/jmkr.39.3.277.19108. *(provenance: schools/wharton.md)* — **frontier**; social comparison/fairness constrains targeted discounting.
- Varian, "A Model of Sales," *AER* 1980; Lal, R., promotions papers. `[verify DOI]`

**Methods/skills:** constructing mixed-strategy equilibria; segment-based price-discrimination models.
**Central debates:** are promotions discrimination, inventory/competition artifacts, or behavioral cues? Do price-match guarantees raise or lower prices?

---

### Week 5 — Channels and Distribution I: Coordination and Double Marginalization
**Foundational.**

**Subtopics:** double marginalization and channel coordination; two-part tariffs, quantity discounts, and resale price maintenance as coordinating contracts; coordinating channels under price *and* non-price competition; manufacturer control of retail competition.

**Key readings:**
- Jeuland, A. P. and Shugan, S. M., "Managing Channel Profits," *Marketing Science* 1983. The foundational channel-coordination paper. `[verify DOI]`
- Iyer, G., "Coordinating Channels Under Price and Nonprice Competition," *Marketing Science* 17(4), 338–355, 1998. doi:10.1287/mksc.17.4.338. *(provenance: schools/berkeley.md)* — **foundational** for the multi-instrument channel result: the optimal degree of retail competition differs across price and service.
- Moorthy, K. S., "Managing Channel Profits: Comment," *Marketing Science* 1987. `[verify DOI]`

**Methods/skills:** vertical-contracting models; designing wholesale contracts to align incentives; manufacturer-Stackelberg leadership.
**Central debates:** which contractual instruments achieve coordination, and why is coordination so often *not* observed?

---

### Week 6 — Channels and Distribution II: Power, Conflict, and Retail-Media Frontier
**Foundational → Frontier.**

**Subtopics:** channel power and bargaining; vertical restraints and exclusivity; private labels and the manufacturer–retailer game; the modern "retail media" / in-store-media turn.

**Key readings:**
- Dukes, A. and Liu, Y., "In-Store Media and Distribution Channel Coordination," *Marketing Science* 29(1), 94–107, 2010. doi:10.1287/mksc.1080.0483. *(provenance: schools/usc.md)* — **frontier**; in-store-media revenue alters retailer incentives and can mitigate double marginalization (an early theory of retail media networks).
- Cosguner, K., Chan, T. Y., and Seetharaman, P. B., "Dynamic Pricing in a Distribution Channel in the Presence of Switching Costs," *Management Science* 64(3), 1212–1229, 2018. doi:10.1287/mnsc.2016.2649. *(provenance: schools/washu.md)* — bridges channels and dynamics: inertial demand lets the retailer raise margins.
- McGuire & Staelin, "An Industry Equilibrium Analysis of Downstream Vertical Integration," *Marketing Science* 1983; Iyer–Villas-Boas bargaining work. `[verify DOI]`

**Methods/skills:** bargaining solutions in vertical settings; dynamic channel pricing.
**Central debates:** who holds channel power and how is it modeled (Nash bargaining vs. Stackelberg)? Is retail media a coordination device or a rent-extraction tool?

---

### Week 7 — Advertising I: Persuasion, Information, and Targeting
**Foundational (Nelson informative/persuasive) → Frontier (targeting, cheap talk).**

**Subtopics:** advertising as persuasion vs. information vs. complement; informative advertising and price competition; the *targeting* of advertising and its effect on differentiation; advertising as (cheap) talk.

**Key readings:**
- Iyer, G., Soberman, D., and Villas-Boas, J. M., "The Targeting of Advertising," *Marketing Science* 24(3), 461–476, 2005. doi:10.1287/mksc.1050.0117. *(provenance: schools/berkeley.md)* — **foundational** modern result: advertising less to switchers raises differentiation and softens price competition.
- Gardete, P. M., "Cheap-Talk Advertising and Misrepresentation in Vertically Differentiated Markets," *Marketing Science* 32(4), 609–621, 2013. doi:10.1287/mksc.2013.0772. *(provenance: schools/stanford-mit-kellogg.md)* — when unverifiable quality claims can still credibly transmit information.
- Grossman & Shapiro, "Informative Advertising with Differentiated Products," *RES* 1984; Butters, "Equilibrium Distributions of Sales and Advertising Prices," *RES* 1977. `[verify DOI]`

**Methods/skills:** equilibrium advertising-intensity models; cheap-talk and verifiable-disclosure games.
**Central debates:** is advertising informative, persuasive, or a complementary good? When does targeting intensify vs. soften competition?

---

### Week 8 — Product Line, Quality, and Signaling
**Foundational.**

**Subtopics:** product-line design and self-selection (second-degree price discrimination / damaged goods); quality choice; price and advertising as *signals* of quality; product variety with consumer evaluation costs.

**Key readings:**
- Villas-Boas, J. M., "Product Variety and Endogenous Pricing with Evaluation Costs," *Management Science* 55(8), 1338–1346, 2009. doi:10.1287/mnsc.1090.1024. *(provenance: schools/berkeley.md)* — **foundational/frontier**; fewer products can commit the firm not to extract all surplus when evaluation is costly.
- Moorthy, K. S., "Market Segmentation, Self-Selection, and Product Line Design," *Marketing Science* 1984; Moorthy & Png, "Market Segmentation, Cannibalization, and the Timing of Product Introductions," *Mgmt Sci* 1992. `[verify DOI]`
- Spence, "Job Market Signaling," *QJE* 1973; Milgrom & Roberts, "Price and Advertising Signals of Product Quality," *JPE* 1986; Nelson, "Information and Consumer Behavior," *JPE* 1970 (search vs. experience goods). `[verify DOI]`

**Methods/skills:** mechanism-design / self-selection (incentive-compatibility, single-crossing); separating vs. pooling signaling equilibria.
**Central debates:** when is dissipative signaling (e.g., uninformative ad spend) credible? How fine should a product line be, and is cannibalization a bug or a feature?

---

### Week 9 — Information, Disclosure, and Online Reviews
**Frontier (with foundational disclosure roots).**

**Subtopics:** verifiable disclosure and unraveling; strategic / selective disclosure by firms and media; manipulation of word of mouth and reviews; information design / Bayesian persuasion in markets.

**Key readings:**
- Mayzlin, D., "Promotional Chat on the Internet," *Marketing Science* 25(2), 155–163, 2006. doi:10.1287/mksc.1050.0137. *(provenance: schools/usc.md)* — **foundational** theory of firms posting disguised promotional chat; rational consumers partially undo it.
- Zhu, Y. and Dukes, A., "Selective Reporting of Factual Content by Commercial Media," *JMR* 52(1), 56–76, 2015. doi:10.1509/jmr.12.0379. *(provenance: schools/usc.md)* — endogenous selective (not false) reporting by ad-funded media.
- Iyer, G. and Singh, S., "Persuasion Contest: Disclosing Own and Rival Information," *Marketing Science* 41(4), 682–709, 2022. doi:10.1287/mksc.2021.1333. *(provenance: schools/berkeley.md)* — **frontier** competitive information design.
- Milgrom, "Good News and Bad News" (unraveling); Kamenica & Gentzkow, "Bayesian Persuasion," *AER* 2011. `[verify DOI]`

**Methods/skills:** disclosure/unraveling arguments; persuasion as choice of a signal structure.
**Central debates:** does information unravel in equilibrium? When can a sender benefit from committing to a noisy signal?

---

### Week 10 — Salesforce, Incentives, and Principal–Agent Theory
**Foundational (Basu–Lal–Srinivasan–Staelin) → Frontier (structural compensation).**

**Subtopics:** moral hazard and optimal sales-compensation contracts; quotas, commissions, and bonuses; multitasking and contract uniformity; the "estimate-then-optimize-then-implement" structural turn.

**Key readings:**
- Misra, S. and Nair, H. S., "A Structural Model of Sales-Force Compensation Dynamics: Estimation and Field Implementation," *QME* 9(3), 211–257, 2011. doi:10.1007/s11129-011-9096-1. *(provenance: schools/chicago.md)* — **frontier**; recovers agents' dynamic response to nonlinear incentives and redesigns the plan in the field.
- Daljord, Ø., Misra, S., and Nair, H. S., "Homogeneous Contracts for Heterogeneous Agents: Aligning Sales Force Composition and Compensation," *JMR* 53(2), 161–182, 2016. doi:10.1509/jmr.14.0018. *(provenance: schools/chicago.md)* — why uniform contracts can be an equilibrium given selection.
- Basu, Lal, Srinivasan & Staelin, "Salesforce Compensation Plans: An Agency Theoretic Perspective," *Marketing Science* 1985; Holmström, "Moral Hazard and Observability," *Bell J. Econ.* 1979. `[verify DOI]`

**Methods/skills:** principal–agent contracting (IC and IR constraints); multitasking; bridging theory to estimable dynamic models.
**Central debates:** how rich should real contracts be relative to theory's predictions? Why are observed plans simpler than the optimum?

---

### Week 11 — Dynamic Models I: Durable Goods, Forward-Looking Consumers, and Learning
**Foundational (Coase, Bass) → Frontier (consumer learning, dynamic pricing).**

**Subtopics:** the Coase conjecture and durable-goods pricing; intertemporal price discrimination with forward-looking consumers; new-product diffusion and dynamic pricing; consumer learning and endogenous loyalty.

**Key readings:**
- Villas-Boas, J. M., "Consumer Learning, Brand Loyalty, and Competition," *Marketing Science* 23(1), 134–145, 2004. doi:10.1287/mksc.1030.0044. *(provenance: schools/berkeley.md)* — **foundational** theory: forward-looking marginal consumers can be *less* price-sensitive than myopic ones.
- Nair, H., "Intertemporal Price Discrimination with Forward-Looking Consumers: Application to the US Market for Console Video-Games," *QME* 5(3), 239–292, 2007. doi:10.1007/s11129-007-9026-4. *(provenance: schools/stanford-mit-kellogg.md)* — **frontier** structural counterpart; quantifies declining-price paths for durables.
- Coase, "Durability and Monopoly," *J. Law & Econ.* 1972; Bass, "A New Product Growth for Model Consumer Durables," *Mgmt Sci* 1969. `[verify DOI]`

**Methods/skills:** dynamic optimization / Markov-perfect equilibrium; the difference between open-loop and closed-loop strategies.
**Central debates:** how binding is the Coase conjecture with commitment devices? Myopic vs. rational-expectations consumers in pricing models.

---

### Week 12 — Dynamic Models II: Behavior-Based Price Discrimination and Customer Recognition
**Frontier.**

**Subtopics:** customer recognition and price cycles; behavior-based price discrimination (BBPD); poaching vs. retention; behavior-based *advertising*; the strategic perils of personalization.

**Key readings:**
- Villas-Boas, J. M., "Price Cycles in Markets with Customer Recognition," *RAND J. Econ.* 35(3), 486–501, 2004. doi:10.2307/1593704. *(provenance: schools/berkeley.md)* — **foundational** for endogenous price cycles over the customer relationship.
- Zhang, J., "The Perils of Behavior-Based Personalization," *Marketing Science* 30(1), 170–186, 2011. doi:10.1287/mksc.1100.0607. *(provenance: schools/stanford-mit-kellogg.md)* — **frontier**; personalization can intensify competition and erode profits.
- Chen, Y., Narasimhan, C., and Zhang, Z. J., "Individual Marketing with Imperfect Targetability," *Marketing Science* 20(1), 23–41, 2001. doi:10.1287/mksc.20.1.23.10201. *(provenance: schools/wharton.md)* — when better targeting is "win-win" vs. cut-throat.
- Shen, Q. and Villas-Boas, J. M., "Behavior-Based Advertising," *Management Science* 64(5), 2047–2064, 2018. doi:10.1287/mnsc.2016.2719. *(provenance: schools/berkeley.md)* — BBPD's advertising analogue.

**Methods/skills:** two-period (and infinite-horizon) recognition games; mapping privacy/data regimes to equilibrium prices.
**Central debates:** does data-driven targeting help or hurt the firms that use it? What is the welfare and privacy verdict on BBPD?

---

### Week 13 — Network Effects, Platforms, and Two-Sided Markets
**Frontier (with foundational network-effects roots).**

**Subtopics:** direct and indirect network effects; tipping and winner-take-all dynamics; two-sided pricing and the platform-design problem; commercial-network formation.

**Key readings:**
- Dubé, J.-P., Hitsch, G. J., and Chintagunta, P. K., "Tipping and Concentration in Markets with Indirect Network Effects," *Marketing Science* 29(2), 216–249, 2010. doi:10.1287/mksc.1090.0541. *(provenance: schools/chicago.md)* — **frontier**; measures tipping from indirect network effects (video-game consoles).
- Katona, Z. and Sarvary, M., "Network Formation and the Structure of the Commercial World Wide Web," *Marketing Science* 27(5), 764–778, 2008. doi:10.1287/mksc.1070.0349. *(provenance: schools/berkeley.md)* — equilibrium link-buying explains web specialization.
- Wilbur, K. C., "A Two-Sided, Empirical Model of Television Advertising and Viewing Markets," *Marketing Science* 27(3), 2008. doi:10.1287/mksc.1070.0303. *(provenance: schools/ucsd.md)* — two-sided media-market modeling benchmark.
- Rochet & Tirole, "Platform Competition in Two-Sided Markets," *JEEA* 2003; Katz & Shapiro, "Network Externalities, Competition, and Compatibility," *AER* 1985; Parker & Van Alstyne. `[verify DOI]`

**Methods/skills:** two-sided pricing models; coordination games and tipping; network-formation equilibria.
**Central debates:** when do markets tip? Who should subsidize which side, and does platform competition discipline pricing?

---

### Week 14 — Behavioral Industrial Organization + Research Craft (Synthesis)
**Frontier.**

**Subtopics:** models with non-standard consumers — reference dependence, fairness, limited attention, naïveté/present bias; how behavioral assumptions change equilibrium predictions; **research craft**: finding a question, knowing when a model is "done," theory ↔ empirics, and refereeing.

**Key readings:**
- Zhu, Y. and Dukes, A., "Prominent Attributes Under Limited Attention," *Marketing Science* 36(5), 683–698, 2017. doi:10.1287/mksc.2017.1037. *(provenance: schools/usc.md)* — **frontier**; firms make attributes prominent to exploit limited attention, reshaping price competition.
- Misra, K., Schwartz, E. M., and Abernethy, J., "Dynamic Online Pricing with Incomplete Information Using Multiarmed Bandit Experiments," *Marketing Science* 38(2), 2019. doi:10.1287/mksc.2018.1129. *(provenance: schools/ucsd.md)* — **frontier**; learning-and-earning pricing where the firm, not just the consumer, is the learner.
- Dubé, J.-P. and Misra, S., "Personalized Pricing and Consumer Welfare," *Journal of Political Economy* 131(1), 131–189, 2023. doi:10.1086/720793. *(provenance: schools/chicago.md)* — **frontier** capstone tying theory, ML, and welfare.
- DellaVigna, "Psychology and Economics: Evidence from the Field," *JEL* 2009; Heidhues & Kőszegi behavioral-IO survey. `[verify DOI]`

**Methods/skills:** embedding behavioral primitives in equilibrium models; reading and writing a referee report; constructing an original modeling proposal.
**Central debates:** do behavioral models *predict* better or merely *rationalize*? How should analytical and empirical marketing inform each other?

---

## 3. Foundational vs. frontier — summary map

| Block | Foundational core (the "must-know") | Frontier extensions (active research) |
|---|---|---|
| Tools (Wk 1–2) | Nash, SPE, PBE, signaling refinements | Bayesian persuasion / information design |
| Pricing & promotions (Wk 3–4) | Hotelling differentiation; Narasimhan mixed-strategy promotions | fairness/social-comparison limits; price-matching as discrimination |
| Channels (Wk 5–6) | Jeuland–Shugan/Iyer coordination; double marginalization | retail media; dynamic channel pricing with switching costs |
| Advertising (Wk 7) | Iyer–Soberman–Villas-Boas targeting; informative-advertising models | cheap-talk / disclosure advertising |
| Product line & signaling (Wk 8) | Moorthy self-selection; Milgrom–Roberts/Spence signaling | endogenous variety with evaluation costs |
| Information & disclosure (Wk 9) | unraveling; Mayzlin promotional chat | competitive information design |
| Salesforce / P-A (Wk 10) | Basu–Lal–Srinivasan–Staelin; Holmström | structural compensation, field implementation |
| Dynamics (Wk 11–12) | Coase, Bass; Villas-Boas learning & price cycles | forward-looking-consumer structural models; BBPD & personalization perils |
| Platforms (Wk 13) | Katz–Shapiro / Rochet–Tirole network effects | empirical tipping; two-sided media models |
| Behavioral IO (Wk 14) | reference dependence, limited attention | prominence/attention competition; bandit pricing; personalized-pricing welfare |

**Reading the map:** A student must be fluent in the left column to pass qualifying exams; the right column is where dissertations are written. The seminar's value-add over a pure economics IO course is the marketing-specific frontier — channels, salesforce, targeting, reviews/WOM, and the personalization/privacy interface — where marketing scholars, not economists, set the agenda.

---

## 4. How the chapter should expand over time

1. **Verify and add the named-but-uncited canon (highest priority).** A web-enabled pass should confirm Crossref DOIs for the works currently flagged `[verify DOI]` — Moorthy (1984, 1985, 1987), Jeuland–Shugan (1983), McGuire–Staelin (1983), Basu–Lal–Srinivasan–Staelin (1985), Milgrom–Roberts (1986), Spence (1973), Nelson (1970), Coase (1972), Bass (1969), Varian (1980), Grossman–Shapiro (1984), Butters (1977), Kamenica–Gentzkow (2011), Katz–Shapiro (1985), Rochet–Tirole (2003), and Holmström (1979) — then promote them from prose to cited entries. These are the textbook spine of the seminar; their current absence is purely an artifact of this run's lack of web/Crossref access, not a judgment that they are peripheral.
2. **Pull real syllabi.** When WebFetch is available, fetch the program pages in Section 5 and any instructor-posted reading lists, and reconcile this canonical structure against actual week-by-week orderings (e.g., Stanford's and Berkeley's analytical seminars, Rochester Simon's economics-of-marketing sequence). Cite program + URL per the original protocol.
3. **Track the frontier modules, which move fastest.** Information design, behavioral IO, platforms/two-sided markets, and the personalization–privacy interface should be refreshed every revision; expect 2–3 new version-of-record papers per area per cycle.
4. **Consider promoting two modules to their own chapters** if space allows, mirroring the gap analysis in `seminar-inventory.md`: (a) **Platforms / two-sided markets** and (b) **the analytics–theory bridge** (bandit pricing, ML-driven personalized pricing) are both currently embedded here but are large enough to stand alone.
5. **Add a methods appendix** — a compact reference on solution concepts, the revelation principle, single-crossing/IC, and Markov-perfect equilibrium — so the chapter is usable by students entering from the empirical or behavioral tracks.
6. **Maintain the foundational/frontier marking** as the load-bearing pedagogical device; re-classify papers from "frontier" to "foundational" only once they are standard qualifying-exam material.

---

## 5. Sources consulted

**Project-internal verified-bibliography files** (each states an explicit Crossref version-of-record verification protocol, verified 2026-06-21; all cited DOIs above were taken verbatim from these):
- `.editorial/research/schools/berkeley.md` (Villas-Boas, Iyer, Katona, Shen–Villas-Boas)
- `.editorial/research/schools/chicago.md` (Dubé, Hitsch, Misra, Nair; tipping; personalized pricing)
- `.editorial/research/schools/washu.md` (Narasimhan; Chen–Narasimhan–Zhang; Pazgal–Soberman–Thomadsen; Cosguner–Chan–Seetharaman)
- `.editorial/research/schools/stanford-mit-kellogg.md` (Gardete; Nair; Zhang)
- `.editorial/research/schools/usc.md` (Mayzlin; Dukes–Liu; Zhu–Dukes)
- `.editorial/research/schools/wharton.md` (Chen–Narasimhan–Zhang; Feinberg–Krishna–Zhang; Iyengar multipart pricing)
- `.editorial/research/schools/ucsd.md` (Wilbur; Misra–Schwartz–Abernethy bandit pricing)
- `.editorial/research/schools/columbia-nyu-duke-harvard.md`, `ucla.md`, `michigan.md` (cross-checked; primarily empirical/behavioral, fewer analytical-theory entries)
- `.editorial/research/seminar-inventory.md` (canonical track taxonomy; program URL list; web-access caveat)

**Program landing pages (NOT fetched in this run — web access denied; listed as pointers for a web-enabled verification pass; no course numbers or quotes are attributed to them):**
- Stanford GSB — https://www.gsb.stanford.edu/programs/phd/fields/marketing
- Chicago Booth — https://www.chicagobooth.edu/phd/academic-experience/dissertation-areas/marketing
- Berkeley Haas — https://haas.berkeley.edu/phd/fields-of-study/marketing/
- Wharton (Penn) — https://marketing.wharton.upenn.edu/programs/phd/
- MIT Sloan — https://mitsloan.mit.edu/phd/program-overview/marketing
- Columbia Business School — https://students.business.columbia.edu/phd/academics/marketing
- NYU Stern — https://www.stern.nyu.edu/programs-admissions/phd/academics/marketing
- Northwestern Kellogg — https://www.kellogg.northwestern.edu/programs/phd/academics/marketing.aspx
- Duke Fuqua — https://www.fuqua.duke.edu/programs/phd/fields-study/marketing
- Harvard Business School — https://www.hbs.edu/doctoral/areas-of-study/marketing/
- Michigan Ross — https://michiganross.umich.edu/programs/phd/academics/marketing
- UCLA Anderson — https://www.anderson.ucla.edu/phd/academics/marketing
- USC Marshall — https://www.marshall.usc.edu/programs/phd-program/areas-study/marketing
- UT Austin (McCombs) — https://www.mccombs.utexas.edu/phd/academics/marketing/
- Maryland (Smith) — https://www.rhsmith.umd.edu/programs/phd/fields-study/marketing

*Yale SOM, Rochester Simon, and Washington University Olin marketing-PhD landing pages were named in the task but are not in the project's verified URL list; a web-enabled pass should add and confirm them (Olin's analytical/theory faculty — Narasimhan, Chan, Thomadsen — are already represented above via `schools/washu.md`).*

---

## 6. Verification status

- **Every DOI above is a Crossref version-of-record DOI re-used verbatim from a project file that documents its own Crossref verification (2026-06-21).** No DOI was invented in this run.
- **No live Crossref or syllabus fetch was possible** (WebSearch/WebFetch/curl denied); the canonical structure rests on stable field knowledge, and the cited-reading subset is intentionally limited to already-verified items.
- **Items flagged `[verify DOI]`** are canonical works named in prose only and must not be cited until a published DOI is confirmed.
