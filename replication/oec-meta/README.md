# Meta-analytic overall evaluation criteria for A/B tests

Companion code for `sec-causal-oec` in Chapter 47 (Causal Inference and Field
Experiments), which discusses

> Huch, E., Nail, S. A., Melconian, T., Vongsathorn, X. & Feinberg, F. (2026).
> Overall Evaluation Criteria for A/B Tests: A Meta-Analytic Approach.
> *Marketing Science*, published online ahead of print (open access).
> doi:10.1287/mksc.2025.0164

The paper's application uses 190 confidential Zillow A/B tests, which can't be
reproduced outside Zillow. The authors' replication package (synthetic archives
drawn from their fitted model, and Python code) is distributed through the INFORMS
dataset page, which requires a registration form; it was not used here. This
folder is an independent R implementation written from the paper's Section 4 and
Appendix B. It reproduces the estimators and the design of the simulation study on
a data-generating process of our own, so the levels of our results are not
comparable with the paper's tables. Only the comparison between methods is.

| File | What it does |
|:--|:--|
| `oec_samplers.R` | Base-R collapsed Gibbs samplers. `gibbs_re()` fits the multivariate Gaussian, Gaussian-0 (prior mean fixed at zero) and Student-t random-effects models (Appendix B.1, B.2). `gibbs_dpm()` fits the Dirichlet process mixture (Appendix B.3) and, given known labels, the metaregression variant. Both accept a mask of unobserved metrics (the paper's eq. 6). Also the naive estimator, posterior summaries, and the surrogacy measures R², TVR, PVR, SVR. |
| `oec_simulate.R` | Simulation study with the paper's six methods and six metrics, plus win rate and mean log error quotient against the naive method. Runs replicates in parallel and writes `oec_simulation_reps.csv` and `oec_simulation_summary.csv`, which the chapter reads. About 65 minutes for 48 replicates on 12 cores. |
| `oec_full_data.R` | One synthetic archive analysed like the paper's Section 6.3: number of clusters, co-clustering, aggregate surrogacy, and an early readout that withholds the KPIs of the 30 most recent tests. Writes `oec_surrogacy.csv`, `oec_early_readout.csv`, `oec_clusters.txt`. |

Run from the repository root:

```bash
Rscript replication/oec-meta/oec_simulate.R 48 2000 500 12
```

```bash
Rscript replication/oec-meta/oec_full_data.R 4000 1000
```

## Where this departs from the paper

- **Data.** Our archives come from a six-cluster Gaussian mixture over five metrics
  (two KPIs, three proxies) with log-normal heterogeneity in test precision. The
  paper simulates from a DPM fitted to the Zillow archive.
- **Scale.** 48 archives and 2,000 draws per fit (500 warm-up), against the
  paper's 100 archives and 30,000 draws (10,000 warm-up).
- **DPM hyperpriors.** The paper puts an inverse-Wishart hyperprior on the scale
  matrix Ψ of the base measure, which needs a Metropolis step. We use a Wishart
  hyperprior with the same prior mean (4·I), which is conditionally conjugate.
  The hyperpriors on η₀, φ and α₀ and the fixed ν = 10 follow the paper.
- **Priors for the Gaussian and Student-t models** follow the paper: η₀ = 0,
  Φ = I, ν = 8, Ψ = 8·I, log γ ~ N(2, 1).
- **Metaregression.** As in the paper, MR is the DPM with cluster labels treated
  as known.
