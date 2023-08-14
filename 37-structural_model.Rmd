# Structural Models

Structural modeling in marketing refers to the use of statistical models to depict the relationships between different variables and factors in a marketing context. The goal is to understand how certain factors influence others, allowing for more accurate prediction of outcomes and more effective decision making.

Structural models can be quite complex, incorporating many variables and accounting for different potential interactions. These might include customer behaviors, market trends, pricing strategies, promotional effects, and many other factors.

Examples of structural modeling papers in marketing:

-   [@misra2011structural]: This paper uses structural modeling to understand the complex interactions between sales force compensation, motivation, and performance. The authors create a model that takes into account various factors including incentive levels, job difficulty, and salesperson effort.

-   [@song2003micromodel]

-   [@goh2013social]

-   [@chintagunta2006structural] This paper reviews the field of structural modeling in marketing, highlighting its strengths and weaknesses and discussing how it has evolved over time. The authors discuss a range of models and their applications, providing a comprehensive overview of the field.

## Top Seminal Papers

-   [@allenby1999dynamic] This paper uses a structural model to understand and predict consumer purchase timing in direct marketing scenarios.

-   [@misra2011structural]: This work models the dynamics of sales force compensation, motivation, and performance, providing valuable insights into sales team management.

-   [@montgomery1999estimating]: This paper focuses on using structural models to estimate price elasticities, offering insights into pricing strategies.

-   [@rutz2011modeling]: This paper uses structural modeling to understand the indirect effects of paid search advertising, with implications for online marketing strategies.

-   [@netzer2008hidden]: This paper presents a structural model for understanding the dynamic nature of customer relationships over time.

-   [@goh2013social]: This paper models the co-evolution of user behavior in social media, enabling a better understanding of social media trends.

-   [@gowrisankaran2012dynamics]: This work models how consumers' preferences evolve over time, with applications to durable goods markets.

-   [@kadiyali2001structural]: This work presents methods for using structural modeling to understand competitive behavior in markets.

-   [@heiss2002structural]: This paper shows how to use nested logit models, a type of structural model, to analyze consumer choice behavior.

-   [@elberg2019dynamic]: This paper investigates the dynamic effects of price promotions using a structural model.

-   [@erdem2008impact]: This paper uses a structural model to understand how advertising influences consumer price sensitivity in experience goods markets.

-   [@kim2022structural]: This work models how a multitasking salesforce operates, providing insights into salesforce compensation and customer relationship management.

-   [@hitsch2006empirical]: This paper models how firms should optimally launch and exit products under demand uncertainty.

-   [@dube2002structural]: This paper provides insights into how discrete choice models, a type of structural model, can be applied in a variety of marketing contexts.

-   [@kadiyali2001structural] This work presents methods for using structural modeling to understand competitive behavior in markets.

-   [@kamakura2005choice]: This work presents a choice model for understanding customer relationship management strategies.

-   [@gupta2006modeling]: This paper uses a structural model to understand and predict customer lifetime value, with implications for customer relationship management.

## To get started in this area

### Books

-   [@greene2003econometric]: This book covers a range of econometric methods, including many that are relevant for structural modeling. It's a classic text in the field of econometrics.

-   [@cameron2005microeconometrics]: This book goes in-depth into econometric methods used in micro-level data analysis -- these are very important for structural modeling in marketing.

-   [@hensher2005applied] A lot of structural modeling in marketing has to do with modeling consumer choice, and this book gives a thorough overview of different choice modeling techniques.

-   [@diamantopoulos2013quantitative]: It provides insights into modern applications of quantitative models in marketing

-   [@heckman2007econometric1, @abbring2007econometric2, @abbring2007econometric3]

## Structural modeling and Causal Inference

Structural modeling and causal inference are both valuable tools in economics and social sciences. In a nutshell, both methods try to understand relationships between variables; however, the objectives and methodologies can differ.

-   Causal inference focuses on the identification and estimation of causal relationships from observational data. It employs strategies like randomized controlled trials, natural experiments, matching, instrumental variables, difference-in-differences, regression discontinuity, etc., to estimate the causal effect of a treatment on an outcome, while trying to control for confounding.

-   On the other hand, structural modeling refers to the practice of using economic theory to guide the specification of statistical models. Structural models explicitly model the decision-making process of agents (consumers, firms, etc.), often taking into account optimization behavior and equilibrium conditions.

While causal inference mainly focuses on "reduced-form" relationships (i.e., direct associations between variables, without necessarily modeling the underlying process), structural modeling aims to uncover the "deep parameters" of the underlying process that generates the data, which represent preferences, technologies, or strategic interactions.

As such, structural models have more demanding data requirements and often require stronger assumptions. However, they can be more flexible in extrapolating beyond the observed data (i.e., for policy analysis or prediction), because they're designed to model the underlying process that generates the data. In other words, while causal inference asks "what is the effect of X on Y?", structural modeling often asks "how does the system work?"

To transition from causal inference to structural modeling, it might be helpful to focus on these aspects:

-   Learning more about optimization theory and game theory: These are the foundations of a lot of structural models.

-   Understanding how to estimate structural models: This usually involves techniques like maximum likelihood estimation or generalized method of moments, which are more complex than the regression-based methods often used in causal inference.

-   Studying some of the seminal papers in structural modeling (like the ones listed above), to see how they specify and estimate their models.

-   Practicing with simple structural models, such as the linear demand and supply model, before moving on to more complex models.

-   Understanding the strengths and weaknesses of structural modeling as compared to causal inference. For example, structural models often require stronger assumptions, but they allow for counterfactual analysis and policy simulations.

It's also worth noting that the two methods can be complementary. For instance, results from causal inference can be used to test or validate a structural model, and a structural model can be used to guide the search for causal relationships. So, having a background in causal inference can be a big advantage as you're learning about structural modeling.

1.  **Simple Models (Linear Demand and Supply):**

    A basic model of linear demand and supply involves modeling how quantity demanded and supplied depend on price. For instance, the demand function might be Qd = a - bP, where Qd is the quantity demanded, P is the price, and a and b are parameters to be estimated. Similarly, the supply function might be Qs = c + dP, where Qs is the quantity supplied, and c and d are parameters to be estimated. By solving these two equations, we can find the equilibrium price and quantity. This model is simple, but it forms the basis for more complex structural models.

2.  **Strong Assumptions in Structural Models:**

    Structural models often involve assumptions about:

    -   The functional form of relationships between variables. For example, is demand linear or non-linear in price?

    -   The decision-making process of agents. For instance, do consumers always buy the product that gives them the highest utility?

    -   The information available to agents. Do consumers know everything about all products when making a choice, or do they face uncertainty?

    -   Equilibrium conditions. For example, in a market model, we might assume that the market always clears (demand equals supply).

    These assumptions are often necessary to make the model tractable and to allow for estimation, but they can also be a source of bias if they're incorrect.

3.  **Counterfactual Analysis and Policy Simulations:**

    Counterfactual analysis involves asking "what if" questions about scenarios that did not actually occur. For example, "what would have happened to sales if we had set a different price?" Policy simulations involve asking similar questions about potential future policies. For example, "how would a change in our pricing strategy affect future sales?"

    An example: [@gowrisankaran2020framework]

4.  **Complementarity of Causal Inference and Structural Modeling:**

    While causal inference focuses on estimating the effect of a particular treatment, structural modeling aims to understand the underlying process that generates the data. Therefore, the results from a causal analysis can provide useful information for specifying or validating a structural model. For example, a causal analysis might reveal that price has a negative effect on demand, which could be used to specify the demand function in a structural model.

    Conversely, a structural model can help guide causal analysis. For example, it can help identify potential sources of endogeneity or omitted variable bias, and suggest instrumental variables or other strategies for causal identification.

    An example is [@conlon2013demand]. The authors use structural modeling to address endogeneity in product availability, and use these structural estimates to perform a counterfactual analysis.
