# Analytical Models

This theoretical/analytical model part of this section comes mostly from professor Murali Mantrala's Marketing Model Seminar.

Marketing models consists of

1.  Analytical Model: pure mathematical-based research
2.  Empirical Model: data analysis.

"A model is a representation of the most important elements of a perceived real-world system".

Marketing model improves decision-making

-   Econometric models

    -   Description
    -   Prediction
    -   Simulation

-   Optimization models

    -   maximize profit using market response model, cost functions, or any constraints.

-   Quasi- and Field experimental analyses

-   Conjoint Choice Experiments.

"A decision calculus will be defined as a model-based set of procedures for processing data and judgments to assist a manager in his decision making"[@Little_1976]:

-   simple
-   robust
-   easy to control
-   adaptive
-   as complete as possible
-   easy to communicate with

<br>

+--------------+------------+---------------+------------------+
|              |            | Type of game  |                  |
+==============+============+===============+==================+
|              |            | Static        | Dynamic          |
+--------------+------------+---------------+------------------+
| Info Content | Complete   | Nash          | Subgame perfect  |
+--------------+------------+---------------+------------------+
|              | Incomplete | Bayesian Nash | Perfect Bayesian |
|              |            |               |                  |
|              |            | (Auctions)    | (signaling)      |
+--------------+------------+---------------+------------------+

<br>

[@moorthy1993]

-   Mathematical Theoretical Models

-   Logical Experimentation

-   An environment as a model, specified by assumptions

    -   Math assumptions for tractability

    -   Substantive assumptions for empirical testing

-   Decision support modeling describe how things work, and theoretical modeling present how things should work.

-   Compensation package including salaries and commission is a tradeoff between reduced income risk and motivation to work hard.

-   Internal and External Validity are questions related to the boundaries conditions of your experiments.

-   "Theories are tested by their predictions, not by the realism of their super model assumptions." (Friedman, 1953)

<br>

[@mcafee1996]

-   Competition is performed under uncertainty

-   Competition reveals hidden information

    -   Independent-private-values case: selling price = second highest valuation

    -   It's always better for sellers to reveal information since it reduces chances of cautious bidding that is resulted from the winner's curse

-   Competition is better than bargaining

    -   Competition requires less computation and commitment abilities

-   Competition creates effort incentives

<br>

[@leeflang2000]

-   Types of model:

    -   Predictive model

        -   Sales model: using time series data

        -   Trial rate: using exponential growth.

        -   Product growth model: @Bass_1969

    -   Descriptive model

        -   Purchase incidence and purchase timing : use Poisson process

        -   Brand choice: Markov models or learning models.

        -   Pricing decisions in an oligopolistic market @howard1968

    -   Normative model

        -   Profit maximization based on price, adverting and quality [@dorfman1976], extended by [@roberts1964; @lambin1970a]

Later, @Little_1970 introduced decision calculus and then multinomial logit model [@guadagni1983]

Potential marketing decision automation:

-   Promotion or pricing programs

-   Media allocation

-   Distribution

-   Product assortment

-   Direct mail solicitation

<br>

[@moorthy1985]

-   Definitions:

    -   Rationality = maximizing subjective expected utility

    -   Intelligence = recognizing other firms are rational.

    -   Rules of the game include

        -   \# of firms

        -   feasible set of actions

        -   utilities for each combination of moves

        -   sequence of moves

        -   the structure of info (who knows what and when?)

    -   Incomplete info stems from

        -   unknown motivations

        -   unknown ability (capabilities)

        -   different knowledge of the world.

    -   Pure strategy = plan of action

    -   A mixed strategy = probability dist of pure strategies.

    -   Strategic form representation = sets of possible strategies for every firm and its payoffs.

    -   Equilibrium = a list of strategies in which "no firm would like unilaterally to change its strategy."

-   Equilibrium is not outcome of a dynamic process.

-   Equilibrium Application

    -   Oligopolistic Competition

        -   Cournot (1838): quantities supplied: Cournot equilibrium. Changing quantities is more costly than changing prices

        -   Bertrand (1883): Bertrand equilibrium: pricing.

    -   Perfect competition

    -   Product Competition: Hotelling (1929): Principle of Minimum Differentiation is invalid.

    -   Entry:

        -   first mover advantage

        -   deterrent strategy

        -   optimal for entrants or incumbents

    -   Channels

-   Perfectness of equilibria

    -   Subgame perfectness

    -   Sequential rationality

    -   Trembling-hand perfectness

    -   Application

        -   Product and price competition in Oligopolies

        -   Strategic Entry Deterrence

-   Dynamic games

    -   Long-term competition in oligopolies

    -   Implicit Collusion in practice : price match from leader firms

-   Incomplete Information

    -   Durable goods pricing by a monopolist

    -   predatory pricing and limit pricing

    -   reputation, product quality, and prices

    -   Competitive bidding and auctions

<br>

[@kim2006]: A location model with preference variety

<br>

[@hotelling1929]

-   Stability in competition

-   Duopoly is inherently unstable

-   Bertrand disagrees with Cournot, and Edgeworth elaborates on it.

    -   because Cournot's assumption of absolutely identical products between firms.

seller try to $p_2 < p_1 c(l-a-b)$

the point of indifference

$$
p_1 + cx = p_2 + cy
$$

-   c = cost per unit of time in each unit of line length

-   p = price

-   q = quantity

-   x, y = length from A and B respectively

$$
a + x + y + b = l
$$

is the length of the street

Hence, we have

$$
x = 0.5(l - a - b + \frac{p_2- p_1}{c}) \\
y = 0.5(l - a - b + \frac{p_1- p_2}{c})
$$

Profits will be

$$
\pi_1 = p_1 q_1 = p_1 (a+ x) = 0.5 (l + a - b) p_1 - \frac{p_1^2}{2c} + \frac{p_1 p_2}{2c} \\
\pi_2 = p_2 q_2 = p_2 (b+ y) = 0.5 (l + a - b) p_2 - \frac{p_2^2}{2c} + \frac{p_1 p_2}{2c}
$$

To set the price to maximize profit, we have

$$
\frac{\partial \pi_1}{\partial p_1} = 0.5 (l + a - b) - \frac{p_1}{c} + \frac{p_2}{2c} = 0 \\
\frac{\partial \pi_2}{\partial p_2} = 0.5 (l - a + b) - \frac{p_2}{c} + \frac{p_1}{2c} = 0
$$

which equals

$$
p_1 = c(l + \frac{a-b}{3}) \\
p_2 = c(l - \frac{a-b}{3})
$$

and

$$
q_1 = a + x = 0.5 (l + \frac{a -b}{3}) \\
q_2 = b + y = 0.5 (l - \frac{a-b}{3})
$$

with the SOC satisfied

In case of deciding locations, socialism works better than capitalism

<br>

[@daspremont1979]

-   Principle of Minimum Differentiation is invalid

$$
\pi_1 (p_1, p_2) = 
\begin{cases}
ap_1 + 0.5(l-a-b) p_1 + \frac{1}{2c}p_1 p_2 - \frac{1}{2c}p_1^2 & \text{if } |p_1 - p_2| \le c(l-a-b) \\
lp_1 & \text{if } p_1 < p_2 - c(l-a-b) \\
0 & \text{if } p_1 > p_2 + c(l-a-b)
\end{cases}
$$

and

$$
\pi_2 (p_1, p_2) = 
\begin{cases}
bp_2 + 0.5(l-a-b) p_2 + \frac{1}{2c}p_1 p_2  - \frac{1}{2c}p_2^2& \text{if } |p_1 - p_2| \le c(l-a-b) \\
lp_2 & \text{if } p_2 < p_1 - c(l-a-b) \\
0 & \text{if } p_2 > p_1 + c(l-a-b)
\end{cases}
$$

## Positioning Models

@tabuchi1995

-   Relax Hotelling's model's assumption of uniform distribution of consumers to non-uniform distribution.

-   Assumptions:

    -   Equal cost

    -   Consumers distributed over [0,1]

    -   $F(x)$ = cumulative distribution of consumers where $F(1) = 1$ = total population

    -   2 distributions:

        -   Traditional uniform density: $f(x) =1$

        -   New: triangular density: $f(x) = 2 - 2|2x-1|$ which represents consumer concentration

    -   Transportation cost = quadratic function of distance.

Hence, marginal consumer is

$$
\bar{x} = (p_2 - p_1 + x^2_2-x_1^2)/2(x_2-x_1)
$$

then when $x_1 < x_2$ the profit function is

$$
\Pi_1 = p_1 F(\bar{x})
$$

and

$$
\Pi_2 = p_2[1-F(\bar{x})]
$$

and vice versa for $x_1 >x_2$, and Bertrand game when $x_1 = x_2$

-   If firms pick **simultaneously** their locations, and then **simultaneously** their prices, and consumer density function is log-concave, then there is a unique Nash price equilibrium

    -   Under **uniform** distribution, firms choose to locate as far apart as possible (could be true when observing shopping centers are far away from cities), but then consumers have to buy products that are far away from their ideal.

    -   Under **triangular** density, no symmetric location can be found, but two asymmetric Nash location equilibrium can still be possible (decrease in equilibrium profits of both firms)

-   If firms pick **sequentially** their locations, and pick their prices **simultaneously,**

    -   Under both uniform and triangular, first entrant will locate at the market center

<br>

@sajeesh2010

-   Model satiation (variety-seeking) as a relative reduction in the willingness to pay of the previously purchased brand. also known as negative state dependence

-   Previous studies argue that in the presence of variety seeking consumers, firms should enjoy higher prices and profits, but this paper argues that average prices and profits are lower.

    -   Firms should charge lower prices in the second period to prevent consumers from switching.

Assumptions:

-   Period 0, choose location simultaneously

-   Period 1, choose prices simultaneously

-   Period 2, firms choose prices simultaneously

<br>

## Market Response Model

Marketing Inputs:

-   Selling effort
-   advertising spending
-   promotional spending

$$
\downarrow
$$

Marketing Outputs:

-   sales
-   share
-   profit
-   awareness

[![](images/Input-Output+Model+Marketing+Actions+Inputs+Observed+Market+Outputs.jpg "Input-Output Model (Marketing Engineering)")](https://slideplayer.com/slide/5259893/)

Give phenomena for a good model:

-   P1: Dynamic sales response involves a sales **growth rate** and a sales **decay rate** that are different
-   P2: Steady-state response can be **concave or S-shaped**. Positive sales at 0 adverting.
-   P3: **Competitive effects**
-   P4: Advertising effectiveness dynamics due to changes in media, copy, and other factors.
-   P5: Sales still increase or fall off even as advertising is held constant.

Saunder (1987) phenomena

-   P1: Output = 0 when Input = 0
-   P2: The relationship between input and output is linear
-   P3: Returns decrease as the scale of input increases (i.e., additional unit of input gives less output)
-   P4: Output cannot exceed some level (i.e., saturation)
-   P5: Returns increase as scale of input increases (i.e., additional unit of input gives more output)
-   P6: Returns first increase and then decrease as input increases (i.e., S-shaped return)
-   P7: Input must exceed some level before it produces any output (i.e., threshold)
-   P8: Beyond some level of input, output declines (i.e., supersaturation point)

[![](images/Response+Function+Sales+Response+Effort+Level+Max+Response+Function.jpg "Response Function (Marketing Engineering)")](https://slideplayer.com/slide/4552247/)

Aggregate Response Models

-   Linear model: $Y = a + bX$

    -   Through origin

    -   can only handle constant returns to scale (i.e., can't handle concave, convex, and S-shape)

-   The Power Series/Polynomial model: $Y = a + bX + c X^2 + dX^3 + ...$

    -   can't handle saturation and threshold

-   Fraction root model/ Power model: $Y = a+bX^c$ where c is prespecified

    -   c = 1/2, called **square root model**

    -   c = -1, called **reciprocal model**

    -   c can be interpreted as elasticity if a = 0.

    -   c = 1, linear

    -   c \<1, decreasing return

    -   c\>1, increasing returns

-   Semilog model: $Y = a + b \ln X$

    -   Good when constant percentage increase in marketing effort (X) result in constant absolute increase in sales (Y)

-   Exponential model: $Y = ae^{bX}$ where X \>0

    -   b \> 0, increasing returns and convex

    -   b \< 0, decreasing returns and saturation

-   Modified exponential model: $Y = a(1-e^{-bX}) +c$

    -   Decreasing returns and saturation

    -   upper bound = a + c

    -   lower bound = c

    -   typically used in selling effort

-   Logistic model: $Y = \frac{a}{a+ e^{-(b+cX)}}+d$

    -   increasing return followed by decreasing return to scale, S-shape

    -   saturation = a + d

    -   good with saturation and s-shape

-   Gompertz model

-   ADBUDG model [@Little_1970] : $Y = b + (a-b)\frac{X^c}{d + X^c}$

    -   c \> 1, S-shaped

    -   0 \< c \< 1

        -   Concave

        -   saturation effect

        -   upper bound at a

        -   lower bound at b

    -   typically used in advertising and selling effort.

    -   can handle, through origin, concave, saturation, S-shape

-   Additive model for handling multiple Instruments: $Y = af(X_1) + bg(X_2)$

-   Multiplicative model for handling multiple instruments: $Y = aX_1^b X_2^c$ where c and c are elasticities. More generally, $Y = af(X_1)\times bg(X_2)$

-   Multiplicative and additive model: $Y = af(X_1) + bg(X_2) + cf(X_1) g(X_2)$

-   Dynamic response model: $Y_t = a_0 + a_1 X_t + \lambda Y_{t-1}$ where $a_1$ = current effect, $\lambda$ = carry-over effect

Dynamic Effects

-   Carry-over effect: current marketing expenditure influences future sales

    -   Advertising adstock/ advertising carry-over is the same thing: lagged effect of advertising on sales

-   Delayed-response effect: delays between when marketing investments and their impact

-   Customer holdout effects

-   Hysteresis effect

-   New trier and wear-out effect

-   Stocking effect

Simple Decay-effect model:

$$
A_t = T_t + \lambda T_{t-1}, t = 1,...,
$$

where

-   $A_t$ = Adstock at time t
-   $T_t$ = value of advertising spending at time t
-   $\lambda$ = decay/ lag weight parameter

Response Models can be characterized by:

1.  The number of marketing variables

2.  whether they include competition or not

3.  the nature of the relationship between the input variables

    1.  Linear vs. S-shape

4.  whether the situation is static vs. dynamic

5.  whether the models reflect individual or aggregate response

6.  the level of demand analyzed

    1.  sales vs. market share

Market Share Model and Competitive Effects: $Y = M \times V$ where

-   Y = Brand sales models

-   V = product class sales models

-   M = market-share models

Market share (attraction) models

$$
M_i = \frac{A_i}{A_1 + ..+ A_n}
$$

where $A_i$ attractiveness of brand i

Individual Response Model:

Multinomial logit model representing the probability of individual `i` choosing brand `l` is

$$
P_{il} = \frac{e^{A_{il}}}{\sum_j e^{A_{ij}}}
$$

where

-   $A_{ij}$ = attractiveness of product j for individual i $A_{ij} = \sum_k w_k b_{ijk}$
-   $b_{ijk}$ = individual i's evaluation of product j on product attribute k, where the summation is over all the products that individual `i` is considering to purchase
-   $w_k$ = importance weight associated with attribute k in forming product preferences.

## Marketing Resource Allocation Models

This section is based on [@Mantrala_1992]

### Case study 1

Concave sales response function

-   Optimal vs. proportional at different investment levels
-   Profit maximization perspective of aggregate function

$$
s_i = k_i (1- e^{-b_i x_i})
$$

where

-   $s_i$ = current-period sales response (dollars / period)
-   $x_i$ = amount of resource allocated to submarket i
-   $b_i$ = rate at which sales approach saturation
-   $k_i$ = sales potential

Allocation functions

-   Fixed proportion

    -   $R_i$ = Investment level (dollars/period)

    -   $w_i$ = fixed proportion or weights

$$
\hat{x}_i = w_i R; \\
\sum_{t=1}^2 w_t = 1; 0 < w_t < 1
$$

-   Informed allocator

    -   optimal allocations via marginal analysis (maximize profits)

$$
max C = m \sum_{i = 1}^2 k_i (1- e^{-b_i x_i}) \\
x_1 + x_2 \le R; x_i  \ge 0 \text{ for } i = 1,2 \\
x_1 = \frac{1}{(b_1 + b_2)(b_2 R + \ln(\frac{k_1b_1}{k_2b_2})} \\
x_2 = \frac{1}{(b_1 + b_2)(b_2 R + \ln(\frac{k_2b_2}{k_1b_1})}
$$

### Case study 2

S-shaped sales response function:

-   Optimal vs. proportional at different investment levels
-   Profit maximization perspective of aggregate function

### Case study 3

Quadratic-form stochastic response function

-   Optimal allocation only with risk averse and risk neutral investors.

## Meta-analyses of Econometric Marketing Models

## Dynamic Advertising Effects and Spending Models

## Marketing Mix Optimization Models

Check this [post](https://towardsdatascience.com/carryover-and-shape-effects-in-media-mix-modeling-paper-review-fd699b509e2d) for implementation in Python

## New Product Diffusion Models

## Two-sided Platform Marketing Models

Example of Marketing Mix Model in practice: [link](http://datafeedtoolbox.com/marketing-mix-model-for-all-using-r-for-mmm/)
