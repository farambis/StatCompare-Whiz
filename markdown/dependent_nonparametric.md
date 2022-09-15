# Hypothesis tests

## The Wilcoxon signed-rank test

The nonparametric Wilcoxon signed-rank test tests the following null hypothesis (Hollander et al., 2014, p. 40)

$$H_0: \theta = 0 \quad \quad Eq.(DGH4.1)$$

namely that the distribution of each sampled difference score $D_i = X_{bi} - X_{ai}$ is symmetric around zero . The major underlying assumption is that the distribution of every
$D_i$ is symmetric around its median (Conover, 1999, p. 357).

The *n'* observed difference scores $d_i = x_{bi} - x_{ai}$ are computed and any $d_i = 0$ are discarded leading to the final sample size of *n* $d_i$. The absolute values of the *
n* $d_i$ are ranked resulting in *n* rank scores $r_i$. All $r_i$ belonging to positive $d_i$ are summed up. Let $\psi_i$ denote an indicator variable that takes on the value 0 for
every $d_i < 0$ and the value 1 for every $d_i > 0$, then the test statistic will be computed as:

$$T^+ = \sum_{i = 1}^n{r_i*\psi_i} \quad \quad Eq.(DGH4.2)$$

The p value is computed based on this test statistic as follows:

$$p =2 * \begin{cases} F_{T^+}(T^+), \quad \quad \quad \quad \quad \space \space if \quad T^+ < \frac{n(n+1)}{2}\\ 1 - F_{T^+}(T^+ - 1), \quad \quad if \quad T^+ > \frac{n(n+1)}{2}
\end{cases} \quad \quad Eq.(DGH4.3)$$

with $F_{T^+}$ being the cumulative distribution function of the Wilcoxon signed-rank statistic under the null hypothesis.

If the sample size *n* exceeds 50 observations, or if any two difference scores are identical $d_i = d_j, \ for \ i \neq j$ so that these difference scores have to be assigned the
same averaged rank $r = \frac{\sum_{j = 1}^k{d_j}}{k}$, and/or if any $d_i = 0$ a p value is determined based on the large samples approximation of the distribution of $T^+$. The
distribution of $T^+$ is asymptotically normal with

$$E[T^+] = \frac{n*(n + 1)}{4} \quad \quad Eq.(DGH4.4)$$

and

$$Var[T^+] = \frac{n(n+1)(2n+1) - \frac{1}{2}\sum_{j = 1}^g{(t_j^3 - t_j})}{24} \quad \quad Eq.(DGH4.5)$$

under the null hypothesis. *g* denotes the number of tied groups and $t_j$ the size of the the tied group - untied values of $|d_i|$ are considered a tied group of size 1. A
continuity corrected z-score is computed:

$$z = \frac{T^+ - E[T^+] - c}{\sqrt{Var[T^+]}} \quad \quad Eq.(DGH4.6)$$

with $c = sign(T^+ - E[T^+]) * 0.5$

A p-value can be obtained with the cumulative distribution function of the standard normal distribution. The p-value is simply twice the smaller of the two one tailed p-values:

$$p = 2 * min\{\Phi(z), 1 - \Phi(z)\} \quad \quad Eq.(DGH4.7)$$

Large values of $T^+$ imply that a large proportion of the difference scores are positive and of larger absolute value, i.e., that the second measurement tends to yield larger
values than the first measurement. Small values of $T^+$ imply that a large proportion of the difference scores are negative and of larger absolute value, i.e., that the second
measurement tends to yield smaller values than the first measurement. For more details on the computation and interpretation of Wilcoxon signed-rank statistics see (Conover, 1999;
Hollander et al., 2014).

# Effect Sizes 

## Probability of Superiority

For dependent groups, when there are no ties, the probability of superiority (PS) can be defined as (Grissom & Kim, 2012)
$$ PS_{dep} = Pr(Y_{ib} > Y_{ia})$$ where

- $Y_{ib}$ is the score of an individual under condition b
- $Y_{ia}$ is the score of that same (or related or matched) individual under condition a.

The PS for dependent groups can then be defined as the probability that within a randomly sampled pair of dependent scores, the score of condition b will be grater than the score
of condition a. 
To estimate $PS_{dep}$ each person's score under condition a with the same person's score under condition b has to be compared. The estimate of $PS_{dep}$ is the
proportion of all such within-participant comparisons in which a participant's score under condition b is greater than that participant's score under condition a. Two PS scores are calculated one considers ties and the other one ignores it (
Grissom & Kim, 2012):
$$ \hat{p}_{dep} = \frac{I_{x_{post} > x_{pre}}(x_{i_{post}})}{n} $$

with
$$I_{x_{post} > x_{pre}}(x_{post}) = \begin{cases}
0 & \text{if} \qquad x_{post} \lt x_{pre} \\
1 & \text{if} \qquad x_{post} \gt x_{pre}
\end{cases}
$$

The exact 1 - $\alpha$ confidence interval is calculated with Pratt's method, adapted to PS for dependent groups by Wilcox(2011).
Assuming that we observe w successes among n trials, to determine the upper limit UL of the confidence interval we compute 
$$ A = (\frac{w + 1}{n - w})^2 $$
$$ B = 81(w+1)(n-2)-9n-8 $$
$$ C = -3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9(w+1)(n-w)(9n+5- \Phi^{-1}(1 - \frac{\alpha}{2}) ^2)+n+1} $$
$$ D = 81(w+1)^2 -9(w+1)(2+ \Phi^{-1}(1 - \frac{\alpha}{2})^2)+1 $$
$$ E = 1+A(\frac{B+C}{D}) $$
in which case 
$$ UL = \frac{1}{E} $$
To get the lower end LL of the confidence interval we compute
$$ A = (\frac{w}{n-w-1})^2 $$
$$ B = 81(w)(n-w-1) -9n -8 $$
$$ C = 3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9w(n-2-1)(9n+5-\Phi^{-1}(1 - \frac{\alpha}{2}) ^2) + n + 1} $$
$$ D = 81w^2 - 9w(2+ \Phi^{-1}(1 - \frac{\alpha}{2}) ^2) + 1 $$
$$ E = 1 + A(\frac{B+C}{D}) $$
in which case 
$$LL = \frac{1}{E}$$

Additionally, an $1 - \alpha$ percentile bootstrap confidence interval is implemented.

## Dominance measure for dependent groups
Cliff(1993) defines the dominance measure, referred to by him as $\delta$, equivalent to the dominance measure discussed in the independent section:
$$ DM = Pr(Y_a > Y_b) - Pr(Y_b - Y_a) $$
$DM$ is calculated by adding the within-subject difference ($DM_w$), and the average between-subject dominance ($DM_b$) for dependent data. $DM_w$ is the probability that individuals change in a given direction whereas $DM_b$ is the proportion of scores on the second occasion that are higher than scores by other individuals on the first. Therefore, the dominance measure for dependent groups can be calculated as follows: 
$$  \hat{DM} = $\hat{DM_w}$ + $\hat{DM_b}$$ 
with $\hat{DM_w}$ being
$$ \hat{DM_w} = \sum{\frac{d_{ii}}{n}} $$

with $d_{ii}$ being
$$d_{ii} = sign(x_i - x_j)$$

and $\hat{DM_b}$ being 
$$\hat{DM_b} = \frac{\sum{\sum}_{i \ne j}d_{ij}}{n(n-1)}$$

$\hat{DM_w}$ which is the proportion of subjects who change in one direction, minus the proportion who do the opposite as well as $\hat{DM_b}$, which is the proportion of scores on the second occasion that are higher than scores by other individuals on the first minus the reverse can also be interpreted as effect sizes of their own. 

The lower limit of the exact 1 - $\alpha$ confidence interval can be calculated as follows 
$$UL =  \hat{DM} + z_{a/2}(\frac{var(DM_b + DM_w)}{\sqrt{n}})$$
and the upper limit  as 
$$LL =  \hat{DM} - z_{a/2}(\frac{var(DM_b + DM_w)}{\sqrt{n}})$$

with $var(DM_b + DM_w)$ being
$$ var(DM_b + DM_w) = s_{DM_w}^2 + s_{DM_b}^2 + 2 cov(DM_b, DM_w) $$

with 
$$ cov(DM_b, DM_w) = \frac{\sum_i[(\sum_i d_{ij} + \sum_j d_{ji})d_{ii}]-2n(n-1)DM_b DM_w}{n(n-1)(n-2} $$

with 
$$s_{DM_w}^2 = \frac{\sum(DM_{ii}-DM_w)^2}{n-1}$$
and with 
$$s_{DM_b}^2 = \frac{(n-1)^2(\sum  d_{i.}^{*2} + d_{i.}^{*2} + 2\sum d_{i.}^{*}d_{i.}^{*}) - \sum\sum d_{ij}^{*} d_{ij}^{*} }{n(n-1)(n-2)(n-3)}$$
with 
$$ d_{i.}^{*} = d_i - DM_b $$

with $d_{i.}$ being the proportion of pretest scores being higher than i's posttest score

Additionally, a $1 - \alpha$ percentile bootstrap confidence interval is implemented.


## Nonparametric Coefficient of Overlapping for dependent groups
The coefficient of overlapping (OVL) is defined as the common area under two probability densities and is used as a measure of agreement of two income distributions. When X and Y denote two univariate random variables with corresponding absolutely continuous distribution functions F and G and densities f and g, the coefficient of overlapping is definded as (Weitzman, 1970):
$$ OVL (X, Y) = \int_{-\infty}^\infty min\{f(x), g(x)\}dx$$
$OVL (X, Y)$ = 1 if and only if the distributions of X and Y are equal and OVL(X, Y) = 0 if and only if the supports of the distributions of X and Y have no interior points in common which is the reason why $OVL (X, Y)$ can be interpreted as a measure of agreement of the two distributions.
Nonparametric estimations can be obtained by replacing the densities by appropriate kernel density estimators and the integrals by an appropriate quadrature formula or the sample mean.
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Coefficient of Overlapping Two for dependent groups
The overlapping coefficient two ($OVL_2$) is the proportion of overlap relative to the joint distribution(DelGiudice, 2019). When X and Y denote two univariate random variables with corresponding absolutely continuous distribution functions F and G and densities f and g, the coefficient of overlapping two is estimated with the following formula:
$$ OVL_2 (X, Y) = \frac{OVL(X, Y)}{\int_{-\infty}^\infty max\{f(x), g(x)\}}dx$$
with OVL being calculated as described above, therefore not relying on assumptions about the data.
Grice and Barret(2014) argue that OVL is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. OVL, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.    
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Cohen's U1
$U_1$ can be interpreted as a percentage of nonoverlap (DelGuidice, 2019). It is the amount of combined area not shared by the two populations (Cohen, 1988).
A nonparametric version of $U_1$ was implemented making use of the relation between $U_1$ and $OVL_2$. Since $OVL_2$ is a measure of the percentage of overlap of the combined area of the two distributions and $U_1$ is a measure of the percentage of nonoverlap of the same area, $U_1$ can be expressed as a function of $OVL_2$:
$$ U_1 = 1 - OVL_2$$
with $OVL_2$ being calculated as described above, therefore not relying on assumptions about the data.
Grice and Barret(2014) argue that OVL is to be preferred over $U_1$ in most contexts, because $U_1$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. OVL, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.    
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

## Nonparametric Cohen's U3
When examining two populations, Cohen's measure of nonoverlap $U_3$ is the percentage of one population which the upper half of the cases of the other population exceeds (Cohen, 1988). A nonparametric pendant of Cohen's $U_3$ was implemented by calculating the median of the dataset of pretest measurements and determining the percentage of values in posttest measurements that exceed the median of pretest measurements: 
$$U_3 = \frac{\sum_{i=1}^n I_{x > median_{pre}}(x_{i_{post}})}{n}$$
with 
$$I_{x > median_{pre}}(x) = \begin{cases}
1 & \text{if} \qquad x \leq median_{pre} \\
0 & \text{if} \qquad x \gt median_{pre}
\end{cases}
$$
and $median_{pre}$ being the median of the prestest group.
We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.
  
  
  
<h2 id="DG_NP_SMD> Standardized Median differences </h2>

A Standardized Median difference can also provide valuable insights into differences between two dependent groups (e.g., pretreatment measurements and posttreatment measurements) and is calculated as follows (Grissom & Kim, 2012): 

$$\hat\delta =  \frac{Mdn_a - Mdn_b}{S_{a|b}}$$

with $Mdn_a$ being the Median of group a, $Mdn_b$ being the median of group b and $S_{a|b}$ being the standardiser, which is some measure of variability of the baseline/control group (e.g., the median absolute deviation of pretreatment measurements).  
Considering group b as measurements taken prior to a treatment and group a as measurements taken after said treatment, then the numerator of the above formula simply gives the difference of posttreatment and pretreatment medians, that is: $Mdn_a - Mdn_b = Mdn_{post} - Mdn_{pre}$.  

For neither of the three standardised median differences described below were we able to identify a closed form formula for the confidence intervals associated with them. Thus, $1 - \alpha$ percentile bootstrap confidence intervals are implemented for these estimators exclusively.
  
<br>

  
<h3 id="DG_NP_MAD"> Standardised by the \( MAD \) </h3>  

The difference in Medians can be standardized by the Median Absolute Deviation (MAD) of the baseline/control group (e.g., the pretreatment measurements). 
Then the median difference is calculated with the following formula(Grissom & Kim, 2012):

$$\hat\delta =  \frac{Mdn_a - Mdn_b}{MAD_{a|b}}$$

with MAD being: 

$$MAD = median(|X_i - median(X_i)|)$$

The MAD is more robust to outliers than the standard deviation and has a lower sampling variance.  
  
<br>

  
<h3 id="DG_NP_RIQ"> Standardised by \(.75 \cdot R_{IQ}\) </h3>  

The difference in medians can also be standardized by $.75 \cdot R_{IQ}$ (Grissom & Kim, 2012):

$$\hat\delta = \frac{Mdn_a - Mdn_b}{.75R_{IQ{a|b}}}$$

which is more outlier resistant than the standard deviation and at the same time approximates the standard devation - under normality - very well(Grissom & Kim, 2005).  
  
<br>

  
<h3 id="DG_NP_bw"> Standardised by the Biweight Standard Deviation </h3>

Differences in medians can be standardized by the biweight standard deviation of the control or baseline group (e.g., pretreatment measurements) (Grissom & Kim, 2005):

$$\hat\delta = \frac{Mdn_a - Mdn_b}{S_{bw_{a|b}}}$$

with $s_{bw_{a|b}}$ being 

$$s_{bw_{a|b}} = \frac{\sqrt{n}\sqrt{\sum{a_i(X_i - median(X_i))^2(1-Y_{i}^{2}}}}{|\sum{a_i(1-1-Y_{i}^{2}}(1-5Y_{i}^{2})}$$

with $Y_i$ and $a_i$ being
$$ Y_i = \frac{X_i-median(X_i)}{9MAD}$$
$$a_i = \{_{1, \, if \, |Y_i| < 1}^{0, \, if \, |Y_i| \geq{1}}$$
  
<br>

<br>


  
<h2 id="DG_NP_dGb"> Nonparametric Glass \( d_{G,\,b}\)</h2>


A nonparametric version of Glass' $d_{G,\,j}$ is described by Kraemer and Andrews (1982) as well as by Hedges and Olkin (1985). Both groups of authors discussed their suggested estimators in the context of a pre- posttest design as it will be done here as well, with group b denoting pretest measurements and group a denoting posttest measurements. However keep in mind, that the same arguments apply to other types of dependent groups: 

$$ \hat{\delta}_b = \Phi^{-1}(\hat{p}_b)$$

where $\hat{p}_b$ is given by

$$ \hat{p}_b = \frac{x_b < median(x_a)}{n} $$

Thus, $p_{b}$ is the proportion of group b (e.g., pretest measurements) that are lower than the median of the group a (e.g., posttest measurements). Consequently, $\hat{\delta}_{b}$ is the $\hat{p}_b$-quantile of the standard normal distribution.  

The reason $\hat{\delta}_b$ can be considered a nonparametric version of Glass' $d_{G,\,b}$ is owed to the fact that when populations b and a (e.g., pre- and posttest scores) are normally distributed, then $\hat{\delta}_b$ is an estimator of the population effect size given by $\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b}$ (see the dependent groups parametric documentation page entry on Glass' $d_{G,\,j}$ for further details on this population effect).  

Hedges and Olkin (1985) suggested this adaption of Kraemer's and Andrews' (1982) estimator $D$ and called it $\hat{\delta}_1$. The latter estimaot has been implemented here. The main difference between $\hat{\delta}_1$ and $D$ is their respective computation of the posttest median. While $\hat{\delta}_1$ computes the median of all posttest scores, $D$ computes the median of the posttest scores of individuals with a pretest score falling in a critical range. Said critical range is comprised of the median of pretest scores and two distinct values on either side of the median, i.e., the observed order statistics immediately preceding and following the median (Kraemer & Andrews, 1982). For further details, the reader is advised to consult Kraemer and Andrews (1982) as well as Hedges and Olkin (1985). 

As stated above Hedges and Olkin (1985) denoted this estimator as $\hat{\delta}_1$. The subscript has been changed from $1$ to $b$ in order to match the used subscript with those used for other effect sizes in this documentation.  

When *n* is small $\hat{p}_b$ might be equal to 0 or 1. To avoid consequently extreme effect sizes  $\hat{p}_b$ is set to $\frac{1}{n+1}$  or  $\frac{n}{n+1}$ respectively in such cases.  

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>
  
  
  
<h2 id="DG_NP_dGa"> Nonparametric Glass \( d_{G,\,a}\)</h2>
  
A nonparametric version of Glass' $d_{G,\,a}$ is described by Hedges and Olkin (1985):  

$$ \hat{\delta}_a = \Phi^{-1}(\hat{p}_a)$$

where $\hat{p}_a$ is given by

$$ \hat{p}_a = \frac{x_a > median(x_b)}{n} $$

Thus, $p_{b}$ is the proportion of group a (e.g., posttest measurements) that are larger than the median of the group b (e.g., pretreatment measurements). Consequently, $\hat{\delta}_{a}$ is the $\hat{p}_a$-quantile of the standard normal distribution.  

The reason $\hat{\delta}_a$ can be considered a nonparametric version of Glass' $d_{G,\,a}$ is owed to the fact that when populations b and a (e.g., pre- and posttest scores) are normally distributed, then $\hat{\delta}_a$ is an estimator of the population effect size given by $\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a}$ (see the dependent groups parametric documentation page entry on Glass' $d_{G,\,j}$ for further details on this population effect).  

It should be noted that Hedges and Olkin (1985) denoted this estimator as $\hat{\delta}_2$. The subscript has been changed from $2$ to $a$ in order to match the used subscript with those used for other effect sizes in this documentation.  

When *n* is small $\hat{p}_a$ might be equal to 0 or 1. To avoid consequently extreme effect sizes  $\hat{p}_a$ is set to $\frac{1}{n + 1}$  or  $\frac{n}{n + 1}$ respectively in such cases.  

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.  

<br>




<h2 id="DG_NP_dz"> Nonparametric Cohen's \(d_z\) </h2> 

A nonparametric verison of Cohen's $d_z$ is described by Hedges and Olkin (1985): 

$$\hat{\delta}_z = \phi^{-1}(\hat{p}_{gain})$$

where $p_{gain}$ is given by:  

$$p_{gain} = \frac{x_a > x_b}{n}$$

Thus  $p_{gain}$ is the proportion of individuals whose scores increase from pretest (group b) to posttest (group a), i.e., the proportion of change scores (also called difference scores) $x_a - x_b$ that are positive.
If ties between pre-and posttest scores are present ($x_a = x_b$), each tie is counted as half an observation in each direction.
Consequently, $\hat{\delta}_Z$ is the $\hat{p}_{gain}$-quantile of the standard normal distribution.  

The reason $\hat{\delta}_z$ can be considered a nonparametric version of Cohen's $d_z$ is owed to the fact that when populations change scores are normally distributed, then $\hat{\delta}_z$ is an estimator of the same population effect estimated by Cohen's $d_z$ given by $\Delta_D = \frac{\mu_a - \mu_b}{\sigma_D}$ (see the dependent groups parametric documentation page entry on Cohen's $d_z$ for further details on this population effect).  

It should be noted that Hedges and Olkin (1985) denoted this estimator as $\hat{\delta}_3$. The subscript has been changed from $3$ to $z$ in order to match the subscript used for this estimator with the subscript used for Cohen's corresponding estimator $d_z$.  

When n is small $\hat{p}_{gain}$ it might be equal to 0 or 1. To avoid extreme effect sizes, if $\hat{p}_{gain}$ is equal to 0 or 1, it is set to $\frac{1}{n + 1}$  or  $\frac{n}{n + 1}$ respectively.  

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.
  
  
<br>

<br>

<hr></hr>

<h1 id="DG_NP_refs"> References </h1>

Conover, W. J. (1999). *Practival nonparametric statistics* (3rd ed.). John Wiley & Sons. Cousineau, D. (2020). Approximating the distribution of Cohen's $d_p$ in within--subject
designs. *The Quantitative Methods for Psychology*, *16*(4), 418--421. <https://doi.org/10.20982/tqmp.16.4.p418>  

Del Giudice, M. (2019). *Measuring sex differences and similarities*. Gender and sexuality development: Contemporary theory and research.  

Cliff, N. (1993). *Dominance statistics: Ordinal analyses to answer ordinal questions.* Psychological bulletin, 114(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>  

Grice, J. W., & Barrett, P. T. (2014). *A note on Cohen's overlapping proportions of normal distributions*. Psychological Reports, 115(3), 741-747.  

Hedges, L. V., & Olkin, I. (1985). *Statistical methods for meta-analysis*. Academic press.  

Hollander, M., Wolfe, D. A., & Chicken E. (2014). *Nonparametric statistical methods* (3rd ed.). John Wiley & Sons  

Kraemer, H. C., & Andrews, G. (1982). A nonparametric technique for meta-analysis effect size calculation. *Psychological Bulletin*, *91*, (2), 404--412. <https://psycnet.apa.org/doi/10.1037/0033-2909.91.2.404>  

Steiger, J.H, & Fouladi, R.T. (1997). Noncentrality interval
estimation and the evaluation of statistical methods. In L.L. Harlow, S.A, Mulaik, & J.H. Steiger (Eds.), *What if There Were no Significance Tests?* (pp. 221--257). Mahwah:
Lawrence Erlbaum Associates.  

Wilcox, R. R. (2011). *Introduction to robust estimation and hypothesis testing.* Academic press.  
