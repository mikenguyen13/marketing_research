# Branding Frontier (Recent): Computational Measurement of Brands on Unstructured Data

Scope: how **brands, brand equity, brand reputation, and brand perception** are measured with
**computational methods on unstructured data** (text, images, video, social engagement, LLMs).
Emphasis 2015-2026, top journals (JM, JMR, Marketing Science, JCR, Management Science, plus IS
journals). The Aaker / Keller / Simon-Sullivan survey-and-financial canon is treated elsewhere; it
appears here only as one-line background. Every DOI below was verified live against the Crossref
REST API (`api.crossref.org`) on 2026-06-23. Where a paper exists as both an SSRN preprint and a
published article, the **published** DOI is cited and the preprint is dropped.

> Verification note. Two items in the seed list had journal/venue corrections, confirmed via
> Crossref: (1) **Liu, Dzyabura & Mizik, "Visual Listening In"** is published in **Marketing
> Science** (2020), *not* JMR. (2) **Netzer et al., "Mine Your Own Business"** published version is
> the **Marketing Science (2012)** record `10.1287/mksc.1120.0713`, not the SSRN preprint. All eight
> seed papers were otherwise confirmed as stated. Nothing below is unverifiable; no DOI was invented.

---

## 1. Ranked list: ~25 most important recent computational brand-measurement papers

Ranking blends (a) centrality to *brand/brand-perception measurement on unstructured data*,
(b) methodological novelty, (c) journal tier and influence, (d) recency. Tier-A = field-defining
for this book's chapter; lower tiers = important supporting/founding/adjacent work.

### Tier A — core of the modern brand-measurement frontier

1. **Rust, Rand, Huang, Stephen, Brooks & Chabuk (2021) — "Real-Time Brand Reputation Tracking Using Social Media," *Journal of Marketing*.**
   DOI: `10.1177/0022242921995173`
   Why it matters: builds a continuously-updating brand-reputation index from social-media streams and validates it against established survey brand metrics — the reference architecture for "always-on" brand tracking.
   Method/data: real-time social-media text + sentiment/relevance scoring aggregated into a dynamic reputation measure; validated against traditional brand surveys.

2. **Culotta & Cutler (2016) — "Mining Brand Perceptions from Twitter Social Networks," *Marketing Science*.**
   DOI: `10.1287/mksc.2015.0968`
   Why it matters: shows brand *perceptual attributes* (e.g., eco-friendly, luxury, nutrition) can be inferred from *who a brand follows / is followed by* rather than text content — a network-structure measure of brand image.
   Method/data: follower-graph mining on Twitter; attribute scores from social connections; benchmarked against survey perceptions.

3. **Liu, Dzyabura & Mizik (2020) — "Visual Listening In: Extracting Brand Image Portrayed on Social Media," *Marketing Science*.**
   DOI: `10.1287/mksc.2020.1226`
   Why it matters: introduces *BrandImageNet* — a deep CNN that reads consumer-posted **images** to measure perceptual brand attributes, opening "visual listening" as a complement to text listening. (Venue corrected from seed's "JMR" to Marketing Science.)
   Method/data: multi-label convolutional neural net on user-generated brand images; predicts perceptual attributes; validated against survey image ratings.

4. **Hartmann, Heitmann, Schamp & Netzer (2021) — "The Power of Brand Selfies," *Journal of Marketing Research*.**
   DOI: `10.1177/00222437211037258`
   Why it matters: distinguishes "selfie" vs. "packshot" consumer brand images and links image *type* to engagement and brand outcomes — multimodal brand measurement with a managerial lever.
   Method/data: computer-vision classification of consumer-generated brand images at scale; field + experimental validation of engagement effects.

5. **Netzer, Feldman, Goldenberg & Fresko (2012) — "Mine Your Own Business: Market-Structure Surveillance Through Text Mining," *Marketing Science*.**
   DOI: `10.1287/mksc.1120.0713`
   Why it matters: founding text-mining paper for marketing — recovers brand market structure / competitive maps from forum co-mentions; the stream's intellectual anchor (one of the few pre-2015 pieces included as a founder).
   Method/data: co-occurrence + semantic-network analysis of online forum text; multidimensional-scaling brand maps.

6. **Schweidel & Moe (2014) — "Listening In on Social Media: A Joint Model of Sentiment and Venue Format Choice," *Journal of Marketing Research*.**
   DOI: `10.1509/jmr.12.0424`
   Why it matters: shows social-media sentiment is venue-biased and must be jointly modeled with *where* people post; foundational caution for any brand-sentiment index.
   Method/data: joint statistical model of sentiment and posting-venue selection across multiple social platforms.

7. **Tirunillai & Tellis (2014) — "Mining Marketing Meaning from Online Chatter: Strategic Brand Analysis of Big Data Using Latent Dirichlet Allocation," *Journal of Marketing Research*.**
   DOI: `10.1509/jmr.12.0106`
   Why it matters: LDA topic modeling of reviews to extract latent quality/brand dimensions, valence, and dynamics for strategic brand analysis — the canonical "topic models for brand attributes" paper.
   Method/data: unsupervised LDA over ~350k UGC reviews, 15 firms / 5 markets / 4 years.

8. **Liu, Dzyabura & Mizik — see #3** *(kept single entry).*

9. **Li, Castelo, Katona & Sarvary (2024) — "Frontiers: Determining the Validity of Large Language Models for Automated Perceptual Analysis," *Marketing Science*.**
   DOI: `10.1287/mksc.2023.0454`
   Why it matters: tests whether an LLM can *replace human respondents* to generate brand perceptual maps and attribute scores; introduces a triplet-agreement validation against human perception data — the key "LLM-as-perceptual-instrument" paper for brands.
   Method/data: prompt-elicited brand-similarity and attribute judgments from LLMs vs. human survey perceptual maps.

10. **Timoshenko & Hauser (2019) — "Identifying Customer Needs from User-Generated Content," *Marketing Science*.**
    DOI: `10.1287/mksc.2018.1123`
    Why it matters: uses word embeddings + machine learning to extract non-redundant customer needs from UGC efficiently — the embeddings-for-needs bridge underpinning modern brand/attribute extraction.
    Method/data: word2vec sentence embeddings + clustering + human-in-the-loop sampling on review text.

### Tier B — image, video, and multimodal brand measurement

11. **Dew, Ansari & Toubia (2022) — "Letting Logos Speak: Leveraging Multiview Representation Learning for Data-Driven Branding and Logo Design," *Marketing Science*.**
    DOI: `10.1287/mksc.2021.1326`
    Why it matters: a multimodal (image + text + ratings) variational-autoencoder that quantifies *logo* semantics and supports data-driven brand visual identity — measurement meets generative design.
    Method/data: multiview representation learning (VAE) over a large logo corpus with associated text/ratings.

12. **Burnap, Hauser & Timoshenko (2023) — "Product Aesthetic Design: A Machine Learning Augmentation," *Marketing Science*.**
    DOI: `10.1287/mksc.2022.1429`
    Why it matters: predicts the aesthetic *appeal* of designs (a core brand-equity driver) with a VAE + adversarial/supervised model; 43.5% lift over baseline — operationalizes "brand look" measurement.
    Method/data: deep generative model on car-design images with consumer appeal ratings.

13. **Li, Shi & Wang (2019) — "Video Mining: Measuring Visual Information Using Automatic Methods," *International Journal of Research in Marketing*.**
    DOI: `10.1016/j.ijresmar.2019.02.004`
    Why it matters: founding "video mining" template — extracts brand-relevant visual features frame-by-frame with CNNs; the methodological bridge from image to video brand measurement.
    Method/data: CNN feature extraction over marketing video frames.

14. **He, Li & Wang (2023) — "Image Features and Demand in the Sharing Economy: A Study of Airbnb," *International Journal of Research in Marketing*.**
    DOI: `10.1016/j.ijresmar.2023.04.001`
    Why it matters: deep-learning image features of listings → demand; a transferable template for "brand/visual cues → market outcome" measurement on unstructured images.
    Method/data: CNN-extracted image attributes linked to booking demand.

### Tier C — text analytics, embeddings, and brand market structure

15. **Gabel, Guhl & Klapper (2019) — "P2V-MAP: Mapping Market Structures for Large Retail Assortments," *Journal of Marketing Research*.**
    DOI: `10.1177/0022243719833631`
    Why it matters: product2vec — neural embeddings of basket co-occurrence yield interpretable brand/product market-structure maps at massive scale; embeddings-for-positioning exemplar.
    Method/data: word2vec-style skip-gram on shopping-basket co-occurrences + 2D map projection.

16. **Tirunillai & Tellis (2012) — "Does Chatter Really Matter? Dynamics of User-Generated Content and Stock Performance," *Marketing Science*.**
    DOI: `10.1287/mksc.1110.0682`
    Why it matters: founding UGC→firm-value paper; volume of chatter leads abnormal stock returns — establishes the social-listening-to-shareholder-value link for brands.
    Method/data: multivariate time-series / VAR + event-study on UGC metrics and stock returns.

17. **Colicev, Malshe, Pauwels & O'Connor (2018) — "Improving Consumer Mindset Metrics and Shareholder Value Through Social Media: The Different Roles of Owned and Earned Media," *Journal of Marketing*.**
    DOI: `10.1509/jm.16.0055`
    Why it matters: connects social-media (owned vs. earned) to *brand mindset metrics* (awareness, satisfaction) and then to shareholder value — the measurement chain from posts to equity.
    Method/data: social-media metrics + brand-tracking + VAR / abnormal-returns modeling.

18. **Berger, Humphreys, Ludwig, Moe, Netzer & Schweidel (2020) — "Uniting the Tribes: Using Text for Marketing Insight," *Journal of Marketing*.**
    DOI: `10.1177/0022242919873106`
    Why it matters: the field's organizing review of automated text analysis for marketing — the standard methods map (dictionaries, topics, embeddings, classifiers) for brand-text measurement.
    Method/data: conceptual/methodological review and framework.

19. **Humphreys & Wang (2018) — "Automated Text Analysis for Consumer Research," *Journal of Consumer Research*.**
    DOI: `10.1093/jcr/ucx104`
    Why it matters: the JCR companion guide to validated text-analysis pipelines (top-down dictionary vs. bottom-up); methodological grounding for construct/brand measurement from text.
    Method/data: methods review with validation guidance.

### Tier D — sentiment, brand personality, and LLM-as-respondent

20. **Hartmann, Heitmann, Siebert & Schamp (2023) — "More than a Feeling: Accuracy and Application of Sentiment Analysis," *International Journal of Research in Marketing*.**
    DOI: `10.1016/j.ijresmar.2022.05.005`
    Why it matters: benchmarks sentiment methods (lexicon vs. ML vs. transformer) and gives accuracy-aware guidance — the methods reference for any brand-sentiment/reputation index.
    Method/data: large-scale benchmark across sentiment models and datasets.

21. **Pamuksuz, Yun & Humphreys (2021) — "A Brand-New Look at You: Predicting Brand Personality in Social Media Networks with Machine Learning," *Journal of Interactive Marketing*.**
    DOI: `10.1016/j.intmar.2021.05.001`
    Why it matters: ML pipeline measuring Aaker-style *brand personality* dimensions from social-media language at scale — modern computational operationalization of a classic construct.
    Method/data: supervised ML / NLP on social posts mapped to brand-personality traits.

22. **Goli & Singh (2024) — "Frontiers: Can Large Language Models Capture Human Preferences?," *Marketing Science*.**
    DOI: `10.1287/mksc.2023.0306`
    Why it matters: probes when LLM-elicited preferences match humans (and where they diverge, e.g., time preference) — sets validity boundaries for LLM brand/preference measurement.
    Method/data: LLM preference elicitation vs. human benchmarks across tasks.

23. **Arora, Chakraborty & Nishimura (2025) — "AI-Human Hybrids for Marketing Research: Leveraging Large Language Models (LLMs) as Collaborators," *Journal of Marketing*.**
    DOI: `10.1177/00222429241276529`
    Why it matters: shows human+LLM hybrids beat either alone for qualitative and quantitative research tasks — the practical template for LLM-assisted brand-perception studies.
    Method/data: experiments comparing human-only, LLM-only, and hybrid research workflows.

24. **Wang, Zhang & Zhang (2026) — "Large Language Models for Market Research: A Data-Augmentation Approach," *Marketing Science*.**
    DOI: `10.1287/mksc.2025.0009`
    Why it matters: uses LLMs to *augment* (not replace) scarce survey data, correcting LLM bias against a human anchor — a measurement-error-aware way to scale brand perception data.
    Method/data: LLM-generated responses statistically combined with human survey data.

25. **Luo, Zhang & Duan (2013) — "Social Media and Firm Equity Value," *Information Systems Research*.**
    DOI: `10.1287/isre.1120.0462`
    Why it matters: IS-journal anchor showing blog/rating social-media metrics are leading indicators of firm equity value — complements the marketing UGC→value stream.
    Method/data: social-media metrics as leading indicators in a dynamic firm-value model.

### Bridge / adjacent (verified, useful as one-line context)

- **Humphreys, Isaac & Wang (2021) — "Construal Matching in Online Search," *JMR*.** DOI: `10.1177/0022243720940693` — applies text analysis to the consumer decision journey (adjacent text-measurement exemplar).
- **Argyle, Busby, Fulda, Gubler, Rytting & Wingate (2023) — "Out of One, Many: Using Language Models to Simulate Human Samples," *Political Analysis*.** DOI: `10.1017/pan.2023.2` — the canonical *silicon-sampling* paper (cross-field founder behind the LLM-as-respondent stream).

---

## 2. Synthesis of the streams

**(A) Text — from topics to embeddings to transformers.** The stream opens with Netzer et al. (2012)
co-mention market-structure maps and Tirunillai & Tellis (2014) LDA quality dimensions, both turning
review/forum text into *interpretable brand attribute spaces*. The second wave replaces counts and
topics with **embeddings**: Timoshenko & Hauser (2019) and Gabel et al. (2019, product2vec) show that
distributed representations recover needs and market structure more efficiently and at larger scale.
Berger et al. (2020) and Humphreys & Wang (2018) codify the methodology (dictionary vs. topic vs.
embedding vs. classifier) and — crucially for a measurement chapter — its validation requirements.

**(B) Image — "visual listening."** Liu, Dzyabura & Mizik (2020, BrandImageNet) established that
perceptual brand attributes can be read directly from consumer-posted *images*, and Hartmann et al.
(2021, brand selfies) showed image *type* carries brand meaning and drives engagement. Dew, Ansari &
Toubia (2022, logos) and Burnap et al. (2023, aesthetics) extend computer vision from *measuring*
brand image to *quantifying and generating* brand visual identity. Method core: pretrained/fine-tuned
CNNs and multimodal autoencoders.

**(C) Video & multimodal.** Li, Shi & Wang (2019) supplied the video-mining template (frame-level CNN
features); He et al. (2023, Airbnb) generalized image→outcome measurement. The frontier is multimodal
fusion (image + text + ratings, as in the logo VAE), and emerging work explicitly combines linguistic,
audio, and visual content — the direction the chapter should flag as "next."

**(D) Social-engagement → brand & firm value.** Tirunillai & Tellis (2012) and Luo, Zhang & Duan (2013,
ISR) established that UGC volume/sentiment are *leading indicators* of stock returns and firm equity;
Colicev et al. (2018) close the loop by routing social media through **brand mindset metrics**
(awareness/satisfaction) to shareholder value, distinguishing owned vs. earned media. Rust et al.
(2021) operationalize the continuous **reputation index**. Method core: VAR / time-series + event-study
abnormal returns on top of text/sentiment features.

**(E) LLM era — measurement instrument and silicon respondent.** The newest stream treats the LLM
itself as a measurement device. Li, Castelo, Katona & Sarvary (2024) build brand perceptual maps from
LLM judgments and validate them against humans; Goli & Singh (2024) map where LLM preferences match or
diverge; Wang, Zhang & Zhang (2026) and Arora et al. (2025) move from naive "silicon sampling" (Argyle
et al. 2023) toward **bias-corrected, human-anchored augmentation** — LLMs scale and pre-test brand
measures but require a human anchor for validity. This is the most active and least settled stream.

**Cross-cutting lesson for the chapter.** Every stream pairs a representation (topics, embeddings, CNN
features, LLM judgments) with an *external validation* against a traditional brand metric (survey
perceptual map, brand-tracking mindset metric, stock return). The methodological through-line — and the
right pedagogical emphasis — is *representation + validation*, not any single algorithm.

---

## 3. Proposed code demonstrations (runnable R chunks on simulated/illustrative data)

All chunks are designed to run on **simulated data** (no proprietary corpora, no API keys, no large
downloads) so they execute in CI. Each maps to a stream above. Package notes assume CRAN packages
already vetted elsewhere in the project; keep dependencies light and provide base-R fallbacks.

1. **Perceptual map from embeddings of simulated reviews** *(Stream A; ref: Timoshenko & Hauser 2019; Gabel et al. 2019).*
   Simulate reviews for ~8 brands as bags of attribute-words with brand-specific word probabilities;
   build a term-document matrix; compute brand vectors (column means of an SVD/`irlba` low-rank
   embedding); project to 2D with PCA/MDS and plot a brand perceptual map. Shows embeddings →
   positioning without any external data.

2. **Topic-model brand-attribute extraction (LDA)** *(Stream A; ref: Tirunillai & Tellis 2014).*
   Simulate a review corpus with 3-4 latent "quality dimensions"; fit LDA (`topicmodels`); recover
   per-brand topic loadings; display a brand × dimension heatmap. Demonstrates latent brand-attribute
   recovery and the valence/importance idea.

3. **Sentiment → brand-reputation index from simulated social posts** *(Stream D; ref: Rust et al. 2021; Hartmann et al. 2023).*
   Generate a daily stream of simulated posts per brand with a time-varying latent reputation driving
   sentiment; score with a small lexicon (illustrate lexicon vs. "model" accuracy tradeoff); aggregate
   into a smoothed daily reputation index with confidence bands; plot the index vs. the true latent
   series to show recoverability and the venue/volume caveat (Schweidel & Moe 2014).

4. **Network-based brand perception (follower-graph attributes)** *(Stream A/structure; ref: Culotta & Cutler 2016).*
   Simulate a bipartite brand-follows-account graph where accounts carry latent attribute tags; infer
   brand attribute scores by propagating tags through the graph (`igraph`); compare inferred vs. true
   attribute scores. Shows perception measured from *structure*, not text.

5. **Logo/color-and-shape feature extraction sketch** *(Stream B; ref: Dew et al. 2022; Liu et al. 2020).*
   Generate simple synthetic "logos" as small raster matrices (color blocks + shapes via base graphics
   to a PNG, re-read with `png`); extract low-level features (dominant colors via k-means in RGB,
   edge/contrast summaries); cluster brands by visual feature vectors. A transparent stand-in for CNN
   feature extraction — no deep-learning dependency, but the *pipeline* is identical in spirit.

6. **Social-engagement → firm-value event study** *(Stream D; ref: Tirunillai & Tellis 2012; Luo et al. 2013; Colicev et al. 2018).*
   Simulate daily abnormal returns and a "buzz" series with buzz Granger-leading returns by a few days;
   run a market-model event study around simulated buzz spikes (CAR computation) and a small VAR /
   Granger test (`vars`/`lmtest`). Demonstrates the UGC→stock leading-indicator finding end-to-end.

7. **LLM-as-perceptual-instrument (mock) → triplet validation** *(Stream E; ref: Li, Castelo, Katona & Sarvary 2024).*
   Without calling any API, simulate "LLM" brand-attribute scores as a noisy, slightly biased copy of
   "human" scores; build brand perceptual maps from each; compute **triplet agreement** (do both agree
   which of brand A/B is closer to brand C?) and Procrustes-aligned map correlation. Teaches the
   validation logic regardless of which model is used; a commented stub shows where a real
   `ellmer`/Anthropic call would slot in.

8. **LLM data-augmentation with bias correction (illustrative)** *(Stream E; ref: Wang, Zhang & Zhang 2026; Arora et al. 2025).*
   Simulate a small "human survey" sample and a large "LLM" sample with known bias; show that naive
   pooling is biased but a simple linear bias-correction / calibration against the human anchor recovers
   the true brand means with tighter intervals than human-only. Demonstrates augmentation > replacement.

9. **Brand personality from text (supervised)** *(Stream D; ref: Pamuksuz, Yun & Humphreys 2021).*
   Simulate brand posts whose word mixes encode latent Aaker personality dimensions (e.g.,
   sincerity/excitement/competence); train a multinomial/`glmnet` classifier on labeled posts; predict
   brand-level personality profiles and plot a radar/heatmap. Modern operationalization of a classic
   construct.

10. **Multimodal fusion mini-demo** *(Stream C; ref: Dew et al. 2022; "visual + text").*
    Combine the embedding vectors from chunk 1 (text) with the visual feature vectors from chunk 5
    (image) by concatenation/CCA into a joint brand space; show that fused positioning separates brands
    that text or image alone confounds. A compact illustration of why multimodal is the frontier.

*Suggested subset if only 6-8 chunks fit the chapter: 1, 2, 3, 5, 6, 7, 8 (covers text, sentiment/
reputation, image, firm-value, and the two LLM ideas); add 4 and 10 if space allows.*

---

## Appendix: Crossref verification ledger (DOI → published venue, year)

| # | Short cite | DOI | Venue | Year |
|---|------------|-----|-------|------|
| 1 | Rust et al. | 10.1177/0022242921995173 | J. Marketing | 2021 |
| 2 | Culotta & Cutler | 10.1287/mksc.2015.0968 | Marketing Science | 2016 |
| 3 | Liu, Dzyabura & Mizik | 10.1287/mksc.2020.1226 | Marketing Science | 2020 |
| 4 | Hartmann et al. (selfies) | 10.1177/00222437211037258 | JMR | 2021 |
| 5 | Netzer et al. | 10.1287/mksc.1120.0713 | Marketing Science | 2012 |
| 6 | Schweidel & Moe | 10.1509/jmr.12.0424 | JMR | 2014 |
| 7 | Tirunillai & Tellis (LDA) | 10.1509/jmr.12.0106 | JMR | 2014 |
| 8 | Timoshenko & Hauser | 10.1287/mksc.2018.1123 | Marketing Science | 2019 |
| 9 | Li, Castelo, Katona & Sarvary | 10.1287/mksc.2023.0454 | Marketing Science | 2024 |
| 10 | Dew, Ansari & Toubia | 10.1287/mksc.2021.1326 | Marketing Science | 2022 |
| 11 | Burnap, Hauser & Timoshenko | 10.1287/mksc.2022.1429 | Marketing Science | 2023 |
| 12 | Li, Shi & Wang (video) | 10.1016/j.ijresmar.2019.02.004 | IJRM | 2019 |
| 13 | He, Li & Wang (Airbnb) | 10.1016/j.ijresmar.2023.04.001 | IJRM | 2023 |
| 14 | Gabel, Guhl & Klapper (P2V-MAP) | 10.1177/0022243719833631 | JMR | 2019 |
| 15 | Tirunillai & Tellis (chatter) | 10.1287/mksc.1110.0682 | Marketing Science | 2012 |
| 16 | Colicev et al. | 10.1509/jm.16.0055 | J. Marketing | 2018 |
| 17 | Berger et al. (Uniting Tribes) | 10.1177/0022242919873106 | J. Marketing | 2020 |
| 18 | Humphreys & Wang | 10.1093/jcr/ucx104 | J. Consumer Research | 2018 |
| 19 | Hartmann et al. (sentiment) | 10.1016/j.ijresmar.2022.05.005 | IJRM | 2023 |
| 20 | Pamuksuz, Yun & Humphreys | 10.1016/j.intmar.2021.05.001 | J. Interactive Marketing | 2021 |
| 21 | Goli & Singh | 10.1287/mksc.2023.0306 | Marketing Science | 2024 |
| 22 | Arora, Chakraborty & Nishimura | 10.1177/00222429241276529 | J. Marketing | 2025 |
| 23 | Wang, Zhang & Zhang | 10.1287/mksc.2025.0009 | Marketing Science | 2026 |
| 24 | Luo, Zhang & Duan | 10.1287/isre.1120.0462 | Information Systems Research | 2013 |
| 25 | Humphreys, Isaac & Wang | 10.1177/0022243720940693 | JMR | 2021 |
| 26 | Argyle et al. (silicon sampling) | 10.1017/pan.2023.2 | Political Analysis | 2023 |

All DOIs above were resolved against `api.crossref.org` on 2026-06-23. SSRN/working-paper preprints
were superseded by published records wherever a published version exists.
