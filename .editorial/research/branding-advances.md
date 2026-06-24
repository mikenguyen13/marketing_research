# Advances in Branding and Brand-Equity Measurement: Marketing and Finance/Accounting Traditions

A citation-verified, demonstrable map for expanding the Branding chapter (`08-branding.qmd`)
and connecting it to the Marketing–Finance chapter (`21-marketing-finance.qmd`,
which already carries Tobin's-*q* material).

**Verification protocol.** Every DOI below was queried against the Crossref REST API
(`https://api.crossref.org/works/<doi>` for exact-DOI checks; `https://api.crossref.org/works?query.bibliographic=...`
for discovery). The title, journal, volume, issue, year, and author family names returned by
the Crossref *version-of-record* record were confirmed before the entry was admitted. Where a
guessed DOI resolved to the *wrong* paper, it was discarded and the correct DOI located via the
bibliographic-query endpoint (see the **DOI ledger** and **Verification incidents** sections).
Classic monographs and trade-press pieces that genuinely have no journal DOI are flagged as such,
with publisher and year — **no DOI was invented**.

This note deliberately keeps the **marketing (customer-based)** and **finance/accounting
(market-based)** traditions distinct, then bridges them. It is complementary to the existing
`branding-frontier.md` (which covers ≈2017–2025 top-4 frontier work); here the emphasis is on the
*foundational* and *measurement* literature plus the finance bridge.

---

## 1. Conceptual foundations

The conceptual base distinguishes **brand equity** (the value the brand name adds beyond the
product's functional utility) from its antecedents and consequences. Two streams define it:
Aaker's managerially-oriented **brand-equity dimensions** (awareness, perceived quality,
associations, loyalty, plus other proprietary assets) and Keller's psychologically-grounded
**customer-based brand equity (CBBE)** — the *differential effect* of brand knowledge on consumer
response to marketing. Keller & Lehmann's **brand value chain** then traces equity from marketing
investment → customer mindset → market performance → shareholder value, which is exactly the
spine that connects Chapter 8 to Chapter 21. Fournier reframes the consumer–brand link as a
**relationship** with quality and durability, supplying the relational substrate beneath attitudinal
equity.

**References (verified unless noted):**

- Keller, K. L. (1993). Conceptualizing, Measuring, and Managing Customer-Based Brand Equity.
  *Journal of Marketing*, 57(1), 1–22. DOI: `10.1177/002224299305700101` — **VERIFIED**.
- Keller, K. L., & Lehmann, D. R. (2006). Brands and Branding: Research Findings and Future
  Priorities. *Marketing Science*, 25(6), 740–759. DOI: `10.1287/mksc.1050.0153` — **VERIFIED**.
  (This is the brand-value-chain synthesis. The earlier *Marketing Letters* 2006 "value chain"
  piece is by Keller & Lehmann separately; this Marketing Science article is the canonical map.)
- Fournier, S. (1998). Consumers and Their Brands: Developing Relationship Theory in Consumer
  Research. *Journal of Consumer Research*, 24(4), 343–373. DOI: `10.1086/209515` — **VERIFIED**.
- Aaker, D. A. (1991). *Managing Brand Equity: Capitalizing on the Value of a Brand Name.*
  New York: The Free Press. — **NO JOURNAL DOI** (classic monograph; cite publisher/year). This is
  the source of the five-asset brand-equity framework.
- Aaker, D. A. (1996). *Building Strong Brands.* New York: The Free Press. — **NO JOURNAL DOI**
  (monograph; source of the "Brand Equity Ten" measurement battery). Already cited in the chapter
  as `@Aaker_1996`.

**R approach / demo idea.** No estimation; a *conceptual* demo. Build a small directed-graph
("brand value chain") with `igraph` or `DiagrammeR`: nodes = {marketing investment, awareness,
associations, perceived quality, loyalty, market share, price premium, cash flow, firm value};
edges = hypothesized links. Render it as the chapter's organizing figure so every later
measurement method maps onto a stage of the chain.

---

## 2. Customer-based (marketing) measurement

This tradition measures equity from **survey/scale data** on consumer mindset. Yoo & Donthu give a
parsimonious **multidimensional brand-equity (MBE) scale** (loyalty, perceived quality,
awareness/associations) plus a 4-item **overall brand equity (OBE)** scale. Netemeyer et al.
develop and validate **facet measures** (perceived quality, perceived value, uniqueness, and
willingness to pay a price premium) and show the premium facet is the proximal driver of purchase
intent. Park et al.'s **brand attachment** (and the attachment-vs-attitude-strength distinction)
supplies the strongest relational antecedent of equity-relevant behaviors.

**References (verified unless noted):**

- Yoo, B., & Donthu, N. (2001). Developing and validating a multidimensional consumer-based brand
  equity scale. *Journal of Business Research*, 52(1), 1–14. DOI: `10.1016/S0148-2963(99)00098-3`
  — **VERIFIED**.
- Netemeyer, R. G., Krishnan, B., Pullig, C., Wang, G., et al. (2004). Developing and validating
  measures of facets of customer-based brand equity. *Journal of Business Research*, 57(2), 209–224.
  DOI: `10.1016/S0148-2963(01)00303-4` — **VERIFIED** (note: NOT the `jmkg.68.4` DOI originally
  guessed; that 404'd).
- Park, C. W., MacInnis, D. J., Priester, J., Eisingerich, A. B., & Iacobucci, D. (2010). Brand
  Attachment and Brand Attitude Strength: Conceptual and Empirical Differentiation of Two Critical
  Brand Equity Drivers. *Journal of Marketing*, 74(6), 1–17. DOI: `10.1509/jmkg.74.6.1`
  — **NOT VERIFIED IN THIS PASS** (the `jmkg.74.6.1` form returns 404 via the exact-DOI endpoint;
  Crossref carries Park et al. 2010 but the version-of-record DOI must be reconfirmed before use —
  see incidents). Use with caution; verify before inserting into the `.bib`.
- (Already in chapter) Lassar, Mittal & Sharma (1995) `@lassar1995`; Aaker (1996) "Brand Equity
  Ten" `@Aaker_1996`.

**R approach / demo idea.** The MBE/Netemeyer scales are reflective multi-item constructs.
Demo: simulate Likert responses for ~300 respondents on 3 factors, then fit a confirmatory factor
model with `lavaan` (`cfa()`), report standardized loadings, composite reliability, and AVE; show
discriminant validity (Fornell–Larcker). Ties directly to the chapter's "Is equity reflective or
formative?" subsection — contrast a reflective CFA with a formative (composite) specification and
show the multicollinearity/identification differences.

---

## 3. Revenue / price-premium measurement

Here equity is read off **market behavior** rather than surveys. Ailawadi, Lehmann & Neslin define
the **revenue premium** — the difference in revenue (price × volume) between a brand and a
comparable private-label/generic, net of cost — as an outcome measure of brand equity computable
from scanner data; it is forward-looking, hard to game, and theoretically grounded. The
**price-premium** family (Sethuraman; Aaker's "Brand Equity Ten" premium item) isolates the
price-per-unit a brand commands at equal share, often via scanner regressions or experiments.

**References (verified unless noted):**

- Ailawadi, K. L., Lehmann, D. R., & Neslin, S. A. (2003). Revenue Premium as an Outcome Measure of
  Brand Equity. *Journal of Marketing*, 67(4), 1–17. DOI: `10.1509/jmkg.67.4.1.18688` — **VERIFIED**.
- Sethuraman, R. (2000/2003) work on price premiums and private-label competition — **not
  DOI-verified in this pass**; the most citable single anchor for the price-premium *outcome* is
  Ailawadi et al. (2003) above, and the chapter's existing `@sethuraman` entry should be checked
  against Crossref before relying on it.
- Datta, H., Ailawadi, K. L., & van Heerde, H. J. (2017) reconciles consumer-based and sales-based
  (revenue-premium) equity — DOI `10.1509/jm.15.0340` (verified in `branding-frontier.md`).

**R approach / demo idea (HIGH PRIORITY — runnable).** Revenue-premium calculation on simulated
scanner data: generate weekly price and unit-sales for a national brand and a private label across
stores; compute revenue premium = (P_brand·Q_brand − P_PL·Q_PL); summarize the distribution,
and regress log units on log price to recover own-price elasticity per brand as a side metric.
~20 lines, base R + `dplyr`.

---

## 4. Conjoint / choice-based equity

This tradition recovers equity from **trade-offs in choice**. Park & Srinivasan decompose
brand equity in a **survey-based conjoint** into an *attribute-based* component (the part explained
by measured attributes) and a *non-attribute (brand-specific)* residual, and link it to
extendibility. Swait, Erdem, Louviere & Dubelaar define the **equalization price** — the price that
makes a brand's choice probability equal to a benchmark's, i.e., the monetary value of the brand's
intangible utility in a discrete-choice model. Erdem & Swait reframe brands as **signals** that
reduce perceived risk and information costs, giving equity a credibility/clarity microfoundation
that maps onto choice-model utility.

**References (all VERIFIED):**

- Park, C. S., & Srinivasan, V. (1994). A Survey-Based Method for Measuring and Understanding Brand
  Equity and Its Extendibility. *Journal of Marketing Research*, 31(2), 271–288.
  DOI: `10.1177/002224379403100210` — **VERIFIED** (a duplicate JSTOR DOI `10.2307/3152199` also
  exists; prefer the SAGE `10.1177/...` version-of-record).
- Swait, J., Erdem, T., Louviere, J., & Dubelaar, C. (1993). The equalization price: A measure of
  consumer-perceived brand equity. *International Journal of Research in Marketing*, 10(1), 23–45.
  DOI: `10.1016/0167-8116(93)90031-S` — **VERIFIED**.
- Erdem, T., & Swait, J. (1998). Brand Equity as a Signaling Phenomenon. *Journal of Consumer
  Psychology*, 7(2), 131–157. DOI: `10.1207/s15327663jcp0702_02` — **VERIFIED**.

**R approach / demo idea (HIGH PRIORITY — runnable).** Equalization-price equity via a multinomial
logit: simulate a choice experiment with attributes (price, quality) and brand-specific intercepts
(ASCs); fit with `mlogit` or `survival::clogit`; then back out the equalization price as
ΔASC / |β_price| — the price reduction that would make a no-name option as attractive as the
branded one. ~25 lines. Pairs naturally with the chapter's preference-measurement chapter (32).

---

## 5. Finance / accounting-based valuation

This is the **market-based** tradition. Simon & Sullivan estimate brand equity from a firm's
**financial-market value**: total intangible value is the excess of market value over the
replacement cost of tangible assets (a Tobin's-*q* logic), then brand equity is the share of that
intangible attributable to brand-related factors (advertising share, order of entry, ad-to-sales).
Barth, Clement, Foster & Kasznik show that published (Interbrand/Financial World) **brand-value
estimates are value-relevant** — they explain share prices and returns incrementally over book
equity and earnings — legitimizing brand value as an accounting-relevant intangible. The
**Interbrand earnings-multiple / discounted-economic-profit** method (already demoed in the
chapter) and **Damodaran-style** relief-from-royalty / excess-earnings DCF round out the
practitioner toolkit.

**References (verified unless noted):**

- Simon, C. J., & Sullivan, M. W. (1993). The Measurement and Determinants of Brand Equity: A
  Financial Approach. *Marketing Science*, 12(1), 28–52. DOI: `10.1287/mksc.12.1.28` — **VERIFIED**.
  (Note: the `mksc.12.1.21` DOI originally guessed is a *different* article; the correct one is `.28`.)
- Barth, M. E., Clement, M. B., Foster, G., & Kasznik, R. (1998). Brand Values and Capital Market
  Valuation. *Review of Accounting Studies*, 3(1–2), 41–68. DOI: `10.1023/A:1009620132177`
  — **VERIFIED**.
- Interbrand methodology — **NO PRIMARY JOURNAL DOI** for the method itself; describe it as the
  Interbrand "Best Global Brands" discounted-economic-profit approach (publicly documented by
  Interbrand) and anchor its academic legitimacy to Barth et al. (1998) above. The chapter already
  implements a worked InterBrand-style demo (`interbrand-valuation` chunk).
- Damodaran, A. — *Investment Valuation* / "relief-from-royalty" intangible valuation. **NO journal
  DOI**; cite the monograph (Damodaran, *Investment Valuation*, Wiley) and/or his NYU Stern working
  notes. Treat as a practitioner reference, not a peer-reviewed anchor.

**R approach / demo idea (HIGH PRIORITY — runnable).** Simon–Sullivan-style Tobin's-*q* brand-value
decomposition on simulated firm financials: simulate N firms with market value, tangible-asset
replacement cost, advertising share, and order-of-entry; compute q = MV / replacement cost; regress
the intangible component (MV − replacement cost) on brand drivers; report the fitted brand-equity
share. ~25 lines, base R. This is the explicit bridge to Chapter 21's Tobin's-*q* section
(`#sec-mf-q`). A second runnable demo: a relief-from-royalty DCF (royalty rate × forecast sales,
discounted) to value a brand — ~15 lines.

---

## 6. Stock-market / risk evidence

Does brand equity show up in **stock returns and risk**? Madden, Fehle & Fournier form portfolios
of strong-brand firms (Interbrand list) and show they earn **higher returns with lower risk** than
the market and matched firms — a Fama–French/Carhart-adjusted alpha for branding. Mizik & Jacobson
show **perceptual brand attributes** (from Y&R BrandAsset Valuator) are associated with future
**stock returns**, i.e., the market does not fully/immediately impound brand-perception changes.
Johansson, Dimofte & Mazvancheryl test brand-value **resilience in the 2008 crisis**, comparing two
brand-value measures and showing strong brands lost less value. The broader theme — brands lowering
**idiosyncratic/cash-flow risk** — is the Fehle–Fournier–Madden asset-pricing strand.

**References (verified unless noted):**

- Madden, T. J., Fehle, F., & Fournier, S. (2006). Brands Matter: An Empirical Demonstration of the
  Creation of Shareholder Value Through Branding. *Journal of the Academy of Marketing Science*,
  34(2), 224–235. DOI: `10.1177/0092070305283356` — **VERIFIED**.
- Mizik, N., & Jacobson, R. (2008). The Financial Value Impact of Perceptual Brand Attributes.
  *Journal of Marketing Research*, 45(1), 15–32. DOI: `10.1509/jmkr.45.1.15` — **VERIFIED**.
- Johansson, J. K., Dimofte, C. V., & Mazvancheryl, S. K. (2012). The performance of global brands
  in the 2008 financial crisis: A test of two brand value measures. *International Journal of
  Research in Marketing*, 29(3), 235–245. DOI: `10.1016/j.ijresmar.2012.01.002` — **VERIFIED**.
- Aaker, D. A., & Jacobson, R. (2001). The Value Relevance of Brand Attitude in High-Technology
  Markets. *Journal of Marketing Research*, 38(4), 485–493. DOI: `10.1509/jmkr.38.4.485.18905`
  — **VERIFIED** (bonus anchor: links brand attitude to stock return).
- Mizik, N. (2014). Assessing the Total Financial Performance Impact of Brand Equity with Limited
  Time-Series Data. *Journal of Marketing Research*, 51(6), 691–706. DOI: `10.1509/jmr.13.0431`
  — **VERIFIED** (bonus anchor for the equity→firm-value estimation problem).
- Fehle, F., Fournier, S., Madden, T. J., & Shrider, D. G. (2008). "Brand Value and Asset Pricing."
  *Quarterly Journal of Finance and Accounting*, 47(1), 3–26. — **COULD NOT BE DOI-VERIFIED**: this
  journal has sparse Crossref coverage and no matching DOI surfaced via bibliographic query. Cite by
  journal/volume/year and flag as unverified, OR substitute Madden et al. (2006, verified) as the
  primary brand-portfolio-returns anchor.

**R approach / demo idea (HIGH PRIORITY — runnable).** Simulated brand-portfolio long–short spread:
simulate monthly returns for a "strong-brand" portfolio and the market with a small positive alpha
and lower idiosyncratic vol; run a CAPM/Fama–French-style time-series regression
(`lm(excess_port ~ mkt_excess)`) to recover alpha and beta; report the long–short (strong − weak)
mean spread and its t-stat. ~25 lines, base R. Directly mirrors Madden et al. (2006).

---

## 7. Marketing–finance bridge

Srinivasan & Hanssens synthesize **how marketing actions (including brand equity) map to firm
value**, cataloguing the metrics (Tobin's *q*, stock returns, event-study CARs), methods
(persistence models, VAR, value-relevance regressions), and findings linking marketing assets to
shareholder value. This is the connective tissue between Chapter 8 (what brand equity *is* and how
to *measure* it) and Chapter 21 (how marketing assets *price into* firm value). The **brand value
chain** (Keller & Lehmann 2006, §1) is the conceptual version; Srinivasan & Hanssens is the
empirical-methods version.

**References (all VERIFIED):**

- Srinivasan, S., & Hanssens, D. M. (2009). Marketing and Firm Value: Metrics, Methods, Findings,
  and Future Directions. *Journal of Marketing Research*, 46(3), 293–312. DOI: `10.1509/jmkr.46.3.293`
  — **VERIFIED**.

**R approach / demo idea.** Reuse the Chapter-21 Tobin's-*q* valuation-regression machinery: add
a brand-equity regressor (e.g., simulated brand-asset index) to a panel `q_it = x_it'β + α_i + δ_t`
and show the brand coefficient with two-way fixed effects (`fixest::feols`). One ≤30-line chunk that
literally bridges the two chapters by sharing the simulated-firm panel from §5.

---

## 8. Modern / computational

Equity measurement is moving to **always-on digital signals**. Colicev, Malshe, Pauwels & O'Connor
show **owned vs. earned social media** move consumer mindset metrics (awareness, satisfaction,
purchase intent) and, downstream, shareholder value — bringing the brand value chain into the
social era. Liu, Dzyabura & Mizik recover **brand image from images** via deep learning
("visual listening in"); Rust et al. track **brand reputation in real time** from social text
(both verified in `branding-frontier.md`). The frontier is **text/embedding-based brand perception**
(embedding brand mentions and measuring associative geometry) and **ML brand valuation** (predicting
brand value from multimodal firm and social signals) — methods-rich but with few single canonical
DOIs yet.

**References (verified unless noted):**

- Colicev, A., Malshe, A., Pauwels, K., & O'Connor, P. (2018). Improving Consumer Mindset Metrics
  and Shareholder Value Through Social Media: The Different Roles of Owned and Earned Media.
  *Journal of Marketing*, 82(1), 37–56. DOI: `10.1509/jm.16.0055` — **VERIFIED**.
- Liu, L., Dzyabura, D., & Mizik, N. (2020). Visual Listening In: Extracting Brand Image Portrayed
  on Social Media. *Marketing Science*, 39(4), 669–686. DOI: `10.1287/mksc.2020.1226`
  — VERIFIED (in `branding-frontier.md`).
- Rust, R. T., et al. (2021). Real-Time Brand Reputation Tracking Using Social Media.
  *Journal of Marketing*, 85(4), 21–43. DOI: `10.1177/0022242921995173`
  — VERIFIED (in `branding-frontier.md`).
- Text/embedding-based brand perception and ML brand valuation: **no single canonical top-4 DOI
  asserted here** — flagged as an open frontier rather than pinned to an unverified citation.

**R approach / demo idea.** (a) Online-ratings brand metric: simulate star ratings + review text;
compute a brand-health index = mean rating × log(volume); show it tracking a latent equity series.
(b) Text-embedding brand perception (lightweight, no GPU): take a handful of brand-association
sentences, build TF-IDF or word-co-occurrence vectors with `text2vec`, and project brands into a
2-D association map with `prcomp`/`umap`. ~25 lines; demonstrates the *method* without proprietary
data.

---

## Verified DOI ledger

All entries below confirmed against Crossref (`api.crossref.org`) in this session. Format:
`DOI — Authors (Year), Short Title — Journal vol(issue)`.

| DOI | Authors (Year) | Journal |
|---|---|---|
| `10.1177/002224299305700101` | Keller (1993), CBBE | J. Marketing 57(1) |
| `10.1287/mksc.1050.0153` | Keller & Lehmann (2006), Brands & Branding | Marketing Science 25(6) |
| `10.1086/209515` | Fournier (1998), Consumers & Their Brands | J. Consumer Research 24(4) |
| `10.1016/S0148-2963(99)00098-3` | Yoo & Donthu (2001), MBE scale | J. Business Research 52(1) |
| `10.1016/S0148-2963(01)00303-4` | Netemeyer et al. (2004), CBBE facets | J. Business Research 57(2) |
| `10.1509/jmkg.67.4.1.18688` | Ailawadi, Lehmann & Neslin (2003), Revenue Premium | J. Marketing 67(4) |
| `10.1177/002224379403100210` | Park & Srinivasan (1994), Survey-based equity | J. Marketing Research 31(2) |
| `10.1016/0167-8116(93)90031-S` | Swait, Erdem, Louviere & Dubelaar (1993), Equalization price | IJRM 10(1) |
| `10.1207/s15327663jcp0702_02` | Erdem & Swait (1998), Brand equity as signaling | J. Consumer Psychology 7(2) |
| `10.1287/mksc.12.1.28` | Simon & Sullivan (1993), Financial approach | Marketing Science 12(1) |
| `10.1023/A:1009620132177` | Barth, Clement, Foster & Kasznik (1998), Brand values & capital markets | Rev. Accounting Studies 3(1–2) |
| `10.1177/0092070305283356` | Madden, Fehle & Fournier (2006), Brands Matter | J. Academy of Marketing Science 34(2) |
| `10.1509/jmkr.45.1.15` | Mizik & Jacobson (2008), Perceptual brand attributes & financial value | J. Marketing Research 45(1) |
| `10.1016/j.ijresmar.2012.01.002` | Johansson, Dimofte & Mazvancheryl (2012), Global brands in 2008 crisis | IJRM 29(3) |
| `10.1509/jmkr.38.4.485.18905` | Aaker & Jacobson (2001), Value relevance of brand attitude | J. Marketing Research 38(4) |
| `10.1509/jmr.13.0431` | Mizik (2014), Total financial impact of brand equity | J. Marketing Research 51(6) |
| `10.1509/jmkr.46.3.293` | Srinivasan & Hanssens (2009), Marketing & Firm Value | J. Marketing Research 46(3) |
| `10.1509/jm.16.0055` | Colicev, Malshe, Pauwels & O'Connor (2018), Social media & shareholder value | J. Marketing 82(1) |
| `10.1287/mksc.2020.1226` | Liu, Dzyabura & Mizik (2020), Visual Listening In | Marketing Science 39(4) |
| `10.1177/0022242921995173` | Rust et al. (2021), Real-time reputation | J. Marketing 85(4) |

19 newly/independently verified in this session, plus 2 cross-referenced from `branding-frontier.md`.

---

## Works that could NOT be DOI-verified (do not invent DOIs)

1. **Aaker (1991), *Managing Brand Equity*** — monograph (The Free Press, 1991). No journal DOI.
   Cite publisher/year. Source of the five-asset brand-equity framework.
2. **Aaker (1996), *Building Strong Brands*** — monograph (The Free Press, 1996). No journal DOI.
   Source of the "Brand Equity Ten."
3. **Interbrand "Best Global Brands" methodology** — proprietary/practitioner method; no primary
   peer-reviewed DOI. Academic value-relevance is anchored to Barth et al. (1998, verified).
4. **Damodaran intangible/brand valuation (relief-from-royalty, excess earnings)** — monograph
   (*Investment Valuation*, Wiley) and Stern working notes; no journal DOI.
5. **Fehle, Fournier, Madden & Shrider (2008), "Brand Value and Asset Pricing"** —
   *Quarterly Journal of Finance and Accounting* 47(1). **No DOI surfaced in Crossref** (journal has
   poor Crossref coverage). Cite by journal/vol/year with an explicit "DOI not available" note, or
   prefer Madden et al. (2006, verified) as the brand-portfolio-returns anchor.
6. **Park, MacInnis, Priester, Eisingerich & Iacobucci (2010), Brand Attachment** —
   DOI `10.1509/jmkg.74.6.1` **did not resolve** via the exact-DOI endpoint in this pass (404).
   The article exists; the version-of-record DOI must be re-confirmed against Crossref before it is
   added to the `.bib`. Treat as **pending verification**, not invented.
7. **Sethuraman price-premium work** — not located/verified in this pass; the chapter's existing
   `@sethuraman` entry should be re-checked against Crossref before relying on it.

---

## Verification incidents (guessed-DOI failures caught)

These are recorded so the chapter authors trust the ledger:

- **Keller & Lehmann (2006):** the guessed `10.1007/s11002-006-4219-2` resolved (status ok) but to
  the **WRONG paper** — Carroll & Ahuvia, "Some antecedents and outcomes of brand love," *Marketing
  Letters*. Correct DOI located via bibliographic query: `10.1287/mksc.1050.0153`. (Lesson: a
  resolving DOI is not a *correct* DOI — title/author must match.)
- **Netemeyer et al. (2004):** guessed `10.1509/jmkg.68.4.1.42542` → **404**. Correct:
  `10.1016/S0148-2963(01)00303-4` (J. Business Research, not J. Marketing).
- **Park & Srinivasan (1994):** guessed `10.1287/mksc.13.4.319` → **404** (that slot is a different
  Marketing Science article). Correct: `10.1177/002224379403100210` (JMR).
- **Simon & Sullivan (1993):** guessed `10.1287/mksc.12.1.21` was a *different* article; correct
  version-of-record is `10.1287/mksc.12.1.28`.
- **Park et al. (2010) attachment:** guessed `10.1509/jmkg.74.6.1` → 404; left as pending (above).

---

## Proposed code demonstrations (≈8–12 runnable R chunks, each ≤30 lines)

Each is self-contained on **simulated data** (no proprietary datasets), ties to a verified method,
and is sized for a Quarto `{r}` chunk. Ordered to build the chapter's two-tradition arc.

1. **Brand value chain figure** (§1) — `DiagrammeR`/`igraph` directed graph from marketing
   investment → mindset → market performance → firm value. Conceptual anchor. (~15 lines)
2. **Reflective CBBE CFA** (§2) — simulate 3-factor Likert data (~300 resp.), fit `lavaan::cfa()`,
   report loadings, CR, AVE, Fornell–Larcker. Pairs with "reflective vs. formative." (~30 lines)
3. **Formative composite contrast** (§2) — same items as a formative index; show VIF/identification
   problems vs. the reflective fit. (~20 lines)
4. **Revenue-premium on simulated scanner data** (§3) — weekly price×units for brand vs. private
   label across stores; compute revenue premium distribution + own-price elasticity. (~25 lines)
5. **Price-premium experiment** (§3) — simulated equal-share choice; estimate the per-unit price a
   brand commands. (~15 lines)
6. **Equalization-price equity via MNL** (§4) — `mlogit`/`clogit` on a simulated choice experiment;
   back out equalization price = ΔASC / |β_price|. (~25 lines)
7. **Attribute vs. non-attribute equity decomposition** (§4, Park–Srinivasan) — regress brand
   preference on measured attributes; brand-specific residual = non-attribute equity. (~20 lines)
8. **Simon–Sullivan Tobin's-q brand-value decomposition** (§5) — simulate firm financials; q = MV /
   replacement cost; regress intangible value on ad-share/order-of-entry; report brand share.
   Bridges to Ch. 21 `#sec-mf-q`. (~25 lines)
9. **Relief-from-royalty brand DCF** (§5) — royalty rate × forecast sales, discounted to PV; one
   alternative to the existing InterBrand demo. (~15 lines)
10. **Brand-value relevance regression** (§5/§6, Barth et al.) — simulate share price ~ book equity
    + earnings + published brand value; show incremental R² of brand value. (~20 lines)
11. **Brand-portfolio long–short return spread** (§6, Madden et al.) — simulate strong vs. weak
    brand portfolio monthly returns; CAPM regression for alpha/beta; report long–short t-stat.
    (~25 lines)
12. **Brand equity in a Tobin's-q panel** (§7, Srinivasan–Hanssens) — extend the §8 firm panel with
    a brand-asset regressor; `fixest::feols(q ~ brand_index | firm + year)`; literal Ch.8↔Ch.21
    bridge. (~20 lines)

(Optional 13th, modern §8): **text-embedding brand-association map** — TF-IDF brand vectors via
`text2vec`, `prcomp`/`umap` projection into a 2-D perceptual map. (~25 lines)

**Recommended minimum set for the chapter (8):** #1, #2, #4, #6, #8, #10, #11, #12 — one per theme,
balanced across the marketing and finance traditions, with #8/#11/#12 carrying the finance bridge.
