# Sales

[@habel2021] found that consistent with traditional idea, having variable factor in salesperson's compensation plan will increase performance, but also introduce health hazard (more stress which results in emotional exhaustion and more sick days). In cases where salespeople have higher personal ability and more social resources, this harmful effect is mitigated.

## Sales from Rank

[@chevalier2003measuring]

-   use an experiment to infer demand

-   From low-selling books (where demand was either known or very small) and purchased large quantities (relative to their low demand)

-   Data from Amazon

-   As the ranks for the books changed, the relationship between the sales rank and demand can be inferred.

-   However, this is practical only to very low-selling books.

[@brynjolfsson2003consumer]

-   With additional demand data from a book publisher, they can derive the relationship between the sales and rank.

[@garg2013inferring]

-   Without demand data, they can infer the demand data

On Apple's App Store, there are three rank list:

1.  Top-free apps
2.  Top-paid apps
3.  Top-grossing apps: based on revenue generation

Assuming a Pareto distribution

$$
d_{r_p} = b_p \times r_p^{-a_p}|1 \le 200
$$

where

-   $d_{r_p}$ = downloads at rank $r_p$ in the **top-paid**

-   $b_p$ = scale factor that is dependent on the total market size for iPad or iPhone apps

-   $a_p$ = shape of the Pareto curve

For apps in the top-grossing list, we assume a Pareto distribution for each app (to estimate use a simple truncated OLS regression)

$$
\begin{aligned}
pd_{r_g} &= p \times d_{r_p} = b_g \times r_g^{-a_g} \\
\log(r_g) &= \frac{1}{a_g} \times \log\left( \frac{b_g}{b_p} \right) + \frac{a_p}{a_g} \times \log (r_p) - \frac{1}{a_g} \times \log(p) \\
\log(r_g) &= \beta_0 + \beta_1 \times \log(r_p) + \beta_2 \log(p)
\end{aligned}
$$

where

-   $p$ = product price

-   $b_g$ = scale factor that is dependent on the total market size for iPad or iPhone apps

-   $d_{r_p}$ = downloads of the same app in the top-paid list

-   Assumption: top-grossing apps generate revenue from upfront pricing only

    -   Free and paid apps may have additional purchasable features inside the app, but these purchases will not be included in the paid apps (which is reasonable since paid apps make most of their money from upfront prices) (p. 1256).

    -   It's reasonable to assume that in-app features are most common in free apps (p. 1256)

    -   Apps' rank and price are assumed to be independent across sectional data (even when an app appears multiple times).

-   $a_g = - 1/\beta_2$

-   $a_p = -\beta_1/\beta_2$

-   $\frac{b_g}{b_p} = \exp(-\beta_1/\beta_2)$

    -   To recover individual values of the scale parameters, we aggregate downloads across apps in a day (since actual downloads for an app is not available) $D_t = \sum d_{r_p} = b_p \sum_{r=1}^N r_p^{-a_p}$

    -   Using the total number of downloads of top ranked apps, the two parameters are

        -   $b_p = (\sum_{r_p=1}^N d_{r_p})/(\sum_{r_p = 1}^N r_p^{-a_p})$

        -   $b_g = \exp(-\beta_0 / \beta_1)\times (\sum_{r_p=1}^N d_{r_p})/(\sum_{r_p = 1}^N r_p^{-a_p})$

Data:

-   Apple, Appshopper (shutdown in 2021), AppAnnie (now is [data.ai](https://www.data.ai/)), [Mobilewalla](https://www.mobilewalla.com/mobile-data)

-   Period: April 2011 - May 2011

-   Data: 200 paid apps, 200 grossing apps and their price data.

[@he2020sales] On Amazon, which is a generalized results from [@chevalier2003measuring]

## Salespeople

[@sunder2017salespeople] own and peer effects on salesperson turnover behavior

-   **Objective:** Delve into the factors influencing salesperson turnover, emphasizing personal performance and peer effects.

-   **Background:** Prior studies mostly focused on the repercussions of voluntary turnover. The direct causes, especially the role of personal achievements and peer influences, have been less explored.

-   **Key Insights:**

    1.  **Framework Proposal:** Introduces a model assessing the impact of individual factors (via identity theory) and peer factors (via social identity theory) on turnover.

    2.  **Data Analysis:** Used data from 6,727 salespeople over two years.

    3.  **Findings:** Alongside personal performance metrics, peer behaviors, especially peer turnover, significantly affect a salesperson's likelihood to leave.

    4.  **Peer vs. Own Effects:** Peer influences have a more pronounced impact than individual factors on turnover.

[@kumar2014measuring] Measure saleperson's future value

-   **Objective:** Introduce a forward-looking metric for sales force evaluation, emphasizing the impact of training and incentive types on future salesperson value.

-   **Background:** Traditional sales evaluations focus on retrospective metrics like sales volume. With businesses shifting towards customer-centric views, there's a need for sales strategy adaptation.

-   **Key Insights:**

    1.  **New Metric Proposal:** A profit-oriented, forward-looking metric is presented to assess salesperson value.

    2.  **Method:** Uses a latent class modeling approach to identify different sales force segments.

    3.  **Findings:** Sales force segments respond differently to training and incentives, suggesting a universal approach might not be effective.

    4.  **Time Horizon Analysis:** The impact of training and incentives can vary based on whether short-term or long-term effects are considered.
