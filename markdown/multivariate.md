<link rel="stylesheet" href="markdown_documentation_style.css">

<div class="toc_container">
<h2 class="toc_title">Table of contents</h2>
<a href="#mult_intro"><h3>1 The multivariate design</h3></a>
<a href="#mult_normality_homoscedasticity"><h3>2 Multivariate measures assuming multivariate normality and equal population covariance matrices</h3></a>
 <ul>
  <li><a href="#mult_normality_SLD"><h4>2.1 Measures of standardised location difference</h4></a>
    <ul>
      <li><a href="#mult-m_d"><h5>2.1.1 Mahalanobis' \(D\)</h5></a></li>
      <ul>
        <li><a href="#mult_H2"><h6>2.1.1.1 \(H_2\) </h6></a></li>
        <li><a href="#mult_EPV2"><h6>2.1.1.2 \(EPV_2\) </h6></a></li>
      </ul>
      <li><a href="#mult-m_d_corrected"><h5>2.1.2 The bias-corrected Mahalanobis' \(D\)</h5></a></li>
    </ul>
  </li>
    <li><a href="#mult_overlap_measures"><h4>2.2 Measures of (non-) overlap </h4></a>
    <ul>
     <li><a href="#mult_ovl"><h5>2.2.1 The multivariate Coefficient of Overlapping (\(OVL\))</h5></a></li>
     <li><a href="#mult_ovl2"><h5>2.2.2 The multivariate Coefficient of Overlapping Two (\(OVL_2\))</h5></a></li>
     <li><a href="#mult_U1"><h5>2.2.3 Cohen's \(U_1\) </h5></a></li>
     <li><a href="#mult_U3"><h5>2.2.4 Cohen's \(U_3\)</h5></a></li>
    </ul>
  </li>
        <li><a href="#mult_normality_EF"><h4>2.3 Probabilistic measures of effect </h4></a>
          <ul>
           <li><a href="#mult_CLES"><h5>2.3.1 Common language ES (\(CLES\)) </h5></a></li>
           <li><a href="#mult_PCC"><h5>2.3.2 Probability of correct classification (\(PCC\))</h5></a></li>
          </ul>
        </li>
      <li>
      </ul>
    <ul>
      <li><a href="#mult_normality_homoscedasticity_tail"><h4>2.4 Measures of difference in group tails </h4></a>
        <ul>
          <li><a href="#mult_TR"><h5>2.4.1 Tail ratio (\(TR\))</h5></a></li>
        </ul>
      </li>
    </ul>
<a href="#mult_normality"><h3>3 Multivariate measures assuming normally distributed population</h3></a>
    <ul>
      <li><a href="#mult_normality_spread"><h4>3.1 Measures of differences in group spread</h4></a>
        <ul>
            <li><a href="#mult_VR"><h5>3.1.1 Variance ratio (\(VR\))</h5></a></li>
        </ul>
    </ul>
  <a href="#mult-refs"><h3>4 References</h3></a>
</div>

<h2 id="mult_intro">1 The multivariate design </h2>

As emphasised by Thompson (1994), whenever the model of reality one wishes to investigate is multivariate in nature, in the sense that interest lies in multiple dependent variables which are interrelated and influenced by multiple, also interrelated independent variables, one should utilise a matching (i.e., multivariate) analytical model. Thus, hypotheses about group differences in multidimensional psychological constructs are best addressed by computing multivariate ESs. By simultaneously considering all the interrelations among all variables present in the data, multivariate analysis yields different results than a series of univariate analyses. It follows that multivariate ESs used for quantifying group differences in multidimensional constructs reflect not simply the sum of univariate group differences in the dependent variables but explicitly model the correlation between these variables as well. 

Under the assumptions that the dependent variables of interest follow a multivariate normal distribution in each population and that the covariance matrix of these variables is equal in both populations, multivariate counterparts of a number of ES described in the documentation tab of the page on ES in the independent groups design can be defined.  

<br>

<h2 id="mult_normality_homoscedasticity"> 2 Multivariate measures assuming multivariate normality and equal population covariance matrices </h2>

<h3 id="mult_normality_SLD">2.1 Measures of standardised location difference </h3>

<h4 id="mult-m_d"> 2.1.1 Mahalanobis' \(D\) </h4>

The population ES of interest is given by (Mahalanobis, 1936/2019): 

$$ D = \sqrt{ \mathbf{(\mathbf{\mu_a} - \mathbf{\mu_b})}^T \mathbf{\Sigma}^{-1} \mathbf{(\mathbf{\mu_a} - \mathbf{\mu_b})} } $$

with $\mathbf{(\mathbf{\mu_a} - \mathbf{\mu_b})}$ being the vector of population mean differences on the dependent variables of interest and $\mathbf{\Sigma}^{-1}$ being the inverse of the common population covariance matrix of said variables. 

The Mahalanobis distance $D$ generalises the concept of a standardised difference between means from the one-dimensional case to higher dimensions (Olejnik & Algina, 2000). Just as Cohen’s $d$ describes the distance between two group means in terms of the common standard deviation of the two groups, so does $D$ measure the distance between the mean vectors (centroids) of the two groups in terms of the common multivariate standard deviation of the two groups (Del Giudice, 2009). In fact $D$ is a function of the Cohen’s $d$’s of the dependent variables of interest (e.g., Olejnik & Algina, 2000): The above definition can be rewritten in terms of the vector of Cohen's $\delta$'s of the dependent variables of interest ( $\mathbf{\delta}$ ) and the inverse of the common correlation matrix of the variables ( $\mathbf{P}^{-1}$ ):  

$$ D = \sqrt{ \mathbf{\delta}^T \mathbf{P}^{-1} \mathbf{\delta} } $$

Importantly, however, $D$ is not a simple sum or average of the univariate $d$ values since as a tool for multivariate analysis it takes the correlations between the analysed dependent variables into account. When the dependent variables are correlated, $D$ will almost certainly be larger than any of the univariate $d$’s, such that a number of small differences on distinct dimensions of a psychological construct can result in a sizeable overall pattern of dissimilarity between two groups (Del Giudice, 2009; Del Giudice, 2013). However, it is not possible to say whether the observed value of $D$ is the result of equal contributions of differences on the individual dimension or the result of large differences on a single or only a few dimensions (Del Giudice, 2017). Also, as a measure of geometrical distance, $D$ can only be positive and thus can only serve as a measure of the global pattern of similarity/dissimilarity between two compared groups (Del Giudice, 2009). As a result $D$ provides no information about the pattern of directional differences (Del Giudice, 2009). To address the former issue Del Giudice (2017, 2018) proposes two indices, $H_2$ and $EPV_2$, to capture the heterogeneity in the contributions of the individual variables (see below). Scrutinising the individual Cohen's $d$ values and the correlation structure of all dependent variables can help address both the issue of heterogeneity and of the pattern of directional differences, highlighting the fact that uni- and multivariate ESs are complementary rather than conflicting tools (Del Giudice, 2009). Lastly, it should be noted that the use of $D$ as a measure of effect is not without its critique which can be read up on in Del Giudice (2013),  Hyde (2014) and Stewart-Williams & Thomas (2013) for example. We highlight two important conclusions to draw from the mentioned discourse. Firstly, one should only include conceptually related variables in the computation of $D$, such as those measuring distinct dimensions of a psychological construct, in order to avoid artificially inflating the size of $D$ by adding superfluous variables (Del Giudice, 2013). Secondly, the estimator $\hat{D}$ has an upward bias that can be quite large when the collected sample size is low relative to the number of dependent variables as well as when the population value of $D$ is small. Therefore, a bias correction should be applied to $\hat{D}$ much like to Cohen’s $d$ in the univariate case. The latter approach yields the bias corrected estimator $\hat{D}_u$ which is implemented as well (Del Giudice, 2022; Lachenbruch & Mickey, 1968).

The sample estimator of the population effect is given by (e.g., De Maesschalck, 2000, Olejnik & Algina, 2000):

$$ \hat{D} = \sqrt{ \mathbf{(\mathbf{\bar{X}_a} - \mathbf{\bar{X}_b})}^T \mathbf{S}^{-1} \mathbf{(\mathbf{\bar{X}_a} - \mathbf{\bar{X}_b})} } = \sqrt{ \mathbf{d}^T \mathbf{R}^{-1} \mathbf{d} } $$

Exact confidence intervals based on the noncentral *F* distribution are computed according to Reiser (2001).

Firstly, $\hat{D}$ is transformed into a statistic termed *F* here, that follows an *F* distribution with $p$ numerator degrees of freedom, $n_a + n_b - p - 1$ denominator degrees of freedom, and a noncentrality parameter of $\lambda = D^2 \frac{n_a n_b}{n_a + n_b}$:

$$ F = \frac{n_a n_b (n_a + n_b - p -1)}{(n_a + n_b)(n_a + n_b - 2) p} \hat{D}^2 \sim F_{p, n_a + n_b - p - 1}(D^2 \frac{n_a n_b}{n_a + n_b}) $$

Secondly, the non-centrality parameter $\lambda_L$ of the noncentral *F* distribution with $df_1 = p$ and $df_2 = n_a + n_b - p - 1$ degrees of freedom which has $\hat{D}^2$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for. If $\mathbb{P}\left(F_{p, n_a + n_b - p - 1}(ncp = 0) \leq \hat{\lambda} \right) \leq 1 - \frac{\alpha}{2}$ then $\lambda_L$ is set to 0.

Next, the non-centrality parameter $\lambda_U$ of the noncentral *F* distribution with $df_1 = p$ and $df_2 = n_a + n_b - p - 1$ degrees of freedom which has $\hat{D}^2$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. If $\mathbb{P}\left(F_{p, n_a + n_b - p - 1}(ncp = 0) \leq \hat{\lambda} \right) \leq \frac{\alpha}{2}$ then $\lambda_U$ is set to 0. Thus, a confidence interval of $(0, 0)$ is a possibility.  

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $\hat{D}$:

$$ LL = \lambda_L \frac{n_a + n_b}{n_a n_b} $$

$$ UL = \lambda_U \frac{n_a + n_b}{n_a n_b} $$ 

Resiser (2001) noted that while the actual coverage rate is conservative ( $1 - \frac{\alpha}{2}$ ) when $D = 0$, the procedure yields close to nominal coverage rates for values of $D > 0$.  

Additionally, a $1 - \alpha$ percentile bootstrap confidence interval is implemented.  

<br>

<h5 id="mult_H2"> 2.1.1.1 \(H_2\) </h5>

As remarked above, it is impossible to assess whether an observed value of $\hat{D}$ is the result of equal contributions of differences on all $p$ studied dependent variables or is mainly driven by very large differences on a small number of variables (Del Giudice, 2017). The first of the two measures introduced by Del Giudice (2017, 2018) to address this conundrum is the $H_2$ statistic. It attempts to measure the inequality in the contributions of differences on individual variables by computing the (corrected) Gini index of the absolute values of individual "contribution" scores $C_i$. The $p$ "contribution" scores are computed based on a decomposition of $\hat{D}^2$:  

$$ \hat{D}^2 = \mathbf{d}^T \mathbf{R}^{-1} \mathbf{d} = \sum_{i = 1}^{p} \sum_{j = 1}^{p} \mathbf{R}^{-1}_{ji} d_j d_i = C_i$$

$$ C_i = \sum_{j = 1}^{p}\mathbf{R}^{-1}_{ji} d_j d_i = \left( \sum_{j = 1}^{p} \mathbf{R}^{-1}_{ji} \frac{d_j}{d_i} \right) d^2_i $$

then the absolute values of these scores are ordered such that $|C_{(1)}| < |C_{(2)}| < \ldots < |C_{(p)}|$ and their Gini coefficient is computed:  

$$ H_2 = \frac{(2/p) \sum_{i = 1}^{p} i |C_{(i)}| - [(p + 1)/p] \sum_{i = 1}^{p} |C_{(i)}|}{(p - 1) \bar{|C|}} $$

with $\bar{|C|}$ being the average of the absolute values of all "contribution" scores. As a Gini coefficient $H_2$ ranges from 0 to 1 with a value of 0 indiciating that all variables contributed equally to $D$ and a value of 1 meaning that $D$ is the result of a single difference (which would mean that all but one mean difference is 0).  

However, Del Giudice (2017, 2018) remarks that using $C_i$ to measure the contributions of differences on individual variables is not without its flaws and calls for further research into the matter.  

A $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.  

<br>

<h5 id="mult_H2"> 2.1.1.1 \(EPV_2\) </h5>

The second statistic introduced by Del Giudice (2017, 2018) to address the question whether the observed value of $\hat{D}$ is the result of equal contributions by every dependent variable used for computing it or is mainly driven by a few large differences is called $EPV_2$. It is itself a function of the $H_2$ statistic:  

$$ EPV_2 = 1 - \frac{p - 1}{p} H_2 $$

with $p$ being the number of dependent variables considered. The $EPV_2$ is directly related to the uncorrected Gini coefficient of the absolute values of the "contribution" scores $C_i$ described above. It is defined as the proportion of $p$ variables that would result in the same value of $H_2$ if they had equal absolute contribution scores while the rest of variables would not make any contribution to the value of $\hat{D}$ (Del Giudice, 2017).  

A $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.   

<br>

<h4 id="mult-m_d_corrected">2.1.2 The bias-corrected Mahalanobis' \(D\)</h4>

As mentioned above $\hat{D}$ has a positive bias, which can be corrected. This alternative formula based on Lachenbruch and Mickey (1968) too estimates $D$ and is given by:  

$$ D_u = \sqrt{ \max \{ 0, \hat{D}^2 \frac{n_a + n_b - p -3}{n_a + nb - 2} - p \frac{n_a + n_b}{n_a * n_b} \} } $$

with $\hat{D}$ being calculated as described above and $p$ being the number of dependent variables considered.  

This bias-corrected estimator removes the upward bias of $\hat{D}$, which can get especially large when the collected sample size ( $N = n_a + n_b$ ) is small relative to the number of variables ( $p$ ) and when the population value of $D$ is small ( $D < 0.45$ ) (Del Giudice, 2022).  

A noncentral *F* based CI is implemented as described for $D$ according to Reiser (2001). The limits of the CI obtained using the above method are simply transformed from $\hat{D}$ values into $\hat{D}_u$ values by applying the correction described in this section.  

Additionally, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<h3 id="mult_overlap_measures"> 2.2 Measures of (non-) overlap</h3>

<h4 id="mult_ovl">2.2.1 The multivariate coefficient of overlapping (\(OVL\))</h4>

The multivariate coefficient of overlapping ( $OVL$ ) is defined as the common area under the multivariate probability densities of the two groups---i.e., the proportion of overlap between the multivariate distributions---and is used as a measure of agreement of two multivariate distributions (Reiser, 2001). When the compared groups are assumed to follow multivariate normal distributions with identical covariance matrices the multivariate $OVL$ can be expressed by simply plugging Mahalanobi's $D$ into the normal cumulative distribution function, giving the formula:

$$ OVL = 2 \Phi \left( \frac{-D}{2} \right) $$

with  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.  

The sample estimator under the stated assumptions is simply:  

$$ \hat{OVL} = 2 \Phi \left( \frac{-\hat{D}}{2} \right) $$

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id="mult_ovl2">2.2.2 The Coefficient of Overlapping (\(OVL_2\))</h4>

The multivariate coefficient of overlapping 2 ( $OVL_2$ ) is the proportion of overlap relative to the combined multivariate density function of two contrasted populations (Del Giudice, 2022), which is the amount of combined area under the combined multivariate density shared by the two populations. When the compared groups are assumed to follow multivariate normal distributions with identical covariance matrices the multivariate $OVL_2$ can be expressed as a function of $OVL$ and thus of $D$ (Del Giudice, 2022):

$$ OVL_2 = \frac{OVL}{2 - OVL} = \frac{\Phi(-\hat{D}/2)}{1 - \Phi(-hat{D}/2)} $$

The sample estimator under the stated assumptions is simply: 

$$ \hat{OVL}_2 = \frac{\hat{OVL}}{2 - \hat{OVL}} $$

Grice and Barret(2014) argue that the $OVL$ is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. $OVL$, on the other hand, indicates what proportion of the area a distribution shares with the other distribution which they argue easier to interpret.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id="mult_U1">2.2.3 Cohen's \(U_1\)</h4>

The multivariate Cohen's measure of nonoverlap $U_1$ is the proportion of nonoverlap relative to the combined multivariate density function of two contrasted populations (Del Giudice, 2022), which is the amount of combined area under the combined multivariate density not shared by the two populations. When the compared groups are assumed to follow multivariate normal distributions with identical covariance matrices the multivariate $U_1$ can be expressed as (Del Giudice, 2022):  

$$ U_1 = 1 - \frac{OVL}{2 - OVL} = 1 - OVL_2 $$

with $OVL$ and $OVL_2$ being the ES described above.  

The sample estimator under the stated assumptions is simply: 

$$ \hat{U}_1 = 1 - \frac{\hat{OVL}}{2 - \hat{OVL}} = 1 - \hat{OVL}_2 $$

with $\hat{OVL}$ and $\hat{OVL}_2$ being defined as above.  

Any critique of $OVL_2$ discussed above is equally applicable to Cohen's $U_1$ since both ES quantify overlap/nonoverlap relative to the combined multivariate density function of the contrasted populations.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id="mult_U3">2.2.4 Cohen's \(U_3\)</h4>

Del Giudice (2022) described the multivariate Cohen's measure of nonoverlap $U_3$ as the proportion of one group with combinations of values of the dependent variables that are more typical of that group than the multivariate median of the other group. For a discussion of what defines the typicality of an observation see Del Giudice (2022). When the compared groups are assumed to follow multivariate normal distributions with identical covariance matrices the multivariate $U_3$ can be expressed by simply plugging Mahalanobi's $D$ into the normal cumulative distribution function, giving the formula:  

$$ U_3 = \Phi \left( D \right) $$

with $D$ being Mahalanobi's $D$ (as defined above) and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.  

The sample estimator under the stated assumptions is simply: 

$$ \hat{U}_3 = \Phi \left( \hat{D} \right) $$

with $\hat{D}$ being computed as outlined above.  

We could not identify a closed form formula for the CI for this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h3 id="mult_normality_EF"> 2.3 Probabilistic measures of effect </h3>

<h4 id="IG_P_CLES">2.3.1 The Common Language ES (\(CLES\)) </h4>

Del Giudice (2022) described the multivariate Common Language ES ( $CLES$ ) as the probability that the combination of values of the dependent variables of a randomly selected member of one group is more typical of that group than the combination of values of a randomly sampled member of the other group. For a discussion on what defines the typicality of an observation see Del Giudice (2022). When the compared groups are assumed to follow multivariate normal distributions with identical covariance matrices the multivariate $CLES$ can be expressed by simply plugging Mahalanobi's $D$ into the normal cumulative distribution function, giving the formula:  

$$ CL = \Phi \left( \frac{D}{\sqrt{2}} \right) $$

with $D$ being Mahalanobi's $D$ (as defined above) and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.  

As argued by Mastrich & Hernandez (2021), The $CLES$ can be considered to provide an intuitive way to understand statistical results and therefore aids practitioners in understanding research findings and making informed decisions.  

The sample estimator under the stated assumptions is simply: 

$$ CL_D = \Phi \left( \frac{\hat{D}}{\sqrt{2}} \right) $$

with $\hat{D}$ being computed as outlined above.  

We could not identify a closed form formula for the CI for this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id="mult_PCC"> 2.3.2 Probability of correct classification (\(PCC\)) </h4>

The population effect of interest is the probability of correctly determining the population membership of a randomly drawn individual (with the options being population ***a*** or ***b***)---i.e., the value of the independent variable (group membership)---based on their values of the dependent variables considered. It is given by (Del Giudice, 2022):  

$$ PCC = \Phi \left( \frac{D}{2} \right) $$

with $D$ being Mahalanobi's $D$ (as defined above) and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.   

The sample estimator under the stated assumptions is simply:  

$$ \widehat{PCC} = \Phi \left( \frac{\hat{D}}{2} \right) $$

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h3 id="mult_normality_homoscedasticity_tail"> 2.4 Measures of difference in group tail</h3>

<h4 id="mult_TR"> 2.4.1 Tail ratio (\(TR\)) </h4>

Del Giudice (2022) offers a definition of the $TR$ in multidimensional space as the proportion of members of one group relative to members of the other group found *z* standard deviations from one group’s centroid in the direction of the other group’s centroid. When the compared groups are assumed to follow multivariate normal distributions with identical covariance matrices the multivariate $TR$ can be expressed as (Del Giudice, 2022):  

$$ TR = \frac{\Phi(D - z)}{\Phi(-z)} $$

with $D$ being Mahalanobi's $D$ (as defined above) and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.  

The sample estimator under the stated assumptions is simply: 

$$ \widehat{TR} = \frac{\Phi(\hat{D} - z)}{\Phi(-z)} $$

with $\hat{D}$ being computed as outlined above.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h2 id="mult_normality">3 Multivariate measures assuming normally distributed population </h2>

<h3 id="mult_normality_spread">3.1 Measures of differences in group spread</h3>

<h4 id="mult_VR"> 3.1.1 Variance ratio (\(VR\)) </h4>

The population effect size of interest is given by:  

$$ VR = \frac{|\Sigma|_{a|b}}{|\Sigma|_{a|b}} $$

with $|\Sigma|_{a|b}$ being the determinant of the covariance matrix---also known as the generalised variance (*GV*)---of the respective population. Consequently, in multidimensional space $VR$ is the ratio of the population *generalised* variances with either population ***a*** $VR_{b/a} = \frac{|\Sigma|_b}{|\Sigma|_a}$ or populatoin ***b*** being the reference group $VR_{a/b} = \frac{|\Sigma|_a}{|\Sigma|_b}$. The *GV* is a one-dimensional measure  of multidimensional scatter (for an overview see Sen Gupta, 2004).  

The sample estimator under the stated assumptions is simply:  

$$ \widehat{VR} = \frac{|S|_{a|b}}{|S|_{a|b}} $$

with $|S|_{a|b}$ being the determinant of the respective sample covariance matrix.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h2 id="mult-refs">4 References</h2>  

De Maesschalck, R., Jouan-Rimbaud, D., & Massart, D. L. (2000). The mahalanobis distance. *Chemometrics and intelligent laboratory systems*, *50*(1), 1--18. <https://doi.org/10.1016/S0169-7439(99)00047-7>  

Del Giudice, M. (2022). Measuring Sex Differences and Similarities. In: D.P. VanderLaan & W. I. Wong (Eds.), *Gender and sexuality development: Contemporary theory and research* (Focus on Sexuality Research, 1--38). Springer, Cham. <https://doi.org/10.1007/978-3-030-84273-4_1>  

Grice, J. W., & Barrett, P. T. (2014). A note on Cohen's overlapping proportions of normal distributions. *Psychological Reports*, *115*(3), 741--747. <https://doi.org/10.2466/03.PR0.115c29z4>  

Mahalanobis, P. C. (2019). On the generalized distance in statistics. *Sankhya A*, *80*(1), 1--7. <https://doi.org/10.1007/s13171-019-00164-5> (Reprinted from "On the generalized distance in statistics," 1936, *Proceedings of the National Institute of Sciences of India*, *2*[1], 49--55)  

Reiser, B. (2001). Confidence intervals for the Mahalanobis distance. *Communications in Statistics - Simulation and Computation*, *30*(1), 37--45. <https://doi.org/10.1081/SAC-100001856>  

Thompson, B. (1994, February 25). *Why multivariate methods are usually vital in research: Some basic concepts* [Paper presentation]. Biennial Meeting of the Southwestern Society for Research in Human Development, Austin, TX, United States. <https://eric.ed.gov/?id=ED367687>  