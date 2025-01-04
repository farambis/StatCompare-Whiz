<link rel="stylesheet" href="markdown_documentation_style.css">

<div class="toc_container">
<h2 class="toc_title">Table of contents</h2>
 <ul>
  <li><a href="#PPC-intro"><h3>1 The pretest-posttest-control design</h3></a>
  <li><a href="#PPC-NP-change-focused-measures"><h3>2 Change-focused measure of effect size</h3></a>
    <ul>
      <li><a href="#PPC-NP-d-PPC-Change"><h4>2.1 \(\hat{\delta}_{PPC-change}\) (nonparametric \(d_{PPC-change}\))</h4></a></li>
    </ul>
  </li>
    <li><a href="#PPC-NP-difference-focused-measures"><h3>3 Difference-focused measures of effect size</h3></a>
    <ul>
     <li><a href="#PPC-NP-d-PPC-pre"><h4>3.1 \(\hat{\delta}_{PPC,\,pre}\) (nonparametric \(d_{PPC,\,pre}\))</h4></a></li>
     <li><a href="#PPC-NP-alternate-difference-focused-estimator"><h4>3.2 An alternate nonparametric difference-focused estimator </h4></a></li>
    </ul>
  </li>
  <li><a href="#PPC-dominance-measure"><h3> 4 The pretest-posttest dominance measure </h3></a></li>
  <li><a href="#PPC-NP-refs"><h3>5 References</h3></a></li>
 </ul>
</div>

<h2 id="PPC-intro"> 1 The Pretest-posttest-control design </h2>  

The pretest-posttest-control (PPC) design, also know as the pretest-posttest control-group design or the independent groups pretest-posttest (IGPP) design amongst other synonyms entails the random/quasirandom assignment of research participants to one of two conditions(e.g., a treatment or a control condition; a novel treatment and a gold-standard treatment condition; etc.)  and the measurement of an outcome variable at two points in time (i.e., both prior to and after treatment) (Morris, 2008).  

A standardised effect size (ES) for the PPC design relates the difference of the mean changes between the two conditions (the numerator) to some measure of variability (the denominator). Different standardised ESs can be considered depending on the choice of the denominator, i.e., of the standardiser (Morris & DeShon, 2002; Morris, 2008; Feingold, 2009).  

Two major "groups" of standardised ESs for the PPC design can be characterised based on whether the mean change within each group is standardised by the variability of change scores (change-focused measures) or by the variability of raw scores (difference-focused measures) (Morris & DeShon, 2002; Feingold, 2009). A research question regarding changes in individual performance after some treatment might motivate the former definition while a research question focusing on group differences in the level of performance might motivate the latter definition (Morris & DeShon, 2002).   

<h2 id="PPC-NP-change-focused-measures"> 2 Change focused measure of effect size </h2>

<h3 id="PPC-NP-d-PPC-Change"> 2.1 \(\hat{\delta}_{PPC-change}\) (nonparametric \(d_{PPC-change}\)) </h3>  

A nonparametric version of the $d_{PPC-change}$ estimator (see the documentation tab of the page on parametric ES estimators for the PPC design) is described by Hedges and Olkin (1984):  

$$ \hat{\delta}_{PPC-change} = \Phi^{-1} \left( \hat{p}_{gain,\,a} \right) - \Phi^{-1} \left( \hat{p}_{gain,\,b} \right) = \hat{\delta}_{z,\,a} - \hat{\delta}_{z,\,b} $$  

where $\hat{p}_{gain,\,a}$ and $\hat{p}_{gain,\,b}$ are given by:

$$ \hat{p}_{gain,\,a} = \frac{1}{n_a} \sum_{i = 1}^{n_a} I_{ \{d \geq 0\} } (d_{a_i}) $$
$$ \hat{p}_{gain,\,b} = \frac{1}{n_b} \sum_{i = 1}^{n_b} I_{ \{d \geq 0\} } (d_{b_i}) $$

with $d_{a_i} = x_{post,\a|b_i} - x_{pre,\,a|b_i}$ and

$$ I_{ \{d \geq 0\} } (d) = \begin{cases}
1 & \text{if } d \gt 0 \cr
0.5 & \text{if } d = 0 \cr
0 & \text{if } d \lt 0
\end{cases}
$$

Thus, $\hat{p}_{gain,\,a}$ and $\hat{p}_{gain,\,b}$ are the proportions of positive change scores ( $d = x_{post} - x_{pre}$ ) in each group respectively. If ties between pre- and posttest scores are present, each tie is counted as half an observation in each direction. This estimator is the difference between the $\hat{p}_{gain,\,a}$- and the $hat{p}_{gain,\,b}$-quantile of the standard normal distribution. Much like $d_{PPC-change}$ simplifies to the difference between Cohen's $d_z$ of groups ***a*** and ***b***, so too does its nonparametric counterpart simplify to the difference between the nonparametric versions of Cohen's $d_z$ of groups ***a*** and ***b***, namely $\hat{\delta}_{z,\,a}$ and $\hat{\delta}_{z,\,b}$.  

The reason $\hat{\delta}_{PPC-change}$ can be considered a nonparametric version of $d_{PPC-change}$ is owed to the fact that when scores are normally distributed, then $\hat{\delta}_{PPC-change}$ is an estimator of the population effect size given by $\delta_{PPC-change} = \frac{\mu_{post,\,a} - \mu_{pre,\,a}}{\sigma_{D,\,a}} - \frac{\mu_{post,\,b} - \mu_{pre,\,b}}{\sigma_{D,\,b}}$ (for further details on this population effect: see the documentation entry on $d_{PPC-change}$ on the page for parametric ES estimators for the PPC design).  

It should be noted that Hedges and Olkin (1984) denoted this estimator as $\hat{\delta}_3$. The subscript has been changed from $3$ to $PPC-change$ in order to match the subscript used for this estimator with the subscript used for the corresponding parametric estimator $d_{PPC-change}$.  

When *n* is small $\hat{p}_{gain,\,a|b}$ might be equal to 0 or 1. To avoid consequently extreme ESs, $\hat{p}_{gain,\,a|b}$ is set to $\frac{1}{n_{a|b}+1}$ or $\frac{n_{a|b}}{n_{a|b}+1}$ respectively in such cases.  

We could not identify a closed form formula for the confidence interval (CI) of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h2 id="PPC-NP-difference-focused-measures"> 3 Difference-focused measures of effect size </h2>

<h3 id="PPC-NP-d-PPC-pre"> 3.1 \(\hat{\delta}_{PPC,\,pre}\) (nonparametric \(d_{PPC,\,pre}\)) </h3>

A nonparametric version of $d_{PPC,\,pre}$ (see the documentation tab of the page on parametric ES estimators for the PPC design) is described by Hedges and Olkin (1984):  

$$ \hat{\delta}_{PPC,\,pre} = \Phi^{-1} \left( \hat{p}_{pre,\,a} \right) - \Phi^{-1} \left( \hat{p}_{pre,\,b} \right) = \hat{\delta}_{pre,\,a} - \hat{\delta}_{pre,\,b} $$

where $\hat{p}_{pre,\,a}$ and $\hat{p}_{pre,\,b}$ are given by:

$$ \hat{p}_{pre,\,a} = \frac{1}{n_a} \sum_{i = 1}^{n_a} I_{ \{x < \hat{Mdn}(x_{post,\,a}) \} } (x_{pre,\,a_i}) $$
$$ \hat{p}_{pre,\,b} = \frac{1}{n_b} \sum_{i = 1}^{n_b} I_{ \{x < \hat{Mdn}(x_{post,\,b}) \} } (x_{pre,\,b_i}) $$

with $\hat{Mdn}(x_{post,\,a}$ and $\hat{Mdn}(x_{post,\,b}$ being the posttest medians of the respective groups and with

$$ I_{ \{x < \hat{Mdn}(x_{post,\,a|b} \} } (x_{pre,\,a|b_i}) = \begin{cases}
1 & \text{if } x \lt \hat{Mdn}(x_{post,\,a|b} \cr
0 & \text{if } x \geq \hat{Mdn}(x_{post,\,a|b}
\end{cases}
$$

Thus, $\hat{p}_{pre,\,a}$ and $\hat{p}_{pre,\,b}$ are the proportions of the pretest scores of each group that are lower than the median of the posttest scores of the respective group. Consequently, $\hat{\delta}_{PPC,\,pre}$ is the difference between the $\hat{p}_{pre,\,a}$- and the $hat{p}_{pre,\,b}$-quantile of the standard normal distribution. Much like $d_{PPC,\,pre}$ simplifies to the difference between Glass' $d_{G,\,pre}$ for groups ***a*** and ***b***, so too does its nonparametric counterpart simplify to the difference between the nonparametric versions of $d_{G,\,pre}$ for groups ***a*** and ***b***: $\hat{\delta}_{pre,\,a}$ and $\hat{\delta}_{pre,\,b}$.  

The reason $\hat{\delta}_{PPC,\,pre}$ can be considered a nonparametric version of $d_{PPC,\,pre}$ is owed to the fact that when scores are normally distributed $\hat{\delta}_{PPC,\,pre}$ is an estimator of the population effect size given by $\delta_{PPC,\,pre} = \frac{\mu_{post,\,a} - \mu_{pre,\,a}}{\sigma_{pre,\,a}} - \frac{\mu_{post,\,b} - \mu_{pre,\,b}}{\sigma_{pre,\,b}}$ (for further details on this population effect: see the documentation entry on $d_{PPC,\,pre}$ on the page for parametric ES estimators for the PPC design).  

It should be noted that Hedges and Olkin (1984) denoted this estimator as $\hat{\delta}_2$. The subscript has been changed from $1$ to $PPC,\,pre$ in order to match the subscript used for this estimator with the subscript used for the corresponding parametric estimator $d_{PPC,\,pre}$.  

When *n* is small $\hat{p}_{pre,\,a|b}$ might be equal to 0 or 1. To avoid consequently extreme ESs, $\hat{p}_{pre,\,a|b}$ is set to $\frac{1}{n_{a|b} + 1}$ or $\frac{n_{a|b}}{n_{a|b} + 1}$ respectively in such cases.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h3 id="PPC-NP-alternate-difference-focused-estimator">  3.2 An alternate nonparametric difference-focused estimator </h3>

An alternate nonparametric difference-focused effect size estimator is given by Hedges and Olkin (1984): 

$$\hat{\delta}_{PPC,\,post} = \Phi^{-1} \left( \hat{p}_{post,\,a} \right) - \Phi^{-1} \left( \hat{p}_{post,\,b} \right) = \hat{\delta}_{post,\,a} - \hat{\delta}_{post,\,b}$$

where $\hat{p}_{post,\,a}$ and $\hat{p}_{post,\,b}$ are given by:

$$ \hat{p}_{pre,\,a} = \frac{1}{n_a} \sum_{i = 1}^{n_a} I_{ \{x > \hat{Mdn}(x_{pre,\,a}) \} } (x_{post,\,a_i}) $$
$$ \hat{p}_{pre,\,a} = \frac{1}{n_b} \sum_{i = 1}^{n_b} I_{ \{x > \hat{Mdn}(x_{pre,\,b}) \} } (x_{post,\,b_i}) $$

with $\hat{Mdn}(x_{pre,\,a}$ and $\hat{Mdn}(x_{pre,\,b}$ being the pretest medians of the respective groups and with

$$ I_{ \{x > \hat{Mdn}(x_{pre,\,a|b} \} } (x_{pre,\,a|b_i}) = \begin{cases}
1 & \text{if } x \gt \hat{Mdn}(x_{pre,\,a|b} \cr
0 & \text{if } x \leq \hat{Mdn}(x_{pre,\,a|b}
\end{cases}
$$

Thus, $\hat{p}_{post,\,a}$ and $\hat{p}_{post,\,b}$ are the proportions of posttest scores of each group that are larger than the median of the pretest scores of the respective group. Consequently, $\hat{\delta}_{PPC,\,post}$ is the difference between the $\hat{p}_{post,\,a}$- and the $\hat{p}_{post,\,b}$-quantile of the standard normal distribution.  

This effect size estimates a similar population effect as $\hat{\delta}_{PPC,\,pre}$ when scores are normally distributed, namely $\delta_{PPC,\,post} = \frac{\mu_{post,\,a} - \mu_{pre,\,a}}{\sigma_{post,\,a}} - \frac{\mu_{post,\,b} - \mu_{pre,\,b}}{\sigma_{post,\,b}}$. The only difference between $\delta_{PPC,\,pre}$ and $\delta_{PPC,\,post}$ is the choice of the standardiser of the population ***a*** and population ***b*** pre- and posttest mean differences. While $\delta_{PPC,\,pre}$ standardises the pre-post mean difference within each population by the population pretest standarad deviation, $\delta_{PPC,\,post}$ employs the population posttest standard deviation.  

Much like $\hat{\delta}_{PPC,\,pre}$ simplifies to the difference between the nonparametric versions of Glass' $d_{G,\,pre}$ for groups ***a*** and ***b***, so too does $\hat{\delta}_{PPC,\,post}$ simplify to the difference between the nonparametric versions of Glass' $d_{G,\,post}$ for groups ***a*** and ***b***: $\hat{\delta}_{post,\,a}$ and $\hat{\delta}_{post,\,b}$.  

It should be noted that Hedges and Olkin (1984) denoted this estimator as $\hat{\delta}_1$. The subscript has been changed from $2$ to $PPC,\,post$ in order to match the subscript used for this estimator with the subscript used for other estimators documented on this page.  

When *n* is small $\hat{p}_{post,\,a|b}$ might be equal to 0 or 1. To avoid consequently extreme ESs, $\hat{p}_{post,\,a|b}$ is set to $\frac{1}{n_{a|b} + 1}$ or $\frac{n_{a|b}}{n_{a|b} + 1}$ respectively in such cases.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h2 id="PPC-dominance-measure"> 4 The pretest-posttest dominance measure</h2>

Cliff (1993) describes an estimator to evaluate whether posttreatment scores are more likely to be higher than pretreatment scores in one group (e.g., a treatment/experimental group) compared with another group (e.g., a control group) in a pretest-posttest control design. The estimator is given by:

$$ DM = DM_{exp} - DM_{con} $$

with $DM_{exp}$ being the dominance measure of group ***a***/the experimental group and $DM_{con}$ being the dominance measure of group ***b***/the control group. Thus, this estimator is equivalent to the difference in dependent groups dominance measures $DM$ between the two contrasted groups. The dependent groups dominance measure is described in the documentation page for the dependent group design.  

$DM$ is calculated by adding the within-subject difference ( $DM_w$ ), and the average between-subject dominance ( $DM_b$ ) for dependent data. $DM_w$ is the probability that individuals change in a given direction (here: increase their score from one occasion of measurement to another) whereas $DM_b$ is the proportion of scores on the second occasion that are higher than scores by other individuals on the first. Therefore, the dominance measure for dependent groups can be calculated for the treatment/experimental and the control groups each as follows:

$$\hat{DM} = \hat{DM_w} + \hat{DM_b}$$

where $\hat{DM_w}$ is given by

$$ \hat{DM_w} = \sum_{i=1}^n{\frac{d_{ii}}{n}} $$

with $d_{ii}$ being

$$d_{ii} = sign(x_{post,\,i} - x_{pre,\,i})$$

and $\hat{DM_b}$ is given by

$$\hat{DM_b} = \frac{\sum{\sum}_{i \ne j}d_{ij}}{n(n-1)}$$

with $d_{ij}$ being

$$d_{ij} = sign(x_{post,\,i} - x_{pre,\,i})$$

Since the treatment groups are independent, the sampling variance of the difference of the two $\hat{DM}$ is simply the sum of their individual sampling  variances.  

Therefore, a $1 - \alpha$ confidence interval can be calculated: 

$$UL = (\hat{DM}_{exp} - \hat{DM}_{con}) + z_{\alpha / 2}(var(\hat{DM}_{exp}) + var(\hat{DM}_{con})^{1/2}$$
$$LL = (\hat{DM}_{exp} - \hat{DM}_{con}) - z_{\alpha / 2}(var(\hat{DM}_{exp}) + var(\hat{DM}_{con})^{1/2}$$

with $var(\hat{DM}) = var(\hat{DM}_b + \hat{DM}_w)$ being
$$ var(\hat{DM}_b + \hat{DM}_w) = s_{\hat{DM}_w}^2 + s_{\hat{DM}_b}^2 + 2 cov(\hat{DM}_b, \hat{DM}_w) $$

with
$$ cov(\hat{DM}_b, \hat{DM}_w) = \frac{\sum_i[(\sum_i d_{ij} + \sum_j d_{ji})d_{ii}]-2n(n-1)\hat{DM}_b \hat{DM}_w}{n(n-1)(n-2} $$

with

$$s_{\hat{DM}_w}^2 = \frac{\sum(DM_{ii}-\hat{DM}_w)^2}{n-1}$$

and with

$$s_{\hat{DM}_b}^2 = \frac{(n-1)^2(\sum  d_{i.}^{*2} + d_{i.}^{*2} + 2\sum d_{i.}^{*}d_{i.}^{*}) - \sum\sum d_{ij}^{*} d_{ij}^{*} }{n(n-1)(n-2)(n-3)}$$

with

$$ d_{i.}^{*} = d_i - \hat{DM}_b $$

with $d_{i.}$ being the proportion of pretest scores being higher than i's posttest score

Additionally, a $1 - \alpha$ percentile bootstrap confidence interval is implemented.

<br>

<hr>

<h2 id="PPC-NP-refs"> 5 References </h2>  

Cliff, N. (1993). *Dominance statistics: Ordinal analyses to answer ordinal questions.* Psychological bulletin, 114(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>   

Feingold, A. (2009). ESs for growth-modeling analysis for controlled clinical trials in the same metric as for classical analysis. *Psychological Methods*, *14*(1), 43--53. <https://doi.org/10.1037/a0014699>  

Hedges, L. V., & Olkin, I. (1984). Nonparametric estimators of effect size in meta-analysis. *Psychological Bulletin*, *96*(3), 573–-580. <https://doi.org/10.1037/0033-2909.96.3.573>

Morris, S. B. (2008). Estimating ESs from pretest-posttest-control group designs. *Organizational Research Methods*, *11*(2), 364--386. <https://doi.org/10.1177/1094428106291059>  

Morris, S. B., & DeShon, R. P. (2002). Combining ES estimates in meta-analysis with repeated measures and independent-groups design. *Psychological Methods*, *7*(1), 105--125. <https://doi.org/10.1037//1082-989X.7.1.105>  