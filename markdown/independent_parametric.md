<div class="toc_container" xmlns="http://www.w3.org/1999/html">
<h2 class="toc_title">Table of contents</h2>
  <ul>
    <li><a href="#IG_P_intro"><h3>1 The independent groups design</h3></a></li>
    <li><a href="#IG_P_normality_homoscedasticity"><h3>2 Measures assuming normally distributed and homoscedastic populations</h3></a>
        <ul>
          <li><a href="#IG_P_normality_SLD"><h4>2.1 Measures of standardised location difference </h4></a>
          <ul>
            <li><a href="#IG_P_cohens_d"><h5>2.1.1 Cohen's \(d\) </h5></a></li>
            <li><a href="#IG_P_hedges_g"><h5>2.1.2 Hedges' \(g\) </h5></a></li>
          </ul>
          </li>
        </ul>
        <ul>
          <li><a href="#IG_P_overlap_measures"><h4>2.2 Measures of (non-)overlap </h4></a>
              <ul>
                <li><a href="#IG_P_OVL"><h5>2.2.1 The coefficient of overlapping (\(OVL\))</h5></a></li>
                <li><a href="#IG_P_OVL2"><h5>2.2.2 The coefficient of overlapping Two (\(OVL_2\)) </h5></a></li>
                <li><a href="#IG_P_U1"><h5>2.2.3 Cohen's \(U_1\) </h5></a></li>
                <li><a href="#IG_P_U2"><h5>2.2.4 Cohen's \(U_2\)</h5></a></li>
                <li><a href="#IG_P_U3"><h5>2.2.5 Cohen's \(U_3\)</h5></a></li>
              </ul>
          </li>
        </ul>
        <ul>
          <li><a href="#IG_P_normality_EF"><h4>2.3.1 Probabilistic measures of effect size </h4></a>
            <ul>
             <li><a href="#IG_P_CLES"><h5>2.3.1 The common language ES (\(CLES\)) </h5></a></li>
             <li><a href="#IG_P_PCC"><h5>2.3.2 Probability of correct classification (\(PCC\)) </h5></a></li>
            </ul>
          </li>
        <li>
        </ul>
    </li>
    <li><a href = "#IG_P_normality_dist_pop"><h3> 3 Measures assuming normally distributed population</h3></a>
    <ul>
      <li><a href="#IG_P_normality_homoscedasticity_SLD"><h4>3.1 Measures of standardised location difference </h4></a>
          <ul>
            <li><a href="#IG_P_glass_dg"><h5>3.1.1 Glass \(d_G\)</h5></a></li>
            <li><a href="#IG_P_hedges_g_G"><h5>3.1.2 Glass' \(g_G\)</h5></a></li>
            <li><a href="#IG_P_bonet_d"><h5>3.1.3 Cohen's \(d'\)</h5></a></li>
            <li><a href="#IG_P_bonett_g"><h5>3.1.4 Hedges' \(g'\)</h5></a></li>
            <li><a href="#IG_P_d2_KS"><h5>3.1.5 Kulinskaya-Staudte's \(d^2_{KS}\)</h5></a></li>
          </ul>
      </li>
    </ul>
      <ul>
        <li><a href="#IG_P_normality_homoscedasticity_tail"><h4>3.2 Measures of difference in group spread and tails </h4></a>
          <ul>
            <li><a href="#IG_P_VR"><h5>3.2.1 Variance ratio (\(VR\))</h5></a></li>
            <li><a href="#IG_P_TR"><h5>3.2.2 Tail ratio (\(TR\))</h5></a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#IG_P_robust"><h3>4 Measures resistant to outliers </h3></a>
     <ul>
      <li><a href="#IG_P_normality_homoscedasticity_SLD"><h4>4.1 Measures of standardised location difference </h4></a>
       <ul>
        <li><a href="#IG_P_d_R"><h5>4.1.1 \(d_R\) (robust Cohen's \(d\))</h5></a></li>
        <li><a href="#IG_P_d_GR"><h5>4.1.2 \(d_{R,\,j}\) (robust Glass \(d_{G,\,j}\))</h5></a></li>
        <li><a href="#IG_P_bonett_d_R"><h5>4.1.3 \(d'_{R}\) (robust Cohen's \(d'\))</h5></a></li>
        <li><a href="#IG_NP_SMD"><h5>4.1.4 Standardized median differences</h5></a>
          <ul>
            <li><a href="#IG_P_d_MAD"><h6> 4.1.4.1 \(d_{MAD}\) </h6></a></li>
            <li><a href="#IG_P_d_RIQ"><h6> 4.1.4.2 \(d_{R_{IQ}}\) </h6></a></li>
            <li><a href="#IG_P_d_bw"><h6> 4.1.4.3 \(d_{bw}\) </h6></a></li>
          </ul>
        </li>
       </ul>
      </li>
     </ul>
    </li>
    <li><h3><a href = "#IG_P_refs"> 5 References</a></h3></li>
  </ul>
</div>

<h2 id="IG_P_intro"> 1 The independent groups design </h2>

The independent groups design---also often referred to as the between-subjects design or the between---group design–is characterised by different groups being exposed to different levels of an independent variable (e.g., experimental conditions). Each test subject can only be a member of one group. Importantly,  no individual's score in one group may be related to or predictable from any individual's score in another group. Thus, the ES described here are applicable to multiple types of studies comparing distinct groups:  
- comparing a group receiving a treatment/intervention (the experimental group) with a different group not receiving any treatment/intervention (the control group). 
- comparing a group receiving a novel treatment/intervention with a different group receiving a gold standard treatment/intervention.  


<br>

<h2 id="IG_P_normality_homoscedasticity"> 2 Measures assuming normally distributed and homoscedastic populations </h2>

<h3 id="IG_P_normality_SLD"> 2.1 Measures of standardised location difference </h3>

<h4 id = "IG_P_cohens_d"> 2.1.1 Cohen's \(d\) </h4>

The population effect size of interest is given by the formula:

$$ \delta = \frac{\mu_a - \mu_b}{\sigma} $$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by their common population standard deviation $\sigma$. The populations of interest might be an experimental group (e.g., a group that receives some form of psychotherapy) and a control group (e.g., a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could be thought of as $\mu_E$, i.e., as the population mean of the experimental group, and $\mu_b$ could be thought of as $mu_C$, i.e., the population mean of the control group.  

$\delta$ tells us how many standard deviation units $\mu_a$ (e.g.,$\mu_E$) lies below or above $\mu_b$ (e.g.,$\mu_C$). Under the assumption that the populations follow normal distributions with equal variances $\delta$ can also be thought of as a *Z* score and can be used to determine what proportion of the population with the lower mean the average/median member of the population with the higher mean outscores---see Cohen's $U_3$.  

This ES assumes homoscedasticity, i.e., $\sigma^2_a = \sigma^2_b = \sigma^2$. Under this assumption $\delta$ and $\Delta$ are identical. However, heteroscedasticity is likely throughout various fields of research and it appears plausible that treatment increases variance in the outcome of interest due to differential responsiveness of subjects to the treatment (Grisson & KIm, 2012, pp. 17-20). Unfortunately, traditional tests of homoscedasticity often fail to produce accurate *p*-values, which makes it difficult to detect heteroscedasticity of population variances (Grissom & Kim, 2012, p. 20). If heteroscedasticity is plausible $\Delta_j$ should be estimated instead (see below).  

The above population effect can be estimated by $d_{G,\,j}$ if homoscedasticity can be assumed. However, in case of homoscedasticity the pooled standard deviation $s_p = \sqrt{\frac{(n_a - 1) s_a^2 + (n_b - 1) s_b^2}{n_a + n_b - 2}}$ is a better estimator of $\sigma$ since it uses more data and thus has a lower sampling variance than $s_a$ or $s_b$.

Thus, the most widely employed estimator for $\delta$ is given by the formula (e.g.,Hedges (1981)):

$$ d = \frac{\bar{X}_a - \bar{X}_b}{s_p} $$

This estimator has a bias. It systematically overestimates the size of the true population effect. This bias can be corrected for---see Hedges' $g$.

A $1 - \alpha$ noncentral *t* CI is implemented according to the method described by Steiger and Fouladi (1997) for constructing CI based on the noncentral *t* distribution.

Firstly, Cohen's $d$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_d$:

$$ \hat{\lambda}_d = \frac{d}{\sqrt{\frac{1}{n_a} + \frac{1}{n_b}}} $$

Then the non-centrality parameter $\lambda_L$ of the noncentral *t* distribution with $\nu = n_a + n_b - 1$ degrees of freedom which has $\hat{\lambda}_d$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral *t* distribution with $\nu = n_a + n_b - 1$ degrees of freedom which has $\hat{\lambda}_d$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d$ :

$$ LL = \lambda_L * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} $$

$$ UL = \lambda_U * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} $$

This CI formula is derived under the assumption that both populations follow a normal distribution and that the variance of the two populations are identical. Fitts (2021) found that the procedure yields consistent coverage rates equivalent to the nominal $1 - \alpha$ level when assumptions are met. Cousineau and Goulet-Pelletier (2020) also reported an excellent coverage rate for this method. The coverage rate was on par with the computation method they have ended up favouring in their article, namely CI based on the non-central $\Lambda'$ distribution.

When sample sizes are small ($n \leq 30$) computation of CI based on the noncentral *t* distribution has been found to perform better than computation of CI based on approximations of the sampling distribution of $d$ (Goulet-Pelletier & Cousineau, 2018; Cousineau & Goulet-Pelletier, 2020). However, approximation methods have the advantage of simplified computation and should not be dismissed since with sufficiently large sample sizes they can be highly accurate (for a review see Viechtbauer, 2007).

Simulations by Algina et al. (2006a) found that when the distribution of only one of the populations deviated from a normal distribution, the noncentral *t* based CI maintained close to nominal $1-\alpha$ coverage rates for various combinations of $\delta$ and $n_a \& n_b$. However, coverage rates dropped when both populations followed non-normal distributions. The deterioration of coverage rates was especially pronounced when the populations followed asymmetric distributions as well as when the value of $\delta$ was large.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. Under the cases of nonnormality studied by Algina et al. (2006a) the percentile bootstrap CI performed comparably  to the approximate CI method. While still relatively stable in terms of coverage rates when only one group does not follow a normal distribution, the method performs increasingly worse with increasing deviation from normality and an increasing size of $\delta$, especially when sample sizes are small($n_a = n_b \le 25$). The authors found similar results for the bias-corrected and accelerated (BCa) bootstrap CI method. Although, it should be noted that, while the BCa method also performed worse when nonnormality became more severe, $\delta$ was larger and $n_a$ and $n_b$ were small, it did perform better than the noncentral *t* based or the percentile bootstrap method. However, Algina et al. (2006b) recommend using a different effect size, $d_{R_p}$, and the percentile bootstrap method when nonnormality is the case!

<br>

<h4 id = "IG_P_hedges_g"> 2.1.2 Hedges' \(g\) </h4> 

As mentioned above $d$ has a slight positive bias, which can be corrected. This alternative formula given by Hedges (1981) estimates $\delta$ and is given by:  

$$ g = \frac{\bar{X}_a - \bar{X}_b}{s_p} * J(\nu) $$

with $\nu = n_a + n_b - 2$ denoting the degrees of freedom and $J(\nu)$ being given by:

$$ J(\nu) = \frac{\Gamma(\frac{\nu}{2})}{\sqrt{\frac{\nu}{2}}\Gamma(\frac{\nu - 1}{2})} $$

CI implementation according to the method described by Hedges and Olkin (1985) which uses the noncentral t distribution to construct a $1 - \alpha$ CI.

Firstly, hedges' $g$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_d$:

$$ \hat{\lambda}_d = \frac{g_p}{\sqrt{\frac{1}{n_a} + \frac{1}{n_b}}} $$

Next the $\frac{\alpha}{2}$ and the  $1 - \frac{\alpha}{2}$ quantiles of the noncentral t distribution with non-centrality parameter $\hat{\lambda}_d$ are identified.
Lastly these quantiles are transformed back into $g$:

$$ LL = t_{df = \nu, \frac{\alpha}{2},ncp = \hat{\lambda}_d} * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} $$

$$ UL = t_{df = \nu, 1 - \frac{\alpha}{2},ncp = \hat{\lambda}_d} * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} $$

Fitts (2021) found that the above procedure yields the most consistent coverage rates for $g_p$ close to the nominal $1 - \alpha$ level among the noncentral t based confidence intervals he compared - when assumptions are met (normality, independence and homogeneity of variances).

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h3 id="IG_P_overlap_measures"> 2.2 Measures of (non-)overlap </h3>

Under the assumption that the populations being compared follow normal distributions with equal variances it is possible to define measures of (non-)overlap which are related to Cohen's $d$ and to each other through the cumulative normal distribution function $\Phi(\cdot)$ (Cohen, 1988).

For the documentation of these measures the following notation will be use:  
Let $X_a$ denote the random variable '*score of a random member of population a*' and $X_b$ denote the random variable '*score of a random member of population b**. Further, let $F_a$ and $F_b$ denote the corresponding absolutely continuous distribution functions and $f_a$ and $f_b$ the corresponding probability density functions respectively.

<br>

<h4 id = "IG_P_OVL"> 2.2.1 The coefficient of overlapping (\(OVL\)) </h4>

The population effect of interest is given by (e.g., Reiser & Faraggi, 1999):

$$ OVL = \int_{-\infty}^{\infty} \min \left \{f_a(x), f_b(x) \right \} dx $$

The coefficient of overlapping ($OVL$) is defined as the common area under two probability densities---i.e., the proportion of overlap between the two distributions/populations---and is used as a measure of agreement of two distributions (Bradley, 2006).  Under the assumption of normality and homoscedasticity the above quantity can be expressed by simply plugging Cohen's $\delta$ into the normal cumulative distribution function, giving the formula:

$$ OVL = 2 \Phi \left( \frac{-|\delta|}{2} \right) $$

$OVL$ = 1 if and only if the two population distributions are identical (i.e., in the case of normal distributions: have the same expectation and variance) and $OVL$ = 0 if and only if the supports of the distributions have no interior points in common (i.e., when the distributions do not overlap at all) which is the reason why $OVL$ can for example be interpreted as a measure of agreement of the two distributions.

A parametric estimator of the above quantity is given by:

$$ \widehat{OVL} = 2 \Phi \left( \frac{-|d|}{2} \right) $$

this estimator is a monotonic function of the absolute value of Cohen's $d$ (see above).

A nonparametric estimator of the population effect can be obtained by using appropriate kernel density estimators and an appropriate quadrature formula (see the documentation tab of the page on nonparametric ES for the independent groups design).

A $1 - \alpha$ CI based on the noncentral *F* distribution is implemented as recommended by Reiser and Faraggi (1999).

Firstly $d$ is transformed into an estimated non-centrality parameter (ncp) $\hat{\eta^2}$:

$$ \hat{\eta^2} = \left( \frac{d}{\nu} \right)^2 = t^2 $$

with $$ \nu = \sqrt{\frac{n_a + n_b}{n_a \cdot n_b}} $$

with $n_{a|b}$  being the sample size of group ***a*** and ***b*** respectively and $t$ being the student's *t*-statistic. Then the ncp $\eta^2_L$ of the noncentral *F* distribution (with $df_1 = 1$ and $df_2 = n_a + n_b - 2$ degrees of freedom) which has $\hat{\eta^2}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for. If $\mathbb{P} \left( F_{1, n_a + n_b - 2}(ncp = 0) \leq \hat{\eta^2} \right) \leq 1 - \frac{\alpha}{2}$ then $\eta^2_L$ is set to 0.

Next, the non-centrality parameter $\eta^2_U$ of the noncentral *F* distribution (with $df_1 = 1$ and $df_2 = n_a + n_b - 2$ degrees of freedom) which has $\hat{\eta^2}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. If $\mathbb{P}\left(F_{1, n_a + n_b - 2}(ncp = 0) \leq \hat{\eta^2} \right) \leq \frac{\alpha}{2}$ then $\eta^2_U$ is set to 0.

The identified upper and lower confidence limits of $\eta^2$ are then transformed back into $\widehat{OVL}$:

$$ LL = 2 \Phi \left( \frac{-(\eta^2_U \cdot \nu)}{2} \right) $$

$$ UL = 2 \Phi \left( \frac{-(\eta^2_L \cdot \nu)}{2} \right) )$$

This method yields a noncentral *F* based approximate CI. This CI formula, just as the formula for the estimator, is derived under the assumption that both populations follow normal distributions with equal variances. Simulations by Reiser and Faraggi (1999) found that when assumptions are met, this method showed close to nominal $1 - \alpha$ coverage rates for various values of $\delta$ and outperformed alternative CI procedures when the value of $\delta$ and/or sample sizes are small.

Additionally, a $1 - \alpha$ percentile bootstrap CI is implemented.

<br>

<h4 id = "IG_P_OVL2"> 2.2.2 The coefficient of overlapping two (\(OVL_2\)) </h4>

The population effect of interest is given by:

$$ OVL_2 = \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = \frac{OVL}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} $$

The coefficient of overlapping 2 ($OVL_2$) is the proportion of overlap relative to the joint distribution of two contrasted populations (DelGiudice, 2019), which is the amount of combined area shared by the two populations. Under the assumption of normality and homoscedasticity the above quantity can be expressed by as a function of $OVL$ (DelGiudice, 2019):

$$ OVL_2 = \frac{OVL}{2 - OVL} $$

and thus the estimator is given by:

$$ \widehat{OVL}_2 = \frac{\widehat{OVL}}{2 - \widehat{OVL}} $$

Grice and Barret(2014) argue that the $OVL$ is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unintuitive. $OVL$, on the other hand, indicates what proportion of the area a distribution shares with the other distribution which is easier to interpret.

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h4 id="IG_P_U1"> 2.2.3 Cohen's \(U_1\) </h4>

The population effect of interest is given by:

$$ U_1 = \frac{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx  - \int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - OVL_2 $$

Cohen's $U_1$ can be interpreted as proportion of nonoverlap relative to the joint distribution of two populations (DelGiudice, 2019), which is the amount of combined area not shared by the two populations (Cohen, 1988). It is characterized by the following formula under the assumption of normality and homoscedasticity (Cohen, 1988):

$$ U_1 = \frac{2 \Phi \left( \frac{|\delta|}{2} \right) - 1}{\Phi \left( \frac{  |\delta|}{2} \right)} = \frac{2 \left(1 - \Phi \left(\frac{-|\delta|}{2}\right)\right) - 1}{1 - \Phi \left(\frac{-|\delta|}{2}\right)} = \frac{1 - 2 \Phi\left(\frac{-|\delta|}{2}\right)}{\frac{1}{2}\left(2 - OVL\right)} = \frac{2(1 - OVL)}{2 - OVL} = \frac{(2 - OVL) - OVL}{2 - OVL} = 1 - \frac{OVL}{2 - OVL} = 1 - OVL_2 $$

with $\delta$ being Cohen's $\delta$---which is effectively a deviate in the unit normal curve---and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate; and $OVL$ and $OVL_2$ being the ES described above.

A parametric estimator of the above quantity is given by:

$$ \hat{U_1} = \frac{2 \Phi \left( \frac{|d|}{2} \right) - 1}{\Phi \left( \frac{|d|}{2} \right)} = 1 - \frac{\widehat{OVL}}{2 - \widehat{OVL}} = 1 - \widehat{OVL}_2 $$

with $d$ being Cohen's $d$ and $\widehat{OVL}$ and $\widehat{OVL}_2$ being defined as above.

Any critique of $OVL_2$ discussed above is equally applicable to Cohen's $U_1$ since both ES quantify overlap/nonoverlap relative to the joint distribution of the contrasted populations.

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h4 id="IG_P_U2"> 2.2.4 Cohen's \(U_2\) </h4>

The population effect on interest is is the proportion of population ***a*** that exceeds the same proportion in population ***b***. Thus, a value of 0.7 for example means that the top 70% of population ***a*** exceed the bottom 70% of population ***b***. Under the assumption of normality and homoscedasticity this quantity can be expressed by simply plugging Cohen's $\delta$ into the normal cumulative distribution function, giving the formula:

$$ U2 = \Phi \left( \frac{\delta}{2} \right) $$

with $\delta$ being Cohen's $\delta$ (as defined above)---which is effectively a deviate in the unit normal curve---and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.

A parametric estimator of the above quantity is given by:

$$ \hat{U}_2 = \Phi \left( \frac{d}{2} \right) $$

with $d$ being Cohen's $d$---which again is effectively a deviate in the unit normal curve.

We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

<br>

<h4 id="IG_P_U3"> 2.2.5 Cohen's \(U_3\) </h4>

For the following description we assume that group ***a*** has a higher mean than group ***b***.

The population effect of interest is given by:

$$ U_3 = F_b(Q_a(0.5)) $$

with $F_b(\cdot)$ being the cumulative distribution function of population ***b*** and $Q_a(\cdot)$ being the quantile function of population ***a***. Consequently, Cohen's measure of nonoverlap $U_3$ is the proportion of the population with the lower mean (***b***) which the upper half of the cases (the top 50%) of the population with the higher mean (***a***) exceeds (Cohen, 1988). Thus, a value of 0.7 for example means that the top 50% of population ***a*** exceed 70% of population ***b***. Alternatively, one could conclude that the median member of population ***a*** exceeds 70% of the members of population ***b***. Under the assumption of normality and homoscedasticity this quantity can be expressed by simply plugging Cohen's $\delta$ into the normal cumulative distribution function, giving the formula:

$$ U_3 = \Phi \left( |\delta| \right) $$

with $\delta$ being Cohen's $\delta$ (as defined above)---which is effectively a deviate in the unit normal curve---and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.

A parametric estimator of the above quantity is given by:

$$ \hat{U}_3 = \Phi \left( |d| \right) $$

with $d$ being Cohen's $d$---which again is effectively a deviate in the unit normal curve.

We could not identify a closed form formula for the CI for this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>

<h3 id="IG_P_normality_EF"> 2.3 Probabilistic measures of effect size </h3>

<h4 id = "IG_P_CLES"> 2.3.1 The common language ES (\(CLES\)) </h4>

The population effect of interest is given by:

$$ \mathbb{P} \left( X_a > X_b \right) $$

that is, the probability that a randomly selected score from population ***a*** exceeds a randomly selected score from population ***b***. As argued by Mastrich & Hernandez (2021), The *CL* ES can be considered to provide an intuitive way to understand statistical results and therefore aids practitioners in understanding research findings and making informed decisions.

The parametric estimator, which assumes normality and homoscedasticity of the two populations, implemented in this application is given by (McGraw & Wong, 1992):

$$ CL = \Phi \left( \frac{\bar{X}_a - \bar{X_b}}{\sqrt{s_a^2 + s_b^2}} \right) $$

One of many alternate parametric estimators (e.g., see Grissom, 1994) of the above population effect is:

$$ CL_d = \Phi \left( \frac{d}{\sqrt2} \right) $$

When $n_a = n_b = n$, $CL_d = \Phi ( \frac{\bar{X}_a - \bar{X}_b}{\sqrt{\frac{(n-1)(s_a^2 + s_b^2)}{\frac{2(n-1)}{2}}}} ) =  \Phi ( \frac{\bar{X}_a - \bar{X_b}}{\sqrt{s_a^2 + s_b^2}} ) = CL$. However, when $n_a \neq n_b$, $CL_d$ only approximates the value of $CL$ ($CL_d \approx CL$).  

No closed form formulas were identified for the computation of a ($1 - \alpha$) CI for the *CL* ES. Mastrich & Hernandez (2021) recommends to transform the bounds of the CI of $d$ "to provide a sense of uncertainty around the reported CLES" (p. 733). The user of this application can use the above formula on the CI limits given by the application for $d$ to transform these limits into $CL_d$ values, if they wish to do so. Otherwise, a $1 - \alpha$ percentile bootstrap CI is computed and can be used to communicate said uncertainty.

Two nonparametric estimators of the above population effect that do not make the normality or homoscedasticity assumptions of the *CL* ES, are called the probability of superiority (*PS*; Grissom, 1994) and the *A* measure of stochastic superiority (Vargha & Delaney, 2000) (see the documentation tab of the page on nonparametric ES for the independent groups design). As discussed by Grissom and Kim (2001) and Vargha and Delaney (2000) these estimators can be considered preferable to the  parametric estimator and if raw data is available the user is best advised to compute one of them alongside the *CL* ES.

<br>

<h4 id="IG_P_PCC"> 2.3.2 Probability of correct classification (\(PCC\)) </h4>

The population effect of interest is the probability of correctly determining the population membership of a randomly drawn individual (with the options being population ***a*** or ***b***)---i.e., the value of the independent variable (group membership)---based on their value on the dependent variable (e.g., score on an outcome variable of interest).  

This quantity is an important parameter for classification procedures such as logistic regression, linear discriminant analysis (LDA) or quadratic discriminant analysis (QDA) just to name a few (James et al., 2013). Under the assumptions that the two populations are of equal size, that the dependent variable used for classification follows a normal distribution in both populations and that these normal distributions are homoscedastic, the $PCC$ of the Bayes classifier, which is the classifier with the highest $PCC$ amongst all potential classifiers, can be considered as the population effect of interest and it is given by  

$$ PCC = \Phi \left( \frac{|\delta|}{2} \right) $$

with $\delta$ being Cohen's $\delta$ (see above). This follows from the fact that the Bayes classifier assigns any observation with a value on the dependent variable larger than $\frac{\mu_a + \mu_b}{2}$ membership to population ***a*** and membership to population ***b*** otherwise (if $\mu_a \gt \mu_b$ and vice versa if $\mu_a \lt \mu_b$) (James et al., 2013). When  $\mu_a \gt \mu_b$ the probability of a member of population ***b*** having a score lower than $\frac{\mu_a + \mu_b}{2}$ (and thus being correctly classified based on the above decision rule) is equal to $\Phi \left( \frac{1}{\sigma} \left( \frac{\mu_a + \mu_b}{2} - \mu_b \right) \right) = \Phi \left( \frac{\mu_a - \mu_b}{2\sigma} \right) = \Phi \left( \frac{\delta}{2} \right)$ and here $\delta = |\delta|$ since $\mu_a > \mu_b$.  

Under the aforementioned assumptions LDA approximates the Bayes classifier by plugging in sample estimates for the population parameters used for deriving the Bayes classifier resulting in the classification rule of assigning any observation with a value on the dependent variable larger than $\frac{\bar{X}_a + \bar{X}_b}{2}$ membership to population ***a*** and membership to population ***b*** otherwise (if $\bar{X}_a \gt \bar{X}_b$ and vice versa if $\bar{X}_a \lt \bar{X}_b$). Thus, $PCC$ can be estimated by plugging in the sample estimate of $\delta$ into the above formula (Del Giudice, 2019).   

$$ \widehat{PCC} = \Phi (\frac{|d|}{2}) $$

with $d$ being Cohen's $d$.

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.

<br>  

<h2 id="IG_P_normality_dist_pop"> 3 Measures assuming normally distributed populations </h2>

<h4 id="IG_P_normality_homoscedasticity_SLD"> 3.1. Measures of standardised location difference </h4>

<h4 id = "IG_P_glass_dg"> 3.1.1 Glass' \(d_G\) </h4>

The population effect of interest is given by:

$$ \Delta_j = \frac{\mu_a - \mu_b}{\sigma_j} $$

with two groups this results in the effects:

$$ \Delta_a = \frac{\mu_a - \mu_b}{\sigma_a} $$

$$ \Delta_b = \frac{\mu_a - \mu_b}{\sigma_b} $$

The difference in means between two independent populations $\mu_a - \mu_b$ is standardised by the population standard deviation of population ***a*** or population ***b*** $\sigma_{(a|b)}$.  

$\Delta_a$ tells us how many population ***a*** standard deviation units $\mu_a$ (e.g.,$\mu_E$) lies below or above $\mu_b$ (e.g.,$\mu_C$). $\Delta_b$ tells us how many population ***b*** standard deviation units $\mu_a$ (e.g., $\mu_E$) lies below or above $\mu_b$ (e.g., $\mu_c$).  

More interestingly perhaps, $\Delta_j$ is rather similar to a *Z* score. Consequently, if the mean difference is standardised by the standard deviation of the population with the lower mean and if further that population follows a normal distribution, $\Delta_j$ can be used to determine what proportion of the population with the lower mean the average member of the population with the higher mean outscores (see Cohen's $U_3$ above). Like with a *Z* score, this information can be derived from the cumulative distribution function of the standard normal distribution. If scores are not normally distributed such convenient interpretations are no longer applicable. 

Treatments can increase the variance in an outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & Kim, 2012, pp. 17-20). Thus, the variance of the population receiving a treatment might be higher than the variance of the population not receiving it. In such cases $\Delta_a$ and $\Delta_b$ provide distinct population effects. However, even when the contrasted populations are homoscedastic, the estimators $d_{G,\,a}$ and $d_{G,\,b}$ will usally yield different estimates due to the sample standard deviation within each group most likely being different. In either case, it is up to the user to decide which estimate to interpret. A common recommendation is to compute the estimator using the standard deviation of a comparison (e.g., control) group (e.g., Grissom & Kim, 2001). If the user of this application chooses this ES, both estimators are computed and denoted as $d_{G, 1}$---being the estimate using the first group's standard deviation in the denominator---and $d_{G, 2}$---being the estimate using the second group's standard deviation in the denominator.    

The estimator for $\Delta_j$ is given by the formula (e.g.,Grissom & Kim, 2001):

$$ d_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} $$

with two groups this results in the estimators:

$$ d_{G,\,a} = \frac{\bar{X}_a - \bar{X}_a}{s_a} $$

$$ d_{G,\,b} = \frac{\bar{X}_a - \bar{X}_b}{s_b} $$

With $\bar{X}_{a|b}$ being the sample mean of group ***a***/***b***, and $s_{a|b}$ being the bias corrected sample standard deviation of group ***a***/***b***. These estimators have a bias. They systematically overestimate the size of the true population effect. These biases can be corrected for---see Hedges' $g_{G,\,j}$.  

A $1 - \alpha$ noncentral *t* CI was implemented according to Algina et al. (2006b) employing the method described by Steiger and Fouladi (1997) for constructing CIs based on the noncentral *t*.  

Firstly Glass' $d_{G,\,j}$ is transformed into an estimated non-centrality parameter $\hat{\lambda}$: 

$$ \hat{\lambda} = \frac{d_{G,\,j}}{\sqrt{\frac{1}{n_i} + \frac{s_i^2}{n_j \cdot s_j^2}}} $$ 

with $n_i$ and $s_i$ being the sample size and the standard deviation of the group **not** being standardised by. Then the non-centrality parameter $\lambda_L$ of the noncentral *t* distribution with $\nu = n_j - 1$ degrees of freedom which has $\hat{\lambda}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral *t* distribution with $\nu = n_j - 1$ degrees of freedom which has $\hat{\lambda}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. 

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_{G,\,j}$: 

$$ LL = \lambda_L * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} $$ 

$$ UL = \lambda_U * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} $$ 

This method yields a noncentral *t* based approximate CI, since the limits of the CI for $\lambda$ are multiplied by the random variable $\sqrt{\frac{1}{n_i} + \frac{s_i^2}{n_j*s_j^2}}$. This CI formula is derived under the assumption that both populations follow a normal distribution. Simulations by Algina et al. (2006b) found that when assumptions are met, this method showed close to nominal coverage rates for various values of $\Delta_j$. However, under nonnormality the coverage rates dropped, especially for larger values of $\Delta_j$. 

Additionally, a $1 - \alpha$ percentile bootstrap CI is computed. This method has been found to produce worse coverage rates than the approximate noncentral *t* CI under normality when sample sizes are small ($n_a = n_b \le = 20$) and $\Delta_j$ is large. Under nonnormality the percentile bootstrap CI performed comparably bad to the approximate CI method. Consequently, Algina et al. (2006b) recommend using a different, more robust ES $d_{R,\,j}$ and the percentile bootstrap method when nonnormality is the case.  

<br>

<h4 id = "IG_P_hedges_g_G"> 3.1.2 Hedges' \(g_G\) </h4>

As mentioned above $d_{G,\,j}$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Hedges, 1981 ) estimates the same population parameter as $d_{G,\,j}$:

$$ g_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} * J(\nu) $$

with two groups this results in the estimators:

$$ g_{G,\,a} = \frac{\bar{X_a} - \bar{X_b}}{s_a} * J(\nu) $$

$$ g_{G,\,b} = \frac{\bar{X_a} - \bar{X_b}}{s_b} * J(\nu) $$

with $\nu = n_j - 1$ denoting the degrees of freedom and $J(\nu)$ being defined above (see documentation of Hedges' $g$).  

If this effect size is chosen by the user, both estimators are provided denoted as $g_{G, 1}$&mdash;using the first group's standard deviation in the denominator&mdash;and $g_{G, 2}$&mdash;using the second group's standard deviation in the denominator.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$).  

CI implementation is the same as for $d_{G,\,j}$, employing the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ CI.

Firstly Glass' $g_{G,\,j}$ is transformed into an estimated non-centrality parameter $\hat{\lambda}$: 

$$\hat{\lambda} = \frac{g_{G,\,j}}{\sqrt{\frac{1}{n_i} + \frac{s_i^2}{n_j*s_j^2}}} $$ 

with $n_i$ and $s_i$ being the sample and the standard deviation of the group not being standardised by. Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n_j - 1$ degrees of freedom) which has $\hat{\lambda}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.  

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n_j - 1$ degrees of freedom) which has $\hat{\lambda}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.  

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $g_{G,\,j}$:  

$$ LL = \lambda_L * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} $$ 

$$ UL = \lambda_U * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} $$ 

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.


<br>

<h4 id = "IG_P_bonet_d"> 3.1.3 Cohen's \(d'\) </h4>

The population effect size of interest is given by the formula (e.g.,Cohen, 1988):

$$ \delta' = \frac{\mu_a - \mu_b}{\sigma'} $$

with $\sigma'$ being:

$$ \sigma' = \sqrt{\frac{\sigma^2_a + \sigma^2_b}{2}} $$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by the root mean square of the population variances $\sigma^2_a$ and $\sigma^2_b$. Thus, this population effect does not assume homoscedasticity. In return, the population mean difference is standardised by the population standard deviation of a hypothetical population with a standard deviation between $\sigma_a$ and $\sigma_b$. Bonett (2008) states the noncentral *t* CI method for Cohen's $d$ is only exact under the assumptions of normality and homoscedasticity. However, the author notes that it is difficult to assess homoscedasticity and the extent to which population variances differ, especially when samples are of small to moderate size. Therefore he advocated using the above population effect size. Nonetheless, Bonett (2008) also acknowledges that the population effect loses its meaningfulness under stronger levels of heteroscedasticity.  

Cohen (1988) also recommends this standardiser when population variances differ. However, as Cohen (1988) too points out, this population effect can no longer be converted into many of the highly intuitive and practical effect sizes such $CLES$, $OVL$ or any of Cohen's $U$ statistics. 

$\delta'$ tells us how many $\sigma'$ units $\mu_b$ lies below or above $\mu_a$ .  

The sample estimate of this population effect is given by the formula (e.g.,Bonett (2008)):

$$ d'= \frac{\bar{X}_a - \bar{X}_b}{s'} $$

with $s' = \sqrt{\frac{s_a^2 + s_b^2}{2}}$

If $n_a = n_b$, then $s_p$ will be equal to $s'$ and thus $d$ will be equal to $d'$. This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g'$.  

An approximate large-sample CI is implemented according to Bonett (2008):

$$ CI = d' \pm \Phi^{-1} \left( \frac{\alpha}{2} \right) \sqrt{\widehat{Var}(d')} $$

with

$$ \widehat{Var}(d') = \frac{d'^2(\frac{s^4_a}{n_a - 1} + \frac{s^4_b}{n_b - 1})}{8s'^4} + \frac{s_a^2}{(n_a-1)s'^2} + \frac{s_b^2}{(n_b-1)s'^2} $$

Bonett (2008) reported that this CI method produced coverage probabilities that were consistent and close to the nominal $1 - \alpha$ level under homoscedasticity as well as under mild heteroscedasticity combined with unequal sample sizes. Under the latter condition Bonett (2008) found that approximate large-sample CIs for Cohen's $d$ failed to maintain consistent coverage probabilities close to the nominal level.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h4 id = "IG_P_bonett_g'"> 3.1.4 Hedges' \(g'\) </h4> 

As mentioned above $d'$ has a slight positive bias, which can be corrected. This alternative statistic estimates the same population parameter as $d'$. The bias-corrected estimator is given by (Bonett, 2009):

$$ g '= \frac{\bar{X}_a - \bar{X}_b}{s'} * J(\nu) $$

with $\nu = n_a + n_b - 2$ denoting the degrees of freedom and $J(\nu)$ described above.

If $n_a = n_b$, then $s_p$ will be equal to $s'$ and thus $g$ will be equal to $g'$.   

An approximate large-sample CI is implemented according to Bonett (2009):

$$ CI = g' \pm \Phi^{-1} \left( \frac{\alpha}{2} \right) \sqrt{J(\nu)^2\widehat{Var}(d')} $$

with

$$ \widehat{Var}(d') = \frac{d'^2(\frac{s^4_a}{n_a - 1} + \frac{s^4_b}{n_b - 1})}{8s'^4} + \frac{s_a^2}{(n_a-1)s'^2} + \frac{s_b^2}{(n_b-1)s'^2} $$

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h4 id = "IG_P_d2_KS"> 3.1.5 Kulinskaya-Staudte's \(d^2_{KS}\) </h4>  

Kulinskaya and Staudte (2006) argued for estimating the following population effect size when population variances are unequal:

$$ \delta^2_{KS} = \frac{(\mu_b - \mu_a)^2}{\frac{n_a \sigma_a^2 + n_b \sigma_b^2}{n_a + n_b}} $$

This ES is the squared difference between population means standardised by a weighted sum of population variances and can be estimated by plugging in sample estimates of the population parameters into the above formula resulting in the estimator:  

$$ d^2_{KS} =  \frac{(\bar{X}_b - \bar{X}_a)^2}{\frac{n_a s_a^2 + n_b s_b^2}{n_a + n_b}} $$

The above ES is similar to a squared Cohen's $d$ and when sample sizes are equal---i.e., $n_a = n_b$---the square root of $d^2_{KS}$ is identical to Cohen's $d$ and to Cohen's $d'$.  

Keselman et al. (2008) argued that the above ES suffers from the same problem as Cohen's $d$ when populations are heteroscedastic. They note that under heteroscedasticity the population parameter being estimated ($\delta^2_{KS}$) depends on the sample size $n_a$ and $n_b$ since the standardiser of the populaion mean difference is a weighted sum of group variances. Consequently, with fixed (unknown) values for $\sigma_a$ and $\sigma_b$ $\delta^2_{KS}$ becomes entirely a function of $n_a$ and $n_b$ making comparisons between studies with different sample sizes for the contrasted groups difficult to compare.  

Kulinskaya and Staudte (2006) only described estimation of tolerance intervals for their proposed ES and thus, solely a $1 - \alpha$ percentile bootstrap CI is implemented in this app.  

<br>

<h3 id="IG_P_normality_homoscedasticity_tail"> 3.2 Measures of difference in group spread and tails </h3>

<h4 id="IG_P_VR"> 3.2.1 Variance ratio (\(VR\))</h4>

The population effect size of interest is given by:  

$$ VR = \frac{\sigma_{a|b}^2}{\sigma_{b|a}^2} $$

It is simply the ratio of population variances with either population ***a*** being the reference group $\frac{\sigma_{b}^2}{\sigma_{a}^2}$ or population ***b*** being the reference group $\frac{\sigma_{a}^2}{\sigma_{b}^2}$.
Among various contexts, the variance ratio can be of particular interest:  

- in psychometric studies assessing the variability of scores of a measurement tool (Bonett, 2006);  
- for selecting an appropriate effect size, since as mentioned throughout this documentation the homogeneity of variances is a relevant factor for this choice;  
- as an informative aspects of treatment effect, since it too can signal practical significance just as a difference of means can (Grissom & Kim, 2012).  

Thus, it is advisable to compute and inspect variance ratios and their confidence intervals.  

The sample estimatoris given by the ratio of sample variances:

$$ \widehat{VR} = \frac{s_{a|b}^2}{s_{a|b}^2} $$

The general approach to assess homogeneity of variances is to conduct an appropriate hypothesis test, like the traditional *F*-test. However, a hypothesis test at best can only inform about the presence of homogeneity of variances, but does not inform about the magnitude of the ratio of variances. Additionally, traditional hypothesis tests have non-nominal Type-I error probabilities when data are sampled from non-normal populations or simply when sample sizes are unequal and/or small (Grissom & Kim, 2012). Therefore, it is more informative to consult the point estimate as well as a confidence interval that is robust to common violations of assumptions.   

Three different confidence interval procedures are implemented. The first procedure is based on the classical *F*-test and thus relies on the assumption of normal populations. This exact procedure is implemented for the "parametric raw data mode" as well as the "parametric educational mode". The confidence interval is computed as:    

$$ LL = \frac{s_a^2}{s_b^2}  F_{\frac{\alpha}{2}, \nu_2, \nu_1}^{-1} $$  

or  

$$ LL = \frac{s_b^2}{s_a^2}  F_{\frac{\alpha}{2}, \nu_1, \nu_2}^{-1} $$  

and  

$$ UL = \frac{s_a^2}{s_b^2}  F_{1 - \frac{\alpha}{2}, \nu_2, \nu_1}^{-1} $$

or  

$$ UL = \frac{s_a^2}{s_b^2}  F_{1 - \frac{\alpha}{2}, \nu_1, \nu_2}^{-1} $$

This confidence interval is exact only when the data stem from normal populations. However, this method is highly sensitive to even slight deviations from normality and cannot be recommended for non-normal populations (Banga & Fox, 2013; Bonett, 2006). Consequently, if any deviation from normality might be expected, the user is advised to inspect the "nonparametric" variance-ratio (found as an effect size in the "nonparametric" mode). As detailed in the documentation page of the nonparametric mode for independent groups, the point estimate will be identical to the one provided for the "parametric raw data" mode, however, a more robust confidence interval procedure is implemented.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h4 id="IG_P_TR"> 3.2.2 Tail ratio (\(TR\))</h4>

Standardised mean differences such as Cohen's $d$ narrow their assessment on the centers of distributions, i.e., on typical observations. For many psychological, biological, and medical models which predict that the probability of some outcome or manifestation only starts increasing after some threshold the tails of distributions are more relevant (Voracek et al., 2013), e.g.,:  

- diathesis-stress  
- vulnerability  
- susceptibility  
- exposure  
- excellence models  

If group differences in the tails of distribution is of interest then the ratio of the proportion of scores found in the lower or upper tail of the distribution of the analysed groups can be assessed. The ratio of proportions of scores in the distributional extremes can be much higher than one might expect based on the inspection of Cohen's $d$ and the variance ratio in the following cases (Voracek et al., 2013):  

- when the difference between means is small and the variance ratio equals 1;  
- when a difference between means is absent but the variance ratio differs from 1;   
- when both means and variances differ;  
- when a difference between means as well as between variances is absent, but the distributions of the groups differ in higher order distributional moments (skewness and kurtosis).  

Consequently, an assessment of tail ratios can be of importance for any two-group research design regardless of the absence of differences between means and/or variances.  

The user of this application can compute tail ratios for a chosen cutoff value, a chosen tail region (i.e., the lower/left or the upper/right tail), and a chosen reference group (i.e. the proportion used as the denominator - either the proportion of group ***a*** or group ***b*** ).  

For a discussion of the history of the tail ratio, a proposal for a consensus regarding a naming and reporting convention, as well as for proposed benchmarks meant to aid the interpretation of tail ratios the reader is advised to turn to the article by Voracek et al. (2013).  

The tail ratio effect size measure is implemented as follows:  
The tail ratio can be thought of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". The number of "hits" in group ***a*** is binomially distributed with parameters $n_a$ and $p_a$, where $p_a$ is the proportion of scores in population ***a*** below/above a cutoff. Conversely, the number of "hits" in group ***b*** is also binomially distributed with parameters $n_b$ and $p_b$, where $p_b$ is the proportion of scores in population ***b*** below/above a cutoff. The population tail ratio for a given cutoff value and region of interest is thus given by:  

$$ TR = \frac{p_{a|b}}{p_{b|a}} $$

The observed data can be thought of as 2 x 2 table of the following form:  

<table class = "TR_table">
	<tr>
		<th>Group</th>
		<th>Hits</th>
		<th>Misses</th>
		<th>Sum</th>
	</tr>
	<tr>
	  <th style="text-align:centered">a</th>
	  <td>\(n_{11}\)</td>
	  <td>\(n_{12}\)</td>
	  <td>\(n_{1.}\)</td>
	</tr>
	<tr>
	  <th>b</th>
	  <td>\(n_{21}\)</td>
	  <td>\(n_{22}\)</td>
	  <td>\(n_{2.}\)</td>
  </tr>
</table>

The point estimate of the population tail ratio can be written as:  

$$ \widehat{TR} = \frac{\hat{p}_{a|b}}{\hat{p}_{b|a}} $$

with $\hat{p}_a = \frac{n_{11}}{n_{1.}}$ and $\hat{p}_b = \frac{n_{21}}{n_{2.}}$.  

For the "parametric mode" of the application the cell frequencies are determined based on the assumption that the data are sampled from normal distributions. The number of scores below/above a cutoff *t* is determined by multiplying the number of observations in a group (i.e., $n_{1.}$ or $n_{2.}$) with the proportion of scores falling below/above *t* in a normal distribution with a mean equal to the sample mean (i.e., $\bar{X}_a$ or $\bar{X}_b$) and a variance equal to the sample variance (i.e., $s_a^2$ or $s_b^2$).  
When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = n_{1.} \cdot \Phi \left( \frac{t - \bar{X}_a}{s_a} \right)$  
- $n_{21}$ is computed as: $n_{21} = n_{2.} \cdot \Phi \left( \frac{t - \bar{X}_b}{s_b} \right)$  

and when "hits" are defined as scores above *t*:

- $n_{11}$ is computed as: $n_{11} = n_{1.} \cdot \left( 1 - \Phi \left( \frac{t - \bar{X}_a}{s_a} \right) \right)$  
- $n_{21}$ is computed as: $n_{21} = n_{2.} \cdot \left( 1 - \Phi \left( \frac{t - \bar{X}_b}{s_b} \right) \right)$  
  
With $n_{11}, n_{21}, n_{1.}$ and $n_{2.}$ defined and computed the ratio of the binomial proportions $\hat{p}_a$ and $\hat{p}_b$ and consequently the point estimate of the tail ratio can be determined.  

An approximate confidence interval is implemented for both the parametric and the nonparametric analyses. Fagerland et al. (2015) analysed multiple approximate and exact confidence intervals for the ratio of binomial proportions. While none of the assessed procedures yielded appropriate coverage rates across the various conditions the authors examined, the Koopman confidence interval (Koopman, 1984) performed decently across most of the studied scenarios and has been recommended by the authors. However, Fagerland et al. (2015) emphasize that while the Koopman interval is in general closest to the nominal level, it can be somewhat liberal (average coverage probabilities between 0.92 and 0.95 for an $1 - \alpha$ level of 0.95) for combinations of unequal sample sizes and small population proportions ($p_{a|b} \leq 0.2$). Koopman (1984) described an iterative search algorithm for finding the confidence limit, however Nam (1995) found a closed form formula, which has been implemented for this application. Since both the iterative search and the closed form solution are quite elaborate and have been described in detail in the cited literature, neither is described in detail here.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h2 id = "IG_P_robust"> 4 ES robust to outliers </h3>

<h3 id = "#IG_P_normality_homoscedasticity_SLD"> 4.1 Measures of standardised location difference </h4>

<h4 id = "IG_P_d_R"> 4.1.1 \(d_R\) (robust Cohen's \(d\)) </h4>

The population effect size of interest is given by the formula:

$$ \delta_{R} = c\frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_w} $$

The difference of $\gamma$-percent trimmed means of populations ***a*** and ***b*** $\mu_{t,\,a} - \mu_{t,\,b}$ is standardised by the (common) $\gamma$-percent winsorised population standard deviation $\sigma_w$ and scaled by $c$.

$\delta_{R}$ tells us how many rescaled $\gamma$-percent winsorised standard deviation units $\mu_{t,\,a}$ (e.g., $\mu_{tpost}$) lies below or above $\mu_tb$ (e.g., $\mu_{tpre}$). This measure of effect is applicable in all contexts in which $\delta$ is applicable (see above for some examples).

Much like how Cohen's $d$ assumes homogeneity of population variances, this ES assumes homogeneity of population winsorised variances i.e., that $\sigma^2_{w,\,a} = \sigma^2_{w,\,b} = \sigma^2_{w}$.

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Thus, if popualtions ***a*** and ***b*** follow normal distributions with equal variances, then $\frac{\sigma_{w}}{c} = \sigma$ and consequently $\delta_{R} = \delta$ (Wilcox, 2017, p.294).

The motivation behind this ES definition is that according to Algina et al. (2005) it manages to more accurately capture the degree of separation between the distribution of two groups when these groups do not follow normal distributions. They argue that the mean and variance are not robust in the sense that a small change in the population distribution can have a large influence on the size of these parameters. As a consequence $\delta$ itself is strongly affected by the shape of the population distributions. On the other hand, the trimmed mean and the winsorised variance are robust according to this definition of robustness.  Thus, $\delta_R$ is not so strongly affected the shape of the population distributions. The authors show this by computing $\delta$ and $\delta_R$ for two scenarios. In scenario one the contrasted populations follow normal distributions (population ***a*** follows $\mathbb{N}(1,1)$ and population ***b*** follows $\mathbb{N}(0,1)$) which leads to identical values for $\delta$ and $\delta_R$ (= 1). In scenario two these distributions are contamined with another normal distribution ($\mathbb{N}(0, 10)$) which has the effect that the populations follow mixed normal distributions with their respective means remaining unchanged but their variances increasing (from 1 to 3.3). The population distributions in the two scenarios are however very similar since the contamination in the second scenario mainly affected the tails of the population distributions (they became heavier compared to normal distributions). Thus, the separation between the population distributions was highly similar in the two scenarios. This similarity in separation was not captured by $\delta$ which differed noticeably between the two scenarios since the population variances increased substantially from scenario one to scenario two ($\delta = 0.3$ in scenario two). However, $\delta_R$ was able to more accurately reflect that the separation between the population distributions only changed minutely ($\delta_R = 0.9$ in scenario two). Since it often might not be reasonable to assume that populations follow normal distributions, Algina et al. (2005) recommend estimating $\delta_R$ when one is interested in reporting a measure of standardised location difference.

It should be noted that the above population effect and its estimator are still robust if the winsorised variance is not rescaled by $c$. Dividing $\delta_R$ gives the population effect $\delta_R^{\dagger} = \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_w}$. Keselman et al. (2008, p.119) write about the related ES $\delta_{R,\j}$ (see below) that "when the 20% trimmed distribution is similar in shape to a 20% trimmed normal distribution (just what trimming is intended to accomplish), using .642 will put the ES on a scale that is similar to the scale of Cohen’s (1965) ES. Not using .642 means that the ES will not be on a familiar scale in any situation. In addition, as was true in regard to the interpretation of $\delta$, the meaning of $\delta_{R_j}$ will emerge from repeated use of the ES."

The estimator of the population effect is given by (Algina et al., 2005):

$$ d_{R} = c\frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{wp}} $$

with $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ being the $\gamma$-percent trimmed means of the independent samples and $s_{wp}$ being the pooled $\gamma$-percent winsorised standard deviation:

$$ s_{wp} = \sqrt{\frac{(n_a - 1)s^2_{w,\,a} + (n_b - 1)s^2_{w,\,b}}{n_a + n_b - 2}} $$

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Algina et al. (2005) by setting $\gamma$ to 20 and thus $c = 0.642$. Should populations ***a*** and ***b*** follow normal distributions with equal variances, then $\frac{s_{wp}}{c}$ estimates $\sigma$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d_{R}$ would estimate $\delta$. This way the robust statistic $d_{R}$ estimates the same population effect as its non robust counterpart $d$ under normality.

In case the user of this app would prefer to estimate $\delta^{\dagger}_R$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d^{\dagger}_R$.

A noncentral *t* CI based on Algina et al. (2005) is implemented:

Firstly, a noncentrality parameter $\hat{\lambda}_R$ is estimated:

$$ \hat{\lambda}_R = \sqrt{\frac{h_a h_b}{h_a + h_b}} \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{\tilde{s}} $$

with $h_{a|b} = n_{a|b} - 2 \frac{\gamma}{100} n_{a|b}$ being the number of observations left after trimming and   
$$ \tilde{s} = \frac{(n_a + n_b - 2)s^2_{wp}}{h_a + h_b - 2} $$

Then the noncentrality parameter $\lambda_{RL}$ of the noncentral *t* distribution with $h_a + h_b - 2$ degrees of freedom which has $\hat{\lambda}_R$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the noncentrality parameter $\lambda_{RU}$ of the noncentral *t* distribution with $h_a + h_b - 2$ degrees of freedom which has $\hat{\lambda}_R$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

Lastly $\lambda_{RL}$ and $\lambda_{RU}$ are then transformed back into $d_{R}$:

$$ LL = \lambda_{RL} \cdot c \frac{(h_a + h_b) (n_a + n_b -2)}{h_a h_b (h_a + h_b - 2)} $$

$$ UL = \lambda_{RU} \cdot c \frac{(h_a + h_b) (n_a + n_b -2)}{h_a h_b (h_a + h_b - 2)}$$

Additionally, a $1 - \alpha$ percentile bootstrap CI is computed as well. Algina et al. (2005) compared the coverage rate of both methods for various combinations of population effect size, sample size and distribution type. When the populations followed normal distributions both procedures for constructing CI performed optimally. The observed coverage rate fell outside of the criterion range of $[0.94, 0.96]$ for a handful of combinations of large population effect sizes $\delta_R \geq 0.8$ and unequal sample sizes. In these situations the percentile bootstrap CI fell outside the range (always above the upper bound) more often than the noncentral *t* CI. For nonnormal data the pattern reversed with the noncentral *t* CI achieving optimal coverage rates only when the population effect was $\delta_R \leq 0.8$ and sample sizes were equal or when $\delta_R \leq 0.5$ and sample sizes were unequal. Otherwise the coverage rate of the noncentral *t* method was consistently lower than 0.94. The percentile bootstrap CI achieved optimal coverage rate for $\delta_R \leq 0.8$ regardless of the sample size ratio. For higher values of $\delta_R$ the percentile bootstrap procedure once again tended to be more conservative with coverage rates falling above 0.96. Another notable difference between the two methods was that for normally distributed populations the noncentral *t* CI consistently produced narrower CI for any combination of sample size and population effect size. However, Algina et al. (2005) ultimately recommend the percentile bootstrap method since it performed optimally over a wide range of distributions.

<br>

<h4 id = "IG_P_d_GR"> 4.1.2 \(d_{R,\,j}\) (robust Glass \(d_{G,\,j}\)) </h4>

The population effect size of interest is given by the formula (Algina et al., 2006b):

$$ \Delta_{R,\,j} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,j}} $$

with two groups this reduces to:

$$ \Delta_{R,\,a} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,a}} $$

$$ \Delta_{R,\,b} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,b}} $$

The difference of $\gamma$-percent trimmed means of populations ***a*** and ***b*** ($\mu_{t,\,a} - \mu_{t,\,b}$) is standardised by the $\gamma$-percent winsorised standard deviation of population ***a***/***b*** ($\sigma_{w(a|b)}$) and scaled by $c$.

$\Delta_{R,\,j}$ tells us how many population ***j*** rescaled $\gamma$-percent winsorised standard deviation units $\mu_{t,\,a}$ (e.g., $\mu_{t,\,post}$) lies below or above $\mu_{t,\,b}$ (e.g., $\mu_{t,\,pre}$). This measure of effect is applicable in all contexts in which $\Delta_j$ is applicable (see above for some examples). When the contrasted populations are heteroscedastic $\Delta_{R,\,a}$ and $\Delta_{R,\,b}$ are distinct population effects and even under homoscedasticity (when the two population effects are identical) the sample estimates will differ depending on which group's winsorised standard deviation is used as the standardiser---simply due to the fact that the sample winsorised standard deviations within the groups will most likely differ. It is up to the user to decide which estimate to interpret and report. If this effect size is chosen by the user, both estimators are provided denoted as $d_{R, 1}$---using the first group's winsorised standard deviation in the denominator---and $d_{R, 2}$---using the second group's winsorised standard deviation in the denominator.

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Should populations ***a*** and ***b*** follow normal distributions, then $\frac{s_{w,\,j}}{c}$ estimates $\sigma_j$ and $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ estimate $\mu_{b}$ and $\mu_{a}$ respectively. Consequently $d_{R,\,j}$ would estimate $\Delta_j$. This way the robust statistic $d_{R,\,j}$ estimates the same population effect as its non robust counterpart $d_{G,\,j}$ under normality.

See the documentation of $\delta_R$ above for the motivation behind this defintion of ES. The rationale of the argumentation is that using robust parameters in the ES defintion (i.e., trimmed means and winsorised variances) robust ES, such as $\delta_{R,\j}$ are better able to quantify the separation between two distributions when outliers are common and in general when the populations do not follow normal distributions.

It should be noted that the above population effect and its estimator are still robust if the winsorised variance is not rescaled by $c$. Dividing $\delta_{R,\,j}$ gives the population effect $\delta^{\dagger}_{R,\,j} = \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,j}}$. Keselman et al. (2008, p.119) write that "when the 20% trimmed distribution is similar in shape to a 20% trimmed normal distribution (just what trimming is intended to accomplish), using .642 will put the ES on a scale that is similar to the scale of Cohen’s (1965) ES. Not using .642 means that the ES will not be on a familiar scale in any situation. In addition, as was true in regard to the interpretation of $\delta$, the meaning of $\delta_{R_j}$ will emerge from repeated use of the ES."

The sample estimate of the population effect is given by (Algina et al., 2006b):

$$ d_{R,\,j} = c \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,j}} $$

with two groups this results in the estiamtors:

$$ d_{R,\,a} = c \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,a}} $$

$$ d_{R,\,b} = c \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,b}} $$

with $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ being the $\gamma$-percent trimmed means of the independent samples and $s_{w,\,a}$ being the sample $\gamma$-percent winsorised standard deviation of group ***a*** and $s_{w,\,b}$ being the sample $\gamma$-percent winsorised standard deviation of group ***b***.

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Algina et al. (2006b) by setting $\gamma$ to 20 and thus $c = 0.642$. Should populations ***a*** and ***b*** follow normal distributions with equal variances, then $\frac{s_{w,\,j}}{c}$ estimates $\sigma$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d_{R,\,j}$ would estimate $\Delta_j$. This way the robust statistic $d_{R,\,j}$ estimates the same population effect as its non robust counterpart $d$ under normality.

In case the user of this app would prefer to estimate $\delta^{\dagger}_{R,\,j}$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d^{\dagger}_{R,\,j}$.

An approximate noncentral *t* CI based on Algina et al. (2006b) is implemented:

Firstly, $d_{R,\,j}$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_R$:

$$ \hat{\lambda}_R = \frac{d_{R,\,j}}{c \sqrt{\frac{n_j - 1)}{h_j - 1} \left( \frac{1}{h_j} + \frac{\tilde{s}_i^2}{h_i \tilde{s}_j^2} \right) }} $$

with $h_{a|b}$ being the number of observations left after trimming $h_{a|b} = n_{a|b} - 2 \frac{\gamma}{100} n_{a|b}$ and

$$ \tilde{s}_j^2 = \frac{(n_j - 1)s_{w,\,j}^2}{h_j - 1} $$

Then, the non-centrality parameter $\lambda_{RL}$ of the noncentral *t* distribution with $\nu = h_j - 1$ degrees of freedom which has $\hat{\lambda}_R$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_{RU}$ of the noncentral *t* distribution with $\nu = h_j - 1$ degrees of freedom which has $\hat{\lambda}_R$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_{R,\,j}$:

$$ LL = \lambda_{RL} c \sqrt{\frac{n_j - 1)}{h_j - 1} \left( \frac{1}{h_j} + \frac{\tilde{s}_i^2}{h_i \tilde{s}_j^2} \right) } $$

$$ UL = \lambda_{RU} c \sqrt{\frac{n_j - 1)}{h_j - 1} \left( \frac{1}{h_j} + \frac{\tilde{s}_i^2}{h_i \tilde{s}_j^2} \right) } $$

This CI formula is approximate because there is no guarantee that it is appropriate to use the noncentral *t* distribution for calculating a CI fo $\lambda_R$ as well as the limits of the CI for $\lambda_R$ being multiplied by a random variable.

Additionally, a $1 - \alpha$ percentile bootstrap CI is computed as well. Algina et al. (2006b) compared the coverage rate of both methods for various combinations of population effect size, sample size and distribution type. When the populations followed normal distributions both procedures for constructing CI performed optimally. The observed coverage rate fell outside of the  range of $[0.94, 0.96]$ in a handful of cases when the population effect sizes were large $\delta_{R,\,j} \gt 0.8$ (for the noncentral *t* CI) or when the sample sizes were small $n_{a|b} \leq 40$ (for the percentile bootstrap CI). For non-normal population distributions the percentile bootstrap method remained similarly robust, tending to be more conservative with coverage rates falling above 0.96---in the few cases when the coverage rate fell outside the range of $[0.94, 0.96]$. The approximate noncentral *t* CI consistently performed worse than the percentile bootstrap method, tending to produce coverage rates below 0.94. Consequently, Algina et al. (2006b) recommended the percentile bootstrap method.

<br>

<h4 id = "IG_P_bonett_d_R"> 4.1.3 \(d'_{R}\) (robust Cohen's \(d'\)) </h4>

The population effect size of interest is given by the formula (Keselman et al., 2008):

$$ \delta'_R = c\frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma'_w} $$

with $\sigma'_w$ being:

$$ \sigma'_w = \sqrt{\frac{\sigma^2_{w,\,a} + \sigma^2_{w,\,b}}{2}} $$

The difference of two population $\gamma$-percent trimmed means is standardised by the root mean square of the population $\gamma$-percent winsorised variances $\sigma^2_{w,\,a}$ and $\sigma^2_{w,\,b}$ and scaled by $c$ which is a function of $\gamma$. Thus, this population effect does not assume homoscedasticity. In return, the population trimmed mean difference is standardised by the winsorised standard deviation of a hypothetical population with a winsorised standard deviation halfway between $\sigma_{w,\,a}$ and $\sigma_{w,\,b}$. This ES is a robust version of the Cohen's $d'$ which has been favoured by Bonett (2008) for situations in which population variances are (slightly) homoscedastic. While Keselman et al. (2008) too prefer using the unweighted average of (winsorised) standard deviations as a standardiser compared to a weighted average (such as Cohen's $d$ or Kulinskaya and Staudte's $d^2_{KS}$) when populations are heteroscedastic, they still favour estimating $\delta_{R,\,j}$ overall under heteroscedasticity.

By replacing the non-robust parameters (the mean and variance) with robust parameters (trimmed mean and winsorised variance), this population effect should more accurately be able to capture the degree of separation between two distributions even when those distributions are non-normal (e.g., have heavier tails than normal distributions). This is the idea underlying this and the other robust standardised location difference measures (like $d_R$ and $d_{R,\,j}$).

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Thus, if popualtions ***a*** and ***b*** follow normal distributions with equal variances, then $\frac{\sigma_{w'}}{c} = \sigma'$ and consequently $\delta'_{R} = \delta'$.

The estimator of the population effect is given by:

$$ d'_{R} = c\frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w'}} $$

with $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ being the $\gamma$-percent trimmed means of the independent samples and $s_{w'}$ being the root mean square of the $\gamma$-percent winsorised standard deviations of the contrasted groups:

$$ s_{w'} = \sqrt{\frac{s^2_{w,\,a} + s^2_{w,\,b}}{2}} $$

$c$ is a constant with a value dependeing on $\gamma$. As recommended by Keselman et al. (2008) $\gamma$ is set to 20 for this application and thus $c = 0.642$.

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Keselman et al. (2008) by setting $\gamma$ to 20 and thus $c = 0.642$. Should populations ***a*** and ***b*** follow normal distributions with equal variances, then $\frac{s_{w'}}{c}$ estimates $\sigma'$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d'_{R}$ would estimate $\delta'$. This way the robust statistic $d'_{R}$ estimates the same population effect as its non robust counterpart $d'$ under normality.

In case the user of this app would prefer to estimate $\delta'^{\dagger}_R$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d'^{\dagger}_R$.

Keselman et al. (2008) did not describe a closed form formula for CI computation and recommended the use of a $1 - \alpha$ percentile bootstrap CI, which is implemented for this application. The perdcentile bootstrap CI performed well both for $d_R$ as well as $d_{R,\,j}$ not only under normality but under non-normality of population distibutions too.

<br>

<h3 id = "IG_NP_SMD"> 4.1.4 Standardised median differences </h3>

Hedges and Olkin (1984) argued that since outliers present in the data can violate the normality assumption, ES estimators insensitive to the presence of outliers ought to be developed. They suggested to replace sample means and standard deviations, which are influenced by outliers, with robust estimators. More concretely, they recommended to estimate group means with sample medians and standard deviations with some linear combination of order statistics.  
Grissom and Kim (2001) reported on three such ES estimators that use robust estimators of location and scale. Each presented estimator computes the difference between medians and standardises it by some robust estimate of variability. Thus, the three estimators described are standardised median differences. These estimators have the following genreal structure:

$$ \hat\delta_{a|b} =  \frac{Mdn_a - Mdn_b}{S_{a|b}} $$

with $Mdn_a$ being the Median of group a, $Mdn_b$ being the median of group ***b*** and $S_{a|b}$ being the standardiser, which is some robust measure of variability of the baseline/control group (e.g., the median absolute  deviation of a gold standard treatment). Here, if this estimator is chosen by the user, both estimators are provided denoted as $d_{MAD, 1}$/$d_{R_{IQ}, 1}$/$d_{bw, 1}$&mdash;using the first group's variability estimator in the denominator&mdash;and $d_{MAD, 2}$/$d_{R_{IQ}, 2}$/$d_{bw, 2}$&mdash;using the second group's variability estimator in the denominator.

<br>

The sampling variance of these estimators are currently unknown and thus only $1 - \alpha$ percentile bootstrap CI are implemented for these estimators exclusively.

<br>

Grissom and Kim (2001) note that other standardised median differences could be conceived by using yet another robust measure of variability in the denominator. However, we agree with the comment of Grissom and Kim (2012) that "the field should settle on the use of a reduced number of appropriate measures" (p.75) and that a alternate robust estimator which has a well-behaved confidence interval should be determined and consistently used when outliers threaten to violate assumptions.

<h4 id = "IG_P_d_MAD"> 4.1.4.1 \(d_{MAD}\) </h4>  

The difference in Medians can be standardised by the Median Absolute Deviation (MAD) of the baseline/control group.
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):

$$ d_{MAD} =  \frac{Mdn_a - Mdn_b}{MAD_{a|b}} $$

with MAD being:

$$ MAD = median(|X_i - median(X_i)|) $$

The MAD is more robust to outliers than the standard deviation and has a lower sampling variance.  
We follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($MAD$) of this estimator as well.

<br>

<h4 id = "IG_P_d_RIQ"> 4.1.4.2 \(d_{R_{IQ}}\) </h4>  

The difference in medians can be standardised by the interquartile range $R_{IQ}$, the difference between the third quartile (0.75-quantile) and the first quartile (0.25-quantile), of the baseline/control group.  
Then the standardised median difference is calculated with the following formula (Laird & Mosteller, 1990).

$$ d_{R_{IQ}} = \frac{Mdn_a - Mdn_b}{0.75 \cdot R_{IQ_{a|b}}} $$

The interquartile range is more outlier resistant than the standard deviation. Multiplying $R_{IQ}$ with 0.75 results in an estimator that approximates the standard deviation under normality (Grissom & Kim, 2001).  
Grissom and Kim (2001) point to Shoemaker (1999) for a discussion of other possibly more robust ranges of quantiles that may yield alternative robust estimators of variability.  
We again follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($R_{IQ}$) of this estimator as well.

<br>

<h4 id="IG_P_d_bw"> 4.1.4.3 \(d_{bw}\) </h4>

The differences in medians can be standardised by the biweight standard deviation $s_bw$ of the baseline/control group (Grissom & Kim, 2001).  
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):

$$ d_{bw} = \frac{Mdn_a - Mdn_b}{S_{bw_{a|b}}} $$

with $s_{bw_{a|b}}$ being

$$ s_{bw_{a|b}} = \frac{\sqrt{n}\sqrt{\sum{a_i(X_i - median(X_i))^2(1 - Y_{i}^{2}}}}{|\sum{a_i(1 - 1 - Y_{i}^{2}}(1 - 5Y_{i}^{2})} $$

with $Y_i$ and $a_i$ being
$$ Y_i = \frac{X_i - median(X_i)}{9MAD} $$
$$ a_i = \{_{1, \, if \, |Y_i| < 1}^{0, \, if \, |Y_i| \geq{1}} $$

Grissom and Kim (2001) note that compared to the $MAD$ $s_bw$ has a relatively small sampling variability.

<br>

<hr>

<h2 id="IG_P_refs"> 5 References </h2>

Algina, J., Keselman, H. J., & Penfield, R. D. (2005). An alternative to Cohen’s standardized mean difference effect size: A robust parameter and confidence interval in the two independent groups case. *Psychological Methods*, *10*(3), 317--238. <https://doi.org/10.1037/1082-989X.10.3.317>  

Algina, J., Keselman, H. J., & Penfield, R. D. (2006a). Confidence interval coverage for Cohen’s effect size statistic. *Educational and Psychological Measurement*, *66*(6), 945--960. <https://doi.org/10.1177/0013164406288161>  

Algina, J., Keselman, H. J., & Penfield, R. D. (2006b). Confidence intervals for an effect size when variances are not equal. *Journal of Modern Applied Statistical Methods*, *5*(1), 2--13. <https://doi.org/10.22237/jmasm/1146456060>  

Banga, s. J., & Fox, G. D. (2013). Bonett's method. State College, PA: Minitab, Inc. <https://support.minitab.com/en-us/minitab/21/media/pdfs/translate/Bonetts_Method_Two_Variances.pdf>

Bonett, D. G. (2006). Robust confidence interval for a ratio of standard deviations. *Applied Psychological Measurement*, *30*(5), 432--439. <https://doi.org/10.1177/0146621605279551>  

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods*, *13*(2), 99--109. <https://doi.org/10.1037/1082-989X.13.2.99>    

Bonett, D. G. (2009). Meta-analytic interval estimation for standardized and unstandardized mean difference. *Psychological Methods*, *14*(3), 225--238. <https://doi.org/10.1037/a0016619>

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Lawrence Erlbaum Associates. <https://doi.org/10.4324/9780203771587>  

Cousineau, D., & Goulet-Pelletier, J. (2020, July 24). A review of five techniques to derive confidence intervals with a special attention to the Cohen's dp in the between-group design. <https://doi.org/10.31234/osf.io/s2597>  

Del Giudice, M. (2019). Measuring sex differences and similarities. *Gender and sexuality development: Contemporary theory and research.*  

Fagerland, M. W., Lydersen, S., & Laake, P. (2015). Recommended confidence intervals for two independent binomial proportions. *Statistical Methods in Medical Research*, *24*(2), 224--254. <https://doi.org/10.1177/0962280211415469>  

Fitts, D. A. (2021). Expected and empirical coverages of different methods for generating noncentral t confidence intervals for a standardized mean difference.*Behavior Research Methods*, <https://doi.org/10.3758/s13428-021-01550-4>  

Gart, J. J., & Nam, J. (1988). Approximate interval estimation of the ratio of binomial parameters: A review and corrections for skewness. *Biometrics*, *44*(2), 323--338. <https://doi.org/10.2307/2531848>  

Glass, G. V. (1976). Primary, secondary, and meta-analysis of research. *Educational researcher*, *5*(10), 3--8. <https://doi.org/10.3102/0013189X005010003>  

Goulet-Pelletier, J.-C., & Cousineau, D. (2018). A review of effect sizes and their confidence intervals, Part I: The Cohen's d family. *The Quantitative Methods for Psychology*, *14*, 242--265. <https://doi.org/10.20982/tqmp.14.4.p242>  

Grissom, R. J. (1994). Probability of the superior outcome of one treatment over another. *Journal of Applied Psychology*, *79*(2), 314--316. <https://doi.org/10.1037/0021-9010.79.2.314>

Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>  

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Routledge.  

Hedges, L. V. (1981). Distribution theory of glass’s Estimator of effect size and related estimators. *Journal of Educational and Behavioral Statistics*, *6*(2), 107--128. <https://doi.org/10.3102%2F10769986006002107>  

Hedges, L. V., & Olkin, I. (1984). Nonparametric estimators of effect size in meta-analysis. *Psychological Bulletin*, *96*(3), 573--580. <https://doi.org/10.1037/0033-2909.96.3.573>  

James, G., Witten, D., Hastie, T., & Tibshirani, R. (2013). *An introduction to statistical learning*. Springer. <https://doi.org/10.1007/978-1-4614-7138-7>

Keselman, H., J., Algina, J., Lix, L. M., Wilcox, R. R., & Deering, K. N. (2008). A generally robust approach for testing hypotheses and confidence intervals for effect sizes. *Psychological Methods*, *13*(2), 110--129. <https://doi.org/0.1037/1082-989X.13.2.110>  

Koopman, P. A. R. (1984). Confidence intervals for the ratio of two binomial proportions. *Biometrics*, *40*(2), 513--517. <https://doi.org/10.2307/2531405>  

Kulinskaya, E., & Staudte, R. G. (2006). Interval estimates of weighted effect sizes in the one-way heteroscedastic ANOVA. *British Journal of Mathematical and Statistical Psychology*, *59*(1), 97–-111. <https://doi.org/10.1348/000711005X68174>  

Laird, N. M., & Mosteller, F. (1990). Some statistical methods for combining experimental results. *International Journal of Technology Assessment in Health Care*, *6*(1), 5--30. <https://doi.org/10.1017/s0266462300008916>  

Layard, M. W. J. (1973). Robust large-sample tests for homogeneity of variances. *Journal of the American Statistical Association*, *68*(341), 195-198. <https://doi.org/10.1080/01621459.1973.10481363>  

Mastrich, Z., & Hernandez, I. (2021). Results everyone can understand: A review of common language effect size indicators to bridge the research-practice gap. *Health Psychology*, *40*(10), 727--736. <https://doi.org/10.1037/hea0001112>  

McGraw, K. O., & Wong, S. P. (1992). A common language effect size statistic. *Psychological bulletin*, *111*(2), 361.  

Nam, J. (1995). Confidence limits for the ratio of two binomial proportions based on likelihood scores: Non-iterative method. *Biometrical Journal*, *37*(3), 375--379. <https://doi.org/10.1002/bimj.4710370311>  

Peng, C.-Y. J., & Chen, L.-T. (2014). Beyond Cohen's d: Alternative effect size measures for between-subject designs. *The Journal of Experimental Education*, *82*(1), 22--50. <https://doi.org/10.1080/00220973.2012.745471>  

Reiser, B., &  Faraggi, D. (1999). Confidence intervals for the overlapping coefficient: The normal equal variance case. *Journal of the Royal Statistical Society: Series D (The Statistician)*, *48*(3), 413--418. <https://doi.org/10.1111/1467-9884.00199>  

Shoemaker, L. H. (1999). Interquantile tests for dispersion in skewed distributions. *Communications in Statistics B: Simulation and Computation*, *28*(1), 189--205. <https://doi.org/10.1080/03610919908813543>  

Shoemaker, L. H. (2003). Fixing the F test for equal Variances. *The American Statistician*, *57*(2), 105–-114. <https://doi.org/10.1198/0003130031441>  

Viechtbauer, W. (2007). Approximate confidence intervals for standardized effect sizes in the two-independent and two-dependent samples design. *Journal of Educational and Behavioral Statistics*, *32*(1), 39--60. <https://doi.org/10.3102/1076998606298034>  

Voracek, M., Mohr, E., & Hagmann, M. (2013). On the importance of tail ratios for psychological science. *Psychological Reports*, *112*(3), 872--886. <https://doi.org/10.2466/03.PR0.112.3.872-886>  

Wilcox, R. R. (2017). *Understanding and applying basic statistical methods using R*. John Wiley & Sons.  
