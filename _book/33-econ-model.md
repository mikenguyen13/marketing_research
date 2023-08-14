# Econ Models

According to [@varian2016; @varian1997], basics of economic model include:

-   People making the choices

-   Possible constraints they face

-   Interaction among agents

-   What adjusts if the choices aren't mutually consistent?

Always start with the simplest model

-   one period

-   2 goods

-   2 people

-   linear utility

The goal is to have the simplest model, not to have the most complex one, because model is just a simplified version of reality. Then, you can generalize your model when you have the simplest one.

This sections is a summary of professor [Matilde Machado's course on industrial organization](https://www.eco.uc3m.es/~mmachado/teaching/oi-i-mei/slides/slides.html)

## Concentration Measures

Competition lies between two extremes:

-   Percent competition (minimum concentration)

-   Monopoly (maximum concentration)

Concentration measures approximates the level of competition in a market between the two extremes.

We can use concentration measures to

-   Compare different markets

-   Regulate the market

Concentration indices should be independent of the market size and in the interval of [0,1] where 1 means monopoly and 0 means perfect competition

Concentration curve: x-axis = number of firms, y-axis = % of total production

@hannah1977 argue for characteristics of concentration index:

1.  Classification can be shown on the concentration curve between markets
2.  Principles of Transfer of Sales (e.g., a small firm sells to a large on will increase the concentration index)
3.  Entry or exit condition (e.g., entries decreases concentration, while exits decrease concentration, typically applies to small firms only)
4.  Merger condition (should increase concentration)

Examples of concentration indexes

1.  The inverse of the number of firms ($\frac{1}{n}$)

    -   Good when firms are of the same size

    -   Does not account for the "transfer of sales" (i.e., number of firms does not change with transfer of sales)

2.  The concentration ratio ($C_r$)

    -   sum of the market shares of the largest $r$ firms

    -   but $r$ is rather arbitrary

    -   hard to compare between industries

3.  Hirschman-Herfindahl index

    -   account for all points of the concentration curve

    -   satisfies @hannah1977 criteria

    -   gives more weights to larger firms

Issues with concentration measures

1.  Can't account for cross-ownership

2.  Depend heavily on boundary conditions of the industry/market

    1.  Definitions usually contain geography and products.

3.  Can't reflect market evolution (i.e., static measures). Hence, one can also look at market stability

Market power can be measured by

-   Surplus over marginal cost (but MC is hard calculate)

-   Price-elasticity of the residual-demand (high elasticity means lower power)

-   Market shares or concentration measures

## Monopoly

Def: only player in a market

Barriers to entry:

1.  Economies of scale or sunk costs
2.  Patents/Licenses
3.  Cost advantages (based on technology)
4.  Customer loyalty (or high switching costs)\

### The standard model

$$
p = P(Q)
$$

price is a function of quantity produced

Assumptions:

-   Single goods

-   Full Info (i.e., consumers know product's characteristics)

-   Negatively sloped demand curve: $\frac{d D(p)}{d p}<0$

-   Marginal costs are non-negative: $\frac{d C(q)}{dq} \ge 0$

-   Uniform pricing (i.e., same price for all consumers and all goods)

Rational monopolists maximize their profits:

$$
\displaystyle \max_{q} \Pi = p(q) q - C(q) = TR - TC
$$

FOC: $p(q) + p'(q) q = c'(q)$. Hence, marginal revenue = marginal cost

Intuitively,

-   If $MR < MC$, it means each extra unit we produce will be lower than its cost. Hence, we should produce more until it reaches $MR = MC$

-   If $MR > MC$, it means each extra unit we produce will be higher than its cost. Hence, we should reduce production until it reaches $MR=MC$

FOC:

$$
\begin{aligned}
p(q) + p'(q) q &= c'(q) \\
p(q) - c'(q) &= - p'(q)q \\
\frac{p(q) - c'(q)}{p(q)} &= - \frac{\partial p}{\partial q} \frac{q}{p} = \frac{1}{\epsilon (q)} \\
p(q) [1 - \frac{1}{\epsilon (q)}] &= c'(q) \\
p(q) &= \frac{c'(q)}{1 - \frac{1}{\epsilon (q)}}
\end{aligned}
$$

where

-   $\frac{p(q) - c'(q)}{p(q)}$ is the Lerner index (a measure of market power that allows cross-market comparisons)

-   $\frac{1}{\epsilon (q)}$ is the inverse of the demand elasticity

Hence, monopolists always choose to produce at $\epsilon (q) >1$ (from the last derivation)

Alternatively, we can also write the maximization problem in terms of quantity (instead of price)

$$
\displaystyle \max_{p} \Pi = p D(p) - C(D(p))
$$

FOC

$$
\begin{aligned}
D(p) + pD'(p)  &= C'(D(p))D'(p) \\
D'(p) [p- C'(D(p))] &= -D(p) \\
\frac{p - C'(D(p))}{p} &= \frac{1}{D'(p)} \frac{D(p)}{p}= \frac{1}{\epsilon (q)}
\end{aligned}
$$

If costs are linear $c(q) = c \times q$ and linear demand $p(q) = a - bq$

$$
\displaystyle \max_{q} \Pi = p(q) q - C(q) = (a-bq) q - cq
$$

FOC:

$$
a - 2bq = c \\
q^M = \frac{a-c}{2b}
$$

$q^M >0$ iff $a>c$ where $a$ represents the willingness to pay for the first unit

Thus, $p^M = a -b \frac{a-c}{2b} = \frac{a+c}{2} >c$ since $a > c$

Thus, $\Pi^M = \frac{1}{b}(\frac{a-c}{2})^2$

#### Perfect Competition

Assumptions

-   A large number of firms leads to price-taking

-   Free entry and exit

-   Homogeneous products across firms

At equilibrium,

-   Price = Marginal cost ($p^c = MC$)

-   Zero profits ($\pi^c = 0$)

-   Efficiency (maximizes total welfare = consumer surplus + producer surplus)

Comparison:

1.  $p^M > (p^c = c) \to CS^M < CS^c$ where $CS$ means consumer surplus
2.  $\Pi^M > \Pi^c = 0 \to PS^M > PS^c = 0$ where $PS$ means producer surplus
3.  $DWL = TS^c - TS^M > 0$ where DWL = Deadweight Loss (i.e., loss of total surplus)
4.  Consumers with valuation higher than MC (but lower than $p^M$) can't buy

## Pricing

### Price Discrimination

Examples:

-   Discounts (e.g., students, seniors, coupons)

-   Tariff

Def: When a seller price the good at 2 different prices (either to the same or different consumers), we say there is price discrimination (exception: different prices at different locations that reflect differences in costs).

Firms can only do price discrimination when arbitrage is not possible, which are

1.  Product arbitrage (linked to the transferability of the commodity) happens when transaction costs are low, which allow those with lower price to resell to other consumers. And prevention include

    1.  Services

    2.  Product warranties

    3.  Product specificity

    4.  Transaction costs

    5.  Contractual clauses

    6.  Vertical integration

    7.  Government Intervention

2.  Demand arbitrage (linked to transferability of the demand)

Types of price discrimination

1.  First-degree (perfect price discrimination):

    1.  customer willingness to pay ($v_i$) = price ($p_i$)

    2.  Two-part tariff: $T(q) = A + pq$ where A (access fee) is fixed and paid independently of the quantity consumed and p (unit fee) is the variable part.

    3.  Individual tariffs - continuous demand: $T_i(q) = A_i + p^c q$ where $p^c = MC$ and $A_i = S_i^c$ (i.e., consumer i's surplus when $p = p^c$)

2.  Second-degree (incomplete info forces the use of self-selection devices)

3.  Third-degree (leverage signal to separate markets)

### Bundling

-   selling more unit of the same good together

-   similar to quantity discounts (under [Price Discrimination])

### Tying

-   sell more than one product together

-   3 strategies

    -   No tying (i.e., sell both goods separately)

    -   Pure tying (i.e., only sell the two goods together)

    -   Mixed tying (sell both goods separately and together)

## Cournot Model

Assumptions:

-   Homogeneous product across firms

-   Market price is a function of the total supply

-   Simultaneous game (decision on production)

-   Quantity is the variable of interest, which has Cournot-Nash equilibrium

### Symmetric Duopoly

Consider a duopoly ($n=2$) and $MC = c$, then residual demand of firm 1 is

$$
RD_1(p, q_2) = D(p) - q_2
$$

Then this is a similar set up as [The standard model]. And optimal value for firm 1 production is a function of function 2's production $q^*1 (q_2) = R_1 (q_2)$

Case 1: When $q_2 = 0$, then $RD_1(p,0) = D(p)$ then firm 1 becomes a monopolist $q^*_1(0) = q^M$

Case 2: $q_2 = q_c$ then $RD_1(p, q^c) = D(p) - q^c$, since both demand and cost functions are linear, the reaction function will also be linear.

Market price will be set as

$$
P = a - bQ = a-b(q_1 + q_2) \\
MC_1 = MC_2 = c
$$

Consider firm 1:

$$
\displaystyle \max_{q_1} \Pi_1(q_1,q_2) = (p-c)q_1 = (a-b(q_1 + q_2)-c)q_1
$$

FOC:

$$
\begin{aligned}
\frac{\partial \Pi_1}{\partial q_1} &= 0 \\
a -bq_1 - b_2 - c- b_1 &= 0 \\
q_1 &= \frac{a-c}{2b} - \frac{q_2}{2}
\end{aligned}
$$

Since the two firms are symmetrical, FOC for firm 2 should be identical

Now we solve for the optimal quantity, which results in

$$
q^N = \frac{a-c}{3b} = q_1^N = q_2^N
$$

where $N$ superscript means Cournot solution

Total quantity is

$$
Q^N = q_1^N + q_2^N = \frac{2}{3}(\frac{a-c}{b})
$$

and market price is

$$
p^N = a - bQ^N = a - \frac{2}{3}(a-c) = \frac{a+2c}{3}
$$

### Symmetric Oligopoly

In equilibrium

| Perfect Competition ($C$)            |     | Cournot ($N$)                                   |     | Monopoly ($M$)                                  |
|--------------------------------------|-----|-------------------------------------------------|-----|-------------------------------------------------|
| $p^c = c$                            | \<  | $p^N = \frac{a+2c}{3}$                          | \<  | $p^M = \frac{a+c}{2}$                           |
| $\frac{\partial p^c}{\partial c} =1$ | \>  | $\frac{\partial p^N}{\partial c} = \frac{2}{3}$ | \<  | $\frac{\partial p^M}{\partial c} = \frac{1}{2}$ |

In general ($n \ge 2$) firms

$$
\displaystyle \max_{q_1} \Pi_1(q_1, \dots, q_N) = (a - b(q_1 + \dots + q_N) - c) q_1
$$

FOC

$$
a-b(q_1 + \dots + q_n) - c- bq_1 = 0 \\
q_1 = \frac{a-b(q_2 + \dots + q_N) - c}{2b}
$$

If all firms are symmetric (i.e., $q_1 = \dots = q_N = q$)

$$
q_1 = \frac{a - b(n-1)q - c}{2b} \\
q^N = \frac{a-c}{(n+1)/b}
$$

Equilibrium quantity

$$
Q^N = nq^N = \frac{n}{n+1} \frac{a-c}{b} \underset{n \to \infty}{\operatorname{\to}} \frac{a-c}{b} = q^c
$$

Equilibrium price

$$
p^N = a- bQ^N = a - b\frac{n}{n+1}\frac{a-c}{b} = \frac{a}{n+1} \frac{n}{n+1}c \underset{n \to \infty}{\operatorname{\to}} c
$$

Hence, as n goes to infinity (i.e., oligopoly converges to a perfect competition), which is the same equilibrium quantity and price as in the perfect competition case.

Deadweight loss in the Cournot model is the area where the willingness to pay is higher than MC.

$$
\begin{aligned}
DWL &= \frac{1}{2}(p^N - p^c) (Q^c - Q^*) \\
&= \frac{1}{2b}(\frac{a-c}{n+1})^2 \underset{n \to \infty}{\operatorname{\to}} 0 \\
\end{aligned}
$$

Asymmetric duopoly

with constant marginal costs

Assume we have linear demand $P(q_1 + q_2) = a-b(q_1 + q_2)$and

$c_1 = MC_1$ and $c_2 = MC_2$
