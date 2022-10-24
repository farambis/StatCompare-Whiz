# Nonparametric methods

## Mann Whitney Based Probability of Superiority (PS)
The PS measures the probability (Pr) that a randomly sampled member of Population a will have a score ($Y_a$) that is higher than the score ($Y_b$) attained by a randomly sampled member of population b and can be described by the formula(Grissom & Kim, 2005): 
$$ PS = Pr(Y_a > Y_b) $$

Therefore, the PS measures the probabilistic superiority of one group's scores over another group's scores. Since it is a probability, the result ranges from 0 to1. A PS of 0 means that every member of Population $a$ is outscored by every member of Population $b$. A PS of 1 means that every member of Population $a$ outscores every member of Population $b$.
The number of times that the scores from one specified sample are higher than the scores from the other sample with which they are paired is called the _U statistic_. Therefore, we can define(Grissom & Kim, 2005): 
$$ \hat{P}_{a>b} = \frac{U}{n_a n_b} $$
with $n_a n_b$ being the number of possible comparisons and $U$ being the number of wins for a specified sample. In the above case ties are counted as 0.5. However, there is also the option to ignore ties. Then ties are not added to U and the denominator of the formula above is subtracted by the number of ties.

The PS is a nonparamatetric estimatior of the population effect estimated by the CL ES, which is described in the documentation tab of the page on parametric ES for the independent groups design.
The means of the sampling distributions of the PS and the CL are typically very similar when $\mu_1 = \mu_2$ and the correlation between the two sets of estimates was found to be well over .9 in Monte-Carlo simulations (Grissom & Kim, 2001).
However, as the difference between $\mu_1$ and $\mu_2$ increases, this correlation sometimes decreases to a value as low as approximately .2, and  the CL tends to show more sampling error than the PS as the difference increases.
Therefore, researchers who are estimating Pr(X_a, > X_b) should think about reporting PS alongside, if not instead of, the CL ES, even when assuming normality and homoscedasticity (Grissom & Kim, 2001).

The exact confidence interval is calculated based on Newcombe(2006):
$$ UL = \hat{\theta} + z \sqrt{var(\hat{\theta})} $$
$$ LL = \hat{\theta} - z \sqrt{var(\hat{\theta})} $$
and $var(\theta)$ being 
$$var(\theta) = \theta(1-\theta) \frac{1 + \frac{n * (1 - \theta)}{2 - \theta} + \frac{m * \theta}{1 + \theta}}{mn}\$$

## Generalized Odds Ratio
The generalized odds ratio is the probability of superiority of group a compared to group b divided by the probability of superiority of group b compared to group a(Grissom & Kim, 2012):
$$ OR_g = \frac{ \hat{P}_{a>b}}{\hat{P_{b>a}}}$$

the current estimated parameter (also known as Agresti's alpha) is:
$$ OR_{g_pop} = \frac{Pr(Y_a > Y_b}{Pr(Y_b > Y_a} $$

The OR_gpop measures the odds that a randomly drawn outcome from one population will be superior to a randomly drawn outcome from the other population. 

The exact Confidence Intervals can be found using the method described by Brown(2010) assuming that the data is retrieved from two independent normal distributions:
$$ \varphi_L = \frac{W_L}{1-W}$$
$$ \varphi_U = \frac{W_U}{1-U}$$

with  $\varphi_L$ being the lower border and $\varphi_U$ being the upper confidence interval and $W_L$ and $W_U$ being
$$W_L = \Phi(\frac{\delta_L}{\sqrt{2}})$$
$$W_U = \Phi(\frac{\delta_U}{\sqrt{2}})$$

with $\delta_L$ and $\delta_L$ being 
$$ \delta_L = \lambda_L\sqrt{\frac{1}{n} + \frac{1}{m}} $$
$$ \delta_U = \lambda_U\sqrt{\frac{1}{n} + \frac{1}{m}} $$

with $\lambda_L$ being the value of $\lambda$  satisfying 
$$ T_{(n+m -2, \lambda)}(T_{n + m - 2, 0}^{-1}(1 - \frac{p}{2})) = 0.975$$

and $\lambda_U$ being the value of $\lambda$  satisfying
$$ T_{(n+m -2, \lambda)}(T_{n + m - 2, 0}^{-1}(1 - \frac{p}{2})) = 0.025$$

Additionally, an $1 - \alpha$ percentile bootstrap confidence interval is implemented.

## Dominance measure
A variation of the probability of superiority was discussed by Cliff(1993) and is called Dominance Measure(DM): 
$$ DM = Pr(Y_a > Y_b) - Pr(Y_b - Y_a) $$
Its estimator is consequently given by 
$$ ds = \hat{p}_{a>b} - \hat{p}_{b>a} $$
Because as probabilities, both Pr (probability) values can range from 0 to 1, the DM ranges from -1 to 1. When calculating the Pr values, ties are ignored. 
The DM is a linear function of the PS and if there are no ties: 
$$DM = 2PS -1$$
The confidence limits for the DM are calculated as follows(Grissom & Kim, 2012): 
$$ UL = PS_{UL} * 2 -1$$
$$ UL = PS_{LL} * 2 -1 $$
with $PS_{UL}$ and $PS_{LL}$ being calculated as described above for the probability of superiority measure.
Additionally, an $1 - \alpha$ bootstrap confidence interval is implemented.

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
  
  
  
<hr></hr>

<h1 id="IG_NP_refs"> References </h1>  
  
Banga, s. J., & Fox, G. D. (2013). Bonett's method. State College, PA: Minitab, Inc. <https://support.minitab.com/en-us/minitab/21/media/pdfs/translate/Bonetts_Method_Two_Variances.pdf>  

Bonett, D. G. (2006). Robust confidence interval for a ratio of standard deviations. *Applied Psychological Measurement*, *30*(5), 432--439. <https://doi.org/10.1177/0146621605279551>  

Browne, R. H. (2010). *The t-test p value and its relationship to the effect size and P (X> Y)*. The American Statistician, 64(1), 30-33. <https://doi.org/10.1198/tast.2010.08261>  

Cliff, N. (1993). *Dominance statistics: Ordinal analyses to answer ordinal questions.* Psychological bulletin, 114(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>  

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Routledge. <https://doi.org/10.4324/9780203771587>  

Del Giudice, M. (2019). *Measuring sex differences and similarities*. Gender and sexuality development: Contemporary theory and research.  

Fagerland, M. W., Lydersen, S., & Laake, P. (2015). Recommended confidence intervals for two independent binomial proportions. *Statistical Methods in Medical Research*, *24*(2), 224--254. <https://doi.org/10.1177/0962280211415469>  

Feng, D. (2007). *Robustness and power of ordinal d for paired data*. Real data analysis, 163-183.  

Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>  

Grissom, R. J., & Kim, J. J. (2005). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Hedges, L. V., & Olkin, I. (1985). *Statistical methods for meta-analysis*. Academic Press.  

Kraemer, H. C., & Andrews, G. (1982). *A nonparametric technique for meta-analysis effect size calculation*. Psychological bulletin, 91(2), 404. <https://psycnet.apa.org/doi/10.1037/0033-2909.91.2.404>  

Schmid, F., & Schmidt, A. (2006). *Nonparametric estimation of the coefficient of overlapping—theory and empirical application*. Computational statistics & data analysis, 50(6), 1583-1596. <https://doi.org/10.1016/j.csda.2005.01.014>  
