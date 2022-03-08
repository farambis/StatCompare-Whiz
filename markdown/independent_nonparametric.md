# Nonparametric methods

## Mann Whitney Based Probability of Superiority
The Probability of Superiority (PS) measures the probability (Pr) that a randomly sampled member of Population a will have a score ($Y_a$) that is higher than the score ($Y_b$) attained by a randomly sampled member of population b and can be described by the formula(Grissom & Kim, 2005): 
$$ PS = Pr(Y_a > Y_b) $$

Therefore, the PS measures the probabilistic superiority of one group's scores over another group's scores. Since it is a probability, the result ranges from 0 to1. A PS of 0 means that every member of Population $a$ is outscored by every member of Population $b$. A PS of 1 means that every member of Population $a$ outscores every member of Population $b$.
The number of times that the scores from one specified sample are higher than the scores from the other sample with which they are paired is called the _U statistic_. Therefore, we can define(Grissom & Kim, 2005): 
$$ \hat{P}_{a>b} = \frac{U}{n_a n_b} $$
wit $n_a n_b$ being the number of possible comparisons and $U$ being the number of wins for a specified sample.  

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
$$ OVL_2 (X, Y) = \frac{OVL}{\int_{-\infty}^\infty max\{f(x), g(x)\}dx$$}
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


## Standardized Median differences 
Standardized Median differences can also provide valuable insights into the differences between groups and is calculated as follows (Grissom & Kim, 2012): 
$$\hat\delta =  \frac{Mdn_a - Mdn_b}{Mdn_{a|b}}$$
with $Mdn_a$ being the Median of group a, $Mdn_b$ being the median of group b and $Mdn_{a|b}$ depending on the median standardization between the two groups.
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.
### Absolute Deviation from the median
The difference in Medians can be standardized by the Median Absolute Deviation (MAD) of the baseline/control group. 
Then the median difference is calculated with the following formula(Grissom & Kim, 2012):
$$\hat\delta =  \frac{Mdn_a - Mdn_b}{MAD_{a|b}}$$
with MAD being
$$MAD = median(|X_i - median(X_i)|)$$
The MAD is more robust to outliers than the standard deviation and has a lower sampling variance.
### Difference in medians standardized by .75 RIQ
The difference in medians can also be standardized by $.75R_{IQ}$ (Grissom & Kim, 2012):
$$\hat\delta = \frac{Mdn_a - Mdn_b}{.75R_{IQ{a|b}}}$$
which is more outlier resistant than the standard deviation and at the same time approximates the standard devation - under normality - very well(Grissom & Kim, 2005).
### Biweight Standard Deviation
Differences in medians can be standardized by the biweight standard deviation of the control or baseline group (Grissom & Kim, 2005):
$$\hat\delta = \frac{Mdn_a - Mdn_b}{S_{bw_{a|b}}}$$
with $s_{bw_{a|b}}$ being 
$$s_{bw_{a|b}} = \frac{\sqrt{n}\sqrt{\sum{a_i(X_i - median(X_i))^2(1-Y_{i}^{2}}}}{|\sum{a_i(1-1-Y_{i}^{2}}(1-5Y_{i}^{2})}$$
with $Y_i$ and $a_i$ being
$$ Y_i = \frac{X_i-median(X_i)}{9MAS}$$
$$a_i = \{_{1, if |Y_i < 1}^{0, if |Y_i| \geq{1}}$$

## Nonparametric Glass d 
A nonparametric version of Glass' $d_G$ is described by Kraemer and Andrews (1982) as well as by Hedges and Olkin (1985):
$$ \hat\gamma_{b} = \Phi^{-1}(p_{b})$$
with $p_{b}$ being
$$ p_{a} = \frac{x < median(y)}{n} $$
the proportion of group b measurements that are lower than the median of the group a measurements. Thus, $\hat{\gamma_b}$ is the $p_b$-quantile of the standard normal distribution. When the observations are independent and normally distributed, $\hat{\gamma_b}$ is an estimate of the population effect size 
$$\Delta = \frac{\mu_a - \mu_b}{\sigma_b}$$
When n is small $p_{a|b}$ might be equal to 0 or 1. To avoid consequently extreme effect sizes  $p_{a|b}$ is set to $\frac{1}{n_{a|b}+1}$  or  $\frac{n_{a|b}}{n_{a|b}+1}$ respectively in such cases.
For further details, the reader is advised to consult Kraemer and Andrews (1982) as well as Hedges and Olkin (1985).
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Tail Ratio

## Nonparametric Variance Ratio

Browne, R. H. (2010). *The t-test p value and its relationship to the effect size and P (X> Y)*. The American Statistician, 64(1), 30-33.

Cliff, N. (1993). *Dominance statistics: Ordinal analyses to answer ordinal questions.* Psychological bulletin, 114(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Routledge. <https://doi.org/10.4324/9780203771587>

Del Giudice, M. (2019). *Measuring sex differences and similarities*. Gender and sexuality development: Contemporary theory and research.

Feng, D. (2007). *Robustness and power of ordinal d for paired data*. Real data analysis, 163-183.

Grissom, R. J., & Kim, J. J. (2005). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.

Hedges, L. V., & Olkin, I. (1985). *Statistical methods for meta-analysis*. Academic Press

Kraemer, H. C., & Andrews, G. (1982). *A nonparametric technique for meta-analysis effect size calculation*. Psychological bulletin, 91(2), 404.

Schmid, F., & Schmidt, A. (2006). *Nonparametric estimation of the coefficient of overlapping—theory and empirical application*. Computational statistics & data analysis, 50(6), 1583-1596.
