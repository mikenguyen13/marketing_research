# UCLA (Anderson School of Management) — Verified Marketing Bibliography

Influential and frontier marketing scholarship associated with UCLA's Anderson School of Management. Every entry below has a DOI verified against Crossref. All are published version-of-record DOIs (10.1287/, 10.1509/, 10.1177/, 10.1086/, 10.1007/, 10.1257/); no SSRN/preprint/dataset DOIs are cited. Annotations and chapter tags map each work to the book's chapters.

Verification method: queried `https://api.crossref.org/works?query.bibliographic=...` (plus `query.author=...`) and confirmed metadata (title/authors/journal/year/volume/issue/DOI) against `https://api.crossref.org/works/<doi>`. Faculty already gathered elsewhere (Tellis, Marinova, the conjoint set including Peter Rossi's HB/conjoint work, and the branding-frontier and advertising sets) are not re-listed; Rossi's other structural/Bayesian works are included here.

Notes on affiliations: Crossref records the affiliation at time of publication, so several entries list authors' prior institutions (e.g., Rossi's 1990s Bayesian/structural papers list University of Chicago; Mogilner's 2010 paper lists Wharton; Hershfield's saving work lists his pre-Anderson affiliation). The listed scholars are current or former UCLA Anderson marketing faculty.

---

## Modeling

```bibtex
@article{rossi2003bayesian,
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
Rossi and Allenby lay out why the Bayesian paradigm is uniquely suited to marketing problems: modular hierarchical models, principled treatment of heterogeneity, and decision-theoretic outputs that map directly onto marketing actions. The piece became the conceptual anchor for a generation of Bayesian marketing modeling. Foundational reading for the modeling chapter's treatment of estimation philosophy.
Chapter: modeling

```bibtex
@article{bodapati2008recommendation,
  author  = {Bodapati, Anand V.},
  title   = {Recommendation Systems with Purchase Data},
  journal = {Journal of Marketing Research},
  year    = {2008},
  volume  = {45},
  number  = {1},
  pages   = {77--93},
  doi     = {10.1509/jmkr.45.1.77}
}
```
Bodapati develops a modeling framework for recommendation agents that distinguishes a product's intrinsic appeal from the consumer's exposure to it, showing that ignoring exposure biases recommendations toward already-popular items. The exposure-versus-attraction decomposition reframes how purchase data should inform targeting. A core analytics reference for recommendation and personalization modeling.
Chapter: modeling

## Empirical Models

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
This landmark paper quantifies how much household purchase history is worth for targeted couponing, using a hierarchical Bayes choice model to form individual-level posteriors. The authors show even short histories yield targeting gains several times those of blanket couponing. A foundational empirical-models and CRM/targeting reference.
Chapter: empirical-models

```bibtex
@article{bodapati2004directapproach,
  author  = {Bodapati, Anand and Gupta, Sachin},
  title   = {A Direct Approach to Predicting Discretized Response in Target Marketing},
  journal = {Journal of Marketing Research},
  year    = {2004},
  volume  = {41},
  number  = {1},
  pages   = {73--85},
  doi     = {10.1509/jmkr.41.1.73.25081}
}
```
Bodapati and Gupta argue that when the goal is predicting a discretized (e.g., buy/no-buy) outcome, directly modeling that discretized response outperforms the conventional approach of modeling the underlying continuous variable, especially under misspecification with large samples. The result has practical force for direct-marketing prediction. Useful for the empirical-models discussion of objective-aligned estimation.
Chapter: empirical-models

```bibtex
@article{bucklin1999upcscanner,
  author  = {Bucklin, Randolph E. and Gupta, Sunil},
  title   = {Commercial Use of {UPC} Scanner Data: Industry and Academic Perspectives},
  journal = {Marketing Science},
  year    = {1999},
  volume  = {18},
  number  = {3},
  pages   = {247--273},
  doi     = {10.1287/mksc.18.3.247}
}
```
Drawing on interviews with 41 executives, Bucklin and Gupta document where scanner-data analysis actually drove decisions in practice (promotions, trade deals, pricing) versus where academic modeling outpaced adoption. It is a candid bridge between the scanner-data modeling literature and managerial reality. A grounding reference for the data and empirical-models chapters.
Chapter: data

## Structural Models

```bibtex
@article{chevalier2003peakdemand,
  author  = {Chevalier, Judith A. and Kashyap, Anil K. and Rossi, Peter E.},
  title   = {Why Don't Prices Rise During Periods of Peak Demand? Evidence from Scanner Data},
  journal = {American Economic Review},
  year    = {2003},
  volume  = {93},
  number  = {1},
  pages   = {15--37},
  doi     = {10.1257/000282803321455142}
}
```
Using 7.5 years of supermarket scanner data, the authors document that retail margins fall during peak-demand periods (e.g., holidays) — counter to naive market-power intuition — consistent with loss-leader and advertised-price competition. The paper is a touchstone for empirical-IO reasoning about retailer pricing. Relevant to structural pricing models and the marketing–economics interface.
Chapter: structural-models

```bibtex
@article{bucklin1991twostate,
  author  = {Bucklin, Randolph E. and Lattin, James M.},
  title   = {A Two-State Model of Purchase Incidence and Brand Choice},
  journal = {Marketing Science},
  year    = {1991},
  volume  = {10},
  number  = {1},
  pages   = {24--39},
  doi     = {10.1287/mksc.10.1.24}
}
```
Bucklin and Lattin model shoppers as moving between a "planned" and an "opportunistic" decision state, capturing how in-store information and promotions differentially affect category incidence and brand choice. The latent-state structure became a template for integrated incidence-and-choice modeling. A classic structural treatment of frequently purchased goods.
Chapter: structural-models

## CLV

```bibtex
@article{bucklin2003websitebrowsing,
  author  = {Bucklin, Randolph E. and Sismeiro, Catarina},
  title   = {A Model of Web Site Browsing Behavior Estimated on Clickstream Data},
  journal = {Journal of Marketing Research},
  year    = {2003},
  volume  = {40},
  number  = {3},
  pages   = {249--267},
  doi     = {10.1509/jmkr.40.3.249.19241}
}
```
This early clickstream paper models within-site browsing as page-view and continuation decisions, recovering how site design and prior behavior shape depth of visits. It established a methodological vocabulary for analyzing server-log behavioral traces. Foundational for modeling online engagement, retention, and the behavioral inputs to customer value.
Chapter: clv

```bibtex
@article{rutz2012banner,
  author  = {Rutz, Oliver J. and Bucklin, Randolph E.},
  title   = {Does Banner Advertising Affect Browsing for Brands? Clickstream Choice Model Says Yes, for Some},
  journal = {Quantitative Marketing and Economics},
  year    = {2012},
  volume  = {10},
  number  = {2},
  pages   = {231--257},
  doi     = {10.1007/s11129-011-9114-3}
}
```
Rutz and Bucklin use a clickstream choice model to show banner advertising shifts brand browsing for a subset of consumers, quantifying heterogeneous response often missed by aggregate click metrics. The paper sharpens how display advertising's behavioral effect should be measured. Relevant to advertising effectiveness and the behavioral antecedents of customer value.
Chapter: advertising

## Advertising

```bibtex
@article{rutz2011generic,
  author  = {Rutz, Oliver J. and Bucklin, Randolph E.},
  title   = {From Generic to Branded: A Model of Spillover in Paid Search Advertising},
  journal = {Journal of Marketing Research},
  year    = {2011},
  volume  = {48},
  number  = {1},
  pages   = {87--102},
  doi     = {10.1509/jmkr.48.1.87}
}
```
This paper models dynamic spillover in paid search, showing generic-keyword activity raises future branded search (an awareness effect) while the reverse does not hold — an asymmetry with direct budget-allocation implications. It is an influential treatment of cross-keyword dynamics in search advertising. Central to attribution and the measurement of search-ad effectiveness.
Chapter: advertising

```bibtex
@article{srinivasan2009innovation,
  author  = {Srinivasan, Shuba and Pauwels, Koen and Silva-Risso, Jorge and Hanssens, Dominique M.},
  title   = {Product Innovations, Advertising, and Stock Returns},
  journal = {Journal of Marketing},
  year    = {2009},
  volume  = {73},
  number  = {1},
  pages   = {24--43},
  doi     = {10.1509/jmkg.73.1.024}
}
```
Srinivasan, Pauwels, Silva-Risso, and Hanssens link product innovations and their advertising support to abnormal stock returns, showing markets reward innovation more when backed by advertising. The paper is a keystone of the marketing–finance interface connecting marketing-mix actions to shareholder value. Relevant to both advertising returns and the metrics chapter's value-linkage theme.
Chapter: advertising

## Metrics

```bibtex
@article{dekimpe1999sustained,
  author  = {Dekimpe, Marnik G. and Hanssens, Dominique M.},
  title   = {Sustained Spending and Persistent Response: A New Look at Long-Term Marketing Profitability},
  journal = {Journal of Marketing Research},
  year    = {1999},
  volume  = {36},
  number  = {4},
  pages   = {397--412},
  doi     = {10.1177/002224379903600401}
}
```
Dekimpe and Hanssens use persistence modeling (unit-root and impulse-response analysis) to separate temporary from permanent marketing effects, reframing how long-run profitability of spending should be assessed. It anchored the time-series persistence tradition in marketing. A core reference for long-term marketing metrics and dynamic response.
Chapter: metrics

## Branding

```bibtex
@article{sood2012brandname,
  author  = {Sood, Sanjay and Keller, Kevin Lane},
  title   = {The Effects of Brand Name Structure on Brand Extension Evaluations and Parent Brand Dilution},
  journal = {Journal of Marketing Research},
  year    = {2012},
  volume  = {49},
  number  = {3},
  pages   = {373--382},
  doi     = {10.1509/jmr.07.0418}
}
```
Sood and Keller show that branding structure — direct extensions versus subbranding — governs both how favorably an extension is evaluated and how much negative feedback flows back to dilute the parent brand. Subbranding both boosts extensions and insulates the parent. A central branding-architecture reference for extension strategy.
Chapter: branding

```bibtex
@article{dreze2009feelingsuperior,
  author  = {Dr{\`e}ze, Xavier and Nunes, Joseph C.},
  title   = {Feeling Superior: The Impact of Loyalty Program Structure on Consumers' Perceptions of Status},
  journal = {Journal of Consumer Research},
  year    = {2009},
  volume  = {35},
  number  = {6},
  pages   = {890--905},
  doi     = {10.1086/593946}
}
```
Drèze and Nunes show that status in a loyalty program is relative: a consumer's sense of elevated standing depends on how many others sit below them, so program tier structure can manufacture or erode felt status. The work reframes loyalty programs as status-signaling systems. Relevant to branding and customer-relationship design.
Chapter: branding

## Nudges

```bibtex
@article{nunes2006endowedprogress,
  author  = {Nunes, Joseph C. and Dr{\`e}ze, Xavier},
  title   = {The Endowed Progress Effect: How Artificial Advancement Increases Effort},
  journal = {Journal of Consumer Research},
  year    = {2006},
  volume  = {32},
  number  = {4},
  pages   = {504--512},
  doi     = {10.1086/500480}
}
```
Nunes and Drèze demonstrate that granting people artificial initial progress toward a goal (e.g., a loyalty card pre-stamped) increases persistence and completion relative to an equivalent goal started from zero. The endowed-progress effect is a widely applied behavioral lever in program design. A canonical nudge for the goal-gradient and program-design discussion.
Chapter: nudges

```bibtex
@article{hershfield2011futureself,
  author  = {Hershfield, Hal E. and Goldstein, Daniel G. and Sharpe, William F. and Fox, Jesse and Yeykelis, Leo and Carstensen, Laura L. and Bailenson, Jeremy N.},
  title   = {Increasing Saving Behavior Through Age-Progressed Renderings of the Future Self},
  journal = {Journal of Marketing Research},
  year    = {2011},
  volume  = {48},
  number  = {SPL},
  pages   = {S23--S37},
  doi     = {10.1509/jmkr.48.spl.s23}
}
```
Hershfield and colleagues show that exposing people to age-progressed visual renderings of their future selves increases willingness to allocate money to long-term saving, operationalizing future-self continuity as a behavioral intervention. It is a flagship demonstration of how to nudge intertemporal financial choice. Central to the nudges chapter and consumer-finance applications.
Chapter: nudges

## Consumer Behavior

```bibtex
@article{spiller2011opportunitycost,
  author  = {Spiller, Stephen A.},
  title   = {Opportunity Cost Consideration},
  journal = {Journal of Consumer Research},
  year    = {2011},
  volume  = {38},
  number  = {4},
  pages   = {595--610},
  doi     = {10.1086/660045}
}
```
Spiller shows that consumers often neglect opportunity costs — the forgone alternative uses of money — but can be prompted to consider them, which systematically changes spending and choice, especially under budget constraints. The work formalizes when and why opportunity-cost neglect arises. A foundational consumer-finance and decision-making reference.
Chapter: consumer-behavior

```bibtex
@article{greenberg2016opportunitycostneglect,
  author  = {Greenberg, Adam Eric and Spiller, Stephen A.},
  title   = {Opportunity Cost Neglect Attenuates the Effect of Choices on Preferences},
  journal = {Psychological Science},
  year    = {2016},
  volume  = {27},
  number  = {1},
  pages   = {103--113},
  doi     = {10.1177/0956797615608267}
}
```
Greenberg and Spiller show that when people neglect opportunity costs, choosing an option does not strengthen their preference for it as much as classic choice-induced preference change would predict — linking opportunity-cost framing to preference construction. The result connects budgeting cognition to attitude dynamics. Relevant to consumer decision-making and preference formation.
Chapter: consumer-behavior

```bibtex
@article{shu2009meretouch,
  author  = {Peck, Joann and Shu, Suzanne B.},
  title   = {The Effect of Mere Touch on Perceived Ownership},
  journal = {Journal of Consumer Research},
  year    = {2009},
  volume  = {36},
  number  = {3},
  pages   = {434--447},
  doi     = {10.1086/598614}
}
```
Peck and Shu demonstrate that merely touching an object raises perceived ownership and, through it, valuation — a tactile route into the endowment effect with direct retail and e-commerce implications. The finding grounds psychological ownership in a simple, manipulable cue. A key consumer-behavior reference on ownership and valuation.
Chapter: consumer-behavior

```bibtex
@article{shu2011psychownership,
  author  = {Shu, Suzanne B. and Peck, Joann},
  title   = {Psychological Ownership and Affective Reaction: Emotional Attachment Process Variables and the Endowment Effect},
  journal = {Journal of Consumer Psychology},
  year    = {2011},
  volume  = {21},
  number  = {4},
  pages   = {439--452},
  doi     = {10.1016/j.jcps.2011.01.002}
}
```
Across nine studies, Shu and Peck argue that psychological ownership and affective reaction jointly mediate the endowment effect, recasting loss aversion in valuation as partly an emotional-attachment phenomenon. The paper provides a process account rather than a purely loss-aversion one. A core reference for ownership, attachment, and valuation in consumer behavior.
Chapter: consumer-behavior

```bibtex
@article{drolet2002rulevariability,
  author  = {Drolet, Aimee},
  title   = {Inherent Rule Variability in Consumer Choice: Changing Rules for Change's Sake},
  journal = {Journal of Consumer Research},
  year    = {2002},
  volume  = {29},
  number  = {3},
  pages   = {293--305},
  doi     = {10.1086/344433}
}
```
Drolet shows consumers vary their decision rules across successive choices — switching strategies seemingly for variety's sake — even when the underlying problem is unchanged. The finding complicates any model assuming a fixed choice rule. Relevant to consumer decision-making and the stability assumptions behind preference models.
Chapter: consumer-behavior

```bibtex
@article{mogilner2009timevsmoney,
  author  = {Mogilner, Cassie and Aaker, Jennifer},
  title   = {"The Time vs. Money Effect": Shifting Product Attitudes and Decisions through Personal Connection},
  journal = {Journal of Consumer Research},
  year    = {2009},
  volume  = {36},
  number  = {2},
  pages   = {277--291},
  doi     = {10.1086/597161}
}
```
Mogilner and Aaker show that priming time (versus money) shifts product attitudes by fostering personal connection to the product, with the effect depending on the consumption context and the consumer's orientation. The "time vs. money effect" reframes how framing influences valuation. A frequently cited consumer-behavior reference on temporal framing.
Chapter: consumer-behavior

## Preference Measurement

```bibtex
@article{drolet2009choicerevealspreference,
  author  = {Drolet, Aimee and Luce, Mary Frances and Simonson, Itamar},
  title   = {When Does Choice Reveal Preference? Moderators of Heuristic versus Goal-Based Choice},
  journal = {Journal of Consumer Research},
  year    = {2009},
  volume  = {36},
  number  = {1},
  pages   = {137--147},
  doi     = {10.1086/596305}
}
```
Drolet, Luce, and Simonson identify conditions under which observed choices reflect underlying goals versus context-driven heuristics, clarifying when revealed choice is a valid signal of true preference. The framework speaks directly to the validity assumptions behind choice-based preference measurement. Useful for the preference-measurement chapter's discussion of choice as a measurement instrument.
Chapter: preference-measurement

## Privacy

```bibtex
@article{hollenbeck2018chainaffiliation,
  author  = {Hollenbeck, Brett},
  title   = {Online Reputation Mechanisms and the Decreasing Value of Chain Affiliation},
  journal = {Journal of Marketing Research},
  year    = {2018},
  volume  = {55},
  number  = {5},
  pages   = {636--654},
  doi     = {10.1177/0022243718802844}
}
```
Hollenbeck shows that as online review platforms spread, the revenue premium hotels earned from chain affiliation fell by over half, because consumer-generated reputation substitutes for brand as a quality signal. The paper documents a structural shift in the value of branding under information abundance. Relevant to branding economics and the information/disclosure themes of the data and metrics chapters.
Chapter: branding

```bibtex
@article{he2022fakereviews,
  author  = {He, Sherry and Hollenbeck, Brett and Proserpio, Davide},
  title   = {The Market for Fake Reviews},
  journal = {Marketing Science},
  year    = {2022},
  volume  = {41},
  number  = {5},
  pages   = {896--921},
  doi     = {10.1287/mksc.2022.1353}
}
```
He, Hollenbeck, and Proserpio infiltrate online markets where sellers buy fake reviews, measuring how purchased reviews temporarily boost ratings and sales before platform detection, and documenting the welfare and trust consequences. It is a frontier empirical study of review manipulation in digital platforms. Relevant to data integrity, online-reputation, and consumer-trust concerns adjacent to privacy and metrics.
Chapter: data
