<div class="toc_container">
<h2 class="toc_title">Table of contents</h2>
 <ul>
  <li><a href="#IG_P_intro"><h3>1. The independent groups design</h3></a>
  <li><a href="#"><h3>2. </h3></a>
    <ul>
      <li><a href="#"><h4>2.1. </h4></a></li>
      <li><a href="#"><h4>2.2. </h4></a></li>
    </ul>
  </li>
  <li><a href="#"><h3>3. </h3></a>
    <ul>
     <li><a href="#"><h4>3.1. </h4></a></li>
     <li><a href="#"><h4>3.2. </h4></a></li>
     <li><a href="#"><h4>3.4. </h4></a></li>
     <li><a href="#"><h4>3.3. </h4></a></li>
     <li><a href="#"><h4>3.5. </h4></a></li>
     <li><a href="#"><h4>3.6. </h4></a></li>
    </ul>
  </li>
  <li><a href="#IG-D-NP-refs"><h3>. References</h3></a></li>
 </ul>
</div>

<h2 id = "DG_NP_SLD"> Nonparametric estimators of measures of standardised location difference </h2>
<h3 id = "DG_NP_dG"> Nonparametric Glass \( d_{G,\,j}\) </h3>
<h3 id = "DG_NP_dz"> Nonparametric Cohen's \(d_z\) </h3>

<h2 id = "DG_NP_tails"> Nonparametric estimators of measures of difference in group tails </h2>
<h3 id = "DG_NP_TR"> Nonparametric Tail Ratio (\(TR\)) </h3> # muss noch von mir aus der parametric documentation rüberkopiert werden!

<h2 id = "DG_NP_OM"> Nonparametric estimators of measures of (non-)overlap </h2>
<h3 id = "DG_NP_OVL"> The Nonparametric Coefficient of Overlapping (\(OVL\)) </h3>
<h3 id = "DG_NP_OVL2"> The Nonparametric Measure of Overlapping Coefficient Two (\(OVL_2\)) </h3>
<h3 id = "DG_NP_U1"> Nonparametric Cohen's (\(U_1\)) </h3>
<h3 id = "DG_NP_U2"> Nonparametric Cohen's (\(U_2\)) </h3>
<h3 id = "DG_NP_U3"> Nonparametric Cohen's (\(U_3\)) </h3>

<h2 id = "DG_NP_PM"> Nonparametric estimators of probabilistic measures of effect </h2>
<h3 id = "DG_NP_PS"> Probability of Superiority (\(PS\)) </h3>
<h3 id = "DG_NP_A_measure"> The \(A\) measure of stochastic Superiority </h3>
<h3 id = "DG_NP_GOR"> Generalized Odds Ratio (\(OR_g\)) </h3>
<h3 id = "DG_NP_DM"> Dominance measure (\(DM\))</h3>

<h2 id = "DG_NP_HT"> Hypothesis tests </h2>

<h3 id = "DG_P_WSRT"> The Wilcoxon signed-rank test </h3>

The nonparametric Wilcoxon signed-rank test tests the following null hypothesis (Hollander et al., 2014, p. 40)

$$H_0: \theta = 0 \quad \quad Eq.(DGH4.1)$$

namely that the distribution of each sampled difference score $D_i = X_{bi} - X_{ai}$ is symmetric around zero . The major underlying assumption is that the distribution of every
$D_i$ is symmetric around its median (Conover, 1999, p. 357).

The *n'* observed difference scores $d_i = x_{bi} - x_{ai}$ are computed and any $d_i = 0$ are discarded leading to the final sample size of *n* $d_i$. The absolute values of the *n* $d_i$ are ranked resulting in *n* rank scores $r_i$. All $r_i$ belonging to positive $d_i$ are summed up. Let $\psi_i$ denote an indicator variable that takes on the value 0 for
every $d_i < 0$ and the value 1 for every $d_i > 0$, then the test statistic will be computed as:

$$T^+ = \sum_{i = 1}^n{r_i*\psi_i} \quad \quad Eq.(DGH4.2)$$

The p value is computed based on this test statistic as follows:

$$p = 2 * \begin{cases} 
  F_{T^+}(T^+) & \text{if} \qquad T^+ < \frac{n(n+1)}{2}\\ 
  1 - F_{T^+}(T^+ - 1) & \text{if} \qquad T^+ > \frac{n(n+1)}{2}
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

<h2 id = "DP_NP_ES"> Effect Sizes </h2>

<h3 id = "DP_NP_PS"> Probability of Superiority (<i>PS</i>) </h3>

The population effect of interest is given by (Grissom & Kim, 2005):

$$ PS_{dep} = \mathbb{P}(X_{ia} > X_{ib})$$ where

- $X_{ia}$ is the score of an individual under condition *a*
- $X_{ib}$ is the score of that same (or related or matched) individual under condition *b*.

Thus, the *PS* for dependent groups can then be defined as the probability that within a randomly sampled pair of dependent scores (e.g., pre- and posttest measurements), the score under condition *a* (e.g., posttest) will be grater than the score under condition *b* (e.g., pretest). This results in a distinct definition of the *PS* ES measure for dependent groups compared to the one defined for independent groups (see the documentation tab of the page on nonparametric ES for the independent groups design). At the same time, the above population effect is identical to the one estimated by the parametric Common Language (*CL*) ES statistic (see the documentation tab of the page on parametric ES for the dependent groups design).  

A nonparametric estimator of this population effect is given by (Grissom & Kim, 2005):

$$ \hat{p}_{a>b} = \frac{\sum_{i = 1}^{n}I_{\{x_{ia} > x_{ib}\}}(x_i)}{n - n_{ties}} $$

with
$$I_{\{x_{ia} > x_{ib}\}}(x_i) = \begin{cases} 
  0 & \text{if} \qquad x_{ia} \lt x_{ib} | x_{ia} = x_{ib}\\ 
  1 & \text{if} \qquad x_{ia} \gt x_{ib}
\end{cases}$$

with $\sum_{i = 1}^{n}I_{\{x_{ia} > x_{ib}\}}(x_i)$ being the sum of pairs of dependent observations in which a person's score under condition *a* is higher than the same person's score under condition *b* (with ties being ignored, i.e., each given a value/weight of 0). This sum is divided by $n - n_{ties}$, i.e., the number of pairs of dependent observations (with ties being ignored, i.e., subtracted from the total sample size). Thus, this estimate is the proportion of all such within-participant comparisons in which a participant's score under condition *a* is greater than that participant's score under condition *b* (with ties being ignored). A related ES, not ignoring ties is described below (the *A* measure of stochastic superiority). Grissom and Kim (2012) recommend "that researchers provide both results, so that their results can be compared, or meta-analyzed" (p.115).  

For the independent groups design, the means of the sampling distributions of the *PS* and the *CL*  statistics are typically very similar when $\mu_1 = \mu_2$ and the correlation between the two sets of estimates was found to be well over .9 in Monte-Carlo simulations (Grissom & Kim, 2001).  
However, as the difference between $\mu_1$ and $\mu_2$ increases, this correlation sometimes decreases to a value as low as approximately .2, and  the *CL* statistic tended to show more sampling error than the *PS* statistic as the difference increased.  
This effect ought to be studied for the dependent *CL* and *PS* ES statistics as well. However, like for the independent groups design, it could be advisable for researchers estimating $\mathbb{P}(X_{ia} > X_{ib})$ to report *PS* alongside, if not instead of, the *CL* ES, even when assuming normality.  

An approximate $1 - \alpha$ confidence interval is calculated with Pratt's method, adapted to *PS* for dependent groups by Wilcox (2011).  
Assuming that we observe *w* successes ($x_{ia} > x_{ib}$)---with ties discarded (i.e., given a value/weight of 0)---among $\tilde{n} = n - n_{ties}$ trials, to determine the upper limit *UL* of the confidence interval we compute:  

$$ A = (\frac{w + 1}{\tilde{n} - w})^2 $$
$$ B = 81(w + 1)(\tilde{n} - 2) - 9\tilde{n} - 8 $$
$$ C = -3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9(w + 1)(\tilde{n} - w)(9\tilde{n} + 5- \Phi^{-1}(1 - \frac{\alpha}{2})^2) + \tilde{n} + 1} $$
$$ D = 81(w + 1)^2 - 9(w + 1)(2 + \Phi^{-1}(1 - \frac{\alpha}{2})^2) + 1 $$
$$ E = 1 + A(\frac{B + C}{D}) $$
in which case 
$$ UL = \frac{1}{E} $$
To get the lower limit *LL* of the confidence interval we compute:  
$$ A = (\frac{w}{\tilde{n} - w - 1})^2 $$
$$ B = 81(w)(\tilde{n} - w - 1) - 9\tilde{n} - 8 $$
$$ C = 3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9w(\tilde{n} - 2 - 1)(9\tilde{n} + 5-\Phi^{-1}(1 - \frac{\alpha}{2})^2) + \tilde{n} + 1} $$
$$ D = 81w^2 - 9w(2 + \Phi^{-1}(1 - \frac{\alpha}{2})^2) + 1 $$
$$ E = 1 + A(\frac{B + C}{D}) $$
in which case 
$$LL = \frac{1}{E}$$

Additionally, an $1 - \alpha$ percentile bootstrap confidence interval is implemented.  

<br>

<h3 id = "DG_NP_A_measure"> The <i>A</i> measure of stochastic Superiority </h3>

The population effect of interest is given by:

$$ A_{a|b} = \mathbb{P}(X_{ia|b} > X_{ib|a}) + .5  \mathbb{P}(X_{ia} = X_{ib}) $$

yielding two distinct population effects:

$$ A_{a} = \mathbb{P}(X_{ia} > X_{ib}) + .5  \mathbb{P}(X_{ia} = X_{ib}) $$

$$ A_{a|b} = \mathbb{P}(X_{ia} > X_{ib}) + .5  \mathbb{P}(X_{ia} = X_{ib}) $$

these are, the probability that within a a randomly sampled pair of dependent observations $(X_{ia}, X_{ib})$, the score under condition *a*, $X_{ia}$ will be greater than or equal to an the score under condition *b* $X_{ib}b$ and vice versa (Vargha & Delaney, 2000). This quantity is identical to the population effect estimated by the parametric dependent *CL* ES statistic and the nonparametric dependent *PS* statistic for continuous measures where ties are not possible. However, the above definition is also applicable to any measure at least ordinally scaled, where ties are quasi unavoidable and have to be explicitly accounted for. For a thorough discussion of the subtle yet important differences between these ES definitions as well as the relations between Cliff's $\delta$, the *CL* ES and $A_{a|b}$ consult Vargha and Delaney (2000).  

It should also be noted that for dependent groups, the definition of the *A* measure of stochastic superiority is distinct from its counterpart defined for independent groups (see the documentation tab of the page on nonparametric ES for the independent groups design).  

If the dependent variable of interest is continuous and ties are not possible, then, much like with the dependent *PS* and the *CL* ES definition, a value of $A_a$ > 0.5 indicates that for a pair of dependent measurements the measurement under condition *a* is "stochastically"/"probabilistically" greater than the measurement under condition *b*. However, whenever ties are possible both $A_a$ and $A_b$ have to be inspected in order to determine which measurement is "stochastically"/"probabilistically" superior. Consider a case where $\mathbb{P}(X_{ia} > X_{ib})$ = 0.1, $\mathbb{P}(X_{ib} > X_{ia})$ = 0.3 and $\mathbb{P}(X_{ia}  = X_{ib})$ = 0.6. In this case $A_a = \mathbb{P}(X_{ia}  > X_{ib}) + .5 \mathbb{P}(X_{ia}  = X_{ib})$ = 0.7 > 0.5. However, $A_b = \mathbb{P}(X_{ia}  > X_{ib}) + .5 \mathbb{P}(X_{ia}  = X_{ib})$ = 0.9 > 0.7 = $A_a$. Thus, for a pair of dependent measurements, the measurement under condition *b* is "stochastically"" superior even though $A_a$ > 0.5. Therefore, whenever the user selects this effect size, both population effects are estimated.  

Nonparametric estimators of these population effects are given by (Vargha & Delaney, 2000):  

$$ \hat{A}_{a} = \frac{\sum_{i = 1}^{n}I_{\{x_{ia} \geq x_{ib}\}}(x_i)}{n} $$

with
$$I_{\{x_{ia} \geq x_{ib}\}}(x_i) = \begin{cases}
  0 & \text{if} \qquad x_{ia} \lt x_{ib}\\
  0.5 & \text{if} \qquad x_{ia} = x_{ib}\\
  1 & \text{if} \qquad x_{ia} \gt x_{ib}
\end{cases}
$$

and 

$$ \hat{A}_{b} = \frac{\sum_{i = 1}^{n}I_{\{x_{ib} \geq x_{ia}\}}(x_i)}{n} $$

with
$$I_{\{x_{ib} \geq x_{ia}\}}(x_i) = \begin{cases}
  0 & \text{if} \qquad x_{ib} \lt x_{ia}\\
  0.5 & \text{if} \qquad x_{ia} = x_{ib}\\
  1 & \text{if} \qquad x_{ib} \gt x_{ia}
\end{cases}
$$

with $\sum_{i = 1}^{n}I_{\{x_{ia|b} \geq x_{ib|a}\}}(x_i)$ being the sum of pairs of dependent observations in which a person's score under condition *a*/*b* is higher than or equal to the same person's score under condition *b*/*a* (with ties given a value/weight of 0.5). This sum is divided by the number of pairs of dependent observations (*n*). Thus, the estimate is the proportion of all such within-participant comparisons in which a participant's score under condition *a*/*b* is greater than or equal to that participant's score under condition *b*/*a*.  
If this effect size is chosen by the user, both estimators are provided denoted as $\hat{A}_1$---estimating the superioirty  of the measurement under the second condition (e.g., posttest) over the measurement under the first condition (e.g., pretest) (= $\hat{A}_a$ in the notation above)---and $\hat{A}_2$---estimating the superioirty  of the measurement under the second condition over the measurement under the first condition(= $\hat{A}_b$ in the notation above).

The approximate $1 - \alpha$ confidence interval is calculated with Pratt's method, adapted to the *PS* for dependent groups by Wilcox(2011).  
Assuming that we observe *w* successes ($x_{ia} \geq x_{ib}$/$x_{ib} \geq x_{ia}$)---with ties given a value/weight of 0.5---among *n* trials, to determine the upper limit *UL* of the confidence interval we compute:  
$$ A = (\frac{w + 1}{n - w})^2 $$
$$ B = 81(w+1)(n-2)-9n-8 $$
$$ C = -3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9(w+1)(n-w)(9n+5- \Phi^{-1}(1 - \frac{\alpha}{2}) ^2)+n+1} $$
$$ D = 81(w+1)^2 -9(w+1)(2+ \Phi^{-1}(1 - \frac{\alpha}{2})^2)+1 $$
$$ E = 1+A(\frac{B+C}{D}) $$
in which case
$$ UL = \frac{1}{E} $$
To get the lower limit *LL* of the confidence interval we compute
$$ A = (\frac{w}{n-w-1})^2 $$
$$ B = 81(w)(n-w-1) -9n -8 $$
$$ C = 3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9w(n-2-1)(9n+5-\Phi^{-1}(1 - \frac{\alpha}{2}) ^2) + n + 1} $$
$$ D = 81w^2 - 9w(2+ \Phi^{-1}(1 - \frac{\alpha}{2}) ^2) + 1 $$
$$ E = 1 + A(\frac{B+C}{D}) $$
in which case
$$LL = \frac{1}{E}$$

Additionally, an $1 - \alpha$ percentile bootstrap confidence interval is implemented.

<br>

<h3 id = "DG_NP_GOR"> Generalized Odds Ratio (<i>OR</i><sub>g</sub>) </h3>

the population effect of interest is given by:

$$ OR_{gpop} = \frac{\mathbb{P}(X_{ia} > X_{ib})}{\mathbb{P}(X_{ib} > X_{ia})} $$

- $X_{ia}$ is the score of an individual under condition *a*
- $X_{ib}$ is the score of that same (or related or matched) individual under condition *b*.

The $OR_{gpop}$---also known as Agresti's alpha---measures the odds that within a randomly sampled pair of dependent scores (e.g., pre- and posttest measurements), the score under condition *a* (e.g., posttest) is superior to the score under condition *b* (e.g., pretest).

A nonparametric estimator that does not make assumptions about the shape of the two population distributions given by (Grissom & Kim, 2012):

$$ OR_g = \frac{\hat{p}_{a>b}}{\hat{p}_{b>a}}$$

Thus, the generalized odds ratio ($OR_g$) is the probability of superiority of condition *a* compared to condition *b* divided by the probability of superiority of condition *b* compared to condition *a*.  When there are no ties present/when ties are ignored, the above estimator can be rewritten as:

$$OR_g = \frac{\hat{p}_{a>b}}{1 - \hat{p}_{a>b}}$$

and can be considered a function of the Probability of Superiority ES measure $\hat{p}_{a>b}$ described above.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h3 id = "DG_NP_DM"> Dominance measure for dependent groups </h3>

Cliff(1993) defines the dominance measure, referred to by him as $\delta$, equivalent to the dominance measure discussed in the independent section:
$$ DM = \mathbb{P}(X_a > X_b) - \mathbb{P}(X_b - X_a) $$
$DM$ is calculated by adding the within-subject difference ($DM_w$), and the average between-subject dominance ($DM_b$) for dependent data. $DM_w$ is the probability that individuals change in a given direction whereas $DM_b$ is the proportion of scores on the second occasion that are higher than scores by other individuals on the first. Therefore, the dominance measure for dependent groups can be calculated as follows: 
$$  \hat{DM} = \hat{DM_w} + \hat{DM_b}$$ 
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

with $d_{i.}$ being the proportion of pretest scores being higher than i's posttest score.  

Additionally, a $1 - \alpha$ percentile bootstrap confidence interval is implemented.  

<br>

<h3 id = "IG_D_NP_overlap_measures"> Measures of (Non-)overlap </h3>

For the documentation of these measures the following notation will be used:  
Let $X_a$ denote the random variable 'score of a random member of measurement *a*' and $X_b$ denote the random variable 'score of a random member of measurement *b*. Further, let $F_a$ and $F_b$ denote the corresponding absolutely continuous distribution functions and $f_a$ and $f_b$ the corresponding probability density functions respectively.

<br>

<h4 id = "IG_NP_OVL"> The Nonparametric Coefficient of Overlapping (\(OVL\)) </h4>

The population effect of interest is given by (e.g., Schmid & Schmidt, 2006):

$$ OVL = \int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx $$

The coefficient of overlapping ($OVL$) is thus defined as the common area under two probability densities---i.e., the proportion of overlap between the two measurements---and can for example be used as a measure of agreement of two distributions (Bradley, 2006).

Nonparametric estimators of the above quantity can be obtained by replacing the densities by appropriate kernel density estimators and the integrals by an appropriate quadrature formula.
Assuming $x_{a_1}$, ..., $x_{a_{n_a}}$ denote observations of random variable $X_a$, a density estimator for *f* is obtained by (Schmid & Schmidt, 2006):

$$ \hat{f_{n_a}}(x) = \hat{f_{n_a}}(x|x_{a_i},\, i =1\ldots n) = \frac{1}{n_a}  \sum_{i = 1}^{n_a} \frac{1}{b} K \left( \frac{x - x_{a_i}}{b} \right)$$

where kernel *K* and bandwidth *b* are to be determined. $\hat{f}_{n_b}$ can be defined analogously. To derive estimators for the $OVL$, $x_{a_i}$ can be transformed into the unit interval by an appropriate affine transformation. The integrals over the unit interval can now be approximated by a trapezoidal rule, resulting in (Schmid & Schmidt, 2005):

$$ \hat{OVL} = \frac{1}{k} \sum_{i = 1}^k \frac{1}{2} \left( \min \left\{ \hat{f_{n_a}}  \left( \frac{i}{k} \right), \hat{f_{n_b}} \left( \frac{i}{k} \right) \right\} + \min \left\{ \hat{f_{n_a}} \left( \frac{i-1}{k} \right), \hat{f_{n_b}} \left( \frac{i-1}{k} \right) \right\} \right) $$

where *k* denotes the number of equidistant subintervals of the unit interval.

Anderson et al. (2012) describes the asymptotic properties of various nonparametric estimators of $OVL$ which could be used to construct an approximate CI procedure. A $1 - \alpha$ percentile bootstrap confidence interval is implemented here exclusively.

<br>
<h4 id = "IG_D_NP_OVL2"> The Nonparametric Measure of Overlapping Coefficient Two (\(OVL_2\)) </h4>

The population effect of interest is given by:

$$ OVL_2 = \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = \frac{OVL}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} $$

The coefficient of overlapping 2 ($OVL_2$) is the proportion of overlap relative to the joint distribution of two contrasted populations (DelGiudice, 2019), which for dependent groups is the amount of combined area shared by the two measurements.

A nonparametric estimator of the above quantity may be obtained by estimating the numerator and denominator separately and dividing the two quantities. The numerator can be estimated as described in detail above (see $\hat{OVL}$). The denominator can be estimated in a similar fashion:

$$ \hat{\theta} = \frac{1}{k} \sum_{i = 1}^k \frac{1}{2} \left( \max \left\{  \hat{f}_{n_a} \left( \frac{i}{k} \right), \hat{f}_{n_b} \left( \frac{i}{k} \right) \right\} + \max \left\{ \hat{f}_{n_a} \left( \frac{i - 1}{k} \right), \hat{f}_{n_b} \left( \frac{i - 1}{k} \right) \right\} \right) $$

giving the estimator:

$$ \hat{OVL}_2 = \frac{\hat{OVL}}{\hat{\theta}} $$

Grice and Barret(2014) argue that $OVL$ is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. $OVL$, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>
<h4 id = "IG_NP_U1"> Nonparametric Cohen's (\(U_1\)) </h4>

The population effect of interest is given by:

$$ U_1 = \frac{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx  - \int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - OVL_2 $$

Cohen's $U_1$ can be interpreted as percentage of nonoverlap relative to the joint distribution of two measurements (DelGiudice, 2019), which is the amount of combined area not shared by the two measurements (Cohen, 1988).

A nonparametric estimator of $U_1$ was implemented by making use of the relation between $U_1$ and $OVL_2$. Since $OVL_2$ is a measure of the percentage of overlap of the combined area of the two distributions and $U_1$ is a measure of the percentage of nonoverlap of the same area, $U_1$ can be expressed as a function of $OVL_2$ ($U_1 = 1 - OVL_2$) and consequently the estimator is given by:

$$ \hat{U}_1 = 1 - \hat{OVL}_2$$

with $\hat{OVL}_2$ being calculated as described above.

Any critique of $OVL_2$ discussed above is equally applicable to Cohen's $U_1$ since both ES quantify overlap/nonoverlap relative to the joint distribution of the constrasted measurements.

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h4 id = "IG_NP_U2"> Nonparametric Cohen's (\(U_2\)) </h4>

The population effect on interest is the percentage of measurement *a* that exceeds the same percentage of measurement *b*. Thus a value of 0.7 means that the top 70% of measurement *a* exceed the bottom 70% of measurement *b*.

We propose the following non-parametric estimator for the above population effect:

$$ \hat{U}_2 = \hat{F}_b(x_{a_{(t)}}) $$

for a value of *t* that satisfies
$$
t \in \{ x_{a_{(1)}}, \ldots, x_{a_{(n_a)}} \} :
\begin{cases}
1 - \hat{F}_a( x_{a_{(t)}} ) > \hat{F}_b( x_{a_{(t)}} ) \cr
1 - \hat{F}_a( x_{a_{(t - 1)}} ) < \hat{F}_b( x_{a_{(t -1)}} )
\end{cases}
$$

where $x_{a_{(1)}, \ldots, x_{a_{(n_a)}}}$ are the order statistics of the group *a* observations and $\hat{F}_{a|b}$ is the empirical distribution function of group *a*/*b* given by:

$$ \hat{F}_{a|b}(t) = \frac{1}{n_{a|b}} \sum_{i = 1}^{n_{a|b}} I_{\{x_{{a|b}_i} \leq t\}}(x_{{a|b}_i}) $$

with
$$
I_{\{x_{{a|b}_i} \leq t\}} (x_{{a|b}_i}) =
\begin{cases}
1 & \text{if } x_{{a|b}_i} \leq t \cr
0 & \text{if } x_{{a|b}_i} \gt t
\end{cases}
$$

The above estimator of $U_2$ can also be thought of as the value of $\hat{F}_b$ at the intersection point of $1 - \hat{F}_a$ and $\hat{F}_b$---which has to be determined by an iterative search algorithm since empirical distribtuion functions are always discrete.

It should be noted that if

$$ \max \{ x_{a_1}, \ldots, x_{a_{n_a}} \} < \min \{ x_{b_1}, \ldots, x_{n_{b}} \} $$

then $\hat{U}_2$ is set to 0 and conversely, if

$$ \min \{ x_{a_1}, \ldots, x_{a_{n_a}} \} > \max \{ x_{b_1}, \ldots, x_{n_{b}} \} $$

$\hat{U}_2$ is set to 1.

An $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h4 id = "IG_NP_U3"> Nonparametric Cohen's (\(U_3\)) </h4>

When examining two measurements, Cohen's measure of nonoverlap $U_3$ is the percentage of one measurements which the upper half of the cases of the other measurements exceeds (Cohen, 1988). A nonparametric pendant of Cohen's $U_3$ was implemented by calculating the median of the dataset of group a and determining the percentage of values in dataset b that exceed the median of group a.
$$ \hat{U}_3 = \frac{1}{n} \sum_{i = 1}^n I_{x > Mdn_a} \left( x_{i_b} \right)$$
with
$$ I_{x > Mdn_a}(x) = \begin{cases}
1 & \text{if } x \leq Mdn_a \cr
0 & \text{if } x \gt Mdn_a
\end{cases}
$$
and $median_{pre}$ being the median of the prestest group.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>
  
<h2 id="DG_NP_dGb"> Nonparametric Glass \( d_{G,\,j}\)</h2>


A nonparametric version of Glass' $d_{G,\,j}$ is described by Kraemer and Andrews (1982) as well as by Hedges and Olkin (1985). Both groups of authors discussed their suggested estimators in the context of a pre- posttest design as it will be done here as well, with group b denoting pretest measurements and group a denoting posttest measurements. However keep in mind, that the same arguments apply to other types of dependent groups: 

$$ \hat{\delta}_j = \Phi^{-1}(\hat{p}_j)$$

resulitng in the effects:

$$ \hat{\delta}_a = \Phi^{-1}(\hat{p}_a)$$

$$ \hat{\delta}_b = \Phi^{-1}(\hat{p}_b)$$

where $\hat{p}_a$ is given by

$$ \hat{p}_a = \frac{x_a > median(x_b)}{n} $$

and $\hat{p}_b$ is given by

$$ \hat{p}_b = \frac{x_b < median(x_a)}{n} $$

If this effect size is chosen by the user, both estimators are provided, denoted as nonparametric Glass' $d_{G, 1}$&mdash;$\hat{\delta}_b$ is computed&mdash;and nonparametric Glass' $d_{G, 2}$&mdash;$\hat{\delta}_a$ is computed.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$).

$p_{a}$ is the proportion of group *a* (e.g., posttest measurements) that are larger than the median of the group *b* (e.g., pretreatment measurements). Consequently, $\hat{\delta}_{a}$ is the $\hat{p}_a$-quantile of the standard normal distribution.  

The reason $\hat{\delta}_a$ can be considered a nonparametric version of Glass' $d_{G,\,a}$ is owed to the fact that when populations *b* and *a* (e.g., pre- and posttest scores) are normally distributed, then $\hat{\delta}_a$ is an estimator of the population effect size given by $\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a}$.

$p_{b}$ is the proportion of group *b* (e.g., pretest measurements) that are lower than the median of the group *a* (e.g., posttest measurements). Consequently, $\hat{\delta}_{b}$ is the $\hat{p}_b$-quantile of the standard normal distribution.  

The reason $\hat{\delta}_b$ can be considered a nonparametric version of Glass' $d_{G,\,b}$ is owed to the fact that when populations b and a (e.g., pre- and posttest scores) are normally distributed, then $\hat{\delta}_b$ is an estimator of the population effect size given by $\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b}$.  

Hedges and Olkin (1985) suggested this adaption of Kraemer's and Andrews' (1982) estimator $D$ and called it $\hat{\delta}_1$. The latter estimator has been implemented here. The main difference between $\hat{\delta}_1$ and $D$ is their respective computation of the posttest median. While $\hat{\delta}_1$ computes the median of all posttest scores, $D$ computes the median of theposttest scores of individuals with a pretest score falling in a critical range. Said critical range is comprised of the median of pretest scores and two distinct values on either side of the median, i.e., the observed order statistics immediately preceding and following the median (Kraemer & Andrews, 1982). For further details, the reader is advised to consult Kraemer and Andrews (1982) as well as Hedges and Olkin (1985). Kraemer and Andrews (1982) did not define an equivalent of Hedges and Olkin's (1985) estimator $\hat{\delta}_2$.  

As stated above Hedges and Olkin (1985) denoted this estimator as $\hat{\delta}_a$ and $\hat{\delta}_b$, respectively. The subscripts have been changed from $1$ to $b$ and from $2$ to $a$ in order to match the used subscript with those used for other effect sizes in this documentation.  

When *n* is small $\hat{p}_b$ might be equal to 0 or 1. To avoid consequently extreme effect sizes  $\hat{p}_b$ is set to $\frac{1}{n+1}$  or  $\frac{n}{n+1}$ respectively in such cases.  

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

<hr>

<h2 id="IG-D-NP-refs">References</h2>

Conover, W. J. (1999). *Practival nonparametric statistics* (3rd ed.). John Wiley & Sons. Cousineau, D. (2020). Approximating the distribution of Cohen's $d_p$ in within--subject
designs. *The Quantitative Methods for Psychology*, *16*(4), 418--421. <https://doi.org/10.20982/tqmp.16.4.p418>  

Del Giudice, M. (2019). *Measuring sex differences and similarities*. Gender and sexuality development: Contemporary theory and research.  

Cliff, N. (1993). *Dominance statistics: Ordinal analyses to answer ordinal questions.* Psychological bulletin, 114(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>  

Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>  

Grice, J. W., & Barrett, P. T. (2014). *A note on Cohen's overlapping proportions of normal distributions*. Psychological Reports, 115(3), 741-747.  

Hedges, L. V., & Olkin, I. (1985). *Statistical methods for meta-analysis*. Academic press.  

Hollander, M., Wolfe, D. A., & Chicken E. (2014). *Nonparametric statistical methods* (3rd ed.). John Wiley & Sons  

Kraemer, H. C., & Andrews, G. (1982). A nonparametric technique for meta-analysis effect size calculation. *Psychological Bulletin*, *91*, (2), 404--412. <https://psycnet.apa.org/doi/10.1037/0033-2909.91.2.404>  

Steiger, J.H, & Fouladi, R.T. (1997). Noncentrality interval
estimation and the evaluation of statistical methods. In L.L. Harlow, S.A, Mulaik, & J.H. Steiger (Eds.), *What if There Were no Significance Tests?* (pp. 221--257). Mahwah:
Lawrence Erlbaum Associates.  

Wilcox, R. R. (2011). *Introduction to robust estimation and hypothesis testing.* Academic press.  
