# PIE replication: Predicted Incrementality by Experimentation

Companion code for the section on predicted incrementality in Chapter 10 (Advertising),
`sec-adv-pie`, which discusses

> Gordon, B. R., Moakler, R. & Zettelmeyer, F. (2026). Predicted Incrementality by
> Experimentation for Ad Measurement. *Management Science*, published online ahead of
> print. doi:10.1287/mnsc.2023.01108. Preprint: arXiv:2304.06828 (v2, 1 April 2026,
> CC BY 4.0).

The paper's empirical application uses 2,226 proprietary Meta Conversion Lift
experiments, so it can't be reproduced outside Meta. What can be reproduced is the
fully specified simulation in its Appendix 3, along with the modelling pipeline.

| File | What it does |
|:--|:--|
| `pie_sim_functions.R` | The Appendix 3 data-generating process: campaign parameters drawn with a Gaussian copula, user-level exposure, clicks and potential outcomes, the within-campaign sample split, and four nested OLS PIE specifications scored by pooled out-of-sample R². |
| `replicate_appendix3.R` | Re-runs 23 scenarios from Tables A-3 to A-7 and writes `appendix3_results.csv`, which the chapter reads. It takes about 25–40 minutes. |
| `appendix3_results.csv` | Our R² for each specification next to the paper's full-model R². |
| `pie_platform_demo.R` | A synthetic platform with 2,250 RCTs from 450 advertisers. It is calibrated only to aggregates the paper reports, and runs the paper's empirical pipeline: ICPD target, spend-weighted random forests, a raw last-click benchmark, the single-experiment calibration multiplier, advertiser-grouped cross-validation, a learning curve, and go/no-go disagreement. Its numbers are an exercise, not a reproduction. |

## Choices the paper leaves open

- **The label.** Appendix 3 builds the outcome, "observed incremental conversions",
  from half 1 of each campaign's users. We use *expected* incremental conversions
  per user (the mean of Prob_T − Prob_C over all users in half 1). That equals the
  ATT times the exposure rate, and under full compliance it equals the ATT. With
  this label, Tables A-3 to A-6 match within about 0.02. If the label is instead the
  *realized* difference of Bernoulli draws, R² falls (0.42 and 0.14 at 10,000 and
  1,000 users), because label noise caps the attainable R². The paper's footnote 21
  makes the same point. A label equal to the ATT alone reproduces Tables A-3 to A-6
  but not Table A-7: there the exposure rate only helps because it scales the
  incremental-conversion count.
- **Unstated parameters.** γ = 0 in Tables A-3 to A-6. The paper doesn't report the
  click process for Table A-7, so each row is run with both click settings from
  Table A-6.
- **Small training samples.** With 50 RCTs, each OLS fit sees 25 campaigns, and R²
  then depends on details the paper does not report: how rank-deficient columns are
  handled (the exposure rate is constant under full compliance) and whether
  repetitions are pooled. Expect the largest gaps there.

## Run

```r
# from the repository root
source("replication/pie/replicate_appendix3.R")   # writes appendix3_results.csv
source("replication/pie/pie_platform_demo.R")     # prints the synthetic-platform R^2
```

R 4.4 with `ranger`. Base R covers the rest, and `ggplot2` draws the chapter's figures.
