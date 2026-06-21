# University of Chicago (Booth) — Verified Bibliography

Curated bibliography of influential and frontier marketing scholarship associated with the **University of Chicago Booth School of Business**, mapped to book chapters. Two complementary traditions are represented: (1) the Booth structural / empirical-IO school of quantitative marketing (Chintagunta, Dubé, Hitsch, Misra and co-authors) and (2) the Booth behavioral-science school spanning consumer behavior, motivation, and behavioral economics (Urminsky, Fishbach, Pope, Thaler, Dietvorst, Sussman).

**Verification protocol.** Every entry below was matched against the Crossref REST API (`https://api.crossref.org/works?query.bibliographic=...`) and each DOI was independently resolved via `https://api.crossref.org/works/<doi>`. Each DOI, title, author list, year, container-title (journal), volume, issue, and page range was checked against the returned version-of-record metadata. Published versions-of-record are used in preference to any SSRN / NBER / preprint DOI; where Crossref returned only a working-paper DOI, the published DOI was located by a follow-up query and substituted. Items that could not be verified to a published DOI are quarantined at the bottom under **UNVERIFIED — do not cite**.

Scholars already gathered elsewhere in the research set (Tellis, Marinova, the conjoint set, the branding-frontier and advertising sets) are not re-listed here.

Verified on: 2026-06-21.

---

## Structural & empirical-IO foundations (choice, heterogeneity, aggregate demand)

```bibtex
@article{chintagunta1993purchase,
  author  = {Chintagunta, Pradeep K.},
  title   = {Investigating Purchase Incidence, Brand Choice and Purchase Quantity Decisions of Households},
  journal = {Marketing Science},
  year    = {1993},
  volume  = {12},
  number  = {2},
  pages   = {184--208},
  doi     = {10.1287/mksc.12.2.184}
}
```
A foundational structural treatment of household purchasing that jointly models three linked decisions — whether to buy the category, which brand to choose, and how much to buy — within a utility-maximizing framework. Chintagunta shows how to capture unobserved heterogeneity in reservation prices and brand preferences across households rather than assuming a representative consumer. Establishes a template for the integrated demand models that defined empirical marketing in the 1990s.
Chapter: structural-models

```bibtex
@article{roy1996habits,
  author  = {Roy, Rishin and Chintagunta, Pradeep K. and Haldar, Sudeep},
  title   = {A Framework for Investigating Habits, ``The Hand of the Past,'' and Heterogeneity in Dynamic Brand Choice},
  journal = {Marketing Science},
  year    = {1996},
  volume  = {15},
  number  = {3},
  pages   = {280--299},
  doi     = {10.1287/mksc.15.3.280}
}
```
Develops a dynamic brand-choice framework that disentangles three sources of persistence that look alike in panel data: genuine habit / state dependence, structural heterogeneity in tastes, and the lingering influence of past purchases ("the hand of the past"). The decomposition matters because each implies different responses to marketing actions. A methodological reference point for the long state-dependence-versus-heterogeneity debate.
Chapter: structural-models

```bibtex
@article{chintagunta2001probit,
  author  = {Chintagunta, Pradeep K.},
  title   = {Endogeneity and Heterogeneity in a Probit Demand Model: Estimation Using Aggregate Data},
  journal = {Marketing Science},
  year    = {2001},
  volume  = {20},
  number  = {4},
  pages   = {442--456},
  doi     = {10.1287/mksc.20.4.442.9751}
}
```
Addresses two estimation problems that bedevil demand models fit to store-level aggregate data: the endogeneity of marketing variables (notably price) and consumer heterogeneity. Chintagunta develops a probit-based aggregate demand estimator that handles both, paralleling the random-coefficients logit (BLP) program but in a probit form. A key bridge between micro choice modeling and aggregate-data demand estimation.
Chapter: empirical-models

```bibtex
@article{nair2005primary,
  author  = {Nair, Harikesh and Dub{\'e}, Jean-Pierre and Chintagunta, Pradeep K.},
  title   = {Accounting for Primary and Secondary Demand Effects with Aggregate Data},
  journal = {Marketing Science},
  year    = {2005},
  volume  = {24},
  number  = {3},
  pages   = {444--460},
  doi     = {10.1287/mksc.1040.0101}
}
```
Shows how to separate primary demand (category expansion) from secondary demand (brand switching) when only aggregate data are available, using a discrete/continuous demand system and a method-of-simulated-moments estimator that handles endogeneity and heterogeneity. The distinction is managerially central because a marketing action that merely steals share differs fundamentally from one that grows the category. A core empirical-IO contribution from the Booth group.
Chapter: empirical-models

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
A synthesizing review of discrete-choice demand modeling in marketing, covering logit/probit foundations, random-coefficients (BLP) aggregate demand, endogeneity correction, dynamics, and supply-side integration. Written as a structural-methods primer, it is the natural anchor citation when introducing the choice-modeling toolkit. Essential framing reference for the modeling and structural chapters.
Chapter: modeling

## Advertising dynamics & competition

```bibtex
@article{dube2005advertising,
  author  = {Dub{\'e}, Jean-Pierre and Hitsch, G{\"u}nter J. and Manchanda, Puneet},
  title   = {An Empirical Model of Advertising Dynamics},
  journal = {Quantitative Marketing and Economics},
  year    = {2005},
  volume  = {3},
  number  = {2},
  pages   = {107--144},
  doi     = {10.1007/s11129-005-0334-2}
}
```
Builds a structural model of advertising in which firms set advertising dynamically in the presence of goodwill stock and threshold/pulsing effects, and estimates it on frozen-entrée data. The paper rationalizes the widely observed practice of advertising "pulsing" (bursts followed by silence) as an optimal response to an S-shaped advertising response function. A frontier statement linking advertising response curves to dynamic firm behavior.
Chapter: advertising

```bibtex
@article{dube2005dynamicbrand,
  author  = {Dub{\'e}, Jean-Pierre and Manchanda, Puneet},
  title   = {Differences in Dynamic Brand Competition Across Markets: An Empirical Analysis},
  journal = {Marketing Science},
  year    = {2005},
  volume  = {24},
  number  = {1},
  pages   = {81--95},
  doi     = {10.1287/mksc.1040.0087}
}
```
Estimates how the intensity of dynamic price-and-advertising competition varies across geographic markets, finding systematic differences in price sensitivity and profitability between larger and smaller markets. Demonstrates that competitive dynamics are not a single national phenomenon but are shaped by local demand structure. A useful empirical reference on cross-market heterogeneity in competition.
Chapter: advertising

```bibtex
@article{narayanan2005temporal,
  author  = {Narayanan, Sridhar and Manchanda, Puneet and Chintagunta, Pradeep K.},
  title   = {Temporal Differences in the Role of Marketing Communication in New Product Categories},
  journal = {Journal of Marketing Research},
  year    = {2005},
  volume  = {42},
  number  = {3},
  pages   = {278--290},
  doi     = {10.1509/jmkr.2005.42.3.278}
}
```
Uses prescription-antihistamine data to show that the role of marketing communication shifts over a new product category's life cycle: early on, advertising and detailing work largely through informing and reducing physician uncertainty (a learning channel), while later their persuasive role dominates. Connects pharmaceutical detailing, physician learning, and the evolving returns to communication. A leading healthcare-marketing structural study.
Chapter: advertising

## Pricing, switching costs & state dependence

```bibtex
@article{dube2009switchingcosts,
  author  = {Dub{\'e}, Jean-Pierre and Hitsch, G{\"u}nter J. and Rossi, Peter E.},
  title   = {Do Switching Costs Make Markets Less Competitive?},
  journal = {Journal of Marketing Research},
  year    = {2009},
  volume  = {46},
  number  = {4},
  pages   = {435--445},
  doi     = {10.1509/jmkr.46.4.435}
}
```
Challenges the textbook intuition that consumer switching costs soften competition. Using a structural model, the authors show that with switching costs firms compete harder to acquire customers (the "investment" effect can dominate the "harvesting" effect), and they find prices up to roughly 18% lower with switching costs than without. A counterintuitive, frequently cited result on loyalty and competition.
Chapter: pricing

```bibtex
@article{dube2010inertia,
  author  = {Dub{\'e}, Jean-Pierre and Hitsch, G{\"u}nter J. and Rossi, Peter E.},
  title   = {State Dependence and Alternative Explanations for Consumer Inertia},
  journal = {The RAND Journal of Economics},
  year    = {2010},
  volume  = {41},
  number  = {3},
  pages   = {417--445},
  doi     = {10.1111/j.1756-2171.2010.00106.x}
}
```
Tackles the identification problem at the heart of brand loyalty: apparent inertia in purchasing can reflect true structural state dependence (past purchase changes utility) or merely persistent unobserved heterogeneity. Through careful modeling the authors isolate genuine state dependence and rule out leading alternative explanations. A definitive empirical-IO treatment of consumer inertia.
Chapter: industrial-organization

```bibtex
@article{dube2010tipping,
  author  = {Dub{\'e}, Jean-Pierre and Hitsch, G{\"u}nter J. and Chintagunta, Pradeep K.},
  title   = {Tipping and Concentration in Markets with Indirect Network Effects},
  journal = {Marketing Science},
  year    = {2010},
  volume  = {29},
  number  = {2},
  pages   = {216--249},
  doi     = {10.1287/mksc.1090.0541}
}
```
Develops a framework to measure "tipping" — the increase in a firm's share dominance caused by indirect network effects — and applies it to the 32/64-bit video-game-console generation. The authors quantify how a hardware platform's installed base and software availability reinforce one another to concentrate the market. A canonical empirical study of platform competition and network effects.
Chapter: industrial-organization

```bibtex
@article{hitsch2010whatmakesyouclick,
  author  = {Hitsch, G{\"u}nter J. and Horta{\c{c}}su, Ali and Ariely, Dan},
  title   = {Matching and Sorting in Online Dating},
  journal = {American Economic Review},
  year    = {2010},
  volume  = {100},
  number  = {1},
  pages   = {130--163},
  doi     = {10.1257/aer.100.1.130}
}
```
Estimates mate preferences from online-dating activity and uses Gale-Shapley matching to predict the stable matches those preferences imply, then compares predictions to observed sorting. The paper recovers rich preference heterogeneity and strong assortative mating, and is a model application of structural demand-and-matching tools to a two-sided market. A frontier example of preference estimation in non-traditional marketplaces.
Chapter: structural-models

## Personalization, targeting & ML-driven pricing

```bibtex
@article{misra2011salesforce,
  author  = {Misra, Sanjog and Nair, Harikesh S.},
  title   = {A Structural Model of Sales-Force Compensation Dynamics: Estimation and Field Implementation},
  journal = {Quantitative Marketing and Economics},
  year    = {2011},
  volume  = {9},
  number  = {3},
  pages   = {211--257},
  doi     = {10.1007/s11129-011-9096-1}
}
```
Estimates a dynamic structural model of how salespeople respond to nonlinear incentive contracts, then takes the estimated model back into the field to redesign the firm's compensation plan and measure the realized lift. A landmark in "estimate, then optimize, then implement" structural marketing, demonstrating that recovered primitives can drive a profitable real-world policy change. A flagship pricing/incentive-design empirical paper.
Chapter: structural-models

```bibtex
@article{daljord2016homogeneous,
  author  = {Daljord, {\O}ystein and Misra, Sanjog and Nair, Harikesh S.},
  title   = {Homogeneous Contracts for Heterogeneous Agents: Aligning Sales Force Composition and Compensation},
  journal = {Journal of Marketing Research},
  year    = {2016},
  volume  = {53},
  number  = {2},
  pages   = {161--182},
  doi     = {10.1509/jmr.14.0018}
}
```
Asks why firms often offer a single, uniform compensation plan to a salesforce of heterogeneous agents, and shows how a "one-size" contract interacts with selection into and out of the salesforce. The analysis links compensation design to workforce composition, reframing contract uniformity as an equilibrium outcome rather than a managerial failure. A frontier treatment of salesforce incentive design.
Chapter: pricing

```bibtex
@article{dube2023personalized,
  author  = {Dub{\'e}, Jean-Pierre and Misra, Sanjog},
  title   = {Personalized Pricing and Consumer Welfare},
  journal = {Journal of Political Economy},
  year    = {2023},
  volume  = {131},
  number  = {1},
  pages   = {131--189},
  doi     = {10.1086/720793}
}
```
Runs a large-scale field experiment with a firm to estimate demand at the individual level via machine learning, then computes optimal personalized (first-degree-ish) prices and evaluates their effect on firm profit and consumer welfare. The paper shows personalized pricing can raise profits while leaving aggregate consumer surplus roughly unchanged, with redistribution across consumers. A frontier statement on algorithmic pricing and its welfare consequences.
Chapter: pricing

## Numerical methods for demand estimation

```bibtex
@article{dube2012blp,
  author  = {Dub{\'e}, Jean-Pierre and Fox, Jeremy T. and Su, Che-Lin},
  title   = {Improving the Numerical Performance of Static and Dynamic Aggregate Discrete Choice Random Coefficients Demand Estimation},
  journal = {Econometrica},
  year    = {2012},
  volume  = {80},
  number  = {5},
  pages   = {2231--2267},
  doi     = {10.3982/ecta8585}
}
```
Reformulates BLP random-coefficients demand estimation as a mathematical-program-with-equilibrium-constraints (MPEC) problem, eliminating the nested inner-loop contraction mapping that made the classic estimator numerically fragile and sometimes biased. The result made large random-coefficients models more reliable and reproducible to estimate. A methodological cornerstone for modern structural demand work.
Chapter: empirical-models

## Behavioral economics & nudges

```bibtex
@article{thaler2004savemore,
  author  = {Thaler, Richard H. and Benartzi, Shlomo},
  title   = {Save More Tomorrow: Using Behavioral Economics to Increase Employee Saving},
  journal = {Journal of Political Economy},
  year    = {2004},
  volume  = {112},
  number  = {S1},
  pages   = {S164--S187},
  doi     = {10.1086/380085}
}
```
Introduces the "Save More Tomorrow" (SMarT) program, which exploits present bias, inertia, and loss aversion by inviting employees to pre-commit to allocating future pay raises to retirement savings. In its field deployment, participation and saving rates rose dramatically. The canonical demonstration that choice architecture / nudges can reshape consequential financial behavior.
Chapter: nudges

```bibtex
@article{pope2011lossaverse,
  author  = {Pope, Devin G. and Schweitzer, Maurice E.},
  title   = {Is Tiger Woods Loss Averse? Persistent Bias in the Face of Experience, Competition, and High Stakes},
  journal = {American Economic Review},
  year    = {2011},
  volume  = {101},
  number  = {1},
  pages   = {129--157},
  doi     = {10.1257/aer.101.1.129}
}
```
Uses millions of professional-golf putts to show that even elite, highly experienced, high-stakes performers exhibit loss aversion: players sink par putts more often than otherwise-identical birdie putts, treating par as a reference point. The setting rules out many alternative explanations, providing unusually clean field evidence that reference-dependence persists despite experience and incentives. A widely cited behavioral-economics field study.
Chapter: nudges

## Consumer behavior: motivation, goals & self-control

```bibtex
@article{kivetz2006goalgradient,
  author  = {Kivetz, Ran and Urminsky, Oleg and Zheng, Yuhuang},
  title   = {The Goal-Gradient Hypothesis Resurrected: Purchase Acceleration, Illusionary Goal Progress, and Customer Retention},
  journal = {Journal of Marketing Research},
  year    = {2006},
  volume  = {43},
  number  = {1},
  pages   = {39--58},
  doi     = {10.1509/jmkr.43.1.39}
}
```
Resurrects the goal-gradient hypothesis in a consumer-loyalty setting, showing that customers accelerate purchasing as they approach a reward (e.g., a free coffee) and that even "illusionary" progress (an endowed head start) speeds effort. Directly connects motivation science to loyalty-program design and customer retention. A foundational paper linking goal pursuit, reward programs, and CLV.
Chapter: clv

```bibtex
@article{fishbach2005goalsexcuses,
  author  = {Fishbach, Ayelet and Dhar, Ravi},
  title   = {Goals as Excuses or Guides: The Liberating Effect of Perceived Goal Progress on Choice},
  journal = {Journal of Consumer Research},
  year    = {2005},
  volume  = {32},
  number  = {3},
  pages   = {370--377},
  doi     = {10.1086/497548}
}
```
Shows that perceived progress toward a goal can "license" goal-incongruent choices: feeling one has already advanced (e.g., toward a fitness or saving goal) leads people to relax and indulge, treating progress as an excuse rather than a guide. A foundational result on the dynamics of self-regulation and how partial success undermines subsequent self-control.
Chapter: consumer-behavior

```bibtex
@article{koo2012smallarea,
  author  = {Koo, Minjung and Fishbach, Ayelet},
  title   = {The Small-Area Hypothesis: Effects of Progress Monitoring on Goal Adherence},
  journal = {Journal of Consumer Research},
  year    = {2012},
  volume  = {39},
  number  = {3},
  pages   = {493--509},
  doi     = {10.1086/663827}
}
```
Proposes that people are more motivated when attention is directed to whichever portion of a goal is smaller — accomplished progress when little has been done, remaining distance when most is done. The "small-area" framing offers a practical lever for sustaining motivation in loyalty, savings, and health programs. Extends the goal-gradient and monitoring literatures with a clean attentional mechanism.
Chapter: consumer-behavior

## Consumer behavior: intertemporal choice & the future self

```bibtex
@article{bartels2015knowandcare,
  author  = {Bartels, Daniel M. and Urminsky, Oleg},
  title   = {To Know and to Care: How Awareness and Valuation of the Future Jointly Shape Consumer Spending},
  journal = {Journal of Consumer Research},
  year    = {2015},
  volume  = {41},
  number  = {6},
  pages   = {1469--1485},
  doi     = {10.1086/680670}
}
```
Argues that prudent intertemporal behavior requires two distinct ingredients — awareness of future consequences and a sense of connectedness to / valuation of the future self — and that interventions only curb impatient spending when both are present. Refines the "connectedness to the future self" account of discounting by separating cognitive awareness from motivational valuation. A frontier consumer-finance / intertemporal-choice contribution.
Chapter: consumer-behavior

## Consumer finance & financial decision-making

```bibtex
@article{sussman2012exception,
  author  = {Sussman, Abigail B. and Alter, Adam L.},
  title   = {The Exception Is the Rule: Underestimating and Overspending on Exceptional Expenses},
  journal = {Journal of Consumer Research},
  year    = {2012},
  volume  = {39},
  number  = {4},
  pages   = {800--814},
  doi     = {10.1086/665833}
}
```
Documents that consumers budget reasonably well for ordinary, recurring purchases but systematically underestimate and overspend on "exceptional" expenses, because each atypical purchase feels like a one-off exempt from the normal budget. A mental-accounting account of why irregular spending blows budgets. A core consumer-finance behavioral finding.
Chapter: consumer-behavior

```bibtex
@article{sussman2012assetsdebt,
  author  = {Sussman, Abigail B. and Shafir, Eldar},
  title   = {On Assets and Debt in the Psychology of Perceived Wealth},
  journal = {Psychological Science},
  year    = {2012},
  volume  = {23},
  number  = {1},
  pages   = {101--108},
  doi     = {10.1177/0956797611421484}
}
```
Shows that, holding net worth constant, people are perceived as (and feel) wealthier when they hold fewer assets and less debt than when they hold more of both — debt looms disproportionately in wealth judgments. Has direct implications for how consumers evaluate borrowing, lending, and financial products. A concise behavioral-finance result on the psychology of debt.
Chapter: consumer-behavior

## Algorithm aversion & data-driven decisions

```bibtex
@article{dietvorst2015algorithm,
  author  = {Dietvorst, Berkeley J. and Simmons, Joseph P. and Massey, Cade},
  title   = {Algorithm Aversion: People Erroneously Avoid Algorithms After Seeing Them Err},
  journal = {Journal of Experimental Psychology: General},
  year    = {2015},
  volume  = {144},
  number  = {1},
  pages   = {114--126},
  doi     = {10.1037/xge0000033}
}
```
Demonstrates "algorithm aversion": after seeing an algorithm make a mistake, people abandon it in favor of an inferior human forecaster, even though they would not abandon a human who erred identically. The asymmetric intolerance of algorithmic error is central to whether data-driven marketing and analytics tools get adopted. The defining paper of the algorithm-aversion literature.
Chapter: data

```bibtex
@article{dietvorst2018overcoming,
  author  = {Dietvorst, Berkeley J. and Simmons, Joseph P. and Massey, Cade},
  title   = {Overcoming Algorithm Aversion: People Will Use Imperfect Algorithms If They Can (Even Slightly) Modify Them},
  journal = {Management Science},
  year    = {2018},
  volume  = {64},
  number  = {3},
  pages   = {1155--1170},
  doi     = {10.1287/mnsc.2016.2643}
}
```
The constructive sequel to algorithm aversion: giving people even a small ability to adjust an algorithm's output sharply increases their willingness to use it, with little cost to accuracy. Offers a practical design principle for deploying analytics and recommendation systems where human acceptance is the binding constraint. A frontier result on human-algorithm collaboration.
Chapter: data

---

## UNVERIFIED — do not cite

No candidate papers from this round failed verification. Every item above resolved to a published version-of-record DOI in Crossref with matching metadata.

Two items pursued during research were intentionally **dropped** (not quarantined) because no Crossref-verified, correctly attributed published version of record could be confirmed:

- A Sanjog Misra machine-learning **targeting / personalization field-experiment** paper beyond those listed: Crossref bibliographic queries surfaced only Simester–Timoshenko–Zoumpoulis targeting papers (not Misra-authored) and SSRN preprints. Misra's verified personalization/pricing contribution is captured by Dubé & Misra (2023, JPE) above. Treat any specific Misra "ML targeting" citation as **UNVERIFIED — do not cite** until a published DOI is confirmed.
- An Oleg Urminsky / Daniel Bartels **2011 Journal of Consumer Research** connectedness paper: Crossref returned only PsycEXTRA dataset records for the 2011 conference versions. The verified, citable version of this research line is Bartels & Urminsky (2015, JCR) above. Any "Bartels & Urminsky 2011, JCR" citation is **UNVERIFIED — do not cite** without a resolved 10.1086 DOI.
