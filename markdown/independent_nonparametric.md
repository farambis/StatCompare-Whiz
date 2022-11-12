# Nonparametric methods

<h3 id = "ID_NP_PS"> Probability of Superiority (<i>PS</i>) </h3>

The population effect of interest is given by:  

$$PS = \mathbb{P}(X_a > X_b) $$

that is, the probability that a randomly sampled member of population *a* will have a score ($X_a$) that is higher than the score ($X_b$) attained by a randomly sampled member of population *b* (Grissom, 1994a). This is the same population effect estimated by the parametric Common Language (*CL*) ES statistic (see the documentation tab of the page on parametric ES for the independent groups design).

Therefore, the *PS* measures the probabilistic superiority of one group's scores over another group's scores. Since it is a probability, its value ranges from 0 to 1. A *PS* of 0 means that every member of population *a* is outscored by every member of population *b*. A *PS* of 1 means that every member of population *a* outscores every member of population *b*.  

A nonparametric estimator of this population effect is given by (Grissom, 1994a):

$$ \hat{p}_{a>b} = \frac{U}{(n_an_b) - n_{ties}} $$

where *U* is 

$$U = \sum_{i = 1}^{n_a}\sum_{j = 1}^{n_b}I_{\{x_{ia} \gt x_{jb}\}}(x_{ia}, x_{jb})$$

and 

$$I_{\{x_{ia} \gt x_{ib}\}}(x_{ia}, x_{jb} = \begin{cases} 
  1 & \text{if} \qquad x_{ia} \gt x_{jb}\\
  0 & \text{if} \qquad x_{ia} \leq x_{jb}
\end{cases}$$

with *U* being the *U*-statistic---the number of times that the scores from one specified sample are higher than the scores from the other sample with which they are paired (with ties being ignored)---and $(n_an_b) - n_{ties}$ being the total number of possibles pairings minus the number of pairings resulting in a tie (which should optimally be 0 if this estimator is chosen). Thus, $\hat{p}_{a>b}$ is the proportion of times a group *a* score was higher than a group *b* score in the sample (with ties being ignored). This definition assumes no ties or equal allocations of ties (Grissom, 1994a). This assumption should hold for continuous dependent variables. However, in practice continuous variables can often only be measured coarsely, which might result in tied values. Additionally, psychological research also employs measures on an ordinal scale, which too likely yield ties. Grissom (1994b) recommended count ties as half a "win". It can be argued that this leads to a slightly different definition of the population effect and thus it can be considered its own distinct ES - see the *A* measure of stochastic superiority below (Vargha & Delaney, 2000).  

$\hat{p}_{a>b}$ is a nonparamatetric estimator of the population effect also estimated by the *CL* ES statistic , in the sense that the former estimator's definition does not rely on the normality and homoscedasticity assumption of the latter estimator's.  

The means of the sampling distributions of $\hat{p}_{a>b}$  and the *CL* statistic are typically very similar when the population means are equal ($\mu_a = \mu_b$) with the correlation between the two sets of estimates found to be well over .9 in Monte-Carlo simulations (Grissom & Kim, 2001).  
However, as the difference between $\mu_a$ and $\mu_b$ increases, this correlation sometimes decreases to a value as low as approximately .2, and  the *CL* statistic tended to show more sampling error than the *PS* estimator as the difference increased.  
Therefore, researchers who are estimating $\mathbb{P}(X_a > X_b)$ should think about reporting *PS* alongside, if not instead of, the *CL* ES, even when assuming normality and homoscedasticity (Grissom & Kim, 2001).

The exact confidence interval is calculated based on Newcombe (2006):

$$ UL = \hat{p}_{a>b} + z \sqrt{var(\hat{p}_{a>b})} $$
$$ LL = \hat{p}_{a>b} - z \sqrt{var(\hat{p}_{a>b})} $$

with *z* being:

$$z = \Phi^{-1}(1 - \frac{\alpha}{2})$$

and $var(\hat{p}_{a>b})$ being: 

$$var(\hat{p}_{a>b}) = \hat{p}_{a>b}(1 - \hat{p}_{a>b}) \frac{1 + \frac{n (1 - \hat{p}_{a>b})}{2 - \hat{p}_{a>b}} + \frac{m \hat{p}_{a>b}}{1 + \hat{p}_{a>b}}}{nm}\$$ 

Additionally, a $1 - \alpha$ percentile bootstrap CI is computed.  

<br> 

<h3 id = "IG_NP_A_measure"> The <i>A</i> measure of stochastic Superiority </h3>

The population effect of interest is given by:

$$A_{a|b} = \mathbb{P}(X_{a|b} > X_{b|a}) + .5 \mathbb{P}(X_a = X_b)$$

yielding the two distinct population effects:

$$A_{a} = \mathbb{P}(X_{a} > X_{b}) + .5 \mathbb{P}(X_a = X_b)$$

$$A_{b} = \mathbb{P}(X_{b} > X_{a}) + .5 \mathbb{P}(X_a = X_b)$$

these are, the probability that a randomly sampled score $X_a$ from population *a* will be greater than or equal to an independently drawn score $X_b$ from population *b* and vice versa (Vargha & Delaney, 2000). This quantity is identical to the population effect estimated by the parametric *CL* ES statistic and the nonparametric *PS* statistic for continuous measures where ties are not possible. However, this definition is also applicable to any measure at least ordinally scaled, where ties are quasi unavoidable and have to be explicitly accounted for. For a thorough discussion of the subtle yet important differences between these ES definitions as well as the relations between Cliff's $\delta$, the *CL* ES and $A_{a|b}$ consult Vargha and Delaney (2000).  

If the dependent variable of interest is continuous and ties are not possible, then, much like with the *PS* and the *CL* ES definition, a value of $A_a$ > 0.5 indicates that population *a* is "stochastically"/"probabilistically" greater than population *b*. However, whenever ties are possible both $A_a$ and $A_b$ have to be inspected in order to determine which group is "stochastically"/"probabilistically" superior. Consider a case where $\mathbb{P}(X_a > X_b)$ = 0.1, $\mathbb{P}(X_b > X_a)$ = 0.3 and $\mathbb{P}(X_a = X_b)$ = 0.6. In this case $A_a = \mathbb{P}(X_a > X_b) + .5 \mathbb{P}(X_a = X_b)$ = 0.7 > 0.5. However, $A_b = \mathbb{P}(X_b > X_a) + .5 \mathbb{P}(X_a = X_b)$ = 0.9 > 0.7 = $A_a$. Thus, population *b* is "stochastically"" superior even though $A_a$ > 0.5. Therefore, whenever the user selects this effect size, both population effects are estimated.  

A nonparametric estimators of these population effects are given by (Vargha & Delaney, 2000):

$$ \hat{A}_a = \frac{U'_a}{n_an_b} $$

$$ \hat{A}_b = \frac{U'_b}{n_an_b} $$

where $U'_a$ is 

$$U'_a = \sum_{i = 1}^{n_a}\sum_{j = 1}^{n_b}I_{\{x_{ia} \geq x_{jb}\}}(x_{ia}, x_{jb})$$

with

$$I_{\{x_{ia} \geq x_{ib}\}}(x_{ia}, x_{jb} = \begin{cases} 
  1 & \text{if} \qquad x_{ia} \gt x_{jb}\\
  0.5 & \text{if} \qquad x_{ia} = x_{jb}\\
  0 & \text{if} \qquad x_{ia} \lt x_{jb}
\end{cases}$$  

and $U'_b$ being: 

$$U'_a = \sum_{i = 1}^{n_a}\sum_{j = 1}^{n_b}I_{\{x_{ia} \leq x_{jb}\}}(x_{ia}, x_{jb})$$

with

$$I_{\{x_{ia} \leq x_{ib}\}}(x_{ia}, x_{jb} = \begin{cases} 
  1 & \text{if} \qquad x_{ia} \lt x_{jb}\\
  0.5 & \text{if} \qquad x_{ia} = x_{jb}\\
  0 & \text{if} \qquad x_{ia} \gt x_{jb}
\end{cases}$$  

with *U'* being the *U*-statistic accounting for ties---the number of times that the scores from one specified sample are higher than or equal to the scores from the other sample with which they are paired---and $n_an_b$ being the total number of possibles pairings. Thus, $\hat{A}_a$ is the proportion of times a group *a* score was higher than or equal to a group *b* score in the sample (and vice versa).  
If this effect size is chosen by the user, both estimators are provided denoted as $\hat{A}_1$---estimating the second groups superioirty over the first (= $\hat{A}_a$ in the notation above)---and $\hat{A}_2$---estimating the first groups superiority over the first (= $\hat{A}_b$ in the notation above).  

The exact confidence interval is calculated based on Newcombe (2006):  

$$ UL = \hat{A}_{a|b} + z \sqrt{var(\hat{A}_{a|b})} $$
$$ LL = \hat{A}_{a|b} - z \sqrt{var(\hat{A}_{a|b})} $$

with *z* being:

$$z = \Phi^{-1}(1 - \frac{\alpha}{2})$$

and $var(\hat{A}_{a|b})$ being

$$var(\hat{A}_{a|b}) = \hat{A}_{a|b} (1 - \hat{A}_{a|b}) \frac{1 + \frac{n (1 - \hat{A}_{a|b})}{2 - \hat{A}_{a|b}} + \frac{m \hat{A}_{a|b}}{1 + \hat{A}_{a|b}}}{mn}\$$

Additionally, a $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h3 id = "IG_NP_GOR"> Generalized Odds Ratio (<i>OR</i><sub>g</sub>) </h3>

the population effect of interest is given by:  

$$ OR_{gpop} = \frac{\mathbb{P}(X_a > X_b)}{\mathbb{P}(X_b > X_a)} $$

The $OR_{gpop}$---also known as Agresti's alpha---measures the odds that a randomly drawn score from population *a* will be superior to a randomly drawn score from population *b*.  

A nonparametric estimator that does not make assumptions about the shape of the two population distributions given by (Grissom & Kim, 2012):  

$$ OR_g = \frac{\hat{p}_{a>b}}{\hat{p}_{b>a}}$$

Thus, the generalized odds ratio ($OR_g$) is the probability of superiority of group *a* compared to group *b* divided by the probability of superiority of group *b* compared to group *a*.  When there are not ties present/when ties are ignored, the above estimator can be rewritten as:  

$$OR_g = \frac{\hat{p}_{a>b}}{1 - \hat{p}_{a>b}}$$

and can be considered a function of the Probability of Superiority ES measure $\hat{p}_{a>b}$ described above.  

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.  

<br>

<h3 id = "IG_NP_DM"> Dominance measure </h3>

A variation of the probability of superiority was discussed by Cliff(1993) and is called Dominance Measure (*DM*): 

$$ DM = \mathbb{P}(X_a > X_b) - \mathbb{P}(X_b - X_a) $$

Its estimator is consequently given by: 

$$ ds = \tilde{p}_{a>b} - \tilde{p}_{b>a} $$

with 

$$ \tilde{p} = \frac{U}{n_a n_b}$$

with *U* being defined as above (see documentation for the Probability of Superiority, *PS*). 

When there are no ties present---i.e., $x_{ia} \neq x_{jb} \quad \text{for any} \ i \in \{1, \ldots, n_a\}, \ \text{and} \ j \in \{1,\ldots,n_b\}$---both $\hat{p}_{a>b}$ and $\hat{p}_{b>a}$ can range from 0 to 1. In this case, the *DM* ranges from -1 to 1. However, when ties are present then the *DM* ranges from -*g* to *g* with *g* being the proportion of comparisons where $x_{ia} \neq x_{jb}$.  

Additionally, when there are not ties present the *DM* is a linear function of the *PS*: 

$$DM = 2PS -1$$

and as a result, the confidence limits for the DM can be calculated by transforming the confidence limits on the *PS* statistic as follows (Grissom & Kim, 2012): 

$$ UL = 2PS_{UL} - 1$$
$$ UL = 2PS_{LL} - 1 $$

with $PS_{UL}$ and $PS_{LL}$ being calculated as described above (see documentation for the *PS*).

Additionally, an $1 - \alpha$ bootstrap confidence interval is implemented. This CI should be reported whenever ties are present.

<br>

## Nonparametric Coefficient of Overlapping
The coefficient of overlapping (OVL) is defined as the common area under two probability densities and is used as a measure of agreement of two income distributions. When X and Y denote two univariate random variables with corresponding absolutely continuous distribution functions F and G and densities f and g, the coefficient of overlapping is definded as (Weitzman, 1970):
$$ OVL (X, Y) = \int_{-\infty}^\infty min\{f(x), g(x)\}dx$$
$OVL (X, Y)$ = 1 if and only if the distributions of X and Y are equal and OVL(X, Y) = 0 if and only if the supports of the distributions of X and Y have no interior points in common which is the reason why $OVL (X, Y)$ can be interpreted as a measure of agreement of the two distributions.
Nonparametric estimations can be obtained by replacing the densities by appropriate kernel density estimators and the integrals by an appropriate quadrature formula or the sample mean.
Assuming $x_1$, ..., $x_n$ denote observations of random variables X, a density estimator for _f_ is obtained by (Schmid & Schmidt, 2005):  
$$ \hat{f_n}(x) = \hat{f_n}(x|x_i, i =1, ..., n) = \frac{1}{n}  \sum_{i=1}^{n} \frac{1}{b}K(\frac{x - x_i}{b})$$
where kernel K and bandwidth b are to be determined. $\hat{g}_m$ can be defined analogously. 
To derive estimators for the OVL, $x_i$ can be transformed into the unit interval by an appropriate affine transformation. The integrals over the unit interval can now be approximated by a trapezoidal rule, resulting in (Schmid & Schmidt, 2005): 
$$ \hat{OVL}(x_1, ..., x_n, y_1, ..., y_m) = \frac{1}{k} \sum_{i=1}^k \frac{1}{2}(min\{\hat{f_n}(\frac{i}{k}), \hat{g_m}(\frac{i}{k}) \} + min\{\hat{f_n}(\frac{i-1}{k}), \hat{g_m}(\frac{i-1}{k}) \})$$
where k denotes the number of equidistant subintervals of the unit interval. 

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Measure of Overlapping Coefficient Two
The overlapping coefficient two ($OVL_2$) is the proportion of overlap relative to the joint distribution(DelGiudice, 2019). When X and Y denote two univariate random variables with corresponding absolutely continuous distribution functions F and G and densities f and g, the coefficient of overlapping two is estimated with the following formula:
$$ OVL_2 (X, Y) = \frac{OVL}{\int_{-\infty}^\infty max\{f(x), g(x)\}dx}$$
with OVL being calculated as described above, therefore not relying on assumptions about the data.
Grice and Barret(2014) argue that OVL is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. OVL, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.    
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Cohen's U1
$U_1$ can be interpreted as a percentage of nonoverlap (DelGuidice, 2019). It is the amount of combined area not shared by the two populations (Cohen, 1988).
A nonparametric version of $U_1$ was implemented making use of the relation between $U_1$ and $OVL_2$. Since $OVL_2$ is a measure of the percentage of overlap of the combined area of the two distributions and $U_1$ is a measure of the percentage of nonoverlap of the same area, $U_1$ can be expressed as a function of $OVL_2$:
$$ U_1 = 1 - OVL_2 $$
with $OVL_2$ being calculated as described above, therefore not relying on assumptions about the data.
Grice and Barret(2014) argue that OVL is to be preferred over $U_1$ in most contexts, because $U_1$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. OVL, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Cohen's U3
When examining two populations, Cohen's measure of nonoverlap $U_3$ is the percentage of one population which the upper half of the cases of the other population exceeds (Cohen, 1988). A nonparametric pendant of Cohen's $U_3$ was implemented by calculating the median of the dataset of group a and determining the percentage of values in dataset b that exceed the median of group a.
$$U_3 = \frac{\sum_{i=1}^n I_{x > median_a}(x_{i_b})}{n}$$
with
$$I_{x > median_a}(x) = \begin{cases}
1 & \text{if} \qquad x \leq median_a \\
0 & \text{if} \qquad x \gt median_a
\end{cases}
$$
and $median_{pre}$ being the median of the prestest group.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.
  
  
<h2 id="IG_NP_dGb"> Nonparametric Glass \( d_{G,\,j}\)</h2>

A nonparametric version of Glass' $d_{G,\,j}$ is described by Hedges and Olkin (1985):  

$$\hat\gamma_{j}^{\ast} = \Phi^{-1}(q_{j}^{\ast})$$

with two groups this results in the estimators:

$$\hat\gamma_{a}^{\ast} = \Phi^{-1}(q_{a}^{\ast})$$

$$\hat\gamma_{b}^{\ast} = \Phi^{-1}(q_{b}^{\ast})$$

where $q_{a}^{\ast}$ is given by:  

$$ q_{a}^{\ast} = \frac{x_a > median(x_b)}{n_a} $$

and $q_{b}^{\ast}$ is given by:  

$$ q_{b}^{\ast} = \frac{x_b < median(x_a)}{n_b} $$

If this effect size is chosen by the user, both estimators are provided denoted as nonparametric Glass' $d_{G, 1}$&mdash;$\hat\gamma_{b}^{\ast}$ is computed&mdash;and nonparametric Glass' $d_{G, 2}$&mdash;$\hat\gamma_{a}^{\ast}$ is computed.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$). 

$q_{a}^{\ast}$ is the proportion of group *a* measurements that are larger than the median of the group *b* measurements. Consequently, $\hat\gamma_{a}^{\ast}$ is the $q_{a}^{\ast}$-quantile of the standard normal distribution.
The reason $\hat\gamma_{a}^{\ast}$ can be considered a nonparametric version of Glass' $d_{G,\,a}$ is owed to the fact that when the observations are independently normally distributed, $\hat\gamma_{a}^{\ast}$ is an estimator of the population effect size $\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a}$. This is the same population effect estimated by $d_{G,\,a}$.  

$q_{b}^{\ast}$ is the proportion of group *b* measurements that are lower than the median of the group *a* measurements. Consequently, $\hat\gamma_{b}^{\ast}$ is the $q_{b}^{\ast}$-quantile of the standard normal distribution.
The reason $\hat\gamma_{b}^{\ast}$ can be considered a nonparametric version of Glass' $d_{G,\,b}$ is owed to the fact that When the observations are independently normally distributed, $\hat\gamma_{b}^{\ast}$ is an estimator of the population effect size $\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b}$. This is the same population effect estimated by $d_{G,\,b}$.  

If the scores are normally distributed and the population *a* and population *b* variances are identical, much like Glass' $d_{G,\,a}$ and $d_{G,\,b}$, $\hat\gamma_{a}^{\ast}$ and $\hat\gamma_{b}^{\ast}$ estimate the same population effect $\delta = \frac{\mu_a - \mu_b}{\sigma}$ with $\sigma$ being the common population standard deviation of groups a and b. 

It should be noted that Hedges and Olkin (1985) denoted this estimator as $\hat\gamma_{1}^{\ast}$ and $\hat\gamma_{2}^{\ast}$, respectively. The subscripts have been changed from $1$ to $b$ and from $2$ to $a$ in order to match the used subscript with those used for other effect sizes in this documentation.    

When n is small $q_{j}^{\ast}$ might be equal to 0 or 1. To avoid consequently extreme effect sizes  $q_{j}^{\ast}$ is set to $\frac{1}{n_{j}+1}$  or  $\frac{n_{j}}{n_{j}+1}$ respectively in such cases.
For further details, the reader is advised to consult Hedges and Olkin (1985).  

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.  
  
  
  
  
<h2 id="IG_NP_TR"> Nonparametric Tail Ratio (TR) </h2>

For a detailed discussion of various possible use cases as well as of the interpretation of the TR ES consult the documentation panel of the page on parametric ES for the independent groups design.   

The TR can be thought of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". The number of "hits" in group a is binomially distributed with parameters $n_a$ and $p_a$, where $p_a$ is the proportion of scores in population a below/above a cutoff. Conversely, the number of "hits" in group b is also binomially distributed with parameters $n_b$ and $p_b$, where $p_b$ is the proportion of scores in population b below/above a cutoff. The population tail ratio for a given cutoff value and region of interest is thus the ratio:  

$$\theta = \frac{p_{a|b}}{p_{b|a}}$$

The observed data can be thought of as 2 x 2 table of the following form:  

| Group | hits | misses | sum |
|-------|------|--------|-----|
|a|$n_{11}$|$n_{12}$|$n_{1.}$ |
|b|$n_{21}$|$n_{22}$|$n_{2.}$ |

The point estimate of the population tail ratio can be written as:  

$$\hat{\theta} = \frac{\hat{p}_{a|b}}{\hat{p}_{b|a}}$$

with $\hat{p}_a = \frac{n_{11}}{n_{1.}}$ and $\hat{p}_b = \frac{n_{21}}{n_{2.}}$.  

The cell frequencies are determined as the number of observed scores below/above a cutoff *t*. No assumption is made regarding the underlying distribution of the scores.  
When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})$  
- $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{2.}}I_{\{x \leq t\}}(x_{b_i})$  

with 

$$ I_{\{x \leq t\}}(x) = \begin{cases}
    1 & \text{if} \qquad x \leq t \\
    0 & \text{if} \qquad x \gt t 
   \end{cases}
$$

and when "hits" are defined as scores above *t*:  

- $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})$  
- $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{2.}}I_{\{x \geq t\}}(x_{b_i})$  

with 

$$ I_{\{x \geq t\}}(x) = \begin{cases}
    1 & \text{if} \qquad x \geq t \\
    0 & \text{if} \qquad x \lt t 
   \end{cases}
$$

With $n_{11}, n_{21}, n_{1.}$ and $n_{2.}$ defined and computed the ratio of the binomial proportions $\hat{p}_a$ and $\hat{p}_b$ and consequently the point estimate of the tail ratio can be determined.  

An approximate confidence interval is implemented for both the parametric and the non-parametric analyses. Fagerland et al. (2015) analysed multiple approximate and exact confidence intervals for the ratio of binomial proportions. While none of the assessed procedures yielded appropriate coverage rates across the various conditions the authors examined, the Koopman confidence interval (Koopman, 1984) performed decently across most of the studied scenarios and has been recommended by the authors. However, Fagerland et al. (2015) emphasize that while the Koopman interval is in general closest to the nominal level, it can be somewhat liberal (average coverage probabilities between 0.92 and 0.95 for an $1 - \alpha$ level of 0.95) for combinations of unequal sample sizes and small population proportions ($p_{a|b} \leq 0.2$). Koopman (1984) described an iterative search algorithm for finding the confidence limit, however Nam (1995) found a closed form formula, which has been implemented for this application. Since both the iterative search and the closed form solution are quite elaborate and have been described in detail in the cited literature, neither is described in detail here.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  
  
  
  
  
<h2 id="IG_NP_VR"> Nonparametric Variance Ratio </h2>

The population effect of interest as well as the implemented point estimate of the population effect are identical to the ones detailed in the documentation page of the "parametric educational" and the "parametric raw data" modes. The only difference to the implementation for the "parametric" modes is the implemented confidence interval procedure detailed here.  

Bonett (2006) modified a confidence interval procedure by Shoemaker (2003) which is based on the Layard test for homogeneity of variances (Layard, 1973) and analysed its performance for both normal and non-normal populations. The Bonett confidence interval procedure performed well when samples were drawn from normal (average coverage rates ranging from 0.951 to 0.958 for an $\alpha$-level of 0.95) as well as from moderately non-normal distributions (average coverage rates ranging from 0.925 to 0.969 for an $\alpha$-level of 0.95) (Bonett, 2006).  

Banga and Fox (2013) further improved upon the Bonett procedure and compared the performance of their confidence interval to other robust confidence intervals. The Banga-Fox-Bonett confidence interval procedure yielded the most stable coverage probabilities when sampling data from a wide variety of distributions.  

The Banga-Fox-Bonett confidence interval relies on iterative search and thus might result in an error under some conditions. Consequently, the following approach has been employed for the implementation of a "non-parametric" confidence interval for the variance ratio:  

- the Banga-Fox-Bonett confidence interval is reported if the iterative search of the confidence limits does not result in an error. The interval is computed as described by Banga and Fox (2013).  
- in case the iterative search does result in an error the user of the app receives a corresponding notification in the user interface and the Bonett confidence interval is reported. The Bonett confidence interval is computed as described by Bonett (2006).  

If the sample of either group a or that of group b consists of less than 4 observations, NAs are returned as confidence limits due to the nature of the formula for the implemented confidence intervals. Neither the computation of the Banga-Fox-Bonett nor of the Bonett confidence interval is described in detail here as they both are rather elaborate - the reader is advised to study the cited literature for further details.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  
  
<br>

<br>
  
<hr>

<h1 id="IG_NP_refs"> References </h1>  
  
Banga, s. J., & Fox, G. D. (2013). Bonett's method. State College, PA: Minitab, Inc. <https://support.minitab.com/en-us/minitab/21/media/pdfs/translate/Bonetts_Method_Two_Variances.pdf>  

Bonett, D. G. (2006). Robust confidence interval for a ratio of standard deviations. *Applied Psychological Measurement*, *30*(5), 432--439. <https://doi.org/10.1177/0146621605279551>  

Browne, R. H. (2010). *The t-test p value and its relationship to the effect size and P (X> Y)*. The American Statistician, 64(1), 30-33. <https://doi.org/10.1198/tast.2010.08261>  

Cliff, N. (1993). *Dominance statistics: Ordinal analyses to answer ordinal questions.* Psychological bulletin, 114(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>  

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Routledge. <https://doi.org/10.4324/9780203771587>  

Del Giudice, M. (2019). *Measuring sex differences and similarities*. Gender and sexuality development: Contemporary theory and research.  

Fagerland, M. W., Lydersen, S., & Laake, P. (2015). Recommended confidence intervals for two independent binomial proportions. *Statistical Methods in Medical Research*, *24*(2), 224--254. <https://doi.org/10.1177/0962280211415469>  

Feng, D. (2007). *Robustness and power of ordinal d for paired data*. Real data analysis, 163-183.  

Grissom, R. J. (1994a). Probability of the superior outcome of one treatment over another. *Journal of Applied Psychology*, *79*(2), 314--316. <https://doi.org/10.1037/0021-9010.79.2.314>  

Grissom, R. J. (1994b). Statistical analysis of ordinal categorical status after therapies. *Journal of Consulting and Clinical Psychology*, *62*(2), 281--284. <https://doi.org/10.1037/0022-006x.62.2.281>  

Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>  

Grissom, R. J., & Kim, J. J. (2005). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Hedges, L. V., & Olkin, I. (1985). *Statistical methods for meta-analysis*. Academic Press.  

Kraemer, H. C., & Andrews, G. (1982). *A nonparametric technique for meta-analysis effect size calculation*. Psychological bulletin, 91(2), 404. <https://psycnet.apa.org/doi/10.1037/0033-2909.91.2.404>  

Newcombe, R. G. (2006). *Confidence intervals for an effect size measure based on the Mann–Whitney statistic. Part 1: general issues and tail‐area‐based methods*. Statistics in medicine, 25(4), 543-557.

Schmid, F., & Schmidt, A. (2006). *Nonparametric estimation of the coefficient of overlapping—theory and empirical application*. Computational statistics & data analysis, 50(6), 1583-1596. <https://doi.org/10.1016/j.csda.2005.01.014>  

Vargha, A., & Delaney, H. D. (2000). A critique and improvement of the CL common language sffect size statistic of McGraw and Wong. *Journal of Educational and Behavioural Statistics*, *25*(2), 101--132. <https://doi.org/10.3102/10769986025002101>
