# Pillars and Constructs: Framing the Book and Inventorying What It Must Cover

*Editorial research note for the Marketing Research reference book (Quarto project).
Two deliverables: (A) the three-pillar framework that should serve as the book's
backbone, and (B) a comprehensive, DOI-verified inventory of the constructs a
doctoral marketing treatment must cover, mapped against the current chapters.*

*Every DOI below was verified live against the Crossref REST API
(`api.crossref.org`) on 2026-06-23. Where a canonical DOI could not be confirmed,
the citation is given without a DOI and flagged. No DOI in this note is invented.*

---

# PART A — THE THREE-PILLAR FRAMEWORK

## A.1 The framing in one paragraph

Marketing and social-science scholarship can be sorted, cleanly and exhaustively,
along three axes. A piece of research is *about* something in the world (a
**substantive** domain), *theorizes* something unobservable (a **construct**
domain), and *does so by some means of measurement, identification, and inference*
(a **methodological** domain). Any study sits at the intersection of all three: a
field experiment (method) on how *scarcity cues* (construct) drive demand in *flash
e-commerce sales* (substantive context). The three pillars are not competing
taxonomies but orthogonal coordinates. The pedagogical move — taught explicitly in
doctoral seminars such as Lisa Scheer's at the University of Missouri, and implicit
in most top programs' first-year structure — is to make those coordinates explicit
so that a student can locate any paper, and design any study, by asking three
separate questions instead of one muddled one.

## A.2 The three pillars, defined

**1. Substantive domains — the phenomena.** The real-world contexts and managerial
problems marketing studies: branding, advertising, pricing, salesforce, new-product
innovation, channels, services, health, gaming, online platforms, privacy. A
substantive domain answers *"what corner of the world is this about?"* Substantive
contributions matter because they establish that a phenomenon is real, important,
and patterned; they are where relevance lives. But a context is not a theory: "we
studied influencer marketing" names a substantive domain, not a contribution.

**2. Construct domains — the concepts.** The latent, theoretically defined variables
the field reasons *with*: attitudes, satisfaction, trust, commitment, loyalty, brand
equity, involvement, perceived risk, engagement, identity, emotion. A construct
domain answers *"what unobservable property are we theorizing about?"* Constructs are
the units of cumulative theory: they travel across substantive contexts (trust
matters in channels, in services, and in online reviews), and progress in a science
is largely the sharpening, differentiation, and nomological embedding of its
constructs. This is the pillar most under-served by purely empirical work and the
one Yadav (2010) warned was being crowded out.

**3. Methodological domains — the means.** How we measure constructs, identify causal
effects, and infer from data to population: scale development and psychometrics,
experimental design, causal inference (DiD, RD, IV, synthetic control), econometric
demand models, structural/analytical models, Bayesian and choice modeling, text and
image as data. A methodological domain answers *"how do we know?"* Method is what
licenses the inference connecting a substantive observation to a construct-level
claim.

A clean contribution is explicit about all three and *novel in at least one*. The
classic failure modes map onto the pillars: a paper that is only substantively novel
("first study of TikTok") with off-the-shelf constructs and methods; a paper that is
only methodologically novel (a new estimator) demonstrated on a toy construct in an
arbitrary context; a paper that claims a construct contribution but merely relabels
an existing construct. The framework's disciplinary value is that it forces the
"so-what" question to be answered on the right axis.

## A.3 The scholarly lineage (verified)

The framing is not folklore; it sits on an identifiable marketing-theory literature
about what *kinds* of contributions exist and how concepts earn their place.

- **MacInnis (2011), "A Framework for Conceptual Contributions in Marketing,"
  *Journal of Marketing.*** DOI: `10.1509/jmkg.75.4.136`. The anchor. MacInnis
  organizes conceptual contributions by the *thinking operation* involved
  (envisioning, explicating, relating, debating) and the *entity* operated on. It is
  the cleanest modern statement that conceptual/construct work is a distinct,
  evaluable form of contribution — directly the "construct pillar" rationale.

- **Yadav (2010), "The Decline of Conceptual Articles and Implications for Knowledge
  Development," *Journal of Marketing.*** DOI: `10.1509/jmkg.74.1.1`. Documents the
  empirical crowding-out of conceptual work and argues knowledge development needs a
  protected channel for construct/theory contributions. The motivating diagnosis for
  giving constructs a pillar of their own.

- **Summers (2001), "Guidelines for Conducting Research and Publishing in
  Marketing: From Conceptualization through the Review Process," *Journal of the
  Academy of Marketing Science.*** DOI: `10.1177/03079450094243`. The
  process-level companion: how a contribution travels from construct definition
  through operationalization, design, and review. Maps the substantive–construct–
  method triad onto the actual research workflow.

- **Hunt (1971), "The Morphology of Theory and the General Theory of Marketing,"
  *Journal of Marketing.*** DOI: `10.1177/002224297103500213`. Foundational
  philosophy-of-science treatment of what a marketing *theory* is and how its
  constructs, laws, and scope conditions hang together.

- **Hunt (1976), "The Nature and Scope of Marketing," *Journal of Marketing.***
  DOI: `10.1177/002224297604000304`. The three-dichotomies map of marketing's
  substantive territory (profit/nonprofit × micro/macro × positive/normative). The
  original "substantive pillar" cartography and a model for taxonomy-as-backbone.

- **MacInnis & Jaworski (1989), "Information Processing from Advertisements: Toward
  an Integrative Framework," *Journal of Marketing.*** DOI:
  `10.1177/002224298905300401`. A canonical example of construct-domain integration:
  organizing a sprawl of advertising-response constructs into one nomological
  framework. Cited here as the *exemplar* of what a construct-pillar chapter does.

- **Cronbach & Meehl (1955), "Construct Validity in Psychological Tests,"
  *Psychological Bulletin.*** DOI: `10.1037/h0040957`. The source of the
  *nomological network* idea — the reason a construct is admitted to a science by the
  web of lawful relations it enters, not by any single observation. This is the
  philosophical floor under the construct pillar and is already cited (currently as
  `CITE-NEEDED`) in `02-construct-vs-variable.qmd`.

*Citations sought but not DOI-confirmed, therefore omitted from load-bearing use:*
a specific Houston "role of conceptualization" article (Crossref returned only
loosely related Houston strategy papers); Zaltman, LeMasters & Heffring's *Theory
Construction in Marketing* (1982) book (no clean Crossref record — it is a
monograph, not a journal article, so absence is expected; cite by ISBN if used). A
Jaworski "nature of marketing thought" theory piece distinct from his control-theory
work (DOI `10.1177/002224298805200303`, 1988) was not isolable; do not attribute the
three-pillar framing to a specific Jaworski article without a confirmed source.

## A.4 How the book should use this as its backbone

The current `_quarto.yml` already *implements* the framework, which is the strongest
possible endorsement of adopting it explicitly:

- **Part "Constructs & Variables"** (ch. 02–07) = the **construct pillar**.
- **Part "Substantive Domains"** (ch. 08–22) = the **substantive pillar** (named
  almost verbatim).
- **Part "Methodology"** (ch. 23–35, 47, 49, 50) = the **methodological pillar**.

Recommended editorial moves to make the backbone load-bearing rather than incidental:

1. **State the framework once, early, as the book's organizing logic** — ideally a
   short section in `01-introduction.qmd` or `02-construct-vs-variable.qmd` — citing
   MacInnis (2011), Yadav (2010), Hunt (1976), and Cronbach & Meehl (1955). Tell the
   reader the three parts *are* the three pillars and that every chapter can be
   located by its (substantive, construct, method) coordinates.
2. **Resolve the existing `CITE-NEEDED` for Cronbach & Meehl (1955)** in
   `02-construct-vs-variable.qmd` with DOI `10.1037/h0040957` (per instructions, this
   note does not edit chapters — flagged for the editor).
3. **Open each substantive chapter with its construct/method coordinates** so the
   pillars are reinforced chapter by chapter (e.g., branding → constructs: brand
   equity/image/personality/attachment; methods: scale development, hedonic pricing,
   event studies).
4. **Fix the construct-pillar mislabeling** documented in Part B below: several
   chapters currently filed under "Constructs & Variables" are substantive contexts,
   and several first-rank constructs have no home.

---

# PART B — COMPREHENSIVE CONSTRUCT INVENTORY

Constructs a doctoral marketing treatment should cover, grouped by family. Each entry
gives a one-line definition and 1–2 seminal references with **Crossref-verified
DOIs**. (Definitions are standard-issue; the load-bearing requirement is the
verified DOI.)

## B.1 Attitudinal / evaluative constructs

- **Attitude** — a learned, relatively enduring evaluative disposition toward an
  object. *(Foundational locus is psychology — Fishbein/Ajzen, Eagly & Chaiken;
  cite via the consumer-behavior seminar chapter rather than a single marketing
  DOI.)*
- **Customer satisfaction** — the post-consumption evaluative judgment from comparing
  performance against an expectation standard. Oliver (1980), *JMR*, DOI:
  `10.1177/002224378001700405`.
- **Perceived value** — the consumer's overall assessment of utility based on what is
  received versus given. Zeithaml (1988), *JM*, DOI: `10.1177/002224298805200302`.
- **Perceived quality** — judgment of a product's overall excellence or superiority;
  treated within the same Zeithaml (1988) means-end synthesis, DOI:
  `10.1177/002224298805200302`.
- **Perceived risk** — expected negative utility from uncertainty about an outcome of
  a choice. *(Origin: Bauer 1960 conference proceedings — no Crossref DOI; treat as a
  classic non-DOI citation. Modern measurement work is DOI-bearing but secondary.)*

## B.2 Relational constructs

- **Trust** — confidence in an exchange partner's reliability and integrity. Morgan &
  Hunt (1994), *JM*, DOI: `10.1177/002224299405800302`.
- **Commitment** — an enduring desire to maintain a valued relationship; co-anchored
  with trust in Morgan & Hunt (1994), DOI: `10.1177/002224299405800302`.
- **Relationship development / relationship quality** — the staged deepening of
  buyer–seller bonds. Dwyer, Schurr & Oh (1987), *JM*, DOI:
  `10.1177/002224298705100202`.
- **Loyalty** — a deeply held commitment to rebuy a preferred offering despite
  situational pressure to switch. Oliver (1999), *JM*, DOI:
  `10.1177/00222429990634s105`.
- **Customer engagement** — a psychological state / behavioral manifestation of
  interactive customer experience beyond purchase. Brodie, Hollebeek, Jurić & Ilić
  (2011), *Journal of Service Research*, DOI: `10.1177/1094670511411703`.
- **Consumer–brand relationships** — the brand as an active relationship partner.
  Fournier (1998), *JCR*, DOI: `10.1086/209515`.
- **Brand love** — passionate emotional attachment to a brand. Batra, Ahuvia &
  Bagozzi (2012), *JM*, DOI: `10.1509/jm.09.0339`.
- **Brand / consumer attachment** — emotional bond connecting self and brand. Park,
  MacInnis, Priester, Eisingerich & Iacobucci (2010), *JM*, DOI:
  `10.1509/jmkg.74.6.1`.
- **Brand engagement in social media** — engagement specialized to social platforms.
  Hollebeek, Glynn & Brodie (2014), *Journal of Interactive Marketing*, DOI:
  `10.1016/j.intmar.2013.12.002`.
- **Identification / self–brand connection** — incorporation of the brand into the
  self-concept. Escalas & Bettman (2005), *JCR*, DOI: `10.1086/497549`.

## B.3 Brand constructs

- **Customer-based brand equity** — the differential effect of brand knowledge on
  response to marketing. Keller (1993), *JM*, DOI: `10.1177/002224299305700101`.
- **Brand image** — the set of associations held in consumer memory; treated within
  Keller (1993), DOI: `10.1177/002224299305700101`.
- **Brand personality** — the set of human characteristics associated with a brand.
  Aaker (1997), *JMR*, DOI: `10.1177/002224379703400304`.
- **Brand authenticity** — perceived genuineness/continuity/credibility of a brand.
  Morhart, Malär, Guèvremont, Girardin & Grohmann (2015), *Journal of Consumer
  Psychology*, DOI: `10.1016/j.jcps.2014.11.006`.

## B.4 Motivational / cognitive constructs

- **Involvement** — perceived personal relevance of an object based on needs, values,
  interests. Zaichkowsky (1985), *JCR*, DOI: `10.1086/208520`.
- **Regulatory focus** — promotion (gains/aspirations) vs. prevention
  (losses/obligations) self-regulatory orientation. Higgins (1997), *American
  Psychologist*, DOI: `10.1037/0003-066x.52.12.1280`.
- **Construal level / psychological distance** — abstract vs. concrete mental
  representation as a function of distance. Trope & Liberman (2010), *Psychological
  Review*, DOI: `10.1037/a0018963`.
- **Self-construal** — independent vs. interdependent definitions of the self;
  operating within the brand-meaning context of Escalas & Bettman (2005), DOI:
  `10.1086/497549`. *(Originating source Markus & Kitayama 1991, Psychological
  Review, is psychology — cite there if used.)*
- **Motivation, mindsets, goals** — directional energizers of behavior. *(No single
  marketing DOI; cover via the consumer-behavior seminar chapter, citing
  psychology.)*

## B.5 Social-influence constructs

- **Word of mouth / virality** — consumer-to-consumer transmission of brand
  information, and its propensity to spread. Berger & Milkman (2012), *JMR*, DOI:
  `10.1509/jmr.10.0353`.
- **Social influence, norms, conformity, status** — the pressure of others' real or
  imagined presence on judgment and choice. *(Disciplinary home is social psychology;
  the marketing specialization is reference-group/brand-meaning work — Escalas &
  Bettman (2005), DOI: `10.1086/497549`.)*

## B.6 Experiential / affective constructs

- **Emotion / affect** — valenced feeling states arising in and shaping consumption.
  Bagozzi, Gopinath & Nyer (1999), *Journal of the Academy of Marketing Science*,
  DOI: `10.1177/0092070399272005`.
- **Hedonic vs. utilitarian consumption; fantasies, feelings, fun** — the
  experiential view of consumption alongside the information-processing view.
  Holbrook & Hirschman (1982), *JCR*, DOI: `10.1086/208906`.
- **Nostalgia, awe, flow** — discrete experiential states (sentimental longing;
  self-transcendent wonder; absorbed optimal experience). *(Each has DOI-bearing
  marketing scale work, but the seminal sources are psychology — Csikszentmihalyi for
  flow, Keltner & Haidt for awe. Cite specific marketing operationalizations when a
  chapter is drafted.)*

## B.7 Value / outcome constructs

- **Customer lifetime value (CLV) / valuing customers** — discounted net future cash
  flow from a customer. Gupta, Lehmann & Stuart (2004), *JMR*, DOI:
  `10.1509/jmkr.41.1.7.25084`.
- **Customer equity** — the aggregated lifetime value of the firm's customer base as
  a strategic asset. Rust, Lemon & Zeithaml (2004), *JM*, DOI:
  `10.1509/jmkg.68.1.109.24030`.
- **Share of wallet, retention, customer profitability** — outcome metrics treated as
  the dependent-variable face of the CLV/customer-equity literature; covered under
  Gupta et al. (2004) and Rust et al. (2004) above and in the metrics chapter.

---

## B.8 Mapping against the current construct-pillar chapters

The "Constructs & Variables" part currently contains six chapters. Assessed against
the three-pillar definitions, **only two are genuine construct chapters; four are
substantive contexts misfiled under the construct pillar.**

| Ch. | Title | Pillar it actually belongs to | Verdict |
|-----|-------|-------------------------------|---------|
| 02 | Construct vs. Variable | Construct (meta) | **Correct.** The pillar's keystone; defines latent constructs, measurement models, validity/reliability. Belongs exactly where it is. |
| 03 | Customer Satisfaction | Construct | **Correct.** Satisfaction is a bona fide construct (Oliver 1980). The chapter itself frames it as "the most surveyed construct in marketing." |
| 04 | Innovation | **Substantive** | **Misclassified.** Innovation/new-product diffusion is a phenomenon and strategy domain (Bass diffusion, financial valuation), not a latent construct. The chapter's own framing is about "the life of an innovation," not measurement of a latent variable. → move to Substantive Domains. |
| 05 | Market Entry | **Substantive** | **Misclassified.** Entry order/timing and first-mover advantage are strategic phenomena, not constructs. → move to Substantive Domains. |
| 06 | Virality & Word of Mouth | **Substantive (phenomenon) housing a construct** | **Borderline / misclassified.** WOM-sharing propensity is construct-adjacent, but the chapter is organized around a transmission *phenomenon* and its network structure. Either move to Substantive Domains or re-scope to foreground the *construct* (WOM, social transmission, social currency). As written, it reads substantive. |
| 07 | Sarcasm & Figurative Language | **Methodological** | **Misclassified.** The chapter explicitly frames figurative language as "a measurement problem" — sentiment-measurement bias in text-as-data. This is a methodology topic (measurement/text-as-data), not a construct. → move to Methodology (near `49-text-as-data.qmd`). |

**Net:** the construct pillar, as currently populated, is mostly substantive and
methodological material wearing a construct label. Of the six chapters, two (02, 03)
are correctly placed; 04, 05, 07 are clearly misfiled; 06 is borderline and should be
re-scoped or moved.

## B.9 Major constructs that are MISSING and deserve a chapter or section

Against the inventory above, the construct pillar has large, conspicuous gaps. The
following first-rank constructs have **no dedicated construct treatment** and the
book would be materially stronger for adding them (each is backed by a verified
seminal DOI above):

**Highest priority — anchor constructs with deep literatures:**

1. **Trust & commitment / relationship quality** (Morgan & Hunt 1994,
   `10.1177/002224299405800302`; Dwyer et al. 1987, `10.1177/002224298705100202`).
   The entire relationship-marketing pillar is absent as a *construct* treatment.
2. **Brand equity / brand image / brand personality / brand authenticity** (Keller
   1993, `10.1177/002224299305700101`; Aaker 1997, `10.1177/002224379703400304`;
   Morhart et al. 2015, `10.1016/j.jcps.2014.11.006`). The book has a *substantive*
   branding chapter (08) but no *construct* chapter defining and differentiating the
   brand constructs — exactly the construct-pillar gap MacInnis (2011) warns about.
3. **Loyalty & customer engagement** (Oliver 1999, `10.1177/00222429990634s105`;
   Brodie et al. 2011, `10.1177/1094670511411703`).
4. **Perceived value / perceived quality / perceived risk** (Zeithaml 1988,
   `10.1177/002224298805200302`). The evaluative-construct family is unrepresented.

**High priority — cognitive/motivational constructs that drive the modern field:**

5. **Involvement** (Zaichkowsky 1985, `10.1086/208520`).
6. **Regulatory focus & construal level** (Higgins 1997,
   `10.1037/0003-066x.52.12.1280`; Trope & Liberman 2010, `10.1037/a0018963`) —
   the dominant process theories in consumer-behavior seminars; currently only
   implicit in the consumer-behavior seminar chapter.
7. **Emotion / affect; hedonic vs. utilitarian** (Bagozzi et al. 1999,
   `10.1177/0092070399272005`; Holbrook & Hirschman 1982, `10.1086/208906`).

**Notable secondary gaps:**

8. **Consumer–brand relationships / brand love / attachment / self–brand connection**
   (Fournier 1998, `10.1086/209515`; Batra et al. 2012, `10.1509/jm.09.0339`; Park
   et al. 2010, `10.1509/jmkg.74.6.1`; Escalas & Bettman 2005, `10.1086/497549`).
9. **CLV / customer equity as constructs** (Gupta et al. 2004,
   `10.1509/jmkr.41.1.7.25084`; Rust et al. 2004, `10.1509/jmkg.68.1.109.24030`) —
   present substantively in `13-clv.qmd` and `23-metrics.qmd`, but not framed as
   constructs in the construct pillar.

**Suggested restructuring (editor's call; this note does not edit chapters):** after
relocating 04, 05, 07 (and possibly 06) to their proper pillars, repopulate the
construct pillar with chapters/sections on (a) the brand-construct family, (b)
trust–commitment–loyalty–engagement (relational), (c) the evaluative family
(value/quality/risk), and (d) cognitive-motivational process constructs (involvement,
regulatory focus, construal level, emotion). That keeps satisfaction (03) and the
construct-vs-variable keystone (02), and turns a pillar that is currently four-fifths
mislabeled into a genuine construct backbone.

---

## Appendix — DOI verification ledger

All DOIs below were returned by `api.crossref.org` bibliographic/metadata queries on
2026-06-23 and matched on title + author + journal + year.

| Citation | DOI | Status |
|----------|-----|--------|
| MacInnis (2011), *JM* | 10.1509/jmkg.75.4.136 | verified |
| Yadav (2010), *JM* | 10.1509/jmkg.74.1.1 | verified |
| Summers (2001), *JAMS* | 10.1177/03079450094243 | verified |
| Hunt (1971), *JM* | 10.1177/002224297103500213 | verified |
| Hunt (1976), *JM* | 10.1177/002224297604000304 | verified |
| MacInnis & Jaworski (1989), *JM* | 10.1177/002224298905300401 | verified |
| Cronbach & Meehl (1955), *Psych. Bull.* | 10.1037/h0040957 | verified |
| Oliver (1980), *JMR* | 10.1177/002224378001700405 | verified |
| Zeithaml (1988), *JM* | 10.1177/002224298805200302 | verified |
| Morgan & Hunt (1994), *JM* | 10.1177/002224299405800302 | verified |
| Dwyer, Schurr & Oh (1987), *JM* | 10.1177/002224298705100202 | verified |
| Oliver (1999), *JM* | 10.1177/00222429990634s105 | verified |
| Brodie et al. (2011), *JSR* | 10.1177/1094670511411703 | verified |
| Fournier (1998), *JCR* | 10.1086/209515 | verified |
| Batra, Ahuvia & Bagozzi (2012), *JM* | 10.1509/jm.09.0339 | verified |
| Park et al. (2010), *JM* | 10.1509/jmkg.74.6.1 | verified |
| Hollebeek, Glynn & Brodie (2014), *JIM* | 10.1016/j.intmar.2013.12.002 | verified |
| Escalas & Bettman (2005), *JCR* | 10.1086/497549 | verified |
| Keller (1993), *JM* | 10.1177/002224299305700101 | verified |
| Aaker (1997), *JMR* | 10.1177/002224379703400304 | verified |
| Morhart et al. (2015), *JCP* | 10.1016/j.jcps.2014.11.006 | verified |
| Zaichkowsky (1985), *JCR* | 10.1086/208520 | verified |
| Higgins (1997), *Am. Psychol.* | 10.1037/0003-066x.52.12.1280 | verified |
| Trope & Liberman (2010), *Psych. Rev.* | 10.1037/a0018963 | verified |
| Berger & Milkman (2012), *JMR* | 10.1509/jmr.10.0353 | verified |
| Bagozzi, Gopinath & Nyer (1999), *JAMS* | 10.1177/0092070399272005 | verified |
| Holbrook & Hirschman (1982), *JCR* | 10.1086/208906 | verified |
| Gupta, Lehmann & Stuart (2004), *JMR* | 10.1509/jmkr.41.1.7.25084 | verified |
| Rust, Lemon & Zeithaml (2004), *JM* | 10.1509/jmkg.68.1.109.24030 | verified |

*Deliberately omitted (no confirmed DOI; do not cite with a fabricated identifier):*
Houston "role of conceptualization" article; Zaltman, LeMasters & Heffring *Theory
Construction in Marketing* (1982, monograph — cite by ISBN if used); Bauer (1960)
perceived risk (conference proceedings); Markus & Kitayama (1991) self-construal
(cite from psychology if used). For each, the Crossref query either returned no
matching record or only loosely related items.
