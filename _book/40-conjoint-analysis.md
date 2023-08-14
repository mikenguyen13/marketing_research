# Preference Measurement

Reservation price = price a consumer willing to pay for a product

Estimation for reservation price:

1.  Survey question direct asks for consumer reservation price (but this estimation method tends to bias downward because participants don't want people to know that they are price sensitive).
2.  From the coefficients of conjoint analysis.

Assumptions to get consumer utility from regression:

1.  Consumption utility equals sum of utilities for the product product attributes

Let $N$ be the number of non-price attributes and each attributes has more than 1 level.

We use fractional factorial design to derive different profiles for consumers to choose with the goal of least number of profiles.

Then the utility function can be represented as

$$
U = \beta_0 + \beta_p \times P + \sum_{k=1}^N \beta_k \times A_k + \epsilon
$$

where

-   $U$ = consumer rating or utility

-   $\beta$'s = utility weights

-   $\beta_0$ = heterogeneity in the range of the ratings scale per consumer.

-   $P$ = price

-   $A$ = non-price attributes (categorical variables)

Then the reservation price (at the individual level) for product $P$ is

$$
r(P) = \frac{\Delta p}{\beta_p} (\sum_{k=1}^N \frac{\beta_k}{\Delta A_k} A_k)
$$

where

-   $\Delta p$ = difference in price between two levels (of the same attribute)

-   $\Delta A_k$ = difference in attribute levels

and the dollar value for each unit of utility is

$$
\frac{\Delta p}{\beta_p}
$$

and for each attribute $k$, the utility a consumer can derive is

$$
(\frac{\beta_k}{\Delta A_k}) A_k
$$

Hence, we can see that the reservation price for a product (i.e., total dollar value a consumer assigns on product $P$) is just the sum of utility across all attributes times dollar value for each unit of utility



@netzer2008

-   Problem

    -   Companies: Product development, pricing segmentation, positioning, advertising, project selection, and investment decisions

    -   Consumers: recommendation agents

    -   Policy makers and health care professionals:

    -   Academic researchers;

-   Design and Data collection

    -   Original goals: maximizing A-efficiency and D-efficiency (based on covariance matrix of the estimates of the partworths)

    -   New: M-efficiency measure (accounts for managers' considerations).

    -   New Adaptive method for data collection:

        -   Commercially available: Adaption conjoint analysis (ACA), Fast Polyhedral approach, Adaptive Self-explicated approach

-   Model Specification, Estimation, and Action

## Conjoint Analysis

also known as conjoint measurements, which stems from mathematical psychology and psychometrics

Aims:

-   Willingness to pay: measure what individual are willing to give up to obtain certain product benefits

-   Distribution of willing to pay : measure how consumer differ

Advantages:

-   Improves ability to assess customers' true wants and needs (especially price)

-   Dissect "everything is important"

Perception vs. preference

-   Perception (beliefs about the market) is largely homogeneous across customers

-   Preference (what product they buy) is heterogeneous across customers.

Conjoint analysis is a tool for preference assessment.

Attributes in conjoint:

-   Not too many attributes

-   Attributes should be actionable

-   Need to choose reasonable range of attributes

    -   within range under consideration

    -   All levels should be feasible

-   Number of attribute levels

    -   Too many can be confusing

    -   Halo effect of number of attributes (or the order of levels)

Number of profiles equal number of dummy variables with the assumption of independence

If you suspect that there might be interaction effect (violation of independence), you can either

-   use higher-level attribute

-   increase the number of profiles



Ranking and Rating conjoint analysis are not different @kalish1991

[@greenwind1975]

Basics:

-   Use orthogonal array (in experimental design) to test combinations where independent contributions of all factors (attributes) are balanced.

-   Then rank all the reduced combinations in order

Uses:

-   New product development

-   Package design

-   Pricing and brand alternatives

-   Descriptions of new products or services

-   Alternative service design

-   Also organizations as consumers

Outcome variable can be:

-   Preference

-   Likelihood to purchase

-   best value for the money

-   Convenience of use

-   Suitability for a specific job

-   Psychological images (e.g., ruggedness, distinctiveness, conservativeness)

Can be used in conjunction with

-   factor analysis: firm-level decision variables (attribute/factor), dimension reduction technique

-   perceptual mapping: multidimensional scaling

-   cluster analysis: customer-level variables, segmentation technique

Suggested packages (in order of preference):

-   `AlgDesign`

-   `conjoint`

-   `faisalconjoint`

-   `mlogit`

-   `conf.design`

-   `prefmod`

### Full-Profile


```r
library(conjoint)
data(tea)
caModel(y = tprefm[1,],x = tprof)
```

```
## 
## Call:
## lm(formula = frml)
## 
## Residuals:
##       1       2       3       4       5       6       7       8       9      10 
##  1.1345 -1.4897  0.3103 -0.2655  0.3103  0.1931  1.5931 -1.4310 -1.4310  1.1207 
##      11      12      13 
##  0.3690  1.1931 -1.6069 
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)   
## (Intercept)          3.3937     0.5439   6.240  0.00155 **
## factor(x$price)1    -1.5172     0.7944  -1.910  0.11440   
## factor(x$price)2    -1.1414     0.6889  -1.657  0.15844   
## factor(x$variety)1  -0.4747     0.6889  -0.689  0.52141   
## factor(x$variety)2  -0.6747     0.6889  -0.979  0.37234   
## factor(x$kind)1      0.6586     0.6889   0.956  0.38293   
## factor(x$kind)2     -1.5172     0.7944  -1.910  0.11440   
## factor(x$aroma)1     0.6293     0.5093   1.236  0.27150   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.78 on 5 degrees of freedom
## Multiple R-squared:  0.8184,	Adjusted R-squared:  0.5642 
## F-statistic:  3.22 on 7 and 5 DF,  p-value: 0.1082
```

### Choice-based

Also known as Discrete-choice conjoint analysis

### Adaptive

-   Varies the choice sets based on respondent's preference

-   Reduces the survey length



### Hybrid

-   Combination of [Full-Profile] and [Adaptive]

### Max-Diff

-   Assortment under most preferred and least preferred scenario.

### Self-explicated

### Hierarchical Bayes analysis

### Application


```r
library(conjoint)
Experiment = expand.grid(weight = c("a","b"),
                         Price = c("Low","High"),
                         Warranty = c("2","3"),
                         Battery = c("10","20"))

partial_design = caFactorialDesign(Experiment,type = "orthogonal",seed = 123)
partial_profile = caEncodedDesign(partial_design)

levels <- c("a","b","Low","High","2","3","10","20")
lev.df <- data.frame(levels)

data = c("")
```

Example by [Martin Muller](https://medium.com/sicara/market-research-survey-conjoint-analysis-r-code-3d4f6190c2aa)


```r
# Declaration of features and feature values
feature_names <- c("LENGTH", "ILLUSTRATION", "CLAPS")
feature_values <- list()
feature_values[[1]] <- c("2min", "7min", "20min")
feature_values[[2]] <- c("several images", "one image", "no image")
feature_values[[3]] <- c("+500 claps", "less than 500 claps")

# All concept generation
articles <- expand.grid(LENGTH = feature_values[[1]],
                        ILLUSTRATION = feature_values[[2]],
                        CLAPS = feature_values[[3]])

library (conjoint)
maxNumberOfArticles = 8

# Selection of relevant concepts
selectedArticles <- caFactorialDesign(data = articles,
                                      type = 'fractional',
                                      cards = maxNumberOfArticles)

# Checking if selected concepts are relevant for study
corrSelectedArticles <- caEncodedDesign(selectedArticles)
#print(cor(corr_design_mails))
print(cor(corrSelectedArticles))
```

```
##                 LENGTH ILLUSTRATION     CLAPS
## LENGTH       1.0000000            0 0.1240347
## ILLUSTRATION 0.0000000            1 0.0000000
## CLAPS        0.1240347            0 1.0000000
```

```r
# List of rates of each article allowing to compare them
ranking = c(7 / 7, 3 / 7, 3 / 7, 5 / 7, 2 / 7, 6 / 7, 3 / 7, 0 / 7)

# Performing conjoint analysis
Conjoint(ranking, selectedArticles, unlist(feature_values))
```

```
## 
## Call:
## lm(formula = frml)
## 
## Residuals:
##        1        2        3        4        5        6        7        8 
## -0,03401 -0,02041  0,07483  0,10884 -0,12925  0,05442 -0,07483  0,02041 
## 
## Coefficients:
##                         Estimate Std. Error t value Pr(>|t|)  
## (Intercept)              0,44898    0,05651   7,945   0,0155 *
## factor(x$LENGTH)1        0,25850    0,07534   3,431   0,0755 .
## factor(x$LENGTH)2        0,06803    0,07534   0,903   0,4619  
## factor(x$ILLUSTRATION)1  0,30612    0,07534   4,063   0,0556 .
## factor(x$ILLUSTRATION)2 -0,18367    0,08835  -2,079   0,1732  
## factor(x$CLAPS)1         0,02041    0,05651   0,361   0,7526  
## ---
## Signif. codes:  0 '***' 0,001 '**' 0,01 '*' 0,05 '.' 0,1 ' ' 1
## 
## Residual standard error: 0,1495 on 2 degrees of freedom
## Multiple R-squared:  0,9389,	Adjusted R-squared:  0,7863 
## F-statistic: 6,151 on 5 and 2 DF,  p-value: 0,1457
```

```
## [1] "Part worths (utilities) of levels (model parameters for whole sample):"
##                levnms    utls
## 1           intercept   0,449
## 2                2min  0,2585
## 3                7min   0,068
## 4               20min -0,3265
## 5      several images  0,3061
## 6           one image -0,1837
## 7            no image -0,1224
## 8          +500 claps  0,0204
## 9 less than 500 claps -0,0204
## [1] "Average importance of factors (attributes):"
## [1] 52,44 43,90  3,66
## [1] Sum of average importance:  100
## [1] "Chart of average factors importance"
```
