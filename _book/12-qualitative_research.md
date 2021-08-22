# Qualitative Research

## Inter-rate reliability methods

Calculation to judge the degree of agreement between the choices made by two or more independent judges

Other packages are

-   `vcd` for visualization

-   `DescTools`

### Percent Agreement

$$
\frac{\text{number of agreement}}{\text{number of total}} \times 100
$$


```r
library("irr")
```

```
## Loading required package: lpSolve
```

```r
data("diagnoses", package = "irr")
data("anxiety", package = "irr")
head(diagnoses,10)
```

```
##                     rater1                  rater2                  rater3
## 1              4. Neurosis             4. Neurosis             4. Neurosis
## 2  2. Personality Disorder 2. Personality Disorder 2. Personality Disorder
## 3  2. Personality Disorder        3. Schizophrenia        3. Schizophrenia
## 4                 5. Other                5. Other                5. Other
## 5  2. Personality Disorder 2. Personality Disorder 2. Personality Disorder
## 6            1. Depression           1. Depression        3. Schizophrenia
## 7         3. Schizophrenia        3. Schizophrenia        3. Schizophrenia
## 8            1. Depression           1. Depression        3. Schizophrenia
## 9            1. Depression           1. Depression             4. Neurosis
## 10                5. Other                5. Other                5. Other
##              rater4           rater5           rater6
## 1       4. Neurosis      4. Neurosis      4. Neurosis
## 2          5. Other         5. Other         5. Other
## 3  3. Schizophrenia 3. Schizophrenia         5. Other
## 4          5. Other         5. Other         5. Other
## 5       4. Neurosis      4. Neurosis      4. Neurosis
## 6  3. Schizophrenia 3. Schizophrenia 3. Schizophrenia
## 7  3. Schizophrenia         5. Other         5. Other
## 8  3. Schizophrenia 3. Schizophrenia      4. Neurosis
## 9       4. Neurosis      4. Neurosis      4. Neurosis
## 10         5. Other         5. Other         5. Other
```

```r
agree(diagnoses)
```

```
##  Percentage agreement (Tolerance=0)
## 
##  Subjects = 30 
##    Raters = 6 
##   %-agree = 16.7
```

```r
# library(vcd)
# # Create the plot
# p <- agreementplot(anxiety)
```

### Cohen's Kappa

[@Cohen_1960]

$$
k = \frac{p_o - p_e}{1 - p_e} = 1 - \frac{1 - p_o}{1- p_e}
$$

where

-   $p_o$ = relative observed agreement among raters

-   $p_e$ = hypothetical probability of chance agreement

strict agreements between raters

appropriate in case of 2 ordinal or nominal varibles

Based on [@Landis_1977]'s guide, we have

| Degree       | Decision                            |
|--------------|-------------------------------------|
| 0.01 -- 0.20 | slight agreement                    |
| 0.21 -- 0.40 | fair agreement                      |
| 0.41 -- 0.60 | moderate agreement                  |
| 0.61 -- 0.80 | substantial agreement               |
| 0.81 -- 1.00 | almost perfect or perfect agreement |


```r
# Unweighted kappa for 2 nominal or 2 ordinal categorical
kappa2(diagnoses[, c("rater1", "rater2")], weight = "unweighted") # two ordinal variables only, allows partial agreement
```

```
##  Cohen's Kappa for 2 Raters (Weights: unweighted)
## 
##  Subjects = 30 
##    Raters = 2 
##     Kappa = 0.651 
## 
##         z = 7 
##   p-value = 2.63e-12
```

```r
# Weighted kappa ordinal scales
kappa2(diagnoses[, c("rater1", "rater2")], weight = "equal") # linear weightes of the differences
```

```
##  Cohen's Kappa for 2 Raters (Weights: equal)
## 
##  Subjects = 30 
##    Raters = 2 
##     Kappa = 0.633 
## 
##         z = 5.43 
##   p-value = 5.52e-08
```

```r
kappa2(diagnoses[, c("rater1", "rater2")], weight = "squared") # squared weightes of the differences
```

```
##  Cohen's Kappa for 2 Raters (Weights: squared)
## 
##  Subjects = 30 
##    Raters = 2 
##     Kappa = 0.655 
## 
##         z = 3.91 
##   p-value = 9.37e-05
```

p-value less than 0.05, mean that raters agree more than what you would expect by chance.

### Fleiss'kappa

for two or more categorical variables (nominal or ordinal)

for three or more raters

-   0 = no agreement

-   1 = perfect agreement


```r
# no assumption of same raters for all subjects
kappam.fleiss(diagnoses[, 1:3])
```

```
##  Fleiss' Kappa for m Raters
## 
##  Subjects = 30 
##    Raters = 3 
##     Kappa = 0.534 
## 
##         z = 9.89 
##   p-value = 0
```

## Krippendorff's Alpha

calculates disagreement among raters.

$$
\frac{\text{observed disagreement}}{\text{expected disagreement}}
$$

Rules of thumb by [@Shelley_1984]

-   $\alpha \ge 0.08$ = good

-   $\alpha \ge 0.667$ = acceptable lower limit


```r
nmm <-
    matrix(
        c(
            1,
            1,
            NA,
            1,
            2,
            2,
            3,
            2,
            3,
            3,
            3,
            3,
            3,
            3,
            3,
            3,
            2,
            2,
            2,
            2,
            1,
            2,
            3,
            4,
            4,
            4,
            4,
            4,
            1,
            1,
            2,
            1,
            2,
            2,
            2,
            2,
            NA,
            5,
            5,
            5,
            NA,
            NA,
            1,
            1,
            NA,
            NA,
            3,
            NA
        ),
nrow = 4
)
 # first assume the default nominal classification
 kripp.alpha(nmm)
```

```
##  Krippendorff's alpha
## 
##  Subjects = 12 
##    Raters = 4 
##     alpha = 0.743
```

```r
 # now use the same data with the other three methods
 kripp.alpha(nmm, "ordinal")
```

```
##  Krippendorff's alpha
## 
##  Subjects = 12 
##    Raters = 4 
##     alpha = 0.815
```

```r
 kripp.alpha(nmm, "interval")
```

```
##  Krippendorff's alpha
## 
##  Subjects = 12 
##    Raters = 4 
##     alpha = 0.849
```

```r
 kripp.alpha(nmm, "ratio") 
```

```
##  Krippendorff's alpha
## 
##  Subjects = 12 
##    Raters = 4 
##     alpha = 0.797
```

### Kendall's W

Continuous ordinal ratings


```r
rtr1 <- c(1, 6, 3, 2, 5, 4)
rtr2 <- c(1, 5, 6, 2, 4, 3)
rtr3 <- c(2, 3, 6, 5, 4, 1)
ratings <- cbind(rtr1, rtr2, rtr3)
library(DescTools)
```

```
## Warning: package 'DescTools' was built under R version 4.0.5
```

```r
KendallW(ratings, test=TRUE)
```

```
## 
## 	Kendall's coefficient of concordance W
## 
## data:  ratings
## Kendall chi-squared = 8.5238, df = 5, subjects = 6, raters = 3, p-value
## = 0.1296
## alternative hypothesis: W is greater 0
## sample estimates:
##        W 
## 0.568254
```

### Intraclass correlation coefficients

[@Shrout_1979]

#### Continuous scales

Decision:

-   model:

    -   `"oneway"` when subjects are random effects

    -   `"twoway"` when subjects and raters are random effects

-   type:

    -   `"agreement"` differences in mean ratings among raters are of interest

    -   `"consistency"` is default

-   unit

    -   `"single"` single value

    -   `"average"` mean of several ratings


```r
icc(anxiety,
    model = "twoway", # can be "oneway"
    type = "agreement", # can be "consistency"
    unit = "single" # can be "average"
    )
```

```
##  Single Score Intraclass Correlation
## 
##    Model: twoway 
##    Type : agreement 
## 
##    Subjects = 20 
##      Raters = 3 
##    ICC(A,1) = 0.198
## 
##  F-Test, H0: r0 = 0 ; H1: r0 > 0 
##  F(19,39.7) = 1.83 , p = 0.0543 
## 
##  95%-Confidence Interval for ICC Population Values:
##   -0.039 < ICC < 0.494
```

`DescTools` package


```r
rtr1 <- c(9, 6, 8, 7, 10, 6)
rtr2 <- c(2, 1, 4, 1,  5, 2)
rtr3 <- c(5, 3, 6, 2,  6, 4)
rtr4 <- c(8, 2, 8, 6,  9, 7)
ratings <- cbind(rtr1, rtr2, rtr3, rtr4)
DescTools::ICC(ratings)
```

```
## 
## Intraclass correlation coefficients 
##                          type   est F-val df1 df2    p-val lwr.ci upr.ci
## Single_raters_absolute   ICC1 0.166  1.79   5  18 0.164769     NA     NA
## Single_random_raters     ICC2 0.290 11.03   5  15 0.000135     NA     NA
## Single_fixed_raters      ICC3 0.715 11.03   5  15 0.000135     NA     NA
## Average_raters_absolute ICC1k 0.443  1.79   5  18 0.164769     NA     NA
## Average_random_raters   ICC2k 0.620 11.03   5  15 0.000135     NA     NA
## Average_fixed_raters    ICC3k 0.909 11.03   5  15 0.000135     NA     NA
## 
##  Number of subjects = 6     Number of raters = 4
```

### Light's kappa

-   average of Cohen's Kappa if using more than two categorical variables


```r
# Light’s kappa: multiple raters
kappam.light(diagnoses[, 1:3])
```

```
## Warning in sqrt(varkappa): NaNs produced
```

```
##  Light's Kappa for m Raters
## 
##  Subjects = 30 
##    Raters = 3 
##     Kappa = 0.555 
## 
##         z = NaN 
##   p-value = NaN
```
