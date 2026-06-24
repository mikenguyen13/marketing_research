# Theories in Marketing Scholarship — A Citation-Verified Map

**Purpose.** A comprehensive, theory-grounded reference for weaving established and
emerging theory into the construct-pillar and substantive-domain chapters of
*Marketing Research: A Technical and Academic Treatment*. For each theory: a crisp
claim, seminal reference(s) with **Crossref-verified DOIs** (or a flag where the
canonical source is a monograph without a DOI), the marketing constructs/phenomena
it explains, and the chapters where it should be developed.

**House rules honored here.**

- Every DOI below was verified live against the Crossref REST API
  (`api.crossref.org`). The full ledger is in §6.
- Classic **monographs** (Kahneman *Thinking, Fast and Slow*; Thaler & Sunstein
  *Nudge*; Festinger *A Theory of Cognitive Dissonance*; Rogers *Diffusion of
  Innovations*; Cialdini *Influence*; Mullainathan & Shafir *Scarcity*) generally
  have no article-level DOI and are **flagged in §7** rather than assigned an
  invented identifier. Where a journal-article statement of the same idea exists,
  it is cited instead/in addition.
- **Behavioral economics is the priority strand** and is given an expanded deep
  treatment in §2, mapped across pricing, nudges, satisfaction, advertising, sales,
  gaming, virality, service, and health.
- This file does not edit any `.qmd` or `.bib`. Bib keys already present in the
  project are noted in brackets where known (e.g. `[bib: tversky1974]`) so the
  editor can wire citations without creating duplicates.

Chapter numbers refer to the current `_quarto.yml` ordering (Constructs:
02–03; Substantive: 04–22; Methodology: 11, 23–35, 47, 50; Multimodal: 07, 34, 49;
Seminars: 36–40, 48, 51).

---

## 1. Theory catalog, organized by disciplinary origin

### 1.A Behavioral economics & judgment / decision-making (priority strand — see §2 for the deep treatment)

| Theory | One-line claim | Seminal reference(s) — verified DOI | Constructs / phenomena it explains |
|---|---|---|---|
| **Prospect theory** | People evaluate outcomes as gains/losses from a reference point with a concave-gain/convex-loss value function and probability weighting, not as final-wealth utility. | Kahneman & Tversky 1979, *Econometrica* — `10.2307/1914185` `[bib: present? check]`; Kahneman & Tversky 1984, *Am. Psychol.* — `10.1037/0003-066x.39.4.341` `[bib: tversky1981 is the framing paper]` | Reference dependence in price/quality judgments; risk attitudes toward promotions, warranties, lotteries; framing of message valence |
| **Loss aversion / reference dependence** | Losses loom larger than equivalent gains (~2×); choices are reference-dependent even when riskless. | Tversky & Kahneman 1991, *QJE* — `10.2307/2937956`; Kahneman, Knetsch & Thaler 1991 (endowment effect), *JEP* — `10.1257/jep.5.1.193` | Endowment effect, status-quo bias, price-increase asymmetry, churn, free-trial stickiness |
| **Framing effects** | Logically equivalent descriptions of the same options yield systematically different choices. | Tversky & Kahneman 1981, *Science* — `10.1126/science.7455683` `[bib: tversky1981]`; Kahneman & Tversky 1984 — `10.1037/0003-066x.39.4.341` | Message framing (gain/loss), attribute framing (75% lean vs 25% fat), goal framing in health/advertising |
| **Mental accounting** | Consumers code, categorize, and evaluate financial outcomes in separate mental "accounts," violating fungibility. | Thaler 1985, *Marketing Science* — `10.1287/mksc.4.3.199`; Thaler 1999, *J. Behav. Dec. Making* — `10.1002/(sici)1099-0771(199909)12:3<183::aid-bdm318>3.0.co;2-f` `[bib: thaler1985]` | Transaction utility, payment decoupling, bundling/partitioned pricing, sunk-cost effects, spending categories |
| **Anchoring & heuristics (availability, representativeness, anchoring-adjustment)** | Judgments are formed by anchoring on an initial value and insufficiently adjusting, and by substituting easy heuristics for hard probability questions. | Tversky & Kahneman 1974, *Science* — `10.1126/science.185.4157.1124` `[bib: tversky1974]` | Reference prices, willingness-to-pay elicitation, list-price/MSRP effects, estimation biases in surveys |
| **Endowment effect** | Mere ownership raises an item's perceived value; WTA > WTP. | Kahneman, Knetsch & Thaler 1991, *JEP* — `10.1257/jep.5.1.193` | Free trials, "try-before-you-buy," psychological ownership in pricing, trade-in valuation |
| **Hyperbolic discounting / present bias** | Discount rates are higher in the near term than the long term, producing dynamically inconsistent, present-biased choices. | Laibson 1997, *QJE* — `10.1162/003355397555253` | Subscription inertia, impulse purchase, commitment devices, health/savings behavior, free-trial-to-paid conversion |
| **Salience theory** | Decision weights are distorted toward attributes/states that stand out in the choice context. | Bordalo, Gennaioli & Shleifer 2013, *J. Polit. Econ.* — `10.1086/673885` | Context effects, decoy/attraction effects, attention-based pricing, assortment design |
| **Choice architecture, defaults & nudges** | The way options are arranged (defaults, order, friction) predictably shifts choice without changing incentives. | Johnson & Goldstein 2003, *Science* (defaults) — `10.1126/science.1091721`; Thaler & Sunstein *Nudge* — **monograph, no DOI (flag §7)** | Opt-in vs opt-out enrollment, default plans, organ-donation analogues, e-commerce checkout defaults |
| **Sludge** | Frictions that impede welfare-enhancing behavior — the dark mirror of nudges. | Thaler 2018, *Science* ("Nudge, not sludge") — `10.1126/science.aau9241` | Cancellation friction, dark patterns, subscription traps, claims/rebate friction |
| **Nudge evidence / behavioral public policy** | Field nudges produce meaningful, cost-effective behavior change at scale (with debate on effect sizes). | Benartzi et al. 2017, *Psychol. Sci.* — `10.1177/0956797617702501` | Default enrollment, reminders, social-norm messaging, health and savings interventions |
| **Scarcity (cognitive-load theory of poverty)** | Scarcity captures attention and taxes cognitive bandwidth, degrading downstream decisions. | Mani, Mullainathan, Shafir & Zhao 2013, *Science* — `10.1126/science.1238041`; Mullainathan & Shafir *Scarcity* — **monograph, no DOI (flag §7)** | Decision quality under budget/time pressure, low-income consumer behavior, "deal" urgency, attention economics |
| **Dual-process / System 1–2** | Two modes of cognition — fast/automatic vs slow/deliberate — jointly drive judgment. | Kahneman *Thinking, Fast and Slow* — **monograph, no DOI (flag §7)**; see also ELM (1.B) and HSM as marketing operationalizations | Heuristic vs systematic processing of ads, impulse vs planned purchase, affect-rich vs cognitive appeals |

### 1.B Cognitive & social psychology

| Theory | One-line claim | Seminal reference — verified DOI | Constructs / phenomena |
|---|---|---|---|
| **Elaboration Likelihood Model (ELM)** | Persuasion travels a central (argument-quality) or peripheral (cue-based) route depending on motivation and ability to elaborate. | Petty & Cacioppo 1986, *Communication and Persuasion* (Springer) — `10.1007/978-1-4612-4964-1_1` (book; see §7 note) `[bib: petty1986]` | Ad processing, source vs argument effects, involvement, endorser cues |
| **Theory of Reasoned Action / Planned Behavior (TRA/TPB)** | Behavior follows intention, which follows attitudes, subjective norms, and perceived behavioral control. | Ajzen 1991, *Org. Behav. Hum. Dec. Proc.* — `10.1016/0749-5978(91)90020-t` | Intention–behavior link, adoption, health/compliance behavior, survey predictive models |
| **Cognitive dissonance** | Inconsistency among cognitions creates aversive arousal that motivates attitude/behavior change. | Festinger *A Theory of Cognitive Dissonance* — **monograph, no DOI (flag §7)** `[bib: festinger1957]` | Post-purchase rationalization, buyer's remorse, satisfaction, choice justification |
| **Attribution theory** | People infer causes (internal vs external) of outcomes and others' behavior, biased toward dispositional causes. | Jones & Harris 1967, *J. Exp. Soc. Psychol.* — `10.1016/0022-1031(67)90034-0`; Kelley/Weiner — see §7 (monograph/edited-volume sources) | Service failure/recovery blame, complaint behavior, endorser credibility, review interpretation |
| **Mere exposure** | Repeated exposure to a stimulus increases liking, even without recognition. | Zajonc 1968, *J. Pers. Soc. Psychol.* — `10.1037/h0025848` `[bib: zajonc1980]` | Ad repetition/wear-in, brand familiarity, logo/jingle effects |
| **Construal Level Theory (CLT)** | Psychological distance (temporal, spatial, social, hypothetical) shifts mental representation from concrete (low-level) to abstract (high-level). | Trope & Liberman 2003, *Psychol. Rev.* — `10.1037/0033-295x.110.3.403` `[bib: trope2000]` | Temporal framing of promotions, near/far messaging, why-vs-how appeals, pre-order behavior |
| **Regulatory focus** | Promotion focus pursues gains/ideals; prevention focus avoids losses/oughts; fit increases persuasion. | Higgins 1997, *Am. Psychol.* — `10.1037/0003-066x.52.12.1280` | Message-frame fit, brand positioning, goal-congruent advertising, risk appeals |
| **Self-determination theory (intrinsic vs extrinsic motivation)** | Autonomy, competence, and relatedness drive intrinsic motivation; extrinsic rewards can crowd it out. | Ryan & Deci 2000, *Am. Psychol.* — `10.1037/0003-066x.55.1.68` | Loyalty-program design, gamification, engagement, reward crowding-out |

### 1.C Economics / information

| Theory | One-line claim | Seminal reference — verified DOI | Constructs / phenomena |
|---|---|---|---|
| **Signaling theory** | Under asymmetric information, informed parties send costly, hard-to-fake signals of unobservable quality. | Spence 1973, *QJE* ("Job Market Signaling") — `10.2307/1882010` `[bib: spence1973]` | Advertising-as-signal, warranties, price-as-quality-cue, brand as quality bond, money-back guarantees |
| **Transaction cost economics (TCE)** | Governance choice (market vs hierarchy) minimizes transaction costs arising from asset specificity, uncertainty, and opportunism. | Williamson 1981, *Am. J. Sociol.* — `10.1086/227496` | Channel/distribution governance, make-vs-buy, sales-force integration, outsourcing |
| **Reference-price / behavioral-pricing economics** | Observed prices are judged against an internal/external reference price, generating asymmetric demand response. | Kalyanaram & Winer 1995, *Marketing Science* — `10.1287/mksc.14.3.g161` | Price perception, promotion response asymmetry, price-fairness, dynamic pricing |
| **Random utility / discrete choice** | Choice probabilities derive from utility maximization with a random component; basis of logit/probit demand. | (Methodological; see Ch. 50 choice modeling. McFadden monograph/edited-volume — §7) | Brand choice, conjoint/WTP, demand estimation, market-share models |
| **Agency theory** | Principal–agent goal conflict plus information asymmetry necessitates monitoring or incentive alignment. | (Classic statements often in edited volumes — §7; see TCE and signaling as cited substitutes) | Sales-force compensation, channel incentives, franchising, influencer contracts |

### 1.D Sociology / relational / network

| Theory | One-line claim | Seminal reference — verified DOI | Constructs / phenomena |
|---|---|---|---|
| **Commitment–trust theory of relationship marketing** | Relationship commitment and trust are the mediating variables that make cooperative exchange succeed. | Morgan & Hunt 1994, *J. Marketing* — `10.1177/002224299405800302` | Relationship quality, loyalty, B2B partnerships, retention/CLV antecedents |
| **Organizational trust (integrative model)** | Trust = ability + benevolence + integrity, moderated by the truster's propensity. | Mayer, Davis & Schoorman 1995, *AMR* — `10.2307/258792` | Trust in firms/platforms/algorithms, privacy trade-offs, e-commerce trust |
| **Diffusion of innovations** | New products spread through a population via communication channels over time among adopter categories. | Rogers *Diffusion of Innovations* — **monograph, no DOI (flag §7)**; **Bass 1969 formal model**, *Management Science* — `10.1287/mnsc.15.5.215` `[bib: Bass_1969]` | Adoption curves, innovators/imitators, new-product forecasting, network effects |
| **Strength of weak ties / network theory** | Novel information flows disproportionately through weak (bridging) ties rather than strong ones. | Granovetter 1973, *Am. J. Sociol.* — `10.1086/225469` `[bib: granovetter1973]` | WOM reach, viral seeding, influence spread, referral programs |
| **Social influence / social norms** | Descriptive and injunctive norms shift behavior, often more than people predict. | Goldstein, Cialdini & Griskevicius 2008, *JCR* — `10.1086/586910`; Cialdini *Influence* — **monograph, no DOI (flag §7)** | Social proof, conformity in reviews/ratings, norm-based nudges, scarcity/authority cues |

### 1.E Marketing-native & recent advances

| Theory | One-line claim | Seminal reference — verified DOI | Constructs / phenomena |
|---|---|---|---|
| **Service-dominant (S-D) logic** | Value is co-created through service exchange and operant resources, not embedded in goods. | Vargo & Lusch 2004, *J. Marketing* — `10.1509/jmkg.68.1.1.24036`; update: Vargo & Lusch 2016, *JAMS* — `10.1007/s11747-015-0456-3` | Value co-creation, customer-as-resource, service ecosystems, engagement |
| **Consumer Culture Theory (CCT)** | Consumption is a site of sociocultural meaning, identity, and marketplace ideology. | Arnould & Thompson 2005, *JCR* — `10.1086/426626` | Identity projects, brand communities, symbolic consumption, qualitative research framing |
| **Brand relationship theory** | Consumers form relationship-like bonds with brands, characterized along quality dimensions (love, commitment, intimacy). | Fournier 1998, *JCR* — `10.1086/209515` `[bib: fournier1998]` | Brand love, attachment, self-brand connection, loyalty |
| **Customer engagement** | Engagement is a psychological state from interactive, co-creative customer experiences, beyond transactions. | Brodie, Hollebeek, Jurić & Ilić 2011, *J. Service Research* — `10.1177/1094670511411703` | Engagement, participation, online community behavior, advocacy |
| **Psychological ownership** | Feelings of "mine-ness" toward a target shift attitudes and valuation even absent legal ownership. | Pierce, Kostova & Dirks 2003, *Rev. Gen. Psychol.* — `10.1037/1089-2680.7.1.84` | Endowment in digital goods, customization, IKEA effect, free-trial stickiness |
| **Algorithm aversion / appreciation (recent)** | People discount algorithmic advice after seeing it err (aversion), but appreciate it for objective tasks (appreciation). | Dietvorst, Simmons & Massey 2015, *J. Exp. Psychol. Gen.* — `10.1037/xge0000033`; Castelo, Bos & Lehmann 2019, *JMR* — `10.1177/0022243719851788` | AI adoption, recommendation acceptance, trust in automation, human-in-the-loop design |
| **Personalization–privacy paradox (recent)** | Personalization raises relevance but can trigger privacy concern; trust-building moderates the trade-off. | Aguirre, Mahr, Grewal, de Ruyter & Wetzels 2015, *J. Retailing* — `10.1016/j.jretai.2014.09.005` | Targeted advertising effectiveness, data disclosure, privacy calculus, consent design |

---

## 2. Behavioral economics — deep section (priority strand)

This is the strand to make prominent and well-developed. Treat behavioral economics
not as a single chapter but as a **cross-cutting lens** that recurs in pricing,
nudges, satisfaction, advertising, sales, gaming, virality, service, and health. The
recommended spine: introduce the dual-process / reference-dependence foundation once
(suggest Ch. 16 Nudges or Ch. 17 Pricing as the anchor), then call back to specific
sub-theories in each substantive chapter.

### 2.1 Foundational sub-theories (verified)

1. **Reference dependence & prospect theory** — Kahneman & Tversky 1979
   (`10.2307/1914185`); the value function and probability weighting. Anchor for any
   discussion of how prices, promotions, and outcomes are *judged relative to a
   reference*, not in absolute terms.
2. **Loss aversion** — Tversky & Kahneman 1991 (`10.2307/2937956`). The single most
   load-bearing BE idea for marketing: price-increase asymmetry, churn aversion,
   "don't lose your points," free-trial framing.
3. **Endowment effect & status-quo bias** — Kahneman, Knetsch & Thaler 1991
   (`10.1257/jep.5.1.193`). WTA–WTP gaps; defaults stick because switching feels like
   a loss.
4. **Framing** — Tversky & Kahneman 1981 (`10.1126/science.7455683`); Kahneman &
   Tversky 1984 (`10.1037/0003-066x.39.4.341`). Attribute, goal, and risky-choice
   framing — directly actionable for advertising and health messaging.
5. **Mental accounting** — Thaler 1985 (`10.1287/mksc.4.3.199`) and 1999
   (`10.1002/(sici)1099-0771(199909)12:3<183::aid-bdm318>3.0.co;2-f`). Transaction
   utility, payment decoupling, bundling, partitioned pricing, prepayment.
6. **Anchoring & heuristics** — Tversky & Kahneman 1974 (`10.1126/science.185.4157.1124`).
   Reference prices, WTP elicitation bias, MSRP anchors, "was/now" pricing.
7. **Hyperbolic discounting / present bias** — Laibson 1997 (`10.1162/003355397555253`).
   Subscriptions, impulse purchase, commitment devices, savings/health behavior.
8. **Salience** — Bordalo, Gennaioli & Shleifer 2013 (`10.1086/673885`). A modern,
   formal account of context/attention effects — useful bridge to assortment and
   decoy/attraction effects.

### 2.2 Choice architecture, defaults, nudges & sludge (verified)

- **Defaults** — Johnson & Goldstein 2003, *Science* (`10.1126/science.1091721`):
  opt-in vs opt-out dramatically changes participation; the canonical default-effect
  citation.
- **Nudge program / choice architecture** — Thaler & Sunstein *Nudge*
  (**monograph, flag §7**); pair with the empirical-scale evidence in Benartzi et al.
  2017, *Psychol. Sci.* (`10.1177/0956797617702501`).
- **Sludge** — Thaler 2018, *Science* (`10.1126/science.aau9241`): cancellation
  friction, dark patterns, rebate hassle — the ethics-of-design counterpart, ideal
  for the privacy and service chapters.

### 2.3 Scarcity, attention & cognitive load (verified)

- **Scarcity / bandwidth tax** — Mani, Mullainathan, Shafir & Zhao 2013, *Science*
  (`10.1126/science.1238041`); Mullainathan & Shafir *Scarcity* (**monograph, flag
  §7**). Connects to "limited-time/limited-stock" urgency tactics, low-income
  consumer welfare (health chapter), and attention economics online.

### 2.4 Recent behavioral-economics advances in marketing (to make the book feel current)

- **Behavioral pricing & reference prices** — Kalyanaram & Winer 1995
  (`10.1287/mksc.14.3.g161`) as the empirical-generalization backbone; combine with
  loss aversion and mental accounting for partitioned/drip pricing and "fairness"
  effects.
- **Default effects at scale / behavioral public policy** — Benartzi et al. 2017
  (`10.1177/0956797617702501`): cost-effectiveness of nudges vs traditional
  interventions — strong material for the nudges and health chapters.
- **Algorithm aversion vs appreciation** — Dietvorst, Simmons & Massey 2015
  (`10.1037/xge0000033`); Castelo, Bos & Lehmann 2019, *JMR* (`10.1177/0022243719851788`).
  A genuinely 2015+ BE-adjacent strand: when consumers accept/reject AI recommenders.
  Map to AI/ML (Ch. 48), service (Ch. 18), and online environments (Ch. 09).
- **Personalization–privacy paradox** — Aguirre et al. 2015 (`10.1016/j.jretai.2014.09.005`):
  a behavioral "privacy calculus" — overt vs covert data collection and trust as
  moderator. Map to privacy (Ch. 22) and advertising (Ch. 10).
- **Sludge / dark patterns** — Thaler 2018 (`10.1126/science.aau9241`): the welfare
  and ethics edge of choice architecture; map to privacy, service, and platforms
  (Ch. 51).

> **Note for the editor.** Several adjacent "recent BE in marketing" reviews
> (e.g., behavioral IO surveys, *JCR*/*JMR* default-effect field experiments,
> decision-focused-experiment methodology pieces) are strong candidates but were not
> DOI-verified in this pass to avoid asserting unverified identifiers. They are
> listed in §7.B as "verify-before-citing." Do not insert their DOIs until verified.

---

## 3. Theory-to-chapter map

Legend: ●●● = develop the theory as a primary lens here; ●● = cite and apply; ● = brief callback.

| Theory | Primary chapters (●●●) | Secondary (●● / ●) |
|---|---|---|
| Prospect theory | 17 Pricing ●●●, 16 Nudges ●●● | 03 Satisfaction ●●, 10 Advertising ●●, 19 Health ●● |
| Loss aversion / endowment | 17 Pricing ●●●, 13 CLV ●●● (churn) | 16 Nudges ●●, 18 Service ●●, 20 Gaming ●● |
| Framing | 10 Advertising ●●●, 19 Health ●●● | 11 Communication ●●, 16 Nudges ●● |
| Mental accounting | 17 Pricing ●●●, 20 Gaming ●●● (IAP) | 13 CLV ●●, 21 Marketing-Finance ●● |
| Anchoring & heuristics | 17 Pricing ●●●, 31 Surveys ●● (response bias) | 32 Preference measurement ●●, 30 Scales ● |
| Hyperbolic discounting / present bias | 16 Nudges ●●●, 19 Health ●●●, 13 CLV ●● | 17 Pricing ●●, 20 Gaming ●● |
| Salience | 17 Pricing ●●, 36 Marketing-Mix ● | 10 Advertising ●●, 09 Online ●● |
| Choice architecture / defaults | 16 Nudges ●●●, 22 Privacy ●●● | 09 Online ●●, 18 Service ●● |
| Sludge / dark patterns | 22 Privacy ●●●, 16 Nudges ●● | 18 Service ●●, 51 Platforms ●● |
| Scarcity / cognitive load | 19 Health ●●●, 16 Nudges ●● | 17 Pricing ●●, 09 Online ● |
| Dual-process / System 1–2 | 10 Advertising ●●●, 38 Consumer-Behavior seminar ●●● | 11 Communication ●●, 16 Nudges ●● |
| Elaboration Likelihood Model | 10 Advertising ●●●, 14 Celebrity ●●●, 15 Influencer ●●● | 11 Communication ●●, 07 Sarcasm ● |
| TRA/TPB | 19 Health ●●●, 31 Surveys ●● | 04 Innovation ●●, 03 Satisfaction ● |
| Cognitive dissonance | 03 Satisfaction ●●● | 17 Pricing ●, 13 CLV ● |
| Attribution theory | 18 Service ●●● (failure/recovery) | 03 Satisfaction ●●, 14 Celebrity ●● |
| Mere exposure | 10 Advertising ●●●, 08 Branding ●● | 06 Virality ● |
| Construal Level Theory | 10 Advertising ●●●, 17 Pricing ●● | 16 Nudges ●●, 11 Communication ●● |
| Regulatory focus | 10 Advertising ●●●, 08 Branding ●● | 19 Health ●●, 16 Nudges ●● |
| Self-determination theory | 20 Gaming ●●●, 13 CLV ●● (loyalty) | 16 Nudges ●●, 18 Service ● |
| Signaling theory | 08 Branding ●●●, 10 Advertising ●●●, 35 Industrial-Org ●● | 14 Celebrity ●●, 05 Market-entry ●● |
| Transaction cost economics | 35 Industrial-Org ●●●, 12 Sales ●●● | 51 Platforms ●●, 05 Market-entry ●● |
| Reference-price economics | 17 Pricing ●●●, 36 Marketing-Mix ●● | 13 CLV ● |
| Random utility / discrete choice | 50 Choice-Bayesian ●●●, 32 Preference ●●● | 35 Industrial-Org ●●, 25 Modeling ●● |
| Agency theory | 12 Sales ●●● (compensation), 15 Influencer ●● | 51 Platforms ●●, 35 Industrial-Org ● |
| Commitment–trust | 13 CLV ●●●, 18 Service ●●● | 12 Sales ●●, 08 Branding ● |
| Organizational/algorithmic trust | 22 Privacy ●●●, 48 AI/ML ●●● | 18 Service ●●, 09 Online ●● |
| Diffusion of innovations / Bass | 04 Innovation ●●●, 06 Virality ●●●, 37 Strategic-Dynamic ●●● | 05 Market-entry ●●, 36 Marketing-Mix ●● |
| Weak ties / network theory | 06 Virality ●●●, 15 Influencer ●●● | 09 Online ●●, 51 Platforms ●● |
| Social influence / norms | 16 Nudges ●●●, 06 Virality ●●● | 19 Health ●●, 09 Online ●● |
| Service-dominant logic | 18 Service ●●●, 40 Strategy seminar ●●● | 13 CLV ●●, 51 Platforms ●● |
| Consumer Culture Theory | 33 Qualitative ●●●, 38 Consumer-Behavior seminar ●●● | 08 Branding ●●, 06 Virality ● |
| Brand relationship theory | 08 Branding ●●●, 13 CLV ●● | 14 Celebrity ●●, 18 Service ● |
| Customer engagement | 09 Online ●●●, 15 Influencer ●●●, 18 Service ●● | 13 CLV ●●, 06 Virality ● |
| Psychological ownership | 17 Pricing ●●, 20 Gaming ●●● (skins/ownership) | 09 Online ●●, 08 Branding ● |
| Algorithm aversion / appreciation | 48 AI/ML ●●●, 18 Service ●●● | 09 Online ●●, 12 Sales ●● |
| Personalization–privacy paradox | 22 Privacy ●●●, 10 Advertising ●●● | 09 Online ●●, 51 Platforms ●● |

**Cross-cutting BE callbacks (priority).** Pricing (17), Nudges (16), Satisfaction
(03), Advertising (10), Sales (12), Gaming (20), Virality (06), Service (18), and
Health (19) should each contain at least one explicitly labeled "behavioral
economics" subsection drawing on §2.

---

## 4. How the strands connect to the construct pillars

- **Constructs chapter (02–03).** Use prospect theory, mental accounting, and CLT to
  illustrate that the *same* objective stimulus maps to different *constructs*
  (perceived value, satisfaction, fairness) depending on reference points and
  construal — a clean motivating example for construct-vs-variable.
- **Satisfaction (03).** Cognitive dissonance + prospect theory (disconfirmation as a
  reference-point comparison) + attribution theory (who is blamed) form a coherent
  theoretical base.
- **Measurement chapters (30–32).** Anchoring/heuristics and TPB justify careful scale
  and survey design (response anchors, intention measures); random utility underpins
  preference measurement and choice-Bayesian modeling.

---

## 5. Suggested new-direction (2015–2026) theoretical threads to keep the book current

All four below are either verified here or flagged for verification in §7.B:

1. **Algorithm aversion ↔ appreciation** (verified: `10.1037/xge0000033`,
   `10.1177/0022243719851788`) — AI/ML, service, recommender adoption.
2. **Personalization–privacy / behavioral privacy calculus** (verified:
   `10.1016/j.jretai.2014.09.005`) — privacy, advertising, platforms.
3. **Sludge & dark patterns** (verified: `10.1126/science.aau9241`) — the ethics of
   choice architecture; privacy and platform-design chapters.
4. **Service ecosystems / institutional S-D logic** (verified: `10.1007/s11747-015-0456-3`)
   — strategy and platform chapters; updates the 2004 statement.

Additional candidate threads (identity-based consumption; computational social
science framings of marketing; behavioral IO) are real and worth developing, but
their canonical citations were **not** DOI-verified in this pass — see §7.B.

---

## 6. Verified DOI ledger

Every DOI below was confirmed via the Crossref REST API
(`api.crossref.org/works?query.bibliographic=...`) during this research pass. Title,
journal, and year matched the intended seminal work.

| # | Reference | DOI | Source verified |
|---|---|---|---|
| 1 | Kahneman & Tversky 1979, Prospect Theory, *Econometrica* | `10.2307/1914185` | Crossref |
| 2 | Kahneman & Tversky 1984, Choices, Values, and Frames, *Am. Psychologist* | `10.1037/0003-066x.39.4.341` | Crossref |
| 3 | Tversky & Kahneman 1981, The Framing of Decisions and the Psychology of Choice, *Science* | `10.1126/science.7455683` | Crossref (DOI resolved directly; confirm bib `tversky1981` points to same) |
| 4 | Tversky & Kahneman 1974, Judgment under Uncertainty, *Science* | `10.1126/science.185.4157.1124` | Crossref |
| 5 | Tversky & Kahneman 1991, Loss Aversion in Riskless Choice, *QJE* | `10.2307/2937956` | Crossref |
| 6 | Kahneman, Knetsch & Thaler 1991, Endowment Effect / Status-Quo Bias, *JEP* | `10.1257/jep.5.1.193` | Crossref |
| 7 | Thaler 1985, Mental Accounting and Consumer Choice, *Marketing Science* | `10.1287/mksc.4.3.199` | Crossref |
| 8 | Thaler 1999, Mental Accounting Matters, *J. Behav. Dec. Making* | `10.1002/(sici)1099-0771(199909)12:3<183::aid-bdm318>3.0.co;2-f` | Crossref |
| 9 | Laibson 1997, Golden Eggs and Hyperbolic Discounting, *QJE* | `10.1162/003355397555253` | Crossref |
| 10 | Bordalo, Gennaioli & Shleifer 2013, Salience and Consumer Choice, *JPE* | `10.1086/673885` | Crossref |
| 11 | Johnson & Goldstein 2003, Do Defaults Save Lives?, *Science* | `10.1126/science.1091721` | Crossref |
| 12 | Thaler 2018, Nudge, not sludge, *Science* | `10.1126/science.aau9241` | Crossref |
| 13 | Benartzi et al. 2017, Should Governments Invest More in Nudging?, *Psychol. Sci.* | `10.1177/0956797617702501` | Crossref |
| 14 | Mani, Mullainathan, Shafir & Zhao 2013, Poverty Impedes Cognitive Function, *Science* | `10.1126/science.1238041` | Crossref |
| 15 | Petty & Cacioppo 1986, Elaboration Likelihood Model, *Communication and Persuasion* (Springer book) | `10.1007/978-1-4612-4964-1_1` | Crossref (book chapter — see §7 note) |
| 16 | Ajzen 1991, Theory of Planned Behavior, *OBHDP* | `10.1016/0749-5978(91)90020-t` | Crossref |
| 17 | Jones & Harris 1967, The Attribution of Attitudes, *J. Exp. Soc. Psychol.* | `10.1016/0022-1031(67)90034-0` | Crossref |
| 18 | Zajonc 1968, Attitudinal Effects of Mere Exposure, *JPSP* | `10.1037/h0025848` | Crossref |
| 19 | Trope & Liberman 2003, Temporal Construal, *Psychol. Review* | `10.1037/0033-295x.110.3.403` | Crossref |
| 20 | Higgins 1997, Beyond Pleasure and Pain (regulatory focus), *Am. Psychologist* | `10.1037/0003-066x.52.12.1280` | Crossref |
| 21 | Ryan & Deci 2000, Self-Determination Theory, *Am. Psychologist* | `10.1037/0003-066x.55.1.68` | Crossref |
| 22 | Spence 1973, Job Market Signaling, *QJE* | `10.2307/1882010` | Crossref |
| 23 | Williamson 1981, The Economics of Organization (TCE), *Am. J. Sociology* | `10.1086/227496` | Crossref |
| 24 | Kalyanaram & Winer 1995, Reference Price Research, *Marketing Science* | `10.1287/mksc.14.3.g161` | Crossref |
| 25 | Morgan & Hunt 1994, Commitment-Trust Theory, *J. Marketing* | `10.1177/002224299405800302` | Crossref |
| 26 | Mayer, Davis & Schoorman 1995, Integrative Model of Organizational Trust, *AMR* | `10.2307/258792` | Crossref |
| 27 | Bass 1969, New Product Growth Model, *Management Science* | `10.1287/mnsc.15.5.215` | Crossref |
| 28 | Granovetter 1973, The Strength of Weak Ties, *Am. J. Sociology* | `10.1086/225469` | Crossref |
| 29 | Goldstein, Cialdini & Griskevicius 2008, A Room with a Viewpoint, *JCR* | `10.1086/586910` | Crossref |
| 30 | Vargo & Lusch 2004, Evolving to a New Dominant Logic, *J. Marketing* | `10.1509/jmkg.68.1.1.24036` | Crossref |
| 31 | Vargo & Lusch 2016, Institutions and Axioms (S-D logic update), *JAMS* | `10.1007/s11747-015-0456-3` | Crossref |
| 32 | Arnould & Thompson 2005, Consumer Culture Theory, *JCR* | `10.1086/426626` | Crossref |
| 33 | Fournier 1998, Consumers and Their Brands, *JCR* | `10.1086/209515` | Crossref |
| 34 | Brodie, Hollebeek, Jurić & Ilić 2011, Customer Engagement, *J. Service Research* | `10.1177/1094670511411703` | Crossref |
| 35 | Pierce, Kostova & Dirks 2003, Psychological Ownership, *Rev. Gen. Psychol.* | `10.1037/1089-2680.7.1.84` | Crossref |
| 36 | Dietvorst, Simmons & Massey 2015, Algorithm Aversion, *J. Exp. Psychol. Gen.* | `10.1037/xge0000033` | Crossref |
| 37 | Castelo, Bos & Lehmann 2019, Task-Dependent Algorithm Aversion, *JMR* | `10.1177/0022243719851788` | Crossref |
| 38 | Aguirre, Mahr, Grewal, de Ruyter & Wetzels 2015, Personalization Paradox, *J. Retailing* | `10.1016/j.jretai.2014.09.005` | Crossref |

---

## 7. Flagged: no article-level DOI, or verify-before-citing

### 7.A Classic monographs / books — cite as books; do NOT invent a DOI

These are foundational but are monographs (or have only book-level/derivative DOIs).
Cite them as books with publisher and year. Do not assign an article DOI.

| Work | Why flagged | Recommended handling |
|---|---|---|
| Kahneman, *Thinking, Fast and Slow* (2011, FSG) | Trade monograph; no article DOI | Cite as book; use for dual-process framing |
| Thaler & Sunstein, *Nudge* (2008/2021, Yale UP / Penguin) | Monograph | Cite as book; pair with Johnson & Goldstein 2003 and Benartzi 2017 for empirical claims |
| Festinger, *A Theory of Cognitive Dissonance* (1957, Stanford UP) `[bib: festinger1957]` | Monograph; the Crossref hits are reprints | Cite as book |
| Rogers, *Diffusion of Innovations* (5th ed. 2003, Free Press) | Monograph | Cite as book; pair with Bass 1969 (`10.1287/mnsc.15.5.215`) for the formal model |
| Cialdini, *Influence* (1984/2021) | Trade monograph | Cite as book; pair with Goldstein, Cialdini & Griskevicius 2008 (`10.1086/586910`) for the empirical norm result |
| Mullainathan & Shafir, *Scarcity* (2013, Times Books) | Trade monograph | Cite as book; pair with Mani et al. 2013 (`10.1126/science.1238041`) |
| Petty & Cacioppo 1986, *Communication and Persuasion* | Springer **book**; DOI `10.1007/978-1-4612-4964-1_1` is the book chapter, not a journal article | Acceptable to cite the book-chapter DOI; if a journal statement is preferred, use Petty, Cacioppo & Schumann 1983 *JCR* (verify before citing) |
| Kelley / Weiner attribution statements | Canonical sources are edited volumes / *Am. Psychol.* addresses | Verify a specific article DOI before citing; Jones & Harris 1967 (`10.1016/0022-1031(67)90034-0`) is verified and usable |
| McFadden, random utility / conditional logit | Canonical statement is a 1974 edited-volume chapter | Verify a specific DOI before citing; for the book, cite Ch. 50 methodology sources |
| Jensen & Meckling 1976 (agency theory), *J. Financial Econ.* | Likely has a DOI but was **not verified in this pass** | Verify before citing (see §7.B) |

### 7.B Verify-before-citing (real works, DOIs NOT confirmed in this pass)

Do not insert DOIs for these until each is checked against Crossref. They are listed
so the editor can pursue them deliberately, not so they can be cited blind.

- Petty, Cacioppo & Schumann 1983, Central/Peripheral Routes, *JCR* (ELM in
  marketing) — verify.
- Jensen & Meckling 1976, Theory of the Firm (agency theory), *J. Financial Econ.* —
  verify.
- McFadden 1974, Conditional Logit Analysis of Qualitative Choice Behavior — verify
  (edited volume).
- Bettman, Luce & Payne 1998, Constructive Consumer Choice Processes, *JCR* — verify
  (relevant to BE / preference construction).
- Behavioral IO surveys and recent *JCR*/*JMR* default-effect field experiments
  (2015–2026) — identify specific papers, then verify each DOI.
- Identity-based consumption / identity-signaling recent statements (e.g., Berger &
  Heath; recent extensions) — verify specific articles.
- Reed, Forehand, Puntoni & Warlop 2012, Identity-based consumer behavior, *IJRM* —
  verify.

### 7.C Editorial note on bib-key reuse

Where a bracketed `[bib: ...]` key appears above, the project's `valid-bib-keys.txt`
already contains a key plausibly matching that work (e.g., `tversky1974`,
`tversky1981`, `thaler1985`, `spence1973`, `granovetter1973`, `fournier1998`,
`festinger1957`, `zajonc1980`, `trope2000`, `Bass_1969`, `petty1986`). Before adding
new `.bib` entries, confirm the existing key's title/DOI matches the intended work to
avoid duplicates. New theories without an existing key (e.g., Laibson 1997, Bordalo
et al. 2013, Dietvorst et al. 2015, Castelo et al. 2019, Aguirre et al. 2015,
Brodie et al. 2011, Pierce et al. 2003, Mayer et al. 1995, Vargo & Lusch 2016,
Higgins 1997, Ryan & Deci 2000) will need new entries built from the verified DOIs in §6.
