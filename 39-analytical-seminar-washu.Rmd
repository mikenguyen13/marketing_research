# WashU Analytical Model

Interview:

-   Don't even show your findings first (people will attack them)

-   Never deny that you have a problem (always accept or have good answers for your problem).

-   Only present summary, main results, and leave extension in the end if there is no question asked.

## Platforms

### [@jiang2011] Amazon's mid-tail

-   Firm strategies in the "mid tail" of platform-based retailing

-   For two sellers on Amazon (high vs. low demand sellers), the threat to entry from the platform benefit them.

-   Upon entry, the platform decreases consumer surplus in the early period, while increases in later period

-   Intuitively, Amazon should sell high-volume products and independent sellers should sell low-volume long-tail products.

-   For mid-tail sellers, if they sell too good, they will be taken over by Amazon. Hence, reducing sales can avoid Amazon's notice.

-   Findings:

    -   After observing demand, the platform can separate the high demand and low-demand seller by setting high fee. Thus only high-demand seller can remain, and later the platform will take the market share of these ones. With low probability of high demand, the platform can set low fee (which allows the high-demand sellers to mask).

    -   The platform can forgo the option to independently sell altogether (so that both types of seller will provide high level of service and subsequently high sales). But both types of sellers prefer the threat of entry because of the low per-unit fee for ex ante probability of high demand.

    -   If the platform enters, it will reduce consumer surplus at first and increase it later.

    -   With the consumer reviews (to proxy seller service quality), the platform can increase its optimal sales fee if the ex ante probability of a high-demand type is low and vice versa.

-   Related literature:

    -   Internet retailing

    -   Two-sided market

    -   Distribution channel

    -   Asymmetric information games

-   Model

Amazon's fixed cost: $F >0$

Seller fixed cost = 0 (sunk)

Demand in each period

$$
q^{(i)} (p, e) = \gamma + e{(i)} - bp^{(i)}
$$

where

-   $p$ is the price of the product

-   $e$ = service level

-   $\gamma, b$ are constant

Uncertainty about product (= uncertainty about the seller's type:

1.  High with probability $\theta$
2.  Low with probability $1 - \theta$

Per-unit marginal cost is $s(e) = k e^2$ where $k$ is constant

There are two conditions for Amazon to make decisions:

1.  If the fixed cost is too high, Amazon will let the sellers to sell
2.  If the fixed cost is low enough, and Amazon know the true demand is high ($\gamma = \gamma_H$) then it will sell directly

Two-stage game:

1.  Nature determines the seller's type, Amazon charge a per-unit fee $f$ (constant in 2-period). Sellers choose to sell or not (both service level $e^{(1)}$ and price $p^{(1)}_t$ where $t \in \{L,H\}$)
2.  Amazon updates beliefs about the seller's type, Amazon decides to sell directly or not.

3 case studies:

1.  Amazon with full info
2.  Amazon promises to not enter: without threat, both types of seller will have the same service levels for both periods
3.  Amazon with incomplete info and decide whether to enter
    1.  Separating equilibrium, based on the fee $f$

        1.  H-type could mimic L-type to avoid Amazon notice

        2.  Only H-type can sell on Amazon. Hence, it makes profit in the first period and 0 in the second.

    2.  Pooling equilibrium



### [@zou2021] search neutrality

-   Counter-intuitive idea: Search neutrality hurts consumers, but good for platforms (due to reduced price competition)

    -   Search neutrality decreases seller's price competition (only apply to online platform with personalized search, not to offline store with uniform display)

    -   it decreases consumer surplus but increases consumer's search relevancy

-   Search neutrality is different from net neutrality

-   Related literature:

    -   Intermediary biases (e.g., recommendation results, copycat products, etc.)

    -   Consumer search

Model

2 groups of consumers:

-   Consumer prefer first-party products than third-party products

-   Consumer prefer third-party over first-party

Consumer dynamics (sequentially):

1.  Pre-search:
    1.  no costs

    2.  Consumer learn expected valuations from pre-search
2.  Search:
    1.  Search costs to determine match and exact value

Consumers' action set

1.  buy the prominent product
2.  end search (no purchase)
3.  incur search cost to inspect non-prominent product

3 stages:

1.  Set prices
2.  Personalized search rankings
3.  Consumer purchase

-   It's still hard to implement the search neutrality policy (similar to the loan policy is not based on race).

-   Tradeoff between commission (profits from true ranking) and product sales from fake order. (but in the paper, they already assumes that the platform capture higher profits from selling the first-party products)

-   



### Diao et al. 2021 P2P rideshare vs. taxi

-   Competition between P2P ridesharing platforms and traditional taxis



### [@gal-or2022] Subscription platform

-   Designing entry strategies for subscription platforms

-   Platforms like ClassPass (fitness) or MoviePass, MealPass, Inspirato Pass (hotel and resorts) offer physical service subscriptions.

-   Reason for limited offer is the transportation cost

-   2 conditions:

    -   Consumers: variety-seeking

    -   High transportation cost

Assumptions:

-   One platform offers a bundle of two vendors (on the Hotelling's line)

Possible variables in contract:

-   Quality of the service

-   Transfer payments between the platform and the vendor: variable fee per customer + fixed fee

-   The number of platform customers that vendors agree to serve.

No deal if there are only 2 variables: a fixed transfer payment + quality of service (due to intensified competition in prices). Only when we add either (1) transfer fee per customer or (2) the number of customers the that vendors agree to serve.

Additional requirement: balanced bargaining positions between vendors and the platform.

Recommendations:

-   Enter markets where vendors are differentiated (variety-seeking consumer will be enticed -\> higher industry profits)

-   Weak competitions between vendors (e.g., local vendors are local monopoly because of high transportation cots)

-   Appropriate tools to avoid price competitions:

    -   transfer fee per customer

    -   impose restrictions on the quantity

    -   Do not: offer lower quality service for platform-user as compared to vendor-users. (restrictions on quantity is better than restriction on quality).

Contributions:

-   Bundling: Different from retailer's bundles, because platform (bundle) competes against the independent sellers as well. Different from information goods bundling, this study provides suggestion on the bundling of physical services

-   Platforms: different types of platform (e.g., as a marketplace, as a retailer), this study focuses on competition between a platform (not an independent seller) and vendors.

-   Channel management: possible only when there is little price competition.

Model\
2 vendors, 1 platform

-   $p_i$ = price charged by vendor $i$

-   $s$ = subscription fee charged by the platform.

-   $v$ = gross utility

-   $(1 + \alpha) v$ is the gross utility when the consumer wants variety where $\alpha \in (0, 1]$

    -   $\alpha$ denotes the preference for variety

-   If we assume that the vendors offer $0 \le k_i \le 1$ (lower quality service) to the platforms subscribers, the gross utility will be $[(k_1 + k_2)/2](1+ \alpha)v$ (i.e., the gross utility reduced by the average quality offered by vendors). (not too sure why the authors introduce this assumption so early)

-   Say that a subscriber after purchasing the pass, only utilize one, her utility is $k_i v$

The net utility when a consumer pick only $i$ is

$$
U(x_i, \text{only vendor } i) = \max\{[ v- tx_i - p_i], [k_i v - tx_i - s]\}
$$

Either the customer has to purchase directly, or via the platform

The net utility when a consumer want to choose both

$$
U( x_i, \text{both vendors} ) = \max \{ [ (\frac{k_1 + k_2}{2}(1 + \alpha) v - t - s], [ (1 - \alpha) v - t - (p_1 + p_2)] \}
$$

again, either purchase from the platform, or directly from the service providers.

Notice difference in transportation costs between one or two services utilization.

**Restriction for model tractability**: $(1+ \alpha)v - t >0$ (see for both vendors) means that consumers always derive a net positive (not including total price paid). (questionable assumptions)

In a market that has both vendors and platform (i.e., positive market share), their prices have to satisfy:

$$
p_1 + p_2 - v(1+ \alpha)[1 - \frac{k_1 + k_2}{2}] \ge s \ge p_i - (1 - k_i) v
$$

-   Lower bound: if a consumer only buys from one vendor, she will directly purchase it from the vendor

-   Upper bound: if a consumer wants to buy both, she will subscribe.

Defensible assumptions:

1.  Vendors continue to offer services independent of the platform
2.  If there is no market share for vendors (i.e., vertical integration), it will attract antitrust law suit.

Market share:

$$
MS_i = x_i^* = \frac{t + s - p_i - v[(\frac{k_1 + k_2}{2})(1 + \alpha) - 1]}{t}
$$

where $i, j = 1,2; i \neq j$

and

$$
MS_p = \frac{v[(k_1 + k_2)(1 + \alpha) - 2] - t - 2s + p_1 + p_2}{t}
$$

Stages:

1.  The platform decides whether to negotiate with the vendors
2.  The platform negotiates with the vendors separately (i.e., different terms, different contracts)
    1.  Pairwise negation between the platform and the individual vendors, use Generalized Nash bargaining solution
3.  The parties (vendors + platform) set prices noncooperatively and independently

2 regimes (common variables: The quality of the service $k_i$ and the fixed payment $F_i$):

1.  Variable transfer fee: Fee per customer $m_i$ -\> higher platform fee -\> lower market share
2.  Quantity restriction: Number of customers agree to serve $y_i$ -\> directly lower market share

Pairwise negotiations:

1.  Platform vs. vendor 1: $k_1, F_1, m_1$ (or $y_1$)
2.  Platform vs. vendor 2: $k_2, F_2, m_2$ (or $y_2$)

To establish the Generalized Nash Bargaining solution, we have to see the outside options for each party

1.  Platform = 0: cannot be formed if there is no agree with either vendor
2.  Vendor (pick only the equilibrium that yields the highest aggregate industry profits because of allowance for side payments): $w_i = f(\alpha, v, t)$

Lemma 1: The best possible outside option for both vendors ($w_1 + w_2$) to be highest satisfy 4 conditions

+-----------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+
| When                                                                                                                                    | $w_i$                                                                | Implication                                                                                            |
+=========================================================================================================================================+======================================================================+========================================================================================================+
| $\frac{1}{1 + \alpha} < \frac{v}{t}< 1$                                                                                                 | $w_i = \frac{v^2}{4t}$                                               | Without the platform, the lower the transportation cost, the more intense the competition on price is. |
|                                                                                                                                         |                                                                      |                                                                                                        |
| Since the transportation cost is so high, the market is not covered (i.e., those far away drop out, and those in also go to one vendor) | Each vendor becomes local monopoly ($\pi_i = w_i$)                   |                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+
| $[\alpha < \frac{2\sqrt{2}}{e} \& 1 \le \frac{v}{t} \le \frac{3}{2}]$ or                                                                | $w_i = \frac{1}{2}(v - \frac{t}{2})$                                 |                                                                                                        |
|                                                                                                                                         |                                                                      |                                                                                                        |
| $[\alpha \ge \frac{2\sqrt{2}}{3} \& 1 \le \frac{v}{t} \le \frac{1 - \sqrt{1 - \alpha^2}}{\alpha^2}]$                                    | Multiple equilibrium satisfying sum of vendors prices equal $2v - t$ |                                                                                                        |
|                                                                                                                                         |                                                                      |                                                                                                        |
| Market is covered                                                                                                                       |                                                                      |                                                                                                        |
|                                                                                                                                         |                                                                      |                                                                                                        |
| Consumer only buys from 1 vendor                                                                                                        |                                                                      |                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+
| $\alpha < \frac{2\sqrt{2}}{3}$ and                                                                                                      | $w_i = \frac{t}{2}$                                                  | Price competition is intense                                                                           |
|                                                                                                                                         |                                                                      |                                                                                                        |
| $\frac{3}{2} \le \frac{v}{t} < \frac{\sqrt{2}}{\alpha}$                                                                                 |                                                                      |                                                                                                        |
|                                                                                                                                         |                                                                      |                                                                                                        |
| Low transportation cost and low variety seeking parameter $\alpha \le (2 \sqrt{2})/3$                                                   |                                                                      |                                                                                                        |
|                                                                                                                                         |                                                                      |                                                                                                        |
| Consumer only buys from 1 vendor                                                                                                        |                                                                      |                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+
| $[\alpha < \frac{2 \sqrt{2}}{e} \& \frac{\sqrt{2}}{3}\le \frac{v}{t} \le \frac{2}{\alpha}]$ or                                          | $w_i = \frac{(\alpha v )^2}{4t}$                                     | Most intense competition                                                                               |
|                                                                                                                                         |                                                                      |                                                                                                        |
| $[\alpha \ge \frac{2\sqrt{2}}{\alpha} \& \frac{1 + \sqrt{1 - \alpha^2}}{\alpha^2} \le \frac{v}{t} \le \frac{2}{\alpha}]$                |                                                                      |                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+

Then the Generalized Nash Bargaining solution can be formulated

under the "variable transfer fee"

$$
\begin{aligned}
\max_{k_i , m_i, F_i}  NB_{ip} &= [MS_i p_i + m_i MS_p + F_i - w_i]^\beta[MS_p (s - m_i - m_j) - F_i - F_j ]^{1 - \beta} \\
&= [\text{net vendor i account for outside option}][\text{net for the platform}]
\end{aligned}
$$

where $i, j = 1,2; i\neq j$

under the "quantity restriction"

$$
\begin{aligned}
\max_{k_i , y_i, F_i} NB_{ip} &= [MS_i p_i + F_i -w_i]^\beta [MS_p s - F_i - F_j]^{1- \beta} \\
&=  [\text{net vendor i account for outside option}][\text{net for the platform}]
\end{aligned}
$$

where $i, j = 1, 2; i \neq j$

and $\beta$ = negotiating power of vendor $i$ and

$1 - \beta$ = negotiating power of the platform

**Prerequisites for the existence of the platform**

1.  The total surplus upon agreement with both vendors is higher than the sum of outsides options

$$
TS = s MS_p + p_1 MS_1 + p_2 MS_2 > w_1 + w_2
$$

(shouldn't it only be $p_1 MS_1 + p_2 MS_2 > w_1 + w_2$, why do we need to include $s MS_p$)

2.  Under the "variable transfer fee" regime, parties can make decisions on quality of service $k_i$ and fee per customer $m_i$ of vendor $i$ and the platform (given the deal with $j$ is done already)

$$
\max_{k_i, m_i} TS_{ip} = (s - m_j) MS_p + p_i MS_i- F_j
$$

(This should be the total surplus $TS = (s- m_1 - m_2) MS_p + p_1 MS_1 + p_2 MS_2 - F_1 - F_2$

3.  Under the quantity restriction regime, parties can negotiate on quality of the service $k_i$ and number of customer agree to serve $y_i$ for vendor $i$ and platform (given the deal is done with $j$ already)

$$
\max_{k_i, y_i} TS_{ip} = s MS_p + p_i MS_i - F_j
$$

Introduction of the platform can increase the industry total profit because it widens to pie to include people who value variety and those who are farther away from either vendor.

**Proposition 1**: With only two variables: (1) $k_i$ (quality service) (2) $F_i$ (fixed payment), there will be no agreement.

But with either regime, agreement can be reached

1.  **Variable transfer fee**

Maximization problems (i.e., setting prices to maximize profits):

$$
\begin{aligned}
\max_{p_i} \pi_i &= p_i MS_i + m_i MS_p + F_i \\
&= \frac{p_i [ t+ s - p_i - v[(\frac{k_1 + k_2}{2})( 1+ \alpha) - 1]}{t} \\
&+ \frac{m_i [v[(k_1 + k_2)(1 + \alpha) - 2] - t - 2s + p_1 + p_2]}{t} \\
&+ F_i
\end{aligned}
$$

where $i = 1, 2$

and

$$
\begin{aligned}
\max_s \pi_p &= (s- m_i - m_j) (MS_p) - F_i - F_j \\
&= \frac{(s- m_i - m_j ) [v[(k_1 + k_2)(1 + \alpha) - 2] - t - 2s + p_1 + p_2]}{t} - F_i - F_j
\end{aligned}
$$

After solving

$$
p_i = \frac{6t + 11 m_i + 5 m_j  - 2v [( 1 + \alpha)(k_1 + k_2)-2]}{12}
$$

$$
MS_i = \frac{6 t - m_i + 5 m_j - 2v [(1 + \alpha)(k_1 + k_2)- 2]}{12}
$$

and

$$
s = \frac{v[(1 + \alpha) (k_1 + k_2) - 2] + 5 (m_1 + m_2)}{6}
$$

$$
MS_p = \frac{v (1 + \alpha)(k_1 + k_2)-2] - (m_1 + m_2)}{3t}
$$

Both $p_i, s$ increase with $m_i$ (variable transfer fee) while if we were to negotiate on ly on $k_i$ (quality), only $p_i$ will increase while $s$ will decrease. Allowing for negotiation based on variable transfer fee can facilitate agreement.

Since in the second stage, we have to make that the indifferent customers can buy from both the vendor and the platform. And the net payoff of platform customers are equal (because of same transportation cost)

$$
\max_{k_i, m_i} TS_{ip} =  p_i MS_i + (s - m_j) MS_p -F_j
$$

where $i, j = 1,2$ subject to (non negative utility for the indifferent customer)

$$
U(x_i^*) = (1 + \alpha) v - t - S \ge 0
$$

**Proposition 2**:

With the addition of the "variable transfer", the platform can enter the market. And it has the following properties:

1.  $k_1 = k_2 =1$ (same quality both platform and vendor users) (both parties have no interest to offer different quality because of cannibalization) and the whole market is covered.
2.  For the entry of platform, the variety parameter $\alpha$ has to be big. If the negotiating position of the platform increase (greater value of $\alpha$), the negotiating powers of each vendor should improve as well (i.e., weak competition between the vendors).

Isn't big value of the variety parameter is the same thing as the two vendors are very much differentiated? No, because two vendors can be local monopoly that has no incentive to agree with the platform (unless there is a segment of consumers that you could serve additionally).

3.  When before entry competition was weak, the surplus of platform customers will be realized upon entry
4.  When before entry competition was strong, the platform customer only derive a positive surplus only when the competition continues to be strong (big value of $\frac{v}{t}$)
5.  The payoff for the parties are

$$
pi_i = \frac{\beta}{1 + \beta}[ TS + \frac{w_i (1 - \beta)}{\beta}]
$$

and

$$
\pi_p = \frac{1 - \beta}{1 + \beta} [ TS - 2w_i]
$$

2.  **Quantity Restriction Regime**

To specify $y_i$ as the number of customers vendor $i$ agrees to serve, we can either use (1) $(y_1 + y_2)/2$ or $\min(y_1, y_2)$ (the first specification is easier to understand and solve while both yield the same results)

When 2 vendors pick the price and platform inherit its price:

Since the market share is $MS_1 + MS_2 + MS_p = 1$ and $MS_p = (y_1+y_2) /2$, the subscription fee is

$$
s = \frac{p_1 + p_2 + v[(k_1 + k_2) (1 + \alpha) -2]}{2} - \frac{t(2 +y_1 + y_2)}{4}
$$

(the result is similar when one vendor and the platform picks the price)

**Proposition 3**: with quantity restriction, an agreement can be reached where

1.  $k_1 = k_2 1$ and the market is covered
2.  When before entry, vendors were local monopoly the variety parameter needs to be sufficiently high
3.  With moderatle before-entry competition, consumers can still yield benefit from the platform
4.  Under very strong competition that consumers always yield positive payoff, and there is no agreement.

**Proposition 4**: (only under the regions where both regimes exist) industry total profit is higher for the variable transfer fee if $\frac{9}{4 + 6 \alpha} < v/t$ (i.e., when the transportation cost is small and variety parameter is big), otherwise the restriction on quantity regime is better.

**Future research**:

-   Assume: sellers with different market power

-   Sellers could also bundle products (subscription)

-   Learning model: customers only use platform to figure out their preference, then pick 1 vendor.

-   Multiple round negotiation.



### [@long2022] Design Amazon marketplace

-   2 sellers on a marketplace with search query that consists of sponsored and organic listings.

-   Consumers preferences are jointly determined by vertical and horizontal aspects.

    -   Vertical component: asymmetric info that are known only by the sellers (product quality $q_i \sim U(0,1), i \in (1,2)$).

    -   Horizontal component: asymmetric info that are known only by the platforms about the consumer preference (personal fit $\lambda_{ki} \in U(0,1), i \in (1,2)$)

-   Products and sellers will either be match ($\sim Ber (m_{ki})$) or no match

The match probability is

$$
m_{ki} = \theta_k q_i + (1- \theta_k) \lambda_{ki}
$$

where

-   $\theta_k$ (consumer's private info) the relative weight that consumer $k$ put on the vertical vs. horizontal components.
-   $q_i$ = seller's private info
-   $\lambda_{ki}$ = the platform's private info
-   All three parameters follow $\sim U(0,1)$

Platform chooses seller to put in the organic slot with the highest value of

$T\tilde{q}_i + (1- T) \lambda_{ki}$

where

-   $T$ = info weight (i.e., info sharing parameter)

-   $\tilde{q}_i$ = partial info on product quality from the auction

-   $\lambda_{ki}$ = platform's personal fit info

-   Assuming that the bidding price from seller to the ad place reveals some info about their product quality

Platform's revenue can come from either

1.  Sales commissions: $\phi \in [0,1]$ (percentage charge per transaction)
2.  Ad Revenue (either pay-per-click payment rule or pay-per-impression)

**Timeline**

1.  Platform decides on $T$ (info weight) and $\phi$ (commission rate)
2.  Sellers decide to join
3.  Consumers decide $\theta_k$ (personal preference), sellers decide on $q_i$ (quality), platform decides on $\lambda_{ki}$ (platform's private info)
4.  Sellers bids $b_i$
5.  Platform infers $\tilde{q}_i$ from $b_i$ and decides who gets the ad placement
6.  Consumers decide on $m_i$ (matching probability), search

**Analysis**

Additional assumption: seller's bid $b(q_i)$ strictly increases in $q_i$ (verifiable in the seller's optimal bidding behavior)

Then, the platform can infer the true value of $q_i$ from sellers' bids and places the seller with the higher $Tq_i + (1-T) \lambda_{ki}$ in the organic result

Hence, consumers also infer that ad position is seller with higher product quality ($q_i$) and organic place is the seller with higher $Tq_i + (1-T) \lambda_{ki}$

**Consumer choice**:

-   When the same seller appears in the ad and organic result (she is the higher-quality seller) (results don't change with multiple slot

-   When the ad slot seller ($i$) (higher quality product) is different from the organic slot ($j$) (higher personal fit)

    -   $i$ is chosen, if consumer value quality more

    -   $j$ is chosen, if consumer value personal fit more.

**Seller's Ad Bids**: optimal bid verifies the bidding behavior of sellers (seller with higher product quality is going to bid higher)

**Platform's Sales Commission and Ad revenue**

Sales Commission: $\phi D(T)$

Ad revenue: $2 \int_0^1 \int^{q_i}_0 b(q_i) dq_i dq_j$

Proposition 2: Sales Commission revenue is concave while Ad revenue is increasing.

Sales is concave (information effect of strategic listing) because if

1.  $T$ is too small (personal fit is overvalued), consumers will not benefit from the product quality info revealed from sellers' bids
2.  $T$ is too large (product quality is overvalued), consumers will not benefit from the personal fit info, in turn worsen the match probability.

Ad revenue is increasing (competition effect of strategic listing):

-   As $T$ increases, platform ad revenue increases (because sellers' probability of being in the ad slot as well as the organic slot increases)

**Platform's design decision**

1.  Platform's choice of commission rate (fixed platform's info weight $T$): the total revenue increases with the commission rate because commission revenue (from both organic and ad slots) dominates the losses in ad revenue (from only the ad slot)
2.  Platform's choice of commission rate (fixed platform's info weight $T$) and the sellers' have an outside option $u_0$ is $\phi^* = 1 - \frac{u_0}{U(T, 0)}$, meaning as the optimal commission rate decreases as $T$ increases because a larger $T$ increase the bids and increases advertising fee.
3.  With varying info weight and commission rate
    1.  If seller's outside option is small (first region), the optimal commission rate decreases as seller's outside option increases

    2.  If the sellers' outside potion is intermediate, the optimal information weight decreases as seller's outside option increases, and the optimal commission rate is 0

    3.  If the outside option is large enough, sellers will not participate in the first place.

Extensions:

1.  Comparison with Independent listing (no strategic listing - using info from the bidding side to list organic search): When comparing with the benchmark that there is no strategic listing behavior, the commission ate under strategic listing leads to lower commission revenue, but higher advertising revenue. Hence, overall the platform benefit from strategic listings
2.  Comparison with Independent Listing (Under Exogenous Commission rate)
    1.  If the commission rate is small, strategic listing leads to higher to both higher commission and advertising revenue

    2.  If the commission rate is intermediate, strategic listing leads to lower commission and ad revenues

    3.  If the commission rate is large, both listing strategies lead to 0 revenue.
3.  When seller's information $q_i$ and platform's info $\lambda_{ki}$ overlap (correlated), results do not change



### [@hajihashemi2021] Personalized Pricing with Network Effects

-   Read [@katz1985network] for fulfilled expectations equilibrium

Stages

Without personalized pricing

1.  Firms know the type of consumers, set uniform price $p$

2.  Consumer $i$ knows $p_i, s_i$

With personalized pricing

1.  Firms know the type of consumers, set price $p_L, p_H$
2.  Consumer $i$ only knows

Proposition 1: Without network effect, price personalization leads to a lower equilibrium price for consumer $L$, but with network effect, price personalization leas to higher equilibrium for consumer $L$

-   If the network effect is too small, the marginal effect of price decreases on the reservation price is minimal.

Proposition 4: Consumer Surplus: price personalization can decrease the unconditional expected surplus of consumer $L$



## Dynamic Pricing and Bundling

-   A monopolist sells products in a bundle to homogenize consumer heterogeneity in willingness to pay for individual products. and to sell individual products to price discriminate

### [@prasad2017] Bundling

-   3 static bundling strategies:

    -   Products are sold separately (pure components PC)

    -   Products are sold only in a bundle (pure bundling PB)

    -   Products are sold under both (mixed bundling MB) second-degree price discrimination

-   Selling products under the

    -   pure-bundling in two stages is optimal when the marginal costs are low

    -   pure components in two stages is optimal when marginal costs are high (with lots of **myopic** consumers)

    -   pure bundling then pure components is optimal when marginal costs are moderate (with lots of **strategic** consumers)

    -   mixed bundling in both stages when the market is mostly **strategic** consumers.

-   Scenario:

    -   PB-PC: bundle first then component

    -   PC-PB: component then bundle

-   Assumptions:

    -   Monopoly with either high or low marginal cost

    -   Heterogeneous consumers (regarding product preference)

    -   2 types in the population: myopic ($\alpha$) (maximize at each stage independently) and strategic $(1- \alpha)$ (maximize both stages)

    -   Marginal cost of the bundle = sum(component costs)

-   Interesting

    -   optimal bundle price can be higher than the sum of individual products

-   Literature:

    -   Bundling

    -   Inter-temporal pricing

PC-PC

Demand for each product from myopic consumers in the first stage is $(1-P) \alpha$

$P - \delta$ is the price for the second stage where $\delta$ is the discount.

Demand for each product from myopic consumer in the second stage is $\alpha \delta$

Demand for each product from strategic consumer is $(1-\alpha)(1 - P + \delta)$

For the seller, the first stage profit is $2(P-c) (1-P)\alpha$

and the second stage profit is $2(P - \delta - c)[\alpha \delta +(1 - \alpha)(1 - P + \delta)]$

Hence, optimal prices are

$$
P_1 = \frac{1 + c}{2} + \frac{(2 - \alpha)(1 - c)}{2(4 - \alpha)}
$$

and

$$
P_2 = \frac{1 + c}{2} - \frac{\alpha (1-c)}{2 (4 - \alpha)}
$$

the total profit is

$$
\frac{2(1-c)^2}{4 - \alpha}
$$



### [@diao2019] Intertemporal price, consumer fairness concern

-   Consumer fairness concerns (unfair due to increased price) lead to lower retail prices in both periods while the wholesale prices might be higher in the first period.

-   Consumer fairness concerns can decrease the first and second period retail prices.

    -   The intuition that retailers increase in the first period and decrease in the second period only hold under a centralized system (wholesale to consumer), not under a decentralized one.

-   If the demand intercept does not raise much in the second period, the cost reduction incentive usually prevails over fairness-mitigation incentive.

-   A larger second-period demand can cause both the producer and the store to lower their pricing.

-   When consumers have fairness costs, the second-period equilibrium unit sales is actually still higher than when they don't, because fairness concerns alleviate the double-marginalization problem.

-   To model fairness concern heterogeneity, they model 2 types of consumers (those with fairness concern and those without), where $\alpha$ is the fraction of customer with fairness concerns. And it should affect the retailer's second-period demand function.



### [@dana2022] Intertemporal price

-   Oligopoly model

-   Pricing on capacity:

    -   fixed capacity, firms dynamically set price.

-   Stage:

    -   Choose capacity

    -   Compete in prices

-   Inventory control (i.e., sales limit restriction) can help mitigate price competition.

-   Contributions:

    -   Equilibrium prices are flat or uniform over time

    -   Intetemporal price discrimination is possible when firms adopt inventory controls (if the demand is more inelastic over time).

-   Firm choices: capacity and 2 prices (2 periods)

### [@kolay2022] Event bundle

-   Two events sold as a bundle in 2 periods.

-   Contribution to current literature:

    -   Consumer expectations of future prices

        -   Durable goods pricing

        -   Product obsolescence

    -   Loyalty programs

    -   Consumer uncertainty regarding valuations

-   Features:

    -   Events with different popularity

    -   Popular event in stage 1 or 2

    -   Consumers can be uncertain about their valuation of the second event

    -   Uncertainty in seller's commitment to the price of a future event

    -   Consumers valuations are independently distributed or positively correlated

-   Examine when it's optimal to sell

    -   event independently

    -   as a bundle

    -   or mixed

-   Events are different from products in that are

    -   perishable

    -   temporal

-   If the seller can choose the order of introduction, popular events should be saved for later. ("save the best for last"). Similar to that we introduce the lower quality products before the higher quality ones. [@moorthy1992]

Model

Consumer valuation of the less popular event $L$ is $v_L \sim U(0,1)$ and of the more popular event $H$ is $v_H \sim U(0, 1 +x)$ where $x$ represents how more popular the second one is (i.e., the proportion of consumers preferring $H$ over $L$).

Consumers understand the order and importance of events before the game begins.

Demand function depends on seller's strategies

-   No bundling at all: consumers only buy products $L, H$ can only be purchased separately

-   Pure bundling: Either buy bundle or not

-   Full and partial mixed bundling: can buy either $L, H$ separately or in a bundle.

## Consumer Fairness

Also see [@diao2019]



### [@fu2021] Unfair machine learning algorithms

-   Compares the consequences of Equal treatment (ET) and equal opportunity (EO)

    -   Regular and protected groups are better off if we change from ET to EO?

    -   Optimal learning efforts under ET and EO?

    -   Is the firm better off if ET to EO?

-   Strategic behavior of a firm: decide the amount of leaning effort. The firm invest for better ML algorithm to predict the outcomes.

Settings

Consumers

-   Good consumer (non-defaulters) and bad consumers (defaulters)

-   Consumers are in either regular or protected group

Firm

-   Risk-neutral, and want to select good consumers

-   Invest in ML by paying the learning costs to separate the good and bad consumers

-   Set approval thresholds for each group

-   A fairness constraint: either ET or EO

Main Results:

-   Firm less motivated to invest in learning under EO than under ET

-   Profit is lower under EO because it's hard to separate the good and bad consumers in the protected group

-   EO makes everyone (regular + protected) worse off

    -   Regular group has higher threshold under EO (than under ET)

    -   Firm invests less on the algorithm under EO

Model

Firm

-   accepts or rejects an application

-   A consumer can either be good or bad

-   the profit/loss ($\alpha, \beta$) where it comes from good/bad consumer

-   firm exerts leaning efforts (s) for better separability between the two groups

Consumer

-   Either regular or protected (size = 1)

-   \% of bad consumer in each group is $d$

-   Expected gains:

    -   $\alpha_p = \alpha(1 - d_p), \beta_p = \beta d_p$

    -   $\alpha_r = \alpha(1 - d_r), \beta_r = \beta d_r$

The bank uses ML and assigns scores to candidates to represent their goodness where $\gamma_r, \gamma_p$ are learning efficiency

Summary

-   The optimal threshold and the profit depend on $\beta_p$

## Decentralized Channels

### [@jiang2022effects] Reactive capacity on product quality and profitability in uncertain markets

-   Under "pull" contracts, the retailer designs the product quality and makes the wholesales and retail pricing decisions, but the risk of excess production is assumed by the upstream suppliers or contract manufacturers, rather than brand-owning retailers or OEMs.

-   How much improvement in reactive capacity will benefit the supplier and how much it will benefit the retailer?

Model

Production Setup

-   A supply chain where before the selling season, a brand-owning retailer designs a production quality $q$ and offers a wholesale price $w$ to outsource its production to ta supplier.

-   At the beginning of the selling seasons, the retailer will decide how many units $Q$ of the product to order from the supplier and choose its retail price $p$

-   Supplier's marginal cost = $k q^2$

Market uncertainty setup

-   Then consumer utility from product with quality $q$ at price $p$ is $u = q \theta - p$

-   where $\theta$ is the consumer's WTP

-   Assume that the market uncertainty is about the distribution of the consumer's rather than about the total number of consumers in the market. Then a fraction of $\alpha \in (0,1)$ of consumers have $\theta = \theta_H$

Time setup

-   Supplier's production lead time $T$ = total production time + shipping and handling

-   $T = T_S + \frac{N}{c}$ quantity independent time + quantity dependent time

-   Denote A as the acceptable delivery time. The supplier will have to manufacture the product before the selling season if $T_s > A$ and could produce some units during the selling season other wise

-   The market outcome $T_S > A$ is equal to $T_S = A$

Model

-   The supplier's reactive capacity is measured by $\bar{Q}$, which is the maximum quantity (number of units) of the product that the supplier can produce and deliver to the retailer within the selling season

-   $T = T_S + \frac{Q}{c} \le A$ Hence, $\bar{Q} = (A - T_s)c$

-   The supplier's reactive capacity, $\bar{Q}$ is driven by both the amount of production capacity $c$ and how reactive and flexible that capacity is ($T_s$)

-   Whether is it the retailer or the supplier that bears the inventory risk?

Timeline

-   Before selling seasons

    -   Retailer decides product quality and wholesale price

    -   Supplier: pre-season inventory I

-   Within the selling seasons

    -   $\alpha$ is known to the retailers

    -   Retailer: product quantity $Q$

    -   Supplier:

        -   $Q \le I$ revenue $w Q$

        -   $Q>I$ decide $I' \le \bar{Q}$ to produce within A

    -   Retailer: selling price

    -   Consumer: purchase decisions

Analysis

-   Without market uncertainty ($\alpha = \alpha_g = \alpha_b$)

-   With market uncertainty

    -   Extreme cases

        -   When $\alpha_b \ge \frac{\theta_L}{\theta_H}$ even the bad market has many high-valuation consumers, the retailer will find it optimal to charge a high price to target only high-valuation consumer regardless of the market state

    -   In-between cases

        -   Low reactive capacity

        -   Medium reactive capacity

            -   Opportunistic targeting with stock-out: the retailer sets the wholesale price low at the supplier's marginal cost and the supplier will produce the risk-free inventory of $I = ag$

            -   Opportunistic targeting with overstock: the retailer chooses a high wholesale price to induce the supplier to optimally produce a higher pre-season inventory of $I = 1 - \bar{Q}$

        -   High reactive capacity: the supplier has enough time to produce during the selling season within the acceptable delivery time. Anticipating the supplier's high ability to fulfill its order, the retailers will target only high valuation costumers at a high retail price

### [@hu2022agency] Wholesale vs. Agency

Literature

-   Distribution channels

    -   Previously examine wholesale contract and downstream consequences (double marginalization problem)

    -   This paper examines channel efficiency of agency contract.

-   Strategic contract choices: wholesale vs. agency

-   Retail pass-through

Model setup

$n \ge 2$ competing suppliers selling substitutable products to consumers through a dominant online retailer $r$

Each supplier has a unique product

Assume same marginal cost across supplier, e-tailer has marginal cost for each unit of products demanded by costumers

Demand structure

Consider the demand of product is given by continuous $q_i(p)$

where $p$ = market prices

Common assumptions:

1.  Demand is downward sloping
2.  Demand function is symmetric

Let $\gamma >0$ be the product substitutability for specific demand function

$\lambda(p) = - \frac{q(p)}{q'(p)}$ be a measure of sensitivity of demand

Additional assumptions on $\lambda(p)$

1.  profit functions are quasi-concave
2.  elasticity of demand decreases with $p$ increases

Game Structure

Wholesale

1.  Supplier announces wholesale price $w_i$
2.  E-tailer sets selling price $p_i$ for each product

Agency

1.  E-tailer sets revenue share rate $1 - \alpha$
2.  Suppliers can choose to accept and sell directly to costumers on e-tailer platform, setting retail prices $p_i$



## Consumer Search

### [@jiang2020] Consumer Search and Filtering on Online Retail Platforms

Findings

-   Lower search cost reduces seller's profit margin (due to increased competition), but also attract more consumers to the platform

-   If referral fee is exogenously determined, a decrease in search cost can either increase and decrease the platform's profit

    -   Hence, platform should compensate by raising its referral fee, but it actually depends on the effect of search cost on demand elasticity:

        -   If the search cost increases the demand elasticity, platform should lower its referral fee

        -   If the search cost decreases the demand elasticity, the platform should increase its referral fee.

-   If referral fee is set optimally, the platform's profit will increase (kinda intuitive)

-   With the filtering feature, consumers will be more likely to buy after searching due to reduction in uncertainty about the product match value for consumers

Motivation:

-   The search costs tend to decrease overtime

-   However, there is not study that study the platform's optimal referral-fee in respect to search costs, filtering.

Research questions:

-   How search cost affects optimal referral fee and profit?

-   How filtering affects the platform, sellers, and consumers?

-   How filtering impact differs from that of a reduction of the search cost?

Results are robust to

-   heterogeneous search costs

-   heterogeneous product quality

-   platform charges a fixed per-unit referral fee (instead of percentage)

Related Literature

-   Consumer search: mixed literature on whether to increase or decrease search cost

-   Information structure effect on consumer search and firm profits

-   This paper:

    -   Add filtering (different from target search)

    -   search cost affects platform's and sellers' optimal pricing decision

    -   search cost affects platform's optimal referral fee

Setup

-   Horizontally differentiated products

-   After search (cost), consumers learn the price and match value (with the product)

-   Match value = f(filterable match value + unfilterable match value)

Consumer utility

$$
u_{ij} = M_{ij} + p_i
$$

where

-   $M_{ij} = \mu_{ij} + m_{ij}$ = match value of product $i$ to consumer $j$

    -   $\mu_{ij} = \delta \times \hat{\mu}$ = filterable match value

        -   $\delta >0$ is a cosntnat scale factor

        -   $\hat{\mu}$ = mean-zero discrete random variable with $K$ realizations

    -   $m_{ij}$ = unfilterable match value

    -   It's ok if $\mu_{ij}$ correlates with $m_{ij}$

-   $p_i$ = product price

Consumer search

1.  Consumer know her outside option $u_{0j}$ and $\mu_{ij}$ (filterable match value)
2.  Consumer do not know $m_{ij}$ (match value) and price before hand, only after search cost $\tau$

Consumers decisions

1.  Whether to search on the platform
2.  Search sellers sequentially and learn $m_{ij}$ and $p_i$
3.  Consumers can buy, search more (to the next product with highest $\mu_{ij}$), and leave

Game Timing

1.  Retail platform sets a percentage referral fee $r \in (0,1)$
2.  Sellers set price where profit is $(1-r)p_i-c$
3.  Consumers make search and purchase decisions.

Notes:

-   $p^*(r)$ = equilibrium retail price

-   $r^*$ = optimal percentage referral fee

In equilibrium, consumers will continue search until the next product expected utility beyond $u_{ij}$ is less than $\tau$ (search cost) [@wolinsky1986]

Result 1: consumer purchase if $m_{ij} \ge \bar{m} (\tau)$ where $\bar{m}(\tau)$ satisfies $\int_{\bar{m}(\tau)}^{m_{max}} (m - \bar{m}(\tau)) dF(m) = \tau$

Result 2: $\bar{m}(\tau)$ decreases with $\tau$

In equilibrium, $\bar{m}(\tau)$ is the equilibrium acceptance threshold for the unfilterable match value

**For exogenous referral fee**

Lemma 1: retail price, sellers' profit, total demand

Result 3: As the cost of searching reduces, a consumer's expected number of searches before purchasing increases, as does the expected aggregate match value $M_{ij}$ of the product she will buy.

Lemma 2: Market demand and sellers' profits change with the search cost ($\tau$). Lower search cost intensify sellers' competition, which reduces their prices and increase profits due to a demand-expanding effect (increase the whole pie). The platform's equilibrium profit can also increase or decrease as the consumer's search cost decreases

**Endogenous referral fee**

Proposition 1: A decrease in search cost increases the platform's expected profit

Proposition 2: As the consumer's search cost $\tau$ decreases, the platform will

1.  Increase its referral fee if the search does not increase the demand elasticity (but communication is important here)
2.  Decreases its referral fee if the search cost increase the demand elasticity

**Effects of Filtering**

-   Consumer's optimal search strategy

    -   Lemma 3: Filtering increases the consumers' acceptance threshold for the aggregate match value by less than $\mu_K$

        -   Filtering allows consumers to have smaller consideration set, which raises acceptance threshold for the aggregate match value

        -   Filtering reduces the direct benefit of searching. Hence, consumers are more likely to stop searching at a lower acceptance threshold.

        -   But the first effect \> the second effect.

    -   Proposition 3: filtering increases a consumer's probability of buying a product after searching it, and reduces the consumer's expected number of search.

-   Seller's pricing decisions: filtering reduces retail price

    -   Proposition 4: Filtering reduces consumer's uncertainty about the product's match value

        -   Consumers only search products with the highest filterable attributes, reducing the match-value differentiation among product (increase price competition, and lower equilibrium price)

        -   filtering decreases consumers' equilibrium probability of continuing search after searching a product, reducing competition and higher equilibrium prices.

    -   Proposition 5: Filtering increases the platform's demand, seller's profit, and platform's profit, and consumer surplus under small scale factor for the match value and referral fee is exogenous

Conclusion

-   Reduction in search cost makes consumers search more, while filtering reduces the benefit of search making consumers search power products

-   Decrease in search cost intensifies seller's competition, leading to lower retail prices. While filtering softens seller competition, and lead to higher retail prices

-   When the referral fee is exogenous, a lower search cost can either be good or bad for the platform, and consumers. Whereas filtering will always benefit the sellers, the platform, and consumers if filtering only reveals a small amount of the variations in the match value.

Heterogeneous search costs:

-   Proposition 6: Optimal retail price is the weighted average of the homogeneous-search cost equilibrium prices

Heterogeneous Product quality:

-   Premium sellers charge a higher price (than non-premium sellers), but the difference is smaller than their quality difference

Fixed Per-unit referral fee:

-   When the platform's referral fee is exogenous, a reduction in search costs will always increase the platform's profit under a set per-unit referral price, but it will lower the platform's profit under a percentage referral fee.



### [@chen2021] Consumer Search with blind buying

Objective and Motivation

-   Consumers don't have relevant info and must invest effort to purchase a suitable product

-   Previous search literature, consumers pay a fixed search cost to visit a store and fully informed about the price and match value at the store

-   These models do not capture

    -   Online search technology that lower the cost of visiting stores and collecting info about prices

    -   Consumers cannot physically inspect and try products.

-   This paper designs a sequential search model to capture these two aspects

Sequence:

-   Before searching, consumers observe the prices and prior values of both firms, and they pay a search cost to learn the match value

-   Consumers have to decide product to search firs, and whethe to continue searching after inspecting the first product. If consumers decide to stop searching, they can either buy the insepcted product or bldinly buy an unispected product

Model construction

-   Duopoly market, 2 firms sell horizontally differentiated products in price competition.

-   The random utility (net of nay search cost) fo consumer $l$, who purchases the product from firm $i$ is $\tilde{u}_{il} = \tilde{\eta}_{il} + \tilde{\epsilon}_{il} - p_i$

    -   $\tilde{\eta}_{il}$ = observable match value

    -   $\tilde{\epsilon}_{il}$ = unobservable match value

The key feature is that consumers can blindly buy a product

-   At any stage of search process, consumers have the option of purchasing a product without inspecting its match value $\tilde{\epsilon}_{il}$ where no search cost is incurred

-   The expected utility for consumer blind search is $E(\tilde{u}_{il}) = \eta_{il} + E(\tilde{\epsilon}_{il}) - p_i$

Search is assumed to be costly

Game sequence

1.  Firms determine their prices
2.  Each consumer costlessly observes both the prices and the prior values of the products and decides whether to blindly buy a product. the game ends if a blind buying takes place
3.  The game continue and after learning product match value, the costumer decides among three 3 options
    1.  buy product without uncertainty

    2.  blindly buy product without inspecting its match value

    3.  discover both realized value

Results

-   The effects of blind buying on equilibrium prices

    -   In price-directed search models without the blind buying option, search friction has 2 effect on prices competition.

-   When the match value has a symmetric distribution, both consumer and firms are indifferent to the search order, conditioning on searching

-   An increase int eh first sample search cost has no effect on market prices in existing price-directed search models, reducing equilibirum prices in the model

### [@li2022] Superior knowledge, price discrimination, and customer inspection 

-   Customer inspection : learn about their intrinsic preferences.

-   Superior knowledge: firms know customers preferences

Setup

A monopolistic firm selling a product to a continum of customers of unit measure

Customer have heterogeneous match values with the firm's product (either high or low)

the prior probability of a high match value is $\alpha$

Information structure:

-   Customers know their expected match value, they are ex ante uninformed about their idiosyncratic shock and do not know their match value beyond its prior distribution

-   Customer inspection: the cost that consumer make for an informed purchase. The inspection cost is independent of rational inferences

-   firm knows both its product characteristics and preference of individual customers.

Timeline

1.  Each customer has their match
2.  Firm offers each customer a personalized price according to her preference. The firm chooses the probability distribution of its price
3.  Observing the personalized price, customer decides whether to inspect to find out her true preference by incurring an inspection cost with probability
4.  Based on the inspection outcome, if the customer chooses to inspect, the customer decides whether to make a purchase



## Review paper

-   To reject, find major flaws

-   If you propose alternative specification or robustness, provide rationale why it's necessary.

How to deal with rejections

-   Let it sit for a few days before/after you read it

-   Vent your anger with your coauthors

-   Examine main points of rejection and focus on improvement

-   Submit to another journal and forget about it

How to deal with revisions

-   Let it sit for a few days

-   Vent with coauthors

-   Examine main concerns (for those papers that you can't address reviewer's concern, consider submitting to another journal). If you don't send back within certain window, editors assume you are not going to submit it.

-   For major revisions, you don't send it back right away in a month

Results

-   Rejection: don't ever send it back

-   Reject and resubmit: If you do these certain thing, we treat it as a new paper

-   Major revision: major problems, but if you revise it, the outcome is still uncertain, but you pass the first round (about 50% will be rejected in the second round)

-   Minor revision: problems that are easily solvable (less uncertainty)

-   Conditional acceptance: some small things, wordings (no risk of being rejected)

-   Accept as is
