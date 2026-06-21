# University of Pennsylvania (Wharton) — Verified Bibliography

Curated bibliography of influential and frontier marketing scholarship associated with the **Wharton School, University of Pennsylvania**, mapped to book chapters. The set spans Wharton's signature traditions: the customer-base-analysis / probability-modeling school (Fader, Hardie and co-authors), the social-contagion and diffusion program (Van den Bulte, Iyengar), structural pricing and targeting (Z. John Zhang and co-authors), behavioral consumer research (Kahn, Reed, Small, Lamberton, Meyer), the consumer-neuroscience frontier (Nave), the AI-and-consumers frontier (Puntoni), and omnichannel / geography-of-demand work (Bell).

**Verification protocol.** Every entry below was matched against the Crossref REST API (`https://api.crossref.org/works?query.bibliographic=...`) and each DOI was independently resolved via `https://api.crossref.org/works/<doi>`. Each DOI, title, author list, year, container-title (journal), volume, issue, and page range was checked against the returned version-of-record metadata. Published versions-of-record are used in preference to any SSRN / preprint DOI; where Crossref surfaced only a working-paper DOI, the published DOI was located by follow-up query and substituted. Items that could not be verified to a published DOI are quarantined at the bottom under **UNVERIFIED — do not cite**.

Scholars already gathered elsewhere in the research set (Jonah Berger; Eric Bradlow and Ron Berman; Tellis; Marinova; the conjoint set; the branding-frontier and advertising sets) are not re-listed here.

Verified on: 2026-06-21.

---

## Customer-base analysis, CLV & probability models (Fader)

```bibtex
@article{fader2005counting,
  author  = {Fader, Peter S. and Hardie, Bruce G. S. and Lee, Ka Lok},
  title   = {``Counting Your Customers'' the Easy Way: An Alternative to the Pareto/NBD Model},
  journal = {Marketing Science},
  year    = {2005},
  volume  = {24},
  number  = {2},
  pages   = {275--284},
  doi     = {10.1287/mksc.1040.0098}
}
```
Introduces the beta-geometric/NBD (BG/NBD) model as a computationally tractable alternative to the classic Pareto/NBD for non-contractual customer-base analysis, with parameters estimable in a spreadsheet yet comparable fit. The paper made probabilistic "buy-till-you-die" modeling accessible to practitioners and became a workhorse for forecasting repeat buying. A cornerstone of the modern CLV toolkit.
Chapter: clv

```bibtex
@article{fader2005rfm,
  author  = {Fader, Peter S. and Hardie, Bruce G. S. and Lee, Ka Lok},
  title   = {RFM and CLV: Using Iso-Value Curves for Customer Base Analysis},
  journal = {Journal of Marketing Research},
  year    = {2005},
  volume  = {42},
  number  = {4},
  pages   = {415--430},
  doi     = {10.1509/jmkr.2005.42.4.415}
}
```
Formally links the long-standing RFM (recency, frequency, monetary value) heuristic to a model-based estimate of customer lifetime value, using iso-value curves to show which customers of differing RFM profiles share the same expected future value. Built on the Pareto/NBD plus a gamma-gamma spend model and validated on CDNOW data. Bridges database-marketing practice and formal CLV theory.
Chapter: clv

```bibtex
@article{jerath2011death,
  author  = {Jerath, Kinshuk and Fader, Peter S. and Hardie, Bruce G. S.},
  title   = {New Perspectives on Customer ``Death'' Using a Generalization of the Pareto/NBD Model},
  journal = {Marketing Science},
  year    = {2011},
  volume  = {30},
  number  = {5},
  pages   = {866--880},
  doi     = {10.1287/mksc.1110.0654}
}
```
Generalizes the Pareto/NBD by introducing the periodic-death-opportunity (PDO) model, which lets customer "death" occur at discrete intervals rather than only in continuous time, spanning the range between continuous-time churn and no-churn models. The authors show how the assumed timing of dropout materially affects fit and forecasts. A methodological refinement at the frontier of customer-base modeling.
Chapter: empirical-models

## Social contagion, diffusion & networks (Van den Bulte, Iyengar)

```bibtex
@article{vandenbulte2001medical,
  author  = {Van den Bulte, Christophe and Lilien, Gary L.},
  title   = {Medical Innovation Revisited: Social Contagion versus Marketing Effort},
  journal = {American Journal of Sociology},
  year    = {2001},
  volume  = {106},
  number  = {5},
  pages   = {1409--1435},
  doi     = {10.1086/320819}
}
```
A landmark reanalysis of the classic Coleman-Katz-Menzel tetracycline-diffusion study showing that once contemporaneous marketing effort is controlled for, the apparent evidence for social contagion among physicians largely disappears. The result reframed decades of diffusion research and warned that contagion is easily confounded with marketing and unobserved heterogeneity. Foundational for skeptical, identification-focused diffusion work.
Chapter: innovation

```bibtex
@article{vandenbulte2004contagion,
  author  = {Van den Bulte, Christophe and Stremersch, Stefan},
  title   = {Social Contagion and Income Heterogeneity in New Product Diffusion: A Meta-Analytic Test},
  journal = {Marketing Science},
  year    = {2004},
  volume  = {23},
  number  = {4},
  pages   = {530--544},
  doi     = {10.1287/mksc.1040.0054}
}
```
A meta-analysis of Bass-model diffusion parameters across many products and countries, testing whether the ratio of imitation to innovation coefficients reflects genuine social contagion or instead income heterogeneity in adoption thresholds. The authors show that much of what looks like contagion is consistent with heterogeneity. Sharpens how diffusion curves should be interpreted.
Chapter: innovation

```bibtex
@article{iyengar2011opinion,
  author  = {Iyengar, Raghuram and Van den Bulte, Christophe and Valente, Thomas W.},
  title   = {Opinion Leadership and Social Contagion in New Product Diffusion},
  journal = {Marketing Science},
  year    = {2011},
  volume  = {30},
  number  = {2},
  pages   = {195--212},
  doi     = {10.1287/mksc.1100.0566}
}
```
Combines sociometric network data with prescription records to separate true network contagion from opinion leadership in the adoption of a new drug, finding that both network position and heavy product usage predict influence. A rare study with hard behavioral adoption data rather than self-reports. Central to understanding influencer effects in diffusion.
Chapter: influencer

```bibtex
@article{iyengar2015trial,
  author  = {Iyengar, Raghuram and Van den Bulte, Christophe and Lee, Jae Young},
  title   = {Social Contagion in New Product Trial and Repeat},
  journal = {Marketing Science},
  year    = {2015},
  volume  = {34},
  number  = {3},
  pages   = {408--429},
  doi     = {10.1287/mksc.2014.0888}
}
```
Decomposes social contagion into its effects on initial trial versus subsequent repeat purchasing, showing that peer influence operates differently across stages of the adoption process. Uses individual-level network and purchase data to identify where contagion actually bites. Refines influencer and word-of-mouth strategy by stage of the customer journey.
Chapter: influencer

## Pricing & targeted promotions (Z. John Zhang)

```bibtex
@article{chen2001individual,
  author  = {Chen, Yuxin and Narasimhan, Chakravarthi and Zhang, Z. John},
  title   = {Individual Marketing with Imperfect Targetability},
  journal = {Marketing Science},
  year    = {2001},
  volume  = {20},
  number  = {1},
  pages   = {23--41},
  doi     = {10.1287/mksc.20.1.23.10201}
}
```
A game-theoretic analysis of competitive targeted pricing when firms can identify customers only imperfectly, showing that improved targetability can paradoxically produce "win-win" rather than purely cut-throat competition until targeting becomes very precise. Establishes when one-to-one marketing intensifies versus softens price competition. A core reference for personalized pricing strategy.
Chapter: pricing

```bibtex
@article{feinberg2002others,
  author  = {Feinberg, Fred M. and Krishna, Aradhna and Zhang, Z. John},
  title   = {Do We Care What Others Get? A Behaviorist Approach to Targeted Promotions},
  journal = {Journal of Marketing Research},
  year    = {2002},
  volume  = {39},
  number  = {3},
  pages   = {277--291},
  doi     = {10.1509/jmkr.39.3.277.19108}
}
```
Experimentally shows that consumers' responses to targeted promotions depend not only on the price they themselves receive but on the prices offered to others, so that targeted deals to rival-firm customers can backfire by alienating loyal buyers. Brings fairness and social-comparison concerns into the economics of price discrimination. Bridges behavioral and analytical pricing.
Chapter: pricing

## Multipart pricing & plans (Iyengar)

```bibtex
@article{iyengar2008multipart,
  author  = {Iyengar, Raghuram and Jedidi, Kamel and Kohli, Rajeev},
  title   = {A Conjoint Approach to Multipart Pricing},
  journal = {Journal of Marketing Research},
  year    = {2008},
  volume  = {45},
  number  = {2},
  pages   = {195--210},
  doi     = {10.1509/jmkr.45.2.195}
}
```
Develops a conjoint-based method for designing multipart (access fee plus usage fee plus feature) pricing of the kind used in wireless, rentals, and drug plans, modeling how consumers trade off the components of a nonlinear tariff. Connects choice-based conjoint measurement to optimal plan design. A practical bridge between preference measurement and pricing structure.
Chapter: pricing

## Assortment, variety-seeking & retail (Kahn)

```bibtex
@article{ratner1999variety,
  author  = {Ratner, Rebecca K. and Kahn, Barbara E. and Kahneman, Daniel},
  title   = {Choosing Less-Preferred Experiences For the Sake of Variety},
  journal = {Journal of Consumer Research},
  year    = {1999},
  volume  = {26},
  number  = {1},
  pages   = {1--15},
  doi     = {10.1086/209547}
}
```
Demonstrates that consumers deliberately diversify across a sequence of choices even when it means selecting options they like less on any given occasion, sacrificing immediate enjoyment for the perceived value of variety. A foundational result in the psychology of variety-seeking with Daniel Kahneman as co-author. Anchors how assortment and choice architecture shape repeated decisions.
Chapter: consumer-behavior

```bibtex
@article{kahn1990retraction,
  author  = {Kahn, Barbara E. and Louie, Therese A.},
  title   = {Effects of Retraction of Price Promotions on Brand Choice Behavior for Variety-Seeking and Last-Purchase-Loyal Consumers},
  journal = {Journal of Marketing Research},
  year    = {1990},
  volume  = {27},
  number  = {3},
  pages   = {279--289},
  doi     = {10.2307/3172586}
}
```
Shows that withdrawing a price promotion affects variety-seeking and last-purchase-loyal consumers very differently, with implications for how temporary discounts reshape subsequent brand choice. An early integration of variety-seeking theory with promotion response. Useful for thinking about the downstream behavioral cost of promotions.
Chapter: pricing

## Identity-based consumption (Reed)

```bibtex
@article{reed2012identity,
  author  = {Reed, II, Americus and Forehand, Mark R. and Puntoni, Stefano and Warlop, Luk},
  title   = {Identity-Based Consumer Behavior},
  journal = {International Journal of Research in Marketing},
  year    = {2012},
  volume  = {29},
  number  = {4},
  pages   = {310--321},
  doi     = {10.1016/j.ijresmar.2012.08.002}
}
```
A definitive review synthesizing how social and personal identities shape consumption, integrating identity salience, self-construal, and identity-congruent choice into a unified framework for marketing. Widely cited as the reference statement of the identity-based consumer behavior program. Anchors work on how brands become vehicles for self-expression.
Chapter: consumer-behavior

## Charitable giving & emotion (Small)

```bibtex
@article{small2007sympathy,
  author  = {Small, Deborah A. and Loewenstein, George and Slovic, Paul},
  title   = {Sympathy and Callousness: The Impact of Deliberative Thought on Donations to Identifiable and Statistical Victims},
  journal = {Organizational Behavior and Human Decision Processes},
  year    = {2007},
  volume  = {102},
  number  = {2},
  pages   = {143--153},
  doi     = {10.1016/j.obhdp.2006.01.005}
}
```
Shows that prompting people to think analytically reduces giving to an identifiable victim, while priming feeling does not raise giving to statistical victims, isolating affect as the engine of the identifiable-victim effect. A widely cited demonstration of how deliberation can crowd out sympathy. Central to the psychology of prosocial and charitable behavior.
Chapter: consumer-behavior

```bibtex
@article{cryder2013donor,
  author  = {Cryder, Cynthia E. and Loewenstein, George and Scheines, Richard},
  title   = {The Donor Is in the Details},
  journal = {Organizational Behavior and Human Decision Processes},
  year    = {2013},
  volume  = {120},
  number  = {1},
  pages   = {15--23},
  doi     = {10.1016/j.obhdp.2012.08.002}
}
```
Finds that giving rises when donors see concrete detail about how their money will be used, because tangibility increases perceived impact and emotional engagement. A frontier-adjacent charitable-giving result complementing the identifiable-victim literature. (Lead author Cryder, not Small; included as a closely related Penn-area giving study.)
Chapter: nudges

## Consumer neuroscience & replication (Nave)

```bibtex
@article{nave2018testosterone,
  author  = {Nave, Gideon and Nadler, Amos and Dubois, David and Zava, David and Camerer, Colin and Plassmann, Hilke},
  title   = {Single-Dose Testosterone Administration Increases Men's Preference for Status Goods},
  journal = {Nature Communications},
  year    = {2018},
  volume  = {9},
  number  = {1},
  pages   = {2433},
  doi     = {10.1038/s41467-018-04923-0}
}
```
A placebo-controlled experiment showing that a single dose of testosterone raises men's preference for status-signaling brands over equivalent-quality, lower-status alternatives, providing causal biological evidence on status consumption. A flagship consumer-neuroscience study published in a top general-science venue. Grounds branding and status-signaling claims in physiology.
Chapter: consumer-behavior

```bibtex
@article{nave2017cognitive,
  author  = {Nave, Gideon and Nadler, Amos and Zava, David and Camerer, Colin},
  title   = {Single-Dose Testosterone Administration Impairs Cognitive Reflection in Men},
  journal = {Psychological Science},
  year    = {2017},
  volume  = {28},
  number  = {10},
  pages   = {1398--1407},
  doi     = {10.1177/0956797617709592}
}
```
Finds that exogenous testosterone reduces performance on the Cognitive Reflection Test, lowering deliberative "System 2" checking of intuitive answers. Connects hormones to the dual-process machinery underlying judgment and decision-making. Relevant to how physiological state modulates reasoning in consumers.
Chapter: consumer-behavior

```bibtex
@article{nave2015oxytocin,
  author  = {Nave, Gideon and Camerer, Colin and McCullough, Michael},
  title   = {Does Oxytocin Increase Trust in Humans? A Critical Review of Research},
  journal = {Perspectives on Psychological Science},
  year    = {2015},
  volume  = {10},
  number  = {6},
  pages   = {772--789},
  doi     = {10.1177/1745691615600138}
}
```
A rigorous review concluding that the widely publicized claim that intranasal oxytocin boosts human trust is not robustly supported once the full body of evidence and methodological weaknesses are considered. A model of replication-minded skepticism applied to a hyped behavioral finding. Important as a cautionary reference for translating neuroscience into marketing claims.
Chapter: data

## AI & consumers (Puntoni)

```bibtex
@article{puntoni2021ai,
  author  = {Puntoni, Stefano and Reczek, Rebecca Walker and Giesler, Markus and Botti, Simona},
  title   = {Consumers and Artificial Intelligence: An Experiential Perspective},
  journal = {Journal of Marketing},
  year    = {2021},
  volume  = {85},
  number  = {1},
  pages   = {131--151},
  doi     = {10.1177/0022242920953847}
}
```
Proposes an experiential framework organizing consumer encounters with AI into four capabilities — data capture, classification, delegation, and social interaction — and details the psychological benefits and costs of each. A foundational conceptual statement for the AI-and-consumers research frontier. Useful scaffolding for chapters on automation, personalization, and privacy.
Chapter: privacy

## Geography of demand & omnichannel (Bell)

```bibtex
@article{bell1998shop,
  author  = {Bell, David R. and Ho, Teck-Hua and Tang, Christopher S.},
  title   = {Determining Where to Shop: Fixed and Variable Costs of Shopping},
  journal = {Journal of Marketing Research},
  year    = {1998},
  volume  = {35},
  number  = {3},
  pages   = {352--369},
  doi     = {10.1177/002224379803500306}
}
```
Models store choice as the minimization of total shopping cost, decomposing it into fixed costs (travel, store loyalty) and variable costs (the prices of the items on a given shopping list), which explains why shoppers split trips across stores. A foundational framework for retail patronage and basket composition. Anchors the geography-of-demand tradition.
Chapter: empirical-models

```bibtex
@article{bell2007neighborhood,
  author  = {Bell, David R. and Song, Sangyoung},
  title   = {Neighborhood Effects and Trial on the Internet: Evidence from Online Grocery Retailing},
  journal = {Quantitative Marketing and Economics},
  year    = {2007},
  volume  = {5},
  number  = {4},
  pages   = {361--400},
  doi     = {10.1007/s11129-007-9025-5}
}
```
Shows that early online-grocery adoption clusters geographically, with local "neighborhood effects" accelerating trial as nearby households adopt, blending offline social influence with online demand. An influential study of how physical geography shapes digital channel growth. Bridges diffusion, word-of-mouth, and e-commerce.
Chapter: innovation

```bibtex
@article{bell2018showrooms,
  author  = {Bell, David R. and Gallino, Santiago and Moreno, Antonio},
  title   = {Offline Showrooms in Omnichannel Retail: Demand and Operational Benefits},
  journal = {Management Science},
  year    = {2018},
  volume  = {64},
  number  = {4},
  pages   = {1629--1651},
  doi     = {10.1287/mnsc.2016.2684}
}
```
Using Warby Parker showroom openings, shows that opening a physical showroom raises overall demand, including online demand, and yields operational benefits such as fewer returns, quantifying offline-to-online spillovers in omnichannel retail. A leading empirical study of the showroom strategy. Relevant to channel design and measuring marketing-mix spillovers.
Chapter: metrics

## Commercial sharing & digital-marketing agenda (Lamberton)

```bibtex
@article{lamberton2012sharing,
  author  = {Lamberton, Cait Poynor and Rose, Randall L.},
  title   = {When Is Ours Better than Mine? A Framework for Understanding and Altering Participation in Commercial Sharing Systems},
  journal = {Journal of Marketing},
  year    = {2012},
  volume  = {76},
  number  = {4},
  pages   = {109--125},
  doi     = {10.1509/jm.10.0368}
}
```
Develops a framework for when consumers prefer access-based "ours" consumption (car-share, bike-share) over ownership, identifying perceived risk of scarcity as a central driver of participation in commercial sharing systems. An early conceptual anchor for the sharing-economy literature. Useful for chapters on ownership, access, and new consumption models.
Chapter: consumer-behavior

```bibtex
@article{lamberton2016thematic,
  author  = {Lamberton, Cait and Stephen, Andrew T.},
  title   = {A Thematic Exploration of Digital, Social Media, and Mobile Marketing: Research Evolution from 2000 to 2015 and an Agenda for Future Inquiry},
  journal = {Journal of Marketing},
  year    = {2016},
  volume  = {80},
  number  = {6},
  pages   = {146--172},
  doi     = {10.1509/jm.15.0415}
}
```
A widely cited review organizing fifteen years of digital, social media, and mobile (DSMM) marketing research into coherent themes and setting a forward agenda, treating DSMM variously as expression, decision support, and market intelligence. A standard orienting reference for digital-marketing scholarship. Useful framing for communication and channel chapters.
Chapter: communication

## Judgment & dynamic decision-making (Meyer)

```bibtex
@article{hutchinson1994dynamic,
  author  = {Hutchinson, J. Wesley and Meyer, Robert J.},
  title   = {Dynamic Decision Making: Optimal Policies and Actual Behavior in Sequential Choice Problems},
  journal = {Marketing Letters},
  year    = {1994},
  volume  = {5},
  number  = {4},
  pages   = {369--382},
  doi     = {10.1007/bf00999211}
}
```
Compares how people actually behave in sequential choice problems against the dynamically optimal policy, documenting systematic departures from optimal search and learning over repeated decisions. An early statement of Meyer's program on the limits of consumer decision-making under dynamics and uncertainty. Relevant to learning, exploration, and judgment chapters.
Chapter: consumer-behavior

---

## UNVERIFIED — do not cite

None. All 22 entries above were resolved to a published version-of-record DOI via Crossref and their title, author list, year, journal, volume, issue, and pages were confirmed against the returned metadata.

**Notes / quarantine reasoning:**
- *Barbara Kahn & Donald Lehmann, "Modeling Choice Among Assortments"* surfaced in Crossref only as a 2026 book chapter in *Great Thinkers in Marketing* (DOI 10.1007/978-3-031-88048-3_9), i.e., a reprint volume, not the original journal article; the original journal version-of-record DOI was not confirmed, so it was excluded rather than cited to the reprint.
- *Z. John Zhang* author-name queries returned heavy noise (homonymous "Zhang" authors in operations/supply-chain venues). Only the two Zhang papers above (Chen-Narasimhan-Zhang; Feinberg-Krishna-Zhang) were positively confirmed with Zhang on the author list and are included.
- *Robert J. Meyer* journal-level marketing papers were difficult to surface cleanly in Crossref bibliographic search; only the Marketing Letters paper was confirmed to a DOI and is included. Several apparent Meyer hits resolved to book chapters or unrelated authors and were excluded.
- The Cryder-Loewenstein-Scheines giving paper is included as a related charitable-giving item but is explicitly attributed to its actual lead author (Cryder), not to Deborah Small.
