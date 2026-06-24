# Debates, Controversies, and Methodological Disagreements in Marketing and Consumer Research

**Research brief: a citation-verified map of the major open debates in marketing, consumer research, and adjacent behavioral/quantitative social science, so they can be woven into the book respectfully and professionally.**

Scope and method. Each subsection frames one disagreement neutrally, summarizes the positions on each side, and cites the strongest works per side. Every DOI in the **Verified-DOI Ledger** at the bottom was checked against the Crossref REST API (`api.crossref.org/works/<DOI>`) on 2026-06-23, and the returned title / authors / year / venue matched the work cited here. Items that genuinely have no DOI, or whose only public record is a blog post or preprint, are flagged explicitly rather than given a fabricated identifier. Where a commonly-pasted DOI is wrong, the correct one is used and the substitution is noted.

A standing instruction governs the integrity material in §3: language is anchored **only** to public records — retraction notices, official university or journal investigation outcomes, and the published Data Colada posts. The book should describe what those records say ("the article was retracted"; "an investigation concluded"; "Data Colada reported anomalies"; "allegations that remain contested in litigation") and should *not* assert contested allegations as settled fact. The lesson is about scientific integrity and forensic methods, not personal judgment.

---

## 1. The replication and credibility crisis

### 1.1 Researcher degrees of freedom and false positives

**Framing.** A foundational claim of the credibility movement is that flexibility in data collection and analysis — undisclosed choices about exclusions, conditions, covariates, and stopping rules — can push the false-positive rate far above the nominal 5%, even with no real effect. The disagreement is less about whether this is *possible* (it provably is) than about how prevalent the resulting errors are and how aggressively the field should police them.

**The flexibility-is-pervasive position.** Simmons, Nelson & Simonsohn (2011), *False-Positive Psychology*, show by simulation and demonstration experiments that exploiting "researcher degrees of freedom" can yield statistically significant support for essentially any hypothesis; they propose disclosure requirements (the "21-word solution") and analytic guidelines. DOI `10.1177/0956797611417632`. Gelman & Loken (2014), *The Statistical Crisis in Science* (the "garden of forking paths"), extend the argument: even researchers who never run multiple analyses inflate error rates because the analysis they *would have run* is contingent on the data — so p-values are uninterpretable without preregistration. DOI `10.1511/2014.111.460`.

**The measured-response position.** No serious counter-party defends undisclosed flexibility, but commentators differ on remedies and on how much published work is actually affected; this connects to the registered-reports and significance debates below rather than to a named opposing camp. Treat §1.1 as a near-converged premise and present the open question as *how much* and *what to do*, not *whether*.

### 1.2 How replicable is the literature?

**Framing.** Large coordinated projects attempted to estimate the replication rate of published findings. The results are widely cited but their interpretation is contested: a non-replication can mean the original was a false positive, or that the replication differed in hidden but consequential ways (moderators, sample, context).

**The low-replicability evidence.** The Open Science Collaboration (2015) replicated 100 psychology studies and found roughly one-third to one-half met various replication criteria, with replication effect sizes about half the originals. DOI `10.1126/science.aac4716`. Camerer et al. (2018) replicated social-science experiments from *Nature* and *Science* (2010–2015) and replicated about 13 of 21, again with attenuated effects. DOI `10.1038/s41562-018-0399-z`.

**The "context and moderators matter" position.** The *Many Labs* projects ran the same protocols across many sites: Many Labs 1 (Klein et al. 2014) found most effects robust across samples while a few varied, and Many Labs 2 (Klein et al. 2018) found that effects that replicated did so consistently across settings — evidence that heterogeneity is real but does not by itself explain most non-replications. DOI `10.1027/1864-9335/a000178` (ML1); DOI `10.1177/2515245918810225` (ML2). The honest synthesis, which the book can state as such, is that the field has converged on "replication rates are materially below 100% and effect sizes shrink on replication," while continuing to debate the mix of causes.

### 1.3 Preregistration and registered reports

**Framing.** If forking paths and selective reporting are the disease, preregistration (committing to hypotheses and analyses in advance) and registered reports (peer review of the design *before* results are known, with in-principle acceptance) are the leading proposed cures. The debate is over scope: enthusiasts want them as a default; skeptics warn against over-claiming, note they constrain legitimate exploration, and ask for evidence that they actually raise quality.

**The pro-reform position.** Nosek et al. (2018), *The Preregistration Revolution*, and the *Manifesto for Reproducible Science* (Munafò et al. 2017) lay out the rationale and a broad reform agenda. DOI `10.1073/pnas.1708274114`; DOI `10.1038/s41562-016-0021`. Early outcome evidence: Soderberg et al. (2021) found registered reports scored higher on rigor and quality dimensions than comparison papers. DOI `10.1038/s41562-021-01142-4`.

**The calibrated-skepticism position.** This is best presented not as opposition to preregistration but as insistence on its limits — that it disciplines confirmatory inference without substituting for good theory or replication, and that exploratory work remains valuable when labeled honestly. The strongest articulation of "don't over-fix on significance" lives in §2.

---

## 2. Statistical-significance debates

### 2.1 The ASA statement and what p-values are not

**Framing.** The American Statistical Association issued an unusual formal statement on p-values after years of misuse. There is broad agreement on the negative claims (a p-value is not the probability the null is true; statistical significance is not practical importance) and continued disagreement on what, if anything, should replace null-hypothesis significance testing.

**Anchor.** Wasserstein & Lazar (2016), *The ASA Statement on p-Values*. DOI `10.1080/00031305.2016.1154108`. Its 2019 follow-up editorial, *Moving to a World Beyond "p < 0.05"* (Wasserstein, Schirm & Lazar 2019), summarizes the special issue and explicitly does **not** endorse a single replacement. DOI `10.1080/00031305.2019.1583913`.

### 2.2 Redefine α vs justify α vs abandon significance

**Framing.** Three distinct reform proposals compete. They agree the status quo is broken and disagree on the fix.

**"Redefine."** Benjamin et al. (2018), *Redefine Statistical Significance*, propose lowering the default threshold for new discoveries from .05 to .005 (treating .005–.05 as "suggestive"). DOI `10.1038/s41562-017-0189-z`. *(Crossref dates the record 2017 online-first; it appears in the 2018 volume.)*

**"Justify."** Lakens et al. (2018), *Justify Your Alpha*, reply that no single threshold fits all contexts and that researchers should transparently justify the α they use given costs of errors and study goals. DOI `10.1038/s41562-018-0311-x`.

**"Abandon."** Amrhein, Greenland & McShane (2019), *Scientists Rise Up Against Statistical Significance* (a comment with hundreds of signatories), and McShane et al. (2019), *Abandon Statistical Significance*, argue for retiring dichotomous "significant/not significant" thresholds entirely in favor of treating p-values as continuous evidence among many factors. DOI `10.1038/d41586-019-00857-9`; DOI `10.1080/00031305.2018.1527253`. (Blakeley McShane is a marketing/statistics scholar, which makes this directly citable in a marketing methods chapter.)

**Reading for the book.** Present these as live and unresolved; the field has *not* converged on a winner. The safe, accurate summary is: near-universal agreement that bright-line p < .05 is misused; genuine disagreement on the remedy.

### 2.3 Bayesian vs frequentist inference

**Framing.** A longer-standing, lower-temperature disagreement: whether to quantify evidence with p-values and confidence intervals (frequentist) or with posterior probabilities and Bayes factors (Bayesian). Increasingly framed as complementary rather than rival, but the priors-and-default-Bayes-factor debate is real.

**Bayesian side.** Rouder et al. (2009), default Bayes-factor t-tests, and Wagenmakers et al. (2018), *Bayesian Inference for Psychology, Part I*, argue Bayes factors can quantify evidence *for* the null and avoid p-value pathologies. DOI `10.3758/PBR.16.2.225`; DOI `10.3758/s13423-017-1343-3` *(Crossref dates 2017 online-first; 2018 volume)*. The frequentist-reform side is well-represented by the ASA materials in §2.1–2.2. The book can note that modern practice often reports both.

---

## 3. Forensic data analysis and research integrity (Data Colada and related)

**Framing — read the standing instruction first.** This subsection covers (a) the forensic *toolkit* developed to detect impossible or improbable numbers in published work, and (b) a small number of high-profile cases. For the cases, the book must use strictly measured, factual language anchored only to public records: retraction notices, official investigation outcomes, and the published Data Colada posts. Some matters remain subject to ongoing litigation; describe allegations as allegations and outcomes as outcomes. The pedagogical point is methods and integrity, never a verdict on individuals.

### 3.1 The forensic toolkit

- **p-curve.** Simonsohn, Nelson & Simmons (2014), *P-Curve: A Key to the File-Drawer*, infer whether a set of significant findings reflects real effects or selective reporting / p-hacking from the distribution of significant p-values. DOI `10.1037/a0033242`. Effect-size and power extensions are in the same authors' related work.
- **Specification-curve / multiverse analysis.** Steegen et al. (2016), *Increasing Transparency Through a Multiverse Analysis*, and Simonsohn, Simmons & Nelson (2020), *Specification Curve Analysis*, formalize running and displaying all reasonable analytic choices rather than one. DOI `10.1177/1745691616658637`; DOI `10.1038/s41562-020-0912-z`.
- **GRIM.** Brown & Heathers (2017), *The GRIM Test*, check whether reported means are arithmetically possible given the sample size and integer responses. DOI `10.1177/1948550616673876` *(Crossref dates the record 2016 online-first; widely cited as 2017)*.
- **SPRITE** (Sample Parameter Reconstruction via Iterative Techniques; Heathers, Anaya, van der Zee & Brown) reconstructs candidate raw datasets consistent with reported means/SDs to expose impossible distributions. **Flagged: the canonical SPRITE write-up is a 2018 PeerJ *Preprints* item (no journal DOI of the kind verified here); cite it as a preprint or cite the GRIM paper above for the same lineage rather than inventing a DOI.**
- **"Detect fabrication from statistics alone."** Simonsohn (2013), *Just Post It*, shows excessive uniformity / improbable similarity across conditions can reveal fabricated data and argues for routine data posting. DOI `10.1177/0956797613480366`.

### 3.2 The Ariely insurance-honesty / "sign-at-the-top" case (public-record chain)

Present strictly as a documented sequence:

1. **Original article.** Shu, Mazar, Gino, Ariely & Bazerman (2012), *Signing at the Beginning Makes Ethics Salient…*, PNAS — reported that signing an honesty pledge *before* (vs after) reporting reduced dishonesty; field study used auto-insurance mileage data. Crossref now flags the record **RETRACTED**. DOI `10.1073/pnas.1209746109`.
2. **Failed replication by the original team.** Kristal, Whillans, Bazerman et al. (2020), *Signing at the Beginning Versus at the End Does Not Decrease Dishonesty*, PNAS — a registered set of replications by several original authors that did not reproduce the effect. DOI `10.1073/pnas.1911695117`.
3. **Data Colada analysis.** In 2021, Data Colada (Simonsohn, Simmons & Nelson) published a post reporting anomalies in the field-experiment data underlying the 2012 paper (the post titled "Evidence of Fraud in an Influential Field Experiment About Dishonesty"). **Flagged: Data Colada is a blog (datacolada.org, post #98); cite it as a blog post with date, not via DOI.**
4. **Retraction.** PNAS published a retraction of Shu et al. (2021). DOI `10.1073/pnas.2115397118`.

Recommended phrasing: "the 2012 article was retracted in 2021; a replication by several of the original authors failed to reproduce the effect; Data Colada reported anomalies in the underlying field data." Note that public reporting attributes the questioned data to a specific co-author's source; because responsibility is contested and litigation has touched related matters, the book should not assign blame.

### 3.3 The Gino cases (public-record chain)

Present strictly via records:

- **A retracted article.** Gino, Kouchaki & Galinsky (2015), *The Moral Virtue of Authenticity*, *Psychological Science* — Crossref flags the record **RETRACTED**. DOI `10.1177/0956797615575277`. The corresponding retraction notice (2023) is a citable public record. DOI `10.1177/09567976231187596`.
- **Investigation and Data Colada series.** In 2023 Data Colada published a four-part series ("Data Falsificada," posts #109–#112) reporting anomalies across several papers co-authored by Francesca Gino; Harvard Business School conducted an internal investigation, and several papers were retracted. **Flagged: the Data Colada posts are blog items (datacolada.org); cite by post number and date, not DOI.**
- **Ongoing litigation.** Defamation litigation related to these allegations has been reported in public sources and elements remain contested. The book should say only that the matter "has been the subject of litigation" and that "allegations remain contested," without characterizing the merits.

Style note for §3.2–3.3: lead with the *method* (what GRIM, p-curve, posting raw data, and independent forensic re-analysis can reveal), use the cases as illustrations of why data transparency matters, and keep every factual claim traceable to a retraction notice, an official investigation statement, or a dated Data Colada post.

---

## 4. Marketing-specific methodological debates

### 4.1 Structural vs reduced-form modeling (the credibility revolution in marketing)

**Framing.** Should marketing estimate primitives of a behavioral/economic model (structural), enabling counterfactuals and policy simulation, or prioritize clean identification of a specific causal effect via design/quasi-experiment (reduced-form)? The economics "credibility revolution" sharpened this into a methodological fault line that runs through quantitative marketing.

**Reduced-form / design-based.** Angrist & Pischke (2010), *The Credibility Revolution in Empirical Economics*, argue better research design (experiments, IV, RD, diff-in-diff) has "taken the con out of econometrics." DOI `10.1257/jep.24.2.3`. In marketing, Rossi (2014), *Even the Rich Can Make Themselves Poor*, critiques routine IV use — warning that weak/invalid instruments can be worse than the endogeneity they purport to fix — which paradoxically motivates *either* better design *or* structural modeling. DOI `10.1287/mksc.2014.0860`.

**Structural.** Chintagunta, Erdem, Rossi & Wedel (2006), *Structural Modeling in Marketing: Review and Assessment*, make the case that structural models answer counterfactual and welfare questions reduced-form cannot. DOI `10.1287/mksc.1050.0161`. The cautionary companion commentary, Mazzeo et al. (2006), *Marketing Structural Models: "Keep It Real"*, argues structural work must stay disciplined by credible identification and data — a useful both-sides anchor in one exchange. DOI `10.1287/mksc.1060.0235`. **Best chapters: causal inference (47), structural models (29), empirical models (27).**

### 4.2 Formative vs reflective measurement

**Framing.** In reflective measurement, the latent construct *causes* its indicators (indicators are interchangeable effects); in formative measurement, indicators *cause* / compose the construct (dropping one changes the construct's meaning). Misspecifying direction biases structural estimates. The debate is over how common misspecification is, whether formative "constructs" are even latent variables, and how to validate them.

**Formative-indicators-are-real-and-misused position.** Bollen & Lennox (1991), *Conventional Wisdom on Measurement*, established that standard psychometric rules (high inter-item correlation, alpha) are inappropriate for causal/formative indicators. DOI `10.1037/0033-2909.110.2.305`. Jarvis, MacKenzie & Podsakoff (2003) documented widespread reflective misspecification of constructs that are arguably formative in marketing/consumer research. DOI `10.1086/376806`. Diamantopoulos & Winklhofer (2001) give an index-construction procedure for formative indicators; Diamantopoulos, Riefler & Roth (2008) advance validation guidance. DOI `10.1509/jmkr.38.2.269.18845`; DOI `10.1016/j.jbusres.2008.01.009`.

**The skeptical / alternative-procedure position.** Rossiter (2002), the C-OAR-SE procedure, rejects much of conventional scale development (including reliance on factor analysis and the reflective default) and proposes a content-validity-first alternative — itself controversial and debated in IJRM. DOI `10.1016/S0167-8116(02)00097-6`. A further strand (Edwards and others) questions whether formative "measurement" is measurement at all; present this as an unresolved conceptual dispute. **Best chapters: construct vs variable (02), measurement scales (30), preference measurement (32).**

### 4.3 The PLS-SEM controversy

**Framing.** Partial Least Squares path modeling is popular in some marketing/IS subfields and distrusted in others. The dispute is technical: critics say PLS lacks a true latent-variable model, gives biased/inconsistent estimates, and its fit/validity heuristics are unreliable; proponents say criticisms target outdated or strawman versions and that PLS suits prediction-oriented, formative, and small-sample work.

**Critique.** Rönkkö & Evermann (2013), *A Critical Examination of Common Beliefs About PLS Path Modeling*, argue several standard PLS claims do not hold up. DOI `10.1177/1094428112474693`.

**Response.** Henseler et al. (2014), *Common Beliefs and Reality About PLS*, reply point-by-point, conceding some issues while rejecting others and clarifying appropriate use. DOI `10.1177/1094428114526928`. This pair is an unusually clean "critique + rejoinder in the same journal" exchange. **Best chapters: structural models (29), measurement scales (30).**

### 4.4 Measuring advertising returns: experiments vs attribution models

**Framing.** Can observational/attribution methods recover the causal effect of advertising on sales, or are large-scale randomized experiments effectively required? The debate pits the practical appeal of attribution modeling against evidence that ad effects are small relative to sales noise and that selection/endogeneity badly bias non-experimental estimates.

**The "you basically need experiments" position.** Lewis & Rao (2015), *The Unfavorable Economics of Measuring the Returns to Advertising*, show that ROI is statistically hard to measure because effects are tiny relative to sales variance — even large experiments are underpowered. DOI `10.1093/qje/qjv023`. Blake, Nosko & Tadelis (2015), in a large eBay field experiment, find brand-keyword paid search delivered near-zero incremental value, contradicting observational attribution. DOI `10.3982/ECTA12423`. Gordon et al. (2019) compare observational and experimental ad-measurement at Facebook and find common observational methods often diverge substantially from the experimental benchmark. DOI `10.1287/mksc.2018.1135`.

**The attribution-modeling position.** Multi-touch attribution research seeks to apportion credit across touchpoints from observational path data; Li & Kannan (2014) build an attribution model validated against a field experiment, and Berman (2018) analyzes the incentives and biases of last-touch vs model-based attribution. DOI `10.1509/jmr.13.0050`; DOI `10.1287/mksc.2018.1104`. Present the convergence honestly: the field increasingly treats experiments (or strong quasi-experiments) as the gold standard for *incrementality*, with attribution useful for allocation under stated assumptions. **Best chapters: advertising (10), causal inference (47), metrics (23), marketing-mix models (36).**

### 4.5 The nudge-effectiveness / publication-bias debate

**Framing.** How large and reliable are choice-architecture "nudge" effects in aggregate? A 2021 meta-analysis reported a sizable average effect; reanalyses argued that effect collapses once publication bias is modeled. This is a live dispute about meta-analytic method as much as about nudges.

**Large-effect meta-analysis.** Mertens, Herberz, Hahnel & Brosch (2021/2022 PNAS), *The Effectiveness of Nudging*, report a moderate, broadly positive average effect across domains. DOI `10.1073/pnas.2107346118`.

**Publication-bias reanalyses.** Maier, Bartoš, Stanley, Shanks et al. (2022), *No Evidence for Nudging After Adjusting for Publication Bias*, find the average effect is not distinguishable from zero once bias-correction is applied. DOI `10.1073/pnas.2200300119`. Szaszi, Higney, Charlton, Gelman, Tipton et al. (2022), *No Reason to Expect Large and Consistent Effects of Nudge Interventions*, argue heterogeneity and bias mean one should not expect uniform effects. DOI `10.1073/pnas.2200732119`. Present as unresolved, with the methodological lesson (publication bias and effect heterogeneity dominate the conclusion) as the durable takeaway. **Best chapter: nudges (16); methods lesson cross-refs to reporting (43) and metrics (23).**

### 4.6 Mediation-analysis critiques

**Framing.** Baron–Kenny-style and bootstrap mediation (estimating indirect effects from observational designs) is ubiquitous in consumer research. Critics argue that without experimental manipulation of the mediator, mediation claims are causally unidentified, and that mechanical "indirect effect is significant" reporting overstates what was learned.

**The causal-identification critique.** Bullock, Green & Ha (2010), *Yes, But What's the Mechanism? (Don't Expect an Easy Answer)*, show statistical mediation does not establish causal mechanism without strong, often experimental, assumptions. DOI `10.1037/a0018933`.

**The constructive-reform position.** Pieters (2017), *Meaningful Mediation Analysis*, argues for plausible causal inference and informative reporting rather than abandoning mediation — a "do it better" rejoinder rather than a defense of the status quo. DOI `10.1093/jcr/ucx081`. Present as broadly converging toward "mediation needs design (manipulated mediators, moderation-of-process, or sensitivity analysis), not just bootstraps." **Best chapters: causal inference (47), consumer-behavior seminar (38), reporting (43).**

### 4.7 The common-method-bias debate

**Framing.** When predictor and outcome come from the same survey respondent at one time, shared method can inflate observed correlations. The dispute: is common-method variance a serious, pervasive threat requiring statistical remedies and design changes, or an overstated "urban legend" whose proposed fixes can do more harm than good?

**The serious-threat position.** Podsakoff, MacKenzie, Lee & Podsakoff (2003), *Common Method Biases in Behavioral Research*, catalog sources and remedies and is the field's standard reference. DOI `10.1037/0021-9010.88.5.879`.

**The "urban legend" position.** Spector (2006), *Method Variance in Organizational Research: Truth or Urban Legend?*, argues the blanket assumption that same-source data are fatally biased is overstated and that some popular corrections (e.g., the unmeasured latent method factor) are problematic. DOI `10.1177/1094428105284955`. Present as genuinely two-sided; consensus has moved toward "design out method overlap where possible; treat post-hoc statistical fixes cautiously." **Best chapters: surveys (31), measurement scales (30), construct vs variable (02).**

### 4.8 Online-panel / MTurk data-quality debates

**Framing.** Crowdsourced samples (Amazon Mechanical Turk, later Prolific/CloudResearch) democratized data collection but raised concerns about non-naïveté, inattentive responding, bots, and VPN "server farms." The debate is whether such data are fundamentally compromised or whether quality is a manageable function of researcher screening.

**Early validation.** Buhrmester, Kwang & Gosling (2011) argued MTurk yields reliable, demographically diverse data at low cost. DOI `10.1177/1745691610393980`. Paolacci & Chandler (2014) characterized the participant pool and its limits. DOI `10.1177/0963721414531598`.

**Non-naïveté / contamination concerns.** Chandler, Mueller & Paolacci (2014) documented worker non-naïveté (repeated exposure to common tasks) and its consequences. DOI `10.3758/s13428-013-0365-7`.

**The "data are badly compromised" vs "burden is on researchers" exchange.** Webb & Tangney (2022), *Too Good to Be True: Bots and Bad Data From Mechanical Turk*, reported that a large share of a sample was invalid. DOI `10.1177/17456916221120027`. Keith & McKay (2024), *Too Anecdotal to Be True?*, reply that the alarming numbers reflect design and screening choices, not an inherent platform failure. DOI `10.1177/17456916241234328`. Present as ongoing, with consensus on concrete safeguards (attention checks, geolocation/bot screening, pre-registered exclusion rules). **Best chapters: surveys (31), data (24); cross-ref reporting (43).**

---

## 5. Theoretical-school tensions

### 5.1 Behavioral vs rational/economic modeling

**Framing.** Should consumer behavior be modeled as (boundedly) rational optimization, or does systematic deviation from rationality require psychologically-grounded models? Largely synthesized today (behavioral economics is mainstream), but the modeling-style tension persists between structural rational-choice work and behavioral-decision research.

**Behavioral side.** Kahneman & Tversky (1979), *Prospect Theory*, is the seminal demonstration that choices under risk depart systematically from expected-utility predictions. DOI `10.2307/1914185`. **Rational/structural side.** The structural-modeling literature in §4.1 (Chintagunta et al. 2006) represents the optimization-based tradition; present the contrast as one of modeling philosophy and intended use (counterfactual policy vs psychological mechanism), now frequently combined in "structural behavioral" work. **Best chapters: consumer-behavior seminar (38), modeling (25), analytical models (26).**

### 5.2 Consumer Culture Theory (interpretive) vs quantitative paradigms

**Framing.** Consumer Culture Theory studies the sociocultural, experiential, and symbolic dimensions of consumption using interpretive/qualitative methods; the tension with the dominant quantitative-experimental paradigm is over what counts as knowledge, generalization, and rigor. This is a paradigm difference, not a "who is right" dispute.

**Interpretive anchor.** Arnould & Thompson (2005), *Consumer Culture Theory (CCT): Twenty Years of Research*, consolidates the interpretive program and its standards of rigor. DOI `10.1086/426626`. Present the quantitative side via the construct/measurement and experimental chapters; the book's job is to represent both as legitimate, with different questions and warrants. **Best chapters: qualitative research (33), consumer-behavior seminar (38), construct vs variable (02).**

### 5.3 Service-Dominant Logic and its critics

**Framing.** Service-Dominant (S-D) logic reframes marketing around service, value co-creation, and operant resources rather than goods and embedded value. It is influential and also criticized as too abstract to be empirically testable, or as relabeling existing ideas; an adjacent "service logic" tradition offers a competing formulation.

**S-D logic.** Vargo & Lusch (2004), *Evolving to a New Dominant Logic for Marketing*, and Vargo & Lusch (2008), *Service-Dominant Logic: Continuing the Evolution*, state and refine the framework. DOI `10.1509/jmkg.68.1.1.24036`; DOI `10.1007/s11747-007-0069-6` *(Crossref dates the second 2007 online-first; cited as 2008)*. **Competing/critical formulation.** Grönroos & Voima (2012/2013), *Critical Service Logic*, argue value is created in the customer's sphere and reframe co-creation more restrictively — a substantive alternative rather than mere critique. DOI `10.1007/s11747-012-0308-3`. Present as an active conceptual debate without declaring a winner. **Best chapters: service (18), branding (08), marketing-strategy seminar (40).**

---

## Debate-to-chapter map

| Debate | Primary chapter(s) | Secondary / cross-ref |
|---|---|---|
| 1.1 Researcher degrees of freedom / forking paths | 41 scientific-writing, 43 reporting | 42 review-process, 47 causal-inference |
| 1.2 Replication rates / Many Labs | 41 scientific-writing, 42 review-process | 43 reporting |
| 1.3 Preregistration & registered reports | 42 review-process, 41 scientific-writing | 43 reporting |
| 2.1 ASA statement / what p-values aren't | 43 reporting, 25 modeling | 50 choice-bayesian |
| 2.2 Redefine vs justify vs abandon α | 43 reporting | 41 scientific-writing, 42 review-process |
| 2.3 Bayesian vs frequentist | 50 choice-bayesian, 25 modeling | 43 reporting |
| 3.1 Forensic toolkit (GRIM, p-curve, SPRITE, multiverse) | 42 review-process, 43 reporting | 41 scientific-writing |
| 3.2–3.3 Integrity cases (Ariely, Gino) — public records only | 42 review-process | 41 scientific-writing |
| 4.1 Structural vs reduced-form | 47 causal-inference, 29 structural-models | 27 empirical-models |
| 4.2 Formative vs reflective measurement | 02 construct-vs-variable, 30 measurement-scales | 32 preference-measurement |
| 4.3 PLS-SEM controversy | 29 structural-models, 30 measurement-scales | — |
| 4.4 Ad returns: experiments vs attribution | 10 advertising, 47 causal-inference | 23 metrics, 36 marketing-mix-models |
| 4.5 Nudge effectiveness / publication bias | 16 nudges | 43 reporting, 23 metrics |
| 4.6 Mediation-analysis critiques | 47 causal-inference, 38 consumer-behavior-seminar | 43 reporting |
| 4.7 Common-method-bias | 31 surveys, 30 measurement-scales | 02 construct-vs-variable |
| 4.8 MTurk / online-panel data quality | 31 surveys, 24 data | 43 reporting |
| 5.1 Behavioral vs rational modeling | 38 consumer-behavior-seminar, 25 modeling | 26 analytical-models |
| 5.2 CCT (interpretive) vs quantitative | 33 qualitative-research, 38 consumer-behavior-seminar | 02 construct-vs-variable |
| 5.3 Service-dominant logic & critics | 18 service, 08 branding | 40 marketing-strategy-seminar |

---

## Verified-DOI Ledger

All verified against `api.crossref.org/works/<DOI>` on 2026-06-23; returned title/authors/year/venue matched.

| Work | DOI | Status |
|---|---|---|
| Simmons, Nelson & Simonsohn 2011, False-Positive Psychology, *Psych Science* | `10.1177/0956797611417632` | verified |
| Gelman & Loken 2014, The Statistical Crisis in Science, *American Scientist* | `10.1511/2014.111.460` | verified |
| Open Science Collaboration 2015, Reproducibility of psychological science, *Science* | `10.1126/science.aac4716` | verified |
| Camerer et al. 2018, Replicability of social-science experiments, *Nat Hum Behav* | `10.1038/s41562-018-0399-z` | verified |
| Klein et al. 2014, Many Labs 1, *Social Psychology* | `10.1027/1864-9335/a000178` | verified |
| Klein et al. 2018, Many Labs 2, *AMPPS* | `10.1177/2515245918810225` | verified |
| Nosek et al. 2018, The Preregistration Revolution, *PNAS* | `10.1073/pnas.1708274114` | verified |
| Munafò et al. 2017, A manifesto for reproducible science, *Nat Hum Behav* | `10.1038/s41562-016-0021` | verified |
| Soderberg et al. 2021, Research quality of registered reports, *Nat Hum Behav* | `10.1038/s41562-021-01142-4` | verified |
| Nosek et al. 2015, Promoting an open research culture (TOP), *Science* | `10.1126/science.aab2374` | verified |
| Wasserstein & Lazar 2016, ASA Statement on p-Values, *Am Statistician* | `10.1080/00031305.2016.1154108` | verified |
| Wasserstein, Schirm & Lazar 2019, Moving to a World Beyond p<0.05, *Am Statistician* | `10.1080/00031305.2019.1583913` | verified |
| Benjamin et al. 2018, Redefine statistical significance, *Nat Hum Behav* | `10.1038/s41562-017-0189-z` | verified (online-first 2017) |
| Lakens et al. 2018, Justify your alpha, *Nat Hum Behav* | `10.1038/s41562-018-0311-x` | verified |
| Amrhein, Greenland & McShane 2019, Scientists rise up…, *Nature* | `10.1038/d41586-019-00857-9` | verified |
| McShane et al. 2019, Abandon Statistical Significance, *Am Statistician* | `10.1080/00031305.2018.1527253` | verified |
| Rouder et al. 2009, Bayesian t tests, *Psychon Bull Rev* | `10.3758/PBR.16.2.225` | verified |
| Wagenmakers et al. 2018, Bayesian inference Part I, *Psychon Bull Rev* | `10.3758/s13423-017-1343-3` | verified (online-first 2017) |
| Simonsohn, Nelson & Simmons 2014, P-Curve, *JEP: General* | `10.1037/a0033242` | verified |
| Steegen et al. 2016, Multiverse analysis, *Perspect Psych Sci* | `10.1177/1745691616658637` | verified |
| Simonsohn, Simmons & Nelson 2020, Specification curve analysis, *Nat Hum Behav* | `10.1038/s41562-020-0912-z` | verified |
| Brown & Heathers 2017, The GRIM Test, *SPPS* | `10.1177/1948550616673876` | verified (online-first 2016) |
| Simonsohn 2013, Just Post It, *Psych Science* | `10.1177/0956797613480366` | verified |
| Shu, Mazar, Gino, Ariely & Bazerman 2012 (RETRACTED), *PNAS* | `10.1073/pnas.1209746109` | verified — Crossref flags RETRACTED |
| Kristal, Whillans, Bazerman et al. 2020, Signing… does not decrease dishonesty, *PNAS* | `10.1073/pnas.1911695117` | verified |
| Retraction for Shu et al. 2021, *PNAS* | `10.1073/pnas.2115397118` | verified (retraction notice) |
| Gino, Kouchaki & Galinsky 2015 (RETRACTED), Moral Virtue of Authenticity, *Psych Science* | `10.1177/0956797615575277` | verified — Crossref flags RETRACTED |
| Retraction Notice to Gino et al. 2023, *Psych Science* | `10.1177/09567976231187596` | verified (retraction notice) |
| Angrist & Pischke 2010, Credibility Revolution, *J Econ Perspect* | `10.1257/jep.24.2.3` | verified |
| Rossi 2014, Even the Rich Can Make Themselves Poor, *Marketing Science* | `10.1287/mksc.2014.0860` | verified |
| Chintagunta, Erdem, Rossi & Wedel 2006, Structural Modeling in Marketing, *Marketing Science* | `10.1287/mksc.1050.0161` | verified |
| Mazzeo et al. 2006, Marketing Structural Models: "Keep It Real", *Marketing Science* | `10.1287/mksc.1060.0235` | verified |
| Bollen & Lennox 1991, Conventional Wisdom on Measurement, *Psych Bulletin* | `10.1037/0033-2909.110.2.305` | verified |
| Jarvis, MacKenzie & Podsakoff 2003, Construct indicators & misspecification, *JCR* | `10.1086/376806` | verified |
| Diamantopoulos & Winklhofer 2001, Index Construction with Formative Indicators, *JMR* | `10.1509/jmkr.38.2.269.18845` | verified |
| Diamantopoulos, Riefler & Roth 2008, Advancing formative measurement models, *J Bus Res* | `10.1016/j.jbusres.2008.01.009` | verified |
| Rossiter 2002, C-OAR-SE procedure, *IJRM* | `10.1016/S0167-8116(02)00097-6` | verified |
| Rönkkö & Evermann 2013, Critical Examination of PLS, *Org Res Methods* | `10.1177/1094428112474693` | verified |
| Henseler et al. 2014, Common Beliefs and Reality About PLS, *Org Res Methods* | `10.1177/1094428114526928` | verified |
| Lewis & Rao 2015, Unfavorable Economics of Measuring Returns to Advertising, *QJE* | `10.1093/qje/qjv023` | verified |
| Blake, Nosko & Tadelis 2015, Consumer Heterogeneity & Paid Search, *Econometrica* | `10.3982/ECTA12423` | verified |
| Gordon et al. 2019, Comparison of Approaches to Advertising Measurement, *Marketing Science* | `10.1287/mksc.2018.1135` | verified |
| Li & Kannan 2014, Attributing Conversions…, *JMR* | `10.1509/jmr.13.0050` | verified |
| Berman 2018, Beyond the Last Touch: Attribution…, *Marketing Science* | `10.1287/mksc.2018.1104` | verified |
| Mertens et al. 2022, The Effectiveness of Nudging, *PNAS* | `10.1073/pnas.2107346118` | verified (online-first 2021) |
| Maier et al. 2022, No evidence for nudging after adjusting for publication bias, *PNAS* | `10.1073/pnas.2200300119` | verified |
| Szaszi et al. 2022, No reason to expect large and consistent effects…, *PNAS* | `10.1073/pnas.2200732119` | verified |
| Bullock, Green & Ha 2010, Yes, but what's the mechanism?, *JPSP* | `10.1037/a0018933` | verified |
| Pieters 2017, Meaningful Mediation Analysis, *JCR* | `10.1093/jcr/ucx081` | verified |
| Podsakoff, MacKenzie, Lee & Podsakoff 2003, Common Method Biases, *J Appl Psych* | `10.1037/0021-9010.88.5.879` | verified |
| Spector 2006, Method Variance: Truth or Urban Legend?, *Org Res Methods* | `10.1177/1094428105284955` | verified |
| Buhrmester, Kwang & Gosling 2011, Amazon's Mechanical Turk, *Perspect Psych Sci* | `10.1177/1745691610393980` | verified |
| Paolacci & Chandler 2014, Inside the Turk, *Curr Dir Psych Sci* | `10.1177/0963721414531598` | verified |
| Chandler, Mueller & Paolacci 2014, Naïveté among MTurk workers, *Behav Res Methods* | `10.3758/s13428-013-0365-7` | verified (online-first 2013) |
| Webb & Tangney 2022, Too Good to Be True, *Perspect Psych Sci* | `10.1177/17456916221120027` | verified |
| Keith & McKay 2024, Too Anecdotal to Be True?, *Perspect Psych Sci* | `10.1177/17456916241234328` | verified |
| Kahneman & Tversky 1979, Prospect Theory, *Econometrica* | `10.2307/1914185` | verified |
| Arnould & Thompson 2005, Consumer Culture Theory, *JCR* | `10.1086/426626` | verified |
| Vargo & Lusch 2004, Evolving to a New Dominant Logic, *J Marketing* | `10.1509/jmkg.68.1.1.24036` | verified |
| Vargo & Lusch 2008, Service-dominant logic: continuing the evolution, *JAMS* | `10.1007/s11747-007-0069-6` | verified (online-first 2007) |
| Grönroos & Voima 2013, Critical service logic, *JAMS* | `10.1007/s11747-012-0308-3` | verified (online-first 2012) |

### Items flagged as having no verifiable journal DOI (do NOT fabricate)

- **SPRITE** (Heathers, Anaya, van der Zee & Brown 2018) — circulated as a PeerJ *Preprints* item; cite as a preprint, or cite GRIM (Brown & Heathers 2017, verified above) for the same forensic lineage.
- **Data Colada posts** (datacolada.org) — blog posts, not DOI-bearing. For §3 cite by post number and date: the Ariely field-experiment post (post #98, 2021) and the "Data Falsificada" Gino series (posts #109–#112, 2023). These are public records suitable for measured citation; they have no DOIs.
- **Ongoing litigation** related to §3.3 — reference via public reporting only; characterize as "subject to litigation" and "contested," with no DOI and no merits characterization.

### Corrected DOIs encountered during verification (for the author's awareness)

- "Redefine statistical significance" is `10.1038/s41562-017-0189-z` (a `…0311-y` variant in circulation is **wrong / 404**).
- The Diamantopoulos, Riefler & Roth (2008) formative-measurement review is `10.1016/j.jbusres.2008.01.009` (a `10.1007/s11747-008-0114-0` sometimes cited belongs to a different JAMS article, Song & Parry 2009).
- The Chintagunta et al. structural-modeling review is `10.1287/mksc.1050.0161`; nearby Marketing Science DOIs in that issue resolve to commentaries/other papers.

---

## How to write these respectfully — style note

1. **Frame the question, not the verdict.** Open each debate with the *tension* ("Should X be modeled structurally or via design-based identification?"), not a conclusion. Declare convergence only where the field genuinely has converged (e.g., replication rates are materially below 100%; experiments are the gold standard for ad incrementality) and label it explicitly as convergence.

2. **Steelman both sides.** State each position in the form its strongest proponents would endorse, and cite that side's best work. Avoid "critics claim" / "defenders insist" asymmetry — give each side a verb of equal standing.

3. **Separate "is this real" from "how common / what to do."** Many of these (forking paths, common-method variance) involve agreement on the mechanism and disagreement on prevalence and remedy. Make that structure explicit; it defuses the appearance of a brawl.

4. **For integrity matters, write like a court reporter, not a prosecutor.** Use only: "the article was retracted" (cite the retraction notice DOI), "an investigation concluded…" (cite the institution's public statement), "Data Colada reported anomalies…" (cite the dated post), "allegations remain contested in litigation." Do not assert intent, do not name a culprit where responsibility is contested, do not editorialize. Anchor every sentence to a public record. The teaching point is *why data transparency and forensic checks matter*, not who did what.

5. **Cite the exchange, not just one shot.** Where a critique-plus-rejoinder exists in the same venue (PLS: Rönkkö & Evermann ↔ Henseler et al.; structural: Chintagunta et al. ↔ "Keep It Real"; nudges: Mertens ↔ Maier/Szaszi; MTurk: Webb & Tangney ↔ Keith & McKay), cite both sides together so the reader can follow the argument.

6. **Keep it in service of the method.** These debates earn their place by teaching the reader to make better design and inference choices — preregister confirmatory tests, justify α, prefer experiments for incrementality, specify measurement direction, screen panel data. End each woven passage with the actionable lesson, not the score.
