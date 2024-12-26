<div class="toc_container">
  <h2 class="toc_title">Table of contents</h2>
    <ul>
      <li>
        <a href = "#DG_NP_intro">
          <h3>1 The dependent groups design</h3>
        </a>
      </li>
      <li>
        <a href = "#DG_NP_SLD">
          <h3>2 Nonparametric estimators of measures of standardised location difference</h3>
        </a>
      <ul>
        <li>
          <a href = "#DG_NP_dG">
            <h4>2.1 Nonparametric Glass \(d_{G,\,j}\)</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_dz">
            <h4>2.2 Nonparametric Cohen's \(d_z\)</h4>
          </a>
        </li>
      </ul>
      </li>
      <li>
        <a href = "#DG_NP_tails">
          <h3>3 Nonparametric estimators of measures of difference in group tails</h3>
        </a>
      <ul>
        <li>
          <a href = "#DG_NP_TR">
            <h4>3.1 Nonparametric Tail Ratio (\(TR\))</h4>
          </a>
        </li>
      </ul>
      </li>
      <li>
        <a href = "#DG_NP_OM">
          <h3>4 Nonparametric estimators of measures of (non-)overlap</h3>
        </a>
      <ul>
        <li>
          <a href = "#DG_NP_OVL">
            <h4>4.1 The Nonparametric Coefficient of Overlapping (\(OVL\))</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_OVL2">
            <h4>4.2 The Nonparametric Measure of Overlapping Coefficient Two (\(OVL_2\))</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_U1">
            <h4>4.3 Nonparametric Cohen's \(U_1\)</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_U2">
            <h4>4.4 Nonparametric Cohen's \(U_2\)</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_U3">
            <h4>4.5 Nonparametric Cohen's \(U_3\)</h4>
          </a>
        </li>
      </ul>
      </li>
      <li>
        <a href = "#DG_NP_PM">
          <h3>5 Nonparametric estimators of probabilistic measures of effect size</h3>
        </a>
      <ul>
        <li>
          <a href = "#DG_NP_PS">
            <h4>5.1 Probability of Superiority (\(PS\))</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_A_measure">
            <h4>5.2 The \(A\) measure of stochastic Superiority</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_GOR">
            <h4>5.3 Generalized Odds Ratio (\(OR_g\))</h4>
          </a>
        </li>
        <li>
          <a href = "#DG_NP_DM">
            <h4>5.4 Dominance measure (\(DM\))</h4>
          </a>
        </li>
      </ul>
      </li>
      <li>
        <a href = "#DG_NP_refs">
          <h3>6 References</h3>
        </a>
      </li>
    </ul>
</div>

<h2 id="DG_NP_intro">1 The dependent groups design</h2>

The dependent groups design---also often referred to as repeated measures design, within-subjects design or within-group design--is characterised by taking multiple measurements of a dependent variable on the same or on matched subjects/objects under different conditions or over multiple points in time (Kraska, 2022). Thus, the ES described here are applicable to a great variety of research designs, such as (Bonett, 2015):\
- a pretest-posttest design (e.g., measuring a health outcome before and after applying a treatment)\
- a within-subjects design where some variable is measured under two treatment conditions (e.g., a novel and a gold standard treatment)\
- a longitudinal design where some variable is measured at two points in time without any intermediate intervention (e.g., measuring the personality traits of a cohort multiple times)\
- or for a matched-pair design where subjects are paired based on covariates and randomly assigned to two conditions (e.g., into a control and an experimental condition).

<h2 id="DG_NP_SLD">2 Nonparametric estimators of measures of standardised location difference</h2>

<h3 id="DG_NP_dG">2.1 Nonparametric Glass \(d_{G,\,j}\)</h3>

A nonparametric version of Glass' $d_{G,\,j}$ is described by Kraemer and Andrews (1982) as well as by Hedges and Olkin (1985). Both groups of authors discussed their suggested estimators in the context of a pre- posttest design as it will be done here as well, with group ***b*** denoting pretest measurements and group ***a*** denoting posttest measurements. However keep in mind, that the same arguments apply to other types of dependent groups:

$$\hat{\delta}_j = \Phi^{-1}(\hat{p}_j)$$

resulitng in the effects:

$$\hat{\delta}_a = \Phi^{-1}(\hat{p}_a)$$

$$\hat{\delta}_b = \Phi^{-1}(\hat{p}_b)$$

where $\hat{p}_a$ is given by

$$\hat{p}_a = \frac{1}{n} \sum_{i=1}^{n} I_{ \{x > Mdn_b \} } (x_{a_i})$$

with

$$I_{ \{x > Mdn_b \} } (x) = \begin{cases} 1 & \text{if } x \gt Mdn_b \cr 0 & \text{if } x \leq Mdn_b \end{cases}$$

and $\hat{p}_b$ is given by

$$\hat{p}_b = \frac{1}{n} \sum_{i=1}^{n} I_{ \{x < Mdn_a \} } (x_{b_i})$$

with

$$I_{ \{x < Mdn_a \} } (x) = \begin{cases} 1 & \text{if } x \lt Mdn_a \cr 0 & \text{if } x \geq Mdn_a \end{cases}$$

If this effect size is chosen by the user, both estimators are provided, denoted as nonparametric Glass' $d_{G, 1}$---$\hat{\delta}_b$ is computed---and nonparametric Glass' $d_{G, 2}$---$\hat{\delta}_a$ is computed.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$ ).

$\hat{p}_{a}$ is the proportion of group ***a*** (e.g., posttest measurements) that are larger than the median of the group ***b*** (e.g., pretreatment measurements). Consequently, $\hat{\delta}_{a}$ is the $\hat{p}_a$-quantile of the standard normal distribution.

The reason $\hat{\delta}_a$ can be considered a nonparametric version of Glass' $d_{G,\,a}$ is owed to the fact that when populations ***b*** and ***a*** (e.g., pre- and posttest scores) are normally distributed, then $\hat{\delta}_a$ is an estimator of the population effect size given by $\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a}$.

$\hat{p}_{b}$ is the proportion of group ***b*** (e.g., pretest measurements) that are lower than the median of the group ***a*** (e.g., posttest measurements). Consequently, $\hat{\delta}_{b}$ is the $\hat{p}_b$-quantile of the standard normal distribution.

The reason $\hat{\delta}_b$ can be considered a nonparametric version of Glass' $d_{G,\,b}$ is owed to the fact that when populations b and a (e.g., pre- and posttest scores) are normally distributed, then $\hat{\delta}_b$ is an estimator of the population effect size given by $\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b}$.

Hedges and Olkin (1985) suggested this adaption of Kraemer's and Andrews' (1982) estimator $D$ and called it $\hat{\delta}_1$. The latter estimator has been implemented here. The main difference between $\hat{\delta}_1$ and $D$ is their respective computation of the posttest median. While $\hat{\delta}_1$ computes the median of all posttest scores, $D$ computes the median of the posttest scores of individuals with a pretest score falling in a critical range. Said critical range is comprised of the median of pretest scores and two distinct values on either side of the median, i.e., the observed order statistics immediately preceding and following the median (Kraemer & Andrews, 1982). For further details, the reader is advised to consult Kraemer and Andrews (1982) as well as Hedges and Olkin (1985). Kraemer and Andrews (1982) did not define an equivalent of Hedges and Olkin's (1985) estimator $\hat{\delta}_2$.

As stated above Hedges and Olkin (1985) denoted these estimators as $\hat{\delta}_a$ and $\hat{\delta}_b$, respectively. The subscripts have been changed from $1$ to $b$ and from $2$ to $a$ in order to match the used subscript with those used for other effect sizes in this documentation.

When *n* is small $\hat{p}_b$ might be equal to 0 or 1. To avoid consequently extreme effect sizes $\hat{p}_b$ is set to $\frac{1}{n+1}$ or $\frac{n}{n+1}$ respectively in such cases. The same applies to $\hat{p}_a$.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h3 id="DG_NP_dz">Nonparametric Cohen's \(d_z\)</h3>

A nonparametric verison of Cohen's $d_z$ is described by Hedges and Olkin (1985):

$$\hat{\delta}_D = \phi^{-1}(\hat{p}_{gain})$$

where $p_{gain}$ is given by:

$$\hat{p}_{gain} = \frac{1}{n} \sum_{i=1}^{n} I_{ \{d \geq 0\} } (d_i)$$

with $d_i = x_{a_i} - x_{b_i}$ and

$$I_{ \{d \geq 0\} } (d) = \begin{cases} 1 & \text{if } d \gt 0 \cr 0.5 & \textif } d = 0 \cr 0 & \text{if } d \lt 0 \end{cases}$$

Thus $\hat{p}_{gain}$ is the proportion of individuals whose scores increase from pretest (group ***b***) to posttest (group ***a***), i.e., the proportion of difference scores (also called change scores) $d_i = x_{a_i} - x_{b_i}$ that are positive.\
If ties between pre-and posttest scores are present ( $x_{a_i} = x_{b_i}$ ), each tie is counted as half an observation in each direction. Consequently, $\hat{\delta}_D$ is the $\hat{p}_{gain}$-quantile of the standard normal distribution.

The reason $\hat{\delta}_D$ can be considered a nonparametric version of Cohen's $d_z$ is owed to the fact that when population change scores are normally distributed, then $\hat{\delta}_D$ is an estimator of the same population effect estimated by Cohen's $d_z$ given by $\delta_D = \frac{\mu_a - \mu_b}{\sigma_D}$ (see the documentation page for the dependent groups parametric ESs on Cohen's $d_z$ for further details on this population effect).

It should be noted that Hedges and Olkin (1985) denoted this estimator as $\hat{\delta}_3$. The subscript has been changed from $3$ to $z$ in order to match the subscript used for this estimator with the subscript used for Cohen's $d_z$.

When *n* is small $\hat{p}_{gain}$ might be equal to 0 or 1. To avoid extreme effect sizes, if $\hat{p}_{gain}$ is equal to 0 or 1, it is set to $\frac{1}{n + 1}$ or $\frac{n}{n + 1}$ instead respectively.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h2 id="DG_NP_tails">Nonparametric estimators of measures of difference in group tails</h2>

<h3 id="DG_NP_TR">Nonparametric Tail Ratio (\(TR\))</h3>

werden!

Measures of standardised location differences narrow their assessment on the centers of distributions, i.e., on typical observations. For many psychological, biological, and medical models which predict that the probability of some outcome or manifestation only starts increasing after some threshold the tails of distributions are more relevant (Voracek et al., 2013), e.g.,:

-   diathesis-stress\
-   vulnerability\
-   susceptibility\
-   exposure\
-   excellence models

If group differences in the tails of distributions are of interest then the ratio of the proportions of scores found in the lower or upper tail of the distribution of the analysed groups can be assessed. The ratio of proportions of scores in the distributional extremes can be much higher than one might expect based on the inspection of measures of standardised location differences and the variance ratio in the following cases (Voracek et al., 2013):

-   when the location difference is small and the variance ratio equals 1;\
-   when a location difference is absent but the variance ratio differs from 1;\
-   when both measures of location and of spread differ;\
-   when a location difference or a difference in spread are absent, but the distributions of the groups differ in higher order distributional moments (skewness and kurtosis).

Consequently, an assessment of tail ratios can be of importance for any dependent groups research design regardless of the absence of location difference or a difference in distributional spread.

The user of this application can compute tail ratios for a chosen cutoff value, a chosen tail region (i.e., the lower/left or the upper/right tail), and a chosen reference group (i.e., the proportion used as the denominator---either the proportion of group ***a*** or group ***b***).

For a discussion of the history of the tail ratio, a proposal for a consensus regarding a naming and reporting convention, as well as for proposed benchmarks meant to aid the interpretation of tail ratios the reader is advised to turn to the article by Voracek et al. (2013).

The tail ratio effect size measure is implemented as follows: The tail ratio can be thought of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". This way we can characterise the data as *n* pairs of Bernoulli events, where the possible outcomes are referred to as a "hit" (denoted by 1) or a "miss" (denoted by 2). Thus, the data can fall into one of four combinations:

-   two "hits" (11)\
-   first observation is a "hit", second observation is a "miss" (12)\
-   first observation is a "miss", second observation is a "hit" (21)\
-   two "misses" (22)

The paired binomial proportions of interest are the marginal proportion of scores from group ***a*** that are categorised as "hits" $p_a$ and the marginal proportion of scores from group ***b*** that are categorised as "hits" $p_b$. The population tail ratio for a given cutoff value and region of interest is thus the ratio:

$$TR = \frac{p_{a|b}}{p_{b|a}}$$

The observed data can be thought of as 2 x 2 table of the following form:

<table border = "1">
	<col>
	<colgroup span = "2"></colgroup>
	<colgroup span = "2"></colgroup>
	<tr>
		<td rowspan = "2" colspan="2" scope="colgroup"></td>
		<th colspan = "2" scope = "colgroup">Measurement a</th>
		<td></td>
	</tr>
	<tr>
		<th>hits&nbsp;&nbsp;</th>
		<th>missess&nbsp;&nbsp;</th>
		<th>sum&nbsp;&nbsp;</th>
	</tr>
	<tbody>
		<tr>
			<th rowspan="2" scope="rowgroup">Measurement b&nbsp;&nbsp;</th>
			<th scope="row">hits&nbsp;&nbsp;</th>
			<td>n<sub>11</sub></td>
			<td>n<sub>12</sub></td>
			<td>n<sub>1.</sub></td>
		</tr>
		<tr>
			<th scope = "row">misses &nbsp;&nbsp;</th>
			<td>n<sub>21</sub></td>
			<td>n<sub>22</sub></td>
			<td>n<sub>2.</sub></td>
		</tr>
		<tr>
			<td></td>
			<th scope="row">sum&nbsp;&nbsp;</th>
			<td>n<sub>.1</sub></td>
			<td>n<sub>.2</sub></td>
			<td>n</td>
		</tr>
	</tbody>
</table>

The point estimate of the population tail ratio can be written as:

$$\widehat{TR} = \frac{\hat{p}_{a|b}}{\hat{p}_{b|a}} = \frac{n_{1.|.1}}{n_{.1|1.}}$$

with $\hat{p}_a = \frac{n_{1.}}{n}$ and $\hat{p}_b = \frac{n_{.1}}{n}$.

The cell frequencies are determined as the number of observed scores below/above a cutoff *t*. No assumption is made regarding the underlying distribution of the pairs of observed scores.

When "hits" are defined as scores below *t*:

-   $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$\
-   $n_{12}$ is computed as: $n_{12} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$\
-   $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$\
-   $n_{22}$ is computed as: $n_{22} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$\
-   $n_{1.}$ is computed as: $n_{1.} = \sum_{i=1}^{n_{1.}} I_{\{x \leq t\}}(x_{a_i})$\
-   $n_{.1}$ is computed as: $n_{.1} = \sum_{i=1}^{n_{.1}}I_{\{x \leq t\}}(x_{b_i})$

with

$$I_{\{x \leq t\})}(x) = \begin{cases} 1 & \text{if }  x \leq t \cr 0 & \text{if }  x \gt t \end{cases}$$

and

$$I_{\{x \geq t\}}(x) = \begin{cases} 1 & \text{if }  x \geq t \cr 0 & \text{if }  x \lt t \end{cases}$$

and when "hits" are defined as scores above *t*:

-   $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$\
-   $n_{12}$ is computed as: $n_{12} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$\
-   $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$\
-   $n_{22}$ is computed as: $n_{22} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$\
-   $n_{1.}$ is computed as: $n_{1.} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})$\
-   $n_{.1}$ is computed as: $n_{.1} = \sum_{i=1}^{n_{.1}}I_{\{x \geq t\}}(x_{b_i})$

With $n_{1.}$ and $n_{.1}$ defined and computed the ratio of the binomial proportions $\hat{p}_a$ and $\hat{p}_b$ and consequently the point estimate of the tail ratio can be determined. The rest of the cell frequencies are relevant for the computation of the implemented confidence interval.

Two approximate confidence intervals are implemented. Fagerland et al. (2014) analysed multiple confidence intervals for the ratio of paired binomial proportions. While none of the assessed procedures yielded appropriate coverage rates across the various conditions the authors examined, the Nam-Blackwelder and the Bonett-Price hybrid Wilson score confidence intervals performed the most adequately across many of the studied scenarios with the Nam-Blackwelder interval outperforming the Bonett-Price interval when marginal probabilities (i.e., $p_{a|b}$ ) are less than 0.2. Both methods have been recommended by the authors for general use.\
The Nam-Blackwelder confidence interval relies on iterative search and thus might result in an error under some conditions. Consequently, the following approach has been employed for the implementation of the confidence interval:

-   the Nam-Blackwelder confidence interval is reported if the iterative search of the confidence limits does not result in an error. The interval is computed as described by Nam and Blackwelder (2002).\
-   in case the iterative search does result in an error the user of the app receives a corresponding notification in the user interface an the Bonett-Price confidence interval is reported. The Bonett-Price confidence interval is computed as described by Bonett and Price (2006b).

Neither the computation of the Nam-Blackwelder nor of the Bonett-Price confidence interval is described in detail here as they both are rather elaborate - the reader is advised to study the cited literature for further details.

However, Fagerland et al. (2014) emphasize that while the implemented intervals are in general the best performing, they can be somewhat liberal (with average coverage probabilities between 0.91 and 0.95 for an $1 - \alpha$ level of 0.95) for combinations of a small sample size ( $n = 20$ ), small marginal proportions ( $p_{a|b} \leq 0.2$ ) and a large/small population ratio of proportions ( $\theta = 4.5$ or $\theta = 0.22$ ). The Bonett-Price confidence interval is more liberal than the Nam-Blackwelder confidence interval for the given combinations of sample size, marginal proportions and ratio of proportions.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h2 id="DG_NP_OM">Nonparametric estimators of measures of (non-)overlap</h2>

For the documentation of these measures the following notation will be use:\
Let $X_a$ denote the random variable '*score of a randomly sampled individual on measurement a*' and $X_b$ denote the random variable '*score of the same/matched individual on measurement b*'. Further, let $F_a$ and $F_b$ denote the corresponding absolutely continuous distribution functions and $f_a$ and $f_b$ the corresponding probability density functions respectively.

<br>

<h3 id="DG_NP_OVL">The Nonparametric Coefficient of Overlapping (\(OVL\))</h3>

The population effect of interest is given by (e.g., Schmid & Schmidt, 2006):

$$OVL = \int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx$$

The coefficient of overlapping ( $OVL$ ) is thus defined as the common area under two probability densities---i.e., the proportion of overlap between the two distributions/measurements---and can for example be used as a measure of agreement of two distributions (Bradley, 2006).

Nonparametric estimators of the above quantity can be obtained by replacing the densities by appropriate kernel density estimators and the integrals by an appropriate quadrature formula.\
Assuming $x_{a_1}, \ldots, x_{a_{n_a}}$ denote observations of random variable $X_a$, a density estimator for $f_a$ is obtained by (Schmid & Schmidt, 2006):

$$\hat{f_{n_a}}(x) = \hat{f_{n_a}}(x|x_{a_i},\, i = 1 \ldots n) = \frac{1}{n_a}  \sum_{i = 1}^{n_a} \frac{1}{b} K \left( \frac{x - x_{a_i}}{b} \right)$$

$$\widehat{OVL} = \frac{1}{k} \sum_{i = 1}^k \frac{1}{2} \left( \min \left\{ \hat{f_{n_a}}  \left( \frac{i}{k} \right), \hat{f_{n_b}} \left( \frac{i}{k} \right) \right\} + \min \left\{ \hat{f_{n_a}} \left( \frac{i-1}{k} \right), \hat{f_{n_b}} \left( \frac{i-1}{k} \right) \right\} \right)$$

where *k* denotes the number of equidistant subintervals of the unit interval.

Anderson et al. (2012) describes the asymptotic properties of various nonparametric estimators of $OVL$ which could be used to construct an approximate CI procedure. A $1 - \alpha$ percentile bootstrap confidence interval is implemented here exclusively.

<br>

<h3 id="DG_NP_OVL2">The Nonparametric Measure of Overlapping Coefficient Two (\(OVL_2\))</h3>

The population effect of interest is given by:

$$OVL_2 = \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = \frac{OVL}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx$$

The coefficient of overlapping 2 ( $OVL_2$ ) is the proportion of overlap relative to the joint distribution of two contrasted populations (DelGiudice, 2019), which is the amount of combined area shared by the populations of measurements ***a*** and ***b***.

A nonparametric estimator of the above quantity may be obtained by estimating the numerator and denominator separately and dividing the two quantities. The numerator can be estimated as described in detail above (see $\widehat{OVL}$ ). The denominator can be estimated in a similar fashion:

$$\hat{\theta} = \frac{1}{k} \sum_{i = 1}^k \frac{1}{2} \left( \max \left\{  \hat{f}_{n_a} \left( \frac{i}{k} \right), \hat{f}_{n_b} \left( \frac{i}{k} \right) \right\} + \max \left\{ \hat{f}_{n_a} \left( \frac{i - 1}{k} \right), \hat{f}_{n_b} \left( \frac{i - 1}{k} \right) \right\} \right)$$

giving the estimator:

$$\widehat{OVL}_2 = \frac{\widehat{OVL}}{\hat{\theta}}$$

Grice and Barret(2014) argue that $OVL$ is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unintuitive. $OVL$, on the other hand, indicates what proportion of the area a distribution shares with the other distribution which is easier to interpret.

We could not identify a closed form formula for the confidence interval of this ES. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h3 id="DG_NP_U1">Nonparametric Cohen's \(U_1\)</h3>

The population effect of interest is given by:

$$U_1 = \frac{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx  - \int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - OVL_2$$

Cohen's $U_1$ can be interpreted as proportion of nonoverlap relative to the joint distribution of two populations (DelGiudice, 2019), which is the amount of combined area not shared by the populations of measurements ***a*** and ***b***.

A nonparametric estimator of $U_1$ was implemented by making use of the relation between $U_1$ and $OVL_2$. Since $OVL_2$ is a measure of the proportion of overlap of the combined area of the two distributions and $U_1$ is a measure of the proportion of nonoverlap of the same area, $U_1$ can be expressed as a function of $OVL_2$ ( $U_1 = 1 - OVL_2$ ) and consequently the estimator is given by:

$$\hat{U}_1 = 1 - \widehat{OVL}_2$$

with $\widehat{OVL}_2$ being calculated as described above.

Any critique of $OVL_2$ discussed above is equally applicable to Cohen's $U_1$ since both ES quantify overlap/nonoverlap relative to the joint distribution of the contrasted measurements.

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h3 id="DG_NP_U2">Nonparametric Cohen's \(U_2$\)</h3>

The population effect on interest is the proportion of measurement ***a*** scores that exceed the same proportion of measurement ***b*** scores. Thus a value of 0.7 means that the top 70% of measurement ***a*** scores exceed the bottom 70% of measurement ***b*** scores.

We propose the following nonparametric estimator for the above population effect:

$$\hat{U}_2 = \hat{F}_b(x_{a_{(t)}})$$

for a value of *t* that satisfies 
$$t \in \{ x_{a_{(1)}}, \ldots, x_{a_{(n_a)}} \} : \begin{cases} 1 - \hat{F}_a( x_{a_{(t)}} ) > \hat{F}_b( x_{a_{(t)}} ) \cr 1 - \hat{F}_a( x_{a_{(t - 1)}} ) < \hat{F}_b( x_{a_{(t -1)}} ) \end{cases}$$

where $x_{a_{(1)}, \ldots, x_{a_{(n_a)}}}$ are the order statistics of the observed measurement ***a*** scores and $\hat{F}_{a|b}$ is the empirical distribution function of measurement ***a***/***b*** scores given by:

$$\hat{F}_{a|b}(t) = \frac{1}{n_{a|b}} \sum_{i = 1}^{n_{a|b}} I_{\{x_{{a|b}_i} \leq t\}}(x_{{a|b}_i})$$

with 
$$I_{\{x_{{a|b}_i} \leq t\}} (x_{{a|b}_i}) = \begin{cases} 1 & \text{if } x_{{a|b}_i} \leq t \cr 0 & \text{if } x_{{a|b}_i} \gt t \end{cases}$$

The above estimator of $U_2$ can also be thought of as the value of $\hat{F}_b$ at the intersection point of $1 - \hat{F}_a$ and $\hat{F}_b$---which has to be determined by an iterative search algorithm since empirical distribution functions are always discrete.

It should be noted that if

$$\max \{ x_{a_1}, \ldots, x_{a_{n_a}} \} < \min \{ x_{b_1}, \ldots, x_{n_{b}} \}$$

then $\hat{U}_2$ is set to 0 and conversely, if

$$\min \{ x_{a_1}, \ldots, x_{a_{n_a}} \} > \max \{ x_{b_1}, \ldots, x_{n_{b}} \}$$

$\hat{U}_2$ is set to 1.

A $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h3 id="DG_NP_U3">Nonparametric Cohen's \(U_3\)</h3>

For the following description we assume that the measurement ***a*** scores have a higher mean than the measurement ***b*** scores.

The population effect of interest is given by:

$$U_3 = F_b(Q_a(0.5))$$

with $F_b(\cdot)$ being the cumulative distribution function of measurement ***b*** and $Q_a(\cdot)$ being the quantile function of measurement ***a***. Consequently, Cohen's measure of nonoverlap $U_3$ is the proportion of scores of the measurement with the lower mean (***b***) which the upper half of scores (the top 50%) of the measurement with the higher mean (***a***) exceeds (Cohen, 1988). Thus, a value of 0.7 for example means that the top 50% of measurement ***a*** scores exceed 70% of measurement ***b*** scores. Alternatively, one could conclude that the median score of measurement ***a*** exceeds 70% of the scores of measurement ***b***.

A nonparametric estimator of the above quantity is given by:

$$\hat{U}_3 = \hat{F}_b(\hat{Q}_a(0.5))$$

with $\hat{F}_b(\cdot)$ being the empirical distribution function of measurement ***b*** scores and $\hat{Q}_a(\cdot)$ being the empirical quantile function of measurement ***a*** scores. The above formula can be written as:

$$\hat{U}_3 = \frac{1}{n} \sum_{i = 1}^{n_b} I_{ \{ x < Mdn_a \} } \left( x_{b_i} \right)$$

with

$$I_{ \{ x < Mdn_a \} }(x) = \begin{cases} 1 & \text{if } x \leq Mdn_a \cr 0 & \text{if } x \gt Mdn_a \end{cases}$$

and $Mdn_a$ being the median (= $\hat{Q}_a(0.5)$ ) of measurement ***a*** scores, i.e., the measurement scores with the higher mean.

Thus, the estimator of $U_3$ is the proportion of scores of the measurement scores with the lower mean that gets exceeded by the median score of the measurement scores with the higher mean. Say that in a pre-posttest design posttest scores have a higher mean than the pretest scores. Then $\hat{U_3}$ would give the proportion of pretest scores that the median posttest score exceeds.

We could not identify a closed form formula for the CI for this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h2 id="DG_NP_PM">Nonparametric estimators of probabilistic measures of effect</h2>

<h3 id="DG_NP_PS">Probability of Superiority (\(PS\))</h3>

The population effect of interest is given by (Grissom & Kim, 2005):

$$PS_{dep} = \mathbb{P}(X_{a_i} > X_{b_i})$$ 

where
-   $X_{a_i}$ is the score of an individual under condition ***a***
-   $X_{b_i}$ is the score of that same (or related or matched) individual under condition ***b***.

Thus, the *PS* for dependent groups can then be defined as the probability that within a randomly sampled pair of dependent scores (e.g., pre- and posttest measurements), the score under condition ***a*** (e.g., posttest) will be grater than the score under condition ***b*** (e.g., pretest). This results in a distinct definition of the *PS* ES measure for dependent groups compared to the one defined for independent groups (see the documentation tab of the page on nonparametric ES for the independent groups design). At the same time, the above population effect is identical to the one estimated by the parametric Common Language (*CL*) ES statistic (see the documentation tab of the page on parametric ES for the dependent groups design).

A nonparametric estimator of this population effect is given by (Grissom & Kim, 2005):

$$ \hat{p}_{a>b} = \frac{\sum_{i = 1}^{n}I_{\{x_{a_i} > x_{b_i}\}}(x_{a_i}, x_{b_i})}{n - n_{ties}}$$

with 
$$I_{\{x_{a_i} > x_{b_i}\}}(x_{a_i}, x_{b_i}) = \begin{cases} 0 & \text{if } x_{a_i} \lt x_{b_i} | x_{a_i} = x_{b_i} \cr 1 & \text{if } x_{a_i} \gt x_{b_i} \end{cases}$$

with $\sum_{i = 1}^{n}I_{\{x_{a_i} > x_{b_i}\}}(x_{a_i}, x_{b_i})$ being the sum of pairs of dependent observations in which a person's score under condition ***a*** is higher than the same person's score under condition ***b*** (with ties being ignored, i.e., each given a value/weight of 0). This sum is divided by $n - n_{ties}$, i.e., the number of pairs of dependent observations (with ties being ignored, i.e., subtracted from the total sample size). Thus, this estimate is the proportion of all such within-participant comparisons in which a participant's score under condition ***a*** is greater than that participant's score under condition ***b*** (with ties being ignored). A related ES, not ignoring ties is described below (the *A* measure of stochastic superiority). Grissom and Kim (2012) recommend "that researchers provide both results, so that their results can be compared, or meta-analyzed" (p.173).

For the independent groups design, the means of the sampling distributions of the *PS* and the *CL* statistics are typically very similar when $\mu_1 = \mu_2$ and the correlation between the two sets of estimates was found to be well over .9 in Monte-Carlo simulations (Grissom & Kim, 2001).\
However, as the difference between $\mu_1$ and $\mu_2$ increases, this correlation sometimes decreases to a value as low as approximately .2, and the *CL* statistic tended to show more sampling error than the *PS* statistic as the difference increased.\
This effect ought to be studied for the dependent *CL* and *PS* ES statistics as well. However, like for the independent groups design, it could be advisable for researchers estimating $\mathbb{P}(X_{a_i} > X_{b_i})$ to report *PS* alongside, if not instead of, the *CL* ES, even when assuming normality.

An approximate $1 - \alpha$ confidence interval is calculated with Pratt's method, adapted to *PS* for dependent groups by Wilcox (2011).\
Assuming that we observe *w* successes ( $x_{a_i} > x_{b_i}$ )---with ties discarded (i.e., given a value/weight of 0)---among $\tilde{n} = n - n_{ties}$ trials, to determine the upper limit *UL* of the confidence interval we compute:

$$A = (\frac{w + 1}{\tilde{n} - w})^2$$

$$B = 81(w + 1)(\tilde{n} - 2) - 9\tilde{n} - 8$$

$$C = -3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9(w + 1)(\tilde{n} - w)(9\tilde{n} + 5- \Phi^{-1}(1 - \frac{\alpha}{2})^2) + \tilde{n} + 1}$$

$$D = 81(w + 1)^2 - 9(w + 1)(2 + \Phi^{-1}(1 - \frac{\alpha}{2})^2) + 1$$

$$E = 1 + A(\frac{B + C}{D})$$ 

in which case 

$$UL = \frac{1}{E}$$

To get the lower limit *LL* of the confidence interval we compute:

$$A = (\frac{w}{\tilde{n} - w - 1})^2$$

$$B = 81(w)(\tilde{n} - w - 1) - 9\tilde{n} - 8$$

$$C = 3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9w(\tilde{n} - 2 - 1)(9\tilde{n} + 5-\Phi^{-1}(1 - \frac{\alpha}{2})^2) + \tilde{n} + 1}$$

$$D = 81w^2 - 9w(2 + \Phi^{-1}(1 - \frac{\alpha}{2})^2) + 1$$ 

$$E = 1 + A(\frac{B + C}{D})$$ 

in which case 

$$LL = \frac{1}{E}$$

Additionally, an $1 - \alpha$ percentile bootstrap confidence interval is implemented.

<br>

<h3 id="DG_NP_A_measure">The \(A\) measure of stochastic Superiority</h3>

The population effect of interest is given by:

$$A_{a|b} = \mathbb{P}(X_{a_i|b_i} > X_{b_i|a_i}) + .5  \mathbb{P}(X_{a_i} = X_{b_i})$$

yielding two distinct population effects:

$$A_{a} = \mathbb{P}(X_{a_i} > X_{b_i}) + .5  \mathbb{P}(X_{a_i} = X_{b_i})$$

$$A_{a|b} = \mathbb{P}(X_{a_i} > X_{b_i}) + .5  \mathbb{P}(X_{a_i} = X_{b_i})$$

these are, the probability that within a a randomly sampled pair of dependent observations $(X_{a_i}, X_{b_i})$, the score under condition ***a***, $X_{a_i}$ will be greater than or equal to an the score under condition ***b*** $X_{b_i}b$ and vice versa (Vargha & Delaney, 2000). This quantity is identical to the population effect estimated by the parametric dependent *CL* ES statistic and the nonparametric dependent *PS* statistic for continuous measures where ties are not possible. However, the above definition is also applicable to any measure at least ordinally scaled, where ties are quasi unavoidable and have to be explicitly accounted for. For a thorough discussion of the subtle yet important differences between these ES definitions as well as the relations between Cliff's dominance measure, the *CL* ES and $A_{a|b}$ consult Vargha and Delaney (2000).

It should also be noted that for dependent groups, the definition of the *A* measure of stochastic superiority is distinct from its counterpart defined for independent groups (see the documentation tab of the page on nonparametric ES for the independent groups design).

If the dependent variable of interest is continuous and ties are not possible, then, much like with the dependent *PS* and the *CL* ES definition, a value of $A_a$ > 0.5 indicates that for a pair of dependent measurements the measurement under condition ***a*** is "stochastically"/"probabilistically" greater than the measurement under condition ***b***. However, whenever ties are possible both $A_a$ and $A_b$ have to be inspected in order to determine which measurement is "stochastically"/"probabilistically" superior. Consider a case where $\mathbb{P}(X_{a_i} > X_{b_i})$ = 0.1, $\mathbb{P}(X_{b_i} > X_{a_i})$ = 0.3 and $\mathbb{P}(X_{a_i} = X_{b_i})$ = 0.6. In this case $A_a = \mathbb{P}(X_{a_i} > X_{b_i}) + .5 \mathbb{P}(X_{a_i} = X_{b_i})$ = 0.7 \> 0.5. However, $A_b = \mathbb{P}(X_{a_i} > X_{b_i}) + .5 \mathbb{P}(X_{a_i} = X_{b_i})$ = 0.9 \> 0.7 = $A_a$. Thus, for a pair of dependent measurements, the measurement under condition ***b*** is "stochastically"" superior even though $A_a$ \> 0.5. Therefore, whenever the user selects this effect size, both population effects are estimated.

Nonparametric estimators of these population effects are given by (Vargha & Delaney, 2000):

$$\hat{A}_{a} = \frac{1}{n} \sum_{i = 1}^{n}I_{\{x_{a_i} \geq x_{b_i}\}}(x_{a_i}, x_{b_i})$$

with 
$$I_{\{x_{a_i} \geq x_{b_i}\}}(x_{a_i}, x_{b_i}) = \begin{cases} 0 & \text{if}\qquad x_{a_i} \lt x_{b_i}\\ 0.5 & \text{if} \qquad x_{a_i} = x_{b_i}\\ 1 & \text{if} \qquad x_{a_i} \gt x_{b_i} \end{cases}$$

and

$$\hat{A}_{b} = \frac{1}{n} \sum_{i = 1}^{n}I_{\{x_{b_i} \geq x_{a_i}\}}(x_{a_i}, x_{b_i})$$

with 
$$I_{\{x_{b_i} \geq x_{a_i}\}}(x_{a_i}, x_{b_i}) = \begin{cases} 0 & \text{if}\qquad x_{b_i} \lt x_{a_i}\\ 0.5 & \text{if} \qquad x_{a_i} = x_{b_i}\\ 1 & \text{if} \qquad x_{b_i} \gt x_{a_i} \end{cases}$$

with $\sum_{i = 1}^{n}I_{\{x_{ia|b} \geq x_{ib|a}\}}(x_{a_i}, x_{b_i})$ being the sum of pairs of dependent observations in which a person's score under condition ***a***/ ***b*** is higher than or equal to the same person's score under condition ***b***/***a*** (with ties given a value/weight of 0.5). This sum is divided by the number of pairs of dependent observations (*n*). Thus, the estimate is the proportion of all such within-participant comparisons in which a participant's score under condition ***a***/ ***b*** is greater than or equal to that participant's score under condition ***b***/***a***.\
If this effect size is chosen by the user, both estimators are provided denoted as $\hat{A}_1$---estimating the superioirty of the measurement under the second condition (e.g., posttest) over the measurement under the first condition (e.g., pretest) (= $\hat{A}_a$ in the notation above)---and $\hat{A}_2$---estimating the superioirty of the measurement under the second condition over the measurement under the first condition(= $\hat{A}_b$ in the notation above).

The approximate $1 - \alpha$ confidence interval is calculated with Pratt's method, adapted to the *PS* for dependent groups by Wilcox(2011).\
Assuming that we observe *w* successes ( $x_{a_i} \geq x_{b_i}$/$x_{b_i} \geq x_{a_i}$ )---with ties given a value/weight of 0.5---among *n* trials, to determine the upper limit *UL* of the confidence interval we compute:

$$A = (\frac{w + 1}{n - w})^2$$ 

$$B = 81(w+1)(n-2)-9n-8$$ 

$$C = -3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9(w+1)(n-w)(9n+5- \Phi^{-1}(1 - \frac{\alpha}{2}) ^2)+n+1}$$ 

$$D = 81(w+1)^2 -9(w+1)(2+ \Phi^{-1}(1 - \frac{\alpha}{2})^2)+1$$ 

$$E = 1+A(\frac{B+C}{D})$$ 

in which case 

$$UL = \frac{1}{E}$$

To get the lower limit *LL* of the confidence interval we compute 

$$A = (\frac{w}{n-w-1})^2$$

$$B = 81(w)(n-w-1) -9n -8$$

$$C = 3 \Phi^{-1}(1 - \frac{\alpha}{2}) \sqrt{9w(n-2-1)(9n+5-\Phi^{-1}(1 - \frac{\alpha}{2}) ^2) + n + 1}$$

$$D = 81w^2 - 9w(2+ \Phi^{-1}(1 - \frac{\alpha}{2}) ^2) + 1$$

$$E = 1 + A(\frac{B+C}{D})$$

in which case

$$LL = \frac{1}{E}$$

Additionally, an $1 - \alpha$ percentile bootstrap confidence interval is implemented.

<br>

<h3 id="DG_NP_GOR">Generalized Odds Ratio (\(OR_g\))</h3>

the population effect of interest is given by:

$$OR_{gpop} = \frac{\mathbb{P}(X_{a_i} > X_{b_i})}{\mathbb{P}(X_{b_i} > X_{a_i})} $$

-   $X_{a_i}$ is the score of an individual under condition ***a***
-   $X_{b_i}$ is the score of that same (or related or matched) individual under condition ***b***.

The $OR_{gpop}$---also known as Agresti's alpha---measures the odds that within a randomly sampled pair of dependent scores (e.g., pre- and posttest measurements), the score under condition ***a*** (e.g., posttest) is superior to the score under condition ***b*** (e.g., pretest).

A nonparametric estimator that does not make assumptions about the shape of the two population distributions given by (Grissom & Kim, 2012):

$$ OR_g = \frac{\hat{p}_{a>b}}{\hat{p}_{b>a}}$$

Thus, the generalized odds ratio ( $OR_g$ ) is the probability of superiority of condition ***a*** compared to condition ***b*** divided by the probability of superiority of condition ***b*** compared to condition ***a***. When there are no ties present/when ties are ignored, the above estimator can be rewritten as:

$$OR_g = \frac{\hat{p}_{a>b}}{1 - \hat{p}_{a>b}}$$

and can be considered a function of the Probability of Superiority ES measure $\hat{p}_{a>b}$ described above.

We could not identify a closed form formula for the confidence interval of this nonparametric effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h3 id="DG_NP_DM">Dominance measure (\(DM\))</h3>

Cliff(1993) defines the dominance measure, referred to by him as $\delta$, equivalent to the dominance measure discussed in the independent section: $$ DM = \mathbb{P}(X_a > X_b) - \mathbb{P}(X_b > X_a) $$ $DM$ is calculated by adding the within-subject difference ( $\delta_w$ ), and the average between-subject dominance ( $\delta_b$ ) for dependent data. $\delta_w$ is the probability that individuals change in a given direction whereas $\delta_b$ is the proportion of scores on the second occasion that are higher than scores by other individuals on the first. Therefore, the dominance measure for dependent groups can be calculated as follows: $$  ds = d_w + d_b$$

with $d_w$ being 

$$d_w = \sum{\frac{d_{ii}}{n}}$$

with $d_{ii}$ being 

$$d_{ii} = sign(x_{a_i} - x_{b_i})$$

and $d_b$ being 

$$d_b = \frac{\sum{\sum}_{i \ne j}d_{ij}}{n(n-1)}$$

wit $d_{ij}$ being

$$d_{ij} = sign(x_{a_i} - x_{b_j})$$

$d_w$ which is the proportion of subjects who change in one direction, minus the proportion who do the opposite as well as $d_b$, which is the proportion of scores on the second occasion that are higher than scores by other individuals on the first minus the reverse can also be interpreted as effect sizes of their own.

The lower limit of the exact $1 - \alpha$ confidence interval can be calculated as follows $$ UL =  ds + z_{a/2}(\frac{\widehat{Var}(d_b + d_w)}{\sqrt{n}}) $$ and the upper limit as $$ LL =  ds - z_{a/2}(\frac{\widehat{Var}(d_b + d_w)}{\sqrt{n}}) $$

with $\widehat{Var}(d_b + d_w)$ being

$$\widehat{Var}(d_b + d_w) = s_{d_w}^2 + s_{d_b}^2 + 2 \widehat{Cov}(d_b, d_w)$$

and the individual terms being given by:

$$\widehat{Cov}(d_b, d_w) = \frac{\sum_i[(\sum_i d_{ij} + \sum_j d_{ji})d_{ii}]-2n(n-1)d_b d_w}{n(n-1)(n-2}$$

$$s_{d_w}^2 = \frac{1}{n-1} \sum_{i=1}^{n} (d_{ii} - d_w)^2$$

$$s_{d_b}^2 = \frac{(n-1)^2(\sum  d_{i.}^{*2} + d_{.i}^{*2} + 2\sum d_{i.}^{*}d_{i.}^{*}) - \sum d_{ij}^{*2} - \sum\sum d_{ij}^{*} d_{ij}^{*} }{n(n-1)(n-2)(n-3)}$$

$$d_{i.}^{*} = d_{i.} - d_b$$

$$d_{i.} = \frac{1}{n} \sum_{j=1}^{n} I_{\{x_{a_i} > x_{b_j} \}}(x_{a_i}, x_{b_j})$$

$$d_{.i}^{*} = d_{.i} - d_b$$

$$d_{.i} = \frac{1}{n} \sum_{j=1}^{n} I_{\{x_{a_i} < x_{b_j} \}}(x_{a_i}, x_{b_j})$$

$$d_{ij}^{*} = d_{ij} - d_b$$

with $d_{i.}$ being the proportion of pretest scores being higher than i's posttest score.

Additionally, a $1 - \alpha$ percentile bootstrap confidence interval is implemented.

<br>

<hr>

<h2 id="IG-D-NP-refs">

References

</h2>

Conover, W. J. (1999). *Practival nonparametric statistics* (3rd ed.). John Wiley & Sons. Cousineau, D. (2020). Approximating the distribution of Cohen's $d_p$ in within--subject designs. *The Quantitative Methods for Psychology*, *16*(4), 418--421. <https://doi.org/10.20982/tqmp.16.4.p418>

Del Giudice, M. (2019). *Measuring sex differences and similarities*. Gender and sexuality development: Contemporary theory and research.

Cliff, N. (1993). Dominance statistics: Ordinal analyses to answer ordinal questions. *Psychological Bulletin*, *114*(3), 494--509. <https://doi.org/10.1037/0033-2909.114.3.494>

Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>

Grissom, R. J., & Kim, J. J. (2005). *Effect sizes for research: A broad practical approach*. Lawrence Erlbaum Associates.

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Routledge.

Grice, J. W., & Barrett, P. T. (2014). *A note on Cohen's overlapping proportions of normal distributions*. Psychological Reports, 115(3), 741-747.

Hedges, L. V., & Olkin, I. (1985). *Statistical methods for meta-analysis*. Academic press.

Hollander, M., Wolfe, D. A., & Chicken E. (2014). *Nonparametric statistical methods* (3rd ed.). John Wiley & Sons

Kraemer, H. C., & Andrews, G. (1982). A nonparametric technique for meta-analysis effect size calculation. *Psychological Bulletin*, *91*(2), 404--412. <https://psycnet.apa.org/doi/10.1037/0033-2909.91.2.404>

Steiger, J.H, & Fouladi, R.T. (1997). Noncentrality interval estimation and the evaluation of statistical methods. In L.L. Harlow, S.A, Mulaik, & J.H. Steiger (Eds.), *What if There Were no Significance Tests?* (pp. 221--257). Mahwah: Lawrence Erlbaum Associates.

Vargha, A., & Delaney, H. D. (2000). A critique and improvement of the CL common language sffect size statistic of McGraw and Wong. *Journal of Educational and Behavioural Statistics*, *25*(2), 101--132. <https://doi.org/10.3102/10769986025002101>

Wilcox, R. R. (2011). *Introduction to robust estimation and hypothesis testing.* Academic press.
