<div class = "toc_container">
<h2 class = "toc_title"> Table of contents </h2>
 <ul>
  <li><a href = "#DG_P_intro"><h3> 1 The dependent groups design </h3></a></li>
  <li><a href = "#DG_P_normality_homoscedasticity"><h3> 2 Measures assuming normally distributed and homoscedastic populations  </h3></a>
    <ul>
      <li><a href = "#DG_P_normality_homoscedasticity_SLD"><h4> 2.1 Measures of standardised location difference </h4></a>
        <ul>
          <li><a href = "#DG_P_cohens_d"><h5> 2.1.1 Cohen's \(d\) </h5></a></li>
          <li><a href = "#DG_P_hedges_g"><h5> 2.1.2 Hedges' \(g\) </h5></a></li>
          <li><a href = "#DG_P_cohens_d"><h5> 2.1.1 Cohen's \(d_{RM}\) </h5></a></li>
          <li><a href = "#DG_P_hedges_g"><h5> 2.1.2 Hedges' \(g_{RM}\) </h5></a></li>
        </ul>
      </li>
      <li><a href = "#DG_P_normality_homoscedasticity_OM"><h4> 2.2 Measures of (non-)overlap </h4></a>
        <ul>
          <li><a href = "#DG_P_OVL"><h5> 2.2.1 The coefficient of overlapping (\(OVL\)) </h5></a></li>
          <li><a href = "#DG_P_OVL2"><h5> 2.2.2 The coefficient of overlapping two (\(OVL_2\)) </h5></a></li>
          <li><a href = "#DG_P_U1"><h5> 2.2.3 Cohen's \(U_1\) </h5></a></li>
          <li><a href = "#DG_P_U2"><h5> 2.2.4 Cohen's \(U_2\)</h5></a></li>
          <li><a href = "#DG_P_U3"><h5> 2.2.5 Cohen's \(U_3\)</h5></a></li>
        </ul>
      </li>
      <li>
    </ul>
  </li>
  <li><a href = "#DG_P_normality"><h3> 3 Measures assuming normally distributed population(s) </h3></a>
    <ul>
     <li><a href = "#DG_P_normality_SLD"><h4> 3.1 Measures of standardised location difference </h4></a>
      <ul>
          <li><a href = "#DG_P_glass_dg"><h5> 3.1.1 Glass' \(d_G\) </h5></a></li>
          <li><a href = "#DG_P_hedges_g_G"><h5> 3.1.2 Hedges' \(g_G\) </h5></a></li>
          <li><a href = "#DG_P_bonett_d"><h5> 3.1.3 Cohen's \(d'\) </h5></a></li>
          <li><a href = "#DG_P_bonett_d_corr"><h5> 3.1.4 Cohen's \(d'_{corr}\) </h5></a></li>
          <li><a href = "#DG_P_cohens_dz"><h5> 3.1.5 Cohen's \(d_z\) </h5></a></li>
          <li><a href = "#DG_P_hedges_gz"><h5> 3.1.6 Hedges' \(g_z\) </h5></a></li>
      </ul>
     </li>
     <li><a href = "#DG_P_normality_prob_ES"><h4> 3.2 Probabilistic measures of effect size </h4></a>
      <ul>
        <li><a href = "#DG_P_CLES"><h5> 3.2.1 The common language ES (\(CLES\)) </h5></a></li>
      </ul>
     </li>
     <li><a href = "#DG_P_normality_tail_and_spread_ES"><h4> 3.3 Measures of difference in group spread and tails </h4></a>
      <ul>
          <li><a href="#DG_P_VR"><h5> 3.3.1 Variance ratio (\(VR\)) </h5></a></li>
          <li><a href="#DG_P_TR"><h5> 3.3.2 Tail ratio (\(TR\)) </h5></a></li>
      </ul>
     </li>
    </ul>
  </li>
  <li><a href = "#DG_P_outlier_resistent"><h3> 4 Measures resistant to outliers </h3></a>
   <ul>
    <li><a href = "#DG_P_outlier_resistent_SLD"><h4> 4.1 Measures of standardised location difference </h4></a>
     <ul>
      <li><a href = "#DG_P_d_R"><h5> 4.1.1 \(d_R\) (robust Cohen's \(d\)) </h5></a></li>
      <li><a href = "#DG_P_d_GR"><h5> 4.1.2 \(d_{R,\,j}\) (robust Glass\(d_{G,\,j}\)) </h5></a></li>
      <li><a href = "#DG_P_bonett_d_R"><h5> 4.1.3 \(d'_R\) (robust Cohen's \(d'\)) </h5></a></li>
      <li><a href = "#DG_P_d_Rz"><h5> 4.1.4 \(d_{Rz}\) (robust Cohen's \(d_z\)) </h5></a></li>
      <li><a href = "#DG_NP_SMD"><h5> 4.1.5 Standardized Median Differences </h5></a>
        <ul>
          <li><a href = "#DG_P_d_MAD"><h6> 4.1.5.1 \(d_{MAD}\) </h6></a></li>
          <li><a href = "#DG_P_d_RIQ"><h6> 4.1.5.2 \(d_{R_{IQ}}\) </h6></a></li>
          <li><a href = "#DG_P_d_bw"><h6> 4.1.5.3 \(d_{bw}\) </h6></a></li>
        </ul>
      </li>
     </ul>
    </li>
   </ul>
  </li>
  <li><a href = "#DG_P_refs"><h3> 5. References </h3></a></li>
 </ul>
</div>

<h2 id = "DG_P_intro"> 1 The dependent groups design </h2>

The dependent groups design---also often referred to as repeated measures design, within-subjects design or within-group design--is characterised by taking multiple measurements of a dependent variable on the same or on matched subjects/objects under different conditions or over multiple points in time (Kraska, 2022). Thus, the ES described here are applicable to a great variety of research designs, such as (Bonett, 2015):  
- a pretest-posttest design (e.g., measuring a health outcome before and after applying a treatment)    
- a within-subjects design where some variable is measured under two treatment conditions (e.g., a novel and a gold standard treatment)    
- a longitudinal design where some variable is measured at two points in time without any intermediate intervention (e.g., measuring the personality traits of a cohort multiple times)  
- or for a matched-pair design where subjects are paired based on covariates and randomly assigned to two conditions (e.g., into a control and an experimental condition).  

<h2 id = "DG_P_normality_homoscedasticity"> 2 Measures assuming normally distributed and homoscedastic populations </h3>
<h3 id = "DG_P_normality_homoscedasticity_SLD"> 2.1 Measures of standardised location difference </h3>
<h4 id = "DG_P_cohens_d"> 2.1.1 Cohen's \(d\) </h4>

The population effect size of interest is given by the same formula as for the independent groups (IG) case:

$$\delta = \frac{\mu_a - \mu_b}{\sigma} $$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by their common population standard deviation $\sigma$.  

$\delta$ tells us how many standard deviation units $\mu_b$ (e.g., the mean of a pre-intervention population $\mu_{pre}$) lies below or above $\mu_a$ (e.g., the mean of a post-intervention population $\mu_{post}$). Under the assumption that the population follow normal distributions $\delta$ can also be thought of as a *z* score and can be used to determine what proportion of population ***b*** the average member of population ***a*** outscores and vice versa (see Cohen's $U_3$).  

With this population effect homoscedasticity is assumed, i.e., that $\sigma^2_a = \sigma^2_b = \sigma^2$. Under this assumption $\delta$ and $\Delta_j$ (another standardised mean difference described below) are identical. However, heteroscedasticity is likely throughout various fields of research and it appears plausible that treatments increases variance in the outcome of interest due to differential responsiveness of subjects to the treatment (Grisson & Kim, 2012, pp. 17-20). Unfortunately, traditional tests of homoscedasticity often fail to produce accurate *p* values, which makes it difficult to detect heteroscedasticity of population variances (Grissom & Kim, 2012, p. 20). If heteroscedasticity is plausible $\Delta_j$ should be estimated.  

The population ES of interest can be estimated by Glass' $d_G$ (described below) if homoscedasticity can be assumed. However, in case of homoscedasticity using the pooled standard deviation $s_p = \sqrt{\frac{(n_a - 1) * s_a^2 + (n_b - 1) * s_b^2}{n_a + n_b - 2}} = \sqrt{\frac{s_a^2 + s^2_b}{2}}$ ($n_a = n_b$ ) is a better estimator of $\sigma$, since it is less variable than $s_b$ or $s_a$.  

Thus, a more useful sample estimator for $\delta$ is given by the formula (e.g., Hedges (1981)):

$$ d = \frac{\bar{X_a} - \bar{X_b}}{s_p} $$

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected---see Hedges' $g_p$.

A $1 - \alpha$ CI is implementated according to the method described by Steiger and Fouladi (1997) which uses the noncentral *t* distribution. The newly identified sampling distribution of $d$ for dependent samples is utilized (Cousineau, 2020) to create an approximate noncentral *t* based CI based on Cousineau and Goulet-Pelletier (2021).

Firstly, Cohen's $d$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_d$:

$$ \hat{\lambda}_d = d * \sqrt{\frac{n}{2(1-r\frac{s_a*s_b}{s^2_p})}} $$

Then the non-centrality parameter $\lambda_L$ of the noncentral *t* distribution with $\nu = \frac{2(n - 1)}{1 + r^2}$ degrees of freedom which has $\hat{\lambda}_d$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.  

Next, the non-centrality parameter $\lambda_U$ of the noncentral *t* distribution with $\nu = \frac{2(n - 1)}{1 + r^2}$ degrees of freedom which has $\hat{\lambda}_d$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.  

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d$:

$$ LL = \lambda_L * \sqrt{\frac{2(1 - r\frac{s_a*s_b}{s^2_p})}{n}} $$

$$ UL = \lambda_U * \sqrt{\frac{2(1 - r\frac{s_a*s_b}{s^2_p})}{n}} $$

This CI formula is derived under the assumption that both populations follow a normal distribution and that the variance of the two populations are identical. Cousineau and Goulet-Pelletier (2021) examined the coverage rate of this as well as other proposed CIs for $d$ and found that the above method frequently yielded coverage rates slightly lower (~1%) than the nominal $1 - \alpha$ rate. However, the method was asymptotically exact (coverage rate = $1- \alpha$) starting at around $n = 100$. It had other desirable properties such as yielding acceptably symmetric and short confidence intervals. The behaviour of this method under nonnormality and heteroscedasticity has not been reported in the study. Algina et al. (2005b) studied the coverage rate of a highly similar noncentral *t* based approximate CI for $d$ (the only difference being somewhat different degrees of freedom) under nonnormality. The coverage rate was consistently below the nominal rate. This effect only worsened with increasing population effect size and sometimes even with increasing sample size. Consequently, Algina et al. (2005b) advocate for the use of a robust version $d$ under nonnormality---see $d_R$ described below.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. The simulation conducted by Algina et al. (2005b) resulted in rather poor coverage rates for the bootstrap CI, even under normality with coverage rates varying between 0.9 and 0.94. An increase in sample size did not always lead to more accurate coverage rates for any of the sizes of $\delta$ studied by the authors. The bootstrap method performed even worse under nonnormality. This was yet another reason for Algina et al. (2005b) to recommend the robust version of $d$ ($d_R$) when the normality assumption is violated.  

<br>

<h4 id = "DG_P_hedges_g"> 2.1.2 Hedges' \(g\) </h4>

As mentioned above $d$ has a slight positive bias, which can be corrected. This alternative formula estimates the same population parameter as $d$ and is given by:

$$ g = \frac{\bar{X_a} - \bar{X_b}}{s_p} * J(\nu) $$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being given by:

$$ J(\nu) = \frac{\Gamma(\frac{\nu}{2})}{\sqrt{\frac{\nu}{2}}\Gamma(\frac{\nu - 1}{2})} $$  

The $1 - \alpha$ CI is implemented the same way as for $d$ with $d$ simply being replaced by $g$ in the computation of $\hat{\lambda}_d$. The properties of this CI method should be comparable to the ones described for the noncentral *t* based method for $d$.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h4 id = "DG_P_cohens_drm"> 2.1.3 Cohen's \(d_{RM}\) </h4>

The population effect size being estimated is given by the formula (e.g., Bonett, 2015):

$$ \delta_{RM} = \frac{\mu_{a} - \mu_{b}}{\frac{\sigma_d}{\sqrt{2(1-\rho)}}} $$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by the standard deviation of difference scores divided by $\sqrt{2(1-\rho)}$. An odd looking effect size at first but if the relationship between homoscedastic populations $\sigma_a = \sigma_b = \sigma$ and $\sigma_D$ is considered (see Cohen's $d_z$), it becomes apparent that this population effect size simplifies to $\delta$ when homoscedasticity is assumed:

$$ \frac{\mu_{a} - \mu_{b}}{\sigma_d}\sqrt{2(1-\rho)} = \frac{\mu_{a} - \mu_{b}}{\sqrt{\sigma^2 + \sigma^2 - 2\rho\sigma\sigma}}\sqrt{2(1-\rho)} = \frac{\mu_{a} - \mu_{b}}{\sigma\sqrt{2(1-\rho)}}\sqrt{2(1-\rho)} = \frac{\mu_{a} - \mu_{b}}{\sigma} = \delta $$

However, with heteroscedastic populations $\delta_{RM}$ becomes a somewhat curious population effect size (Bonett, 2015).  

The population effect size is estimated with the formula given by (e.g., Morris & DeShon, 2002):

$$ d_{RM} = \frac{\bar{X}_a - \bar{X}_b}{s_d}\sqrt{2(1-r)} $$

$d_{RM}$ will only equal $d$ when the ***sample*** standard deviation are equal $s_a = s_b = s$ and the sample correlation of group ***a*** and group ***b*** measurements is exactly $r = .5$. Due to the high variability of sample standard deviations, the sample ratio of variances can easily exceed the population ratio of variances even if the latter is 1:1 (Grissom & Kim, 2012, p. 19). Additionally, pretest-posttest correlations for example often exceed .5 (Morris & DeShon, 2002). Therefore, it is unlikely that $d$ and $d_{RM}$ will be identical in any given sample.  

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected---see Hedges' $g_{RM}$.  

The aforementioned relationship between $\delta_{RM}$ and $\delta$ is the reason why this population effect size and its estimator $d_{RM}$ have been recommended for repeated measures designs. This effect size is supposed to transform $d_z$ into the metric of $d$ for independent groups. Meaning, that $d_{RM}$ is supposed to transform an effect size of changes in an individual's performance into an effect size quantifying group difference in performance (Morris & DeShon, 2002). This transformation could be motivated by meta-analysis, where effect sizes coming from studies with differing designs (e.g., independent groups and dependent groups) should have a common metric, i.e., that they estimate the same population parameter (e.g., $\delta$) (Morris & DeShon, 2002). Transforming $d_z$ into $d_{RM}$ has been favoured over computing $d$ as described above mainly for two reasons: Firstly, because the likely unit of deviation used and reported in a dependent groups design is the standard deviation of difference scores, making the computation of $d$ from summary statistics impossible if $s_a$ and $s_b$ are not  reported (Borenstein et al., 2009, p. 29). Secondly, an exact estimate of the distribution of $d$ for dependent groups could not be obtained previously, since the degrees of freedom of a pooled standard deviation of dependent groups was not known (Morris & DeShon, 2002). As reported above Cosineau (2020) identified an approach to compute the degrees of freedom associated with $d$. While the approach is not exact, since the degrees of freedom depend on the unknown population value of $\rho$, the degrees of freedom can be estimated as described by Cousineau and Goulet-Pelletier (2021) to construct CI for $d$. To conclude, if the aim is to estimate $\delta$ for dependent groups, $d$ might be the better choice as of writing this description.  

An approximate $1 - \alpha$ large-sample CI is implemented according to Bonett (2015):

$$ CI = d_{RM} \pm z_{\frac{\alpha}{2}}\sqrt{\widehat{Var}(d_{RM})} $$

with $\widehat{Var}(d_{RM})$ being given in Borenstein et al. (2009, p. 29)

$$ \widehat{Var}(d_{RM}) = 2(1-r)(\frac{d^2_{RM}}{2n} + \frac{1}{n}) $$

This estimator of the variance of $d_{RM}$ assumes normality of difference scores and homoscedasticity of populations ***a*** and ***b***. Bonett (2015) assessed the performance of the above CI method under varying conditions. The method could not produce coverage rates consistently close to the nominal $1 - \alpha$ rate even under bivariate normality and homoscedasticity, when $\rho \le 0.6$ and when $\delta = \delta_{RM} \le 1.2$. This pattern only worsened under (even slight) heteroscedasticity.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h4 id = "DG_P_hedges_grm"> 2.1.4 Hedges' \(g_{RM}\) </h4>

As mentioned above $d_{RM}$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Borenstein et al., 2009, p. 29) too estimates $\delta_{RM}$ and is given by:

$$ g_{RM} = \frac{\bar{X}_{post} - \bar{X}_{pre}}{s_d}\sqrt{2(1-r)} \cdot J(\nu) $$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being given above (see documentation of Hedges' $g$).  

A approximate large-sample $1 - \alpha$ CI is implemented similarly as the CI for $d_{RM}$ with $\widehat{Var}(d_{RM})$ being multiplied by $J(\nu)^2$:

$$ CI = g_{RM} \pm z_{\frac{\alpha}{2}} \cdot \sqrt{\widehat{Var}(d_{RM}) \cdot J(\nu)^2} $$

Bonett (2015) recommends reporting the unbiased point estimate alongside with the CI calculated for the biased estimator---i.e., the CI for $d_{RM}$. The author argues that using the biased estimate in the formula should produce slightly more accurate coverage rates. If the user of this shiny app wishes to follow this recommendation, they are advised to report the CI computed for $d_{RM}$, since here a CI for $g_{RM}$ is computed with the estimated variance of $d_{RM}$ being multiplied by $J(\nu)^2$ following Borenstein et al. (2009, p. 27).  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h3 id = "DG_P_normality_homoscedasticity_OM"> 2.2 Measures of (non-)overlap </h3>

Under the assumption that the measurements being compared follow normal distributions with equal variances it is possible to define measures of (non-)overlap which are related to Cohen's $d$ and to each other via the cumulative normal distribution function $\Phi(\cdot)$ (Cohen, 1988).

For the documentation of these measures the following notation will be use:  
Let $X_a$ denote the random variable '*score of a randomly sampled individual on measurement a*' and $X_b$ denote the random variable '*score of the same/matched individual on measurement b*'. Further, let $F_a$ and $F_b$ denote the corresponding absolutely continuous distribution functions and $f_a$ and $f_b$ the corresponding probability density functions respectively.  

<br> 

<h4 id = "DG_P_OVL"> 2.2.1 The Coefficient of Overlapping (\(OVL\)) </h4>
 
The population effect of interest is given by (e.g., Reiser & Faraggi, 1999):

$$ OVL = \int_{-\infty}^{\infty} \min \left \{f_a(x), f_b(x) \right \} dx $$

The coefficient of overlapping ($OVL$) is defined as the common area under two probability densities---i.e., the proportion of overlap between the two distributions/measurements---and is used as a measure of agreement of two distributions (Bradley, 2006).  Under the assumption of normality and homoscedasticity the above quantity can be expressed by simply plugging Cohen's $\delta$ into the normal cumulative distribution function, giving the formula:  

$$ OVL = 2 \Phi \left( \frac{-|\delta|}{2} \right) $$

$OVL$ = 1 if and only if the two measurement distributions are identical (i.e., in the case of normal distributions: have the same expectation and variance) and $OVL$ = 0 if and only if the supports of the distributions have no interior points in common (i.e., when the distributions do not overlap at all) which is the reason why $OVL$ can for example be interpreted as a measure of agreement of the two distributions.  

A parametric estimator of the above quantity is given by:

$$ \widehat{OVL} = 2 \Phi \left( \frac{-|d|}{2} \right) $$

this estimator is a monotonic function of the absolute value of Cohen's $d$ (see above).  

A nonparametric estimator of the population effect can be obtained by using appropriate kernel density estimators and an appropriate quadrature formula (see the documentation tab of the page on nonparametric ES for the dependent groups design).  

We could not identify a closed form formula for the CI of the dependent samples $OVL$. The CI method implemented for the independent samples $OVL$ was derived under the assumption that the contrasted population are independent. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id = "DG_P_OVL2"> 2.2.2 The Coefficient of Overlapping Two (\(OVL_2\)) </h4>

The population effect of interest is given by:  

$$ OVL_2 = \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = \frac{OVL}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} $$

The coefficient of overlapping 2 ($OVL_2$) is the proportion of overlap relative to the joint distribution of two contrasted populations (DelGiudice, 2019), which is the amount of combined area shared by the populations of  measurements ***a*** and ***b***. Under the assumption of normality and homoscedasticity the above quantity can be expressed by as a function of $OVL$ (DelGiudice, 2019):  

$$ OVL_2 = \frac{OVL}{2 - OVL} $$

and thus the estimator is given by:

$$ \widehat{OVL}_2 = \frac{\widehat{OVL}}{2 - \widehat{OVL}} $$

Grice and Barret(2014) argue that the $OVL$ is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unintuitive. $OVL$, on the other hand, indicates what proportion of the area a distribution shares with the other distribution which is easier to interpret.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id = "DG_P_U1"> 2.2.3 Cohen's \(U_1\) </h4>

The population effect of interest is given by:

$$ U_1 = \frac{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx  - \int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - \frac{\int_{-\infty}^{\infty} \min \{ f_a(x), f_b(x) \} dx}{\int_{-\infty}^{\infty} \max \{ f_a(x), f_b(x) \} dx} = 1 - OVL_2 $$

Cohen's $U_1$ can be interpreted as proportion of nonoverlap relative to the joint distribution of two populations (DelGiudice, 2019), which is the amount of combined area not shared by the populations of  measurements ***a*** and ***b***. It is characterized by the following formula under the assumption of normality and homoscedasticity (Cohen, 1988):

$$ U_1 = \frac{2 \Phi \left( \frac{|\delta|}{2} \right) - 1}{\Phi \left( \frac{  |\delta|}{2} \right)} = \frac{2 \left(1 - \Phi \left(\frac{-|\delta|}{2}\right)\right) - 1}{1 - \Phi \left(\frac{-|\delta|}{2}\right)} = \frac{1 - 2 \Phi\left(\frac{-|\delta|}{2}\right)}{\frac{1}{2}\left(2 - OVL\right)} = \frac{2(1 - OVL)}{2 - OVL} = \frac{(2 - OVL) - OVL}{2 - OVL} = 1 - \frac{OVL}{2 - OVL} = 1 - OVL_2 $$

with $\delta$ being Cohen's $\delta$---which is effectively a deviate in the unit normal curve---and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate; and $OVL$ and $OVL_2$ being the ES described above.  

A parametric estimator of the above quantity is given by:  

$$ \hat{U_1} = \frac{2 \Phi \left( \frac{|d|}{2} \right) - 1}{\Phi \left( \frac{|d|}{2} \right)} = 1 - \frac{\widehat{OVL}}{2 - \widehat{OVL}} = 1 - \widehat{OVL}_2 $$

with $d$ being Cohen's $d$ and $\widehat{OVL}$ and $\widehat{OVL}_2$ being defined as above.  

Any critique of $OVL_2$ discussed above is equally applicable to Cohen's $U_1$ since both ES quantify overlap/nonoverlap relative to the joint distribution of the contrasted populations.  

We could not identify a closed form formula for the CI of this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h4 id = "DG_P_U2"> 2.2.4 Cohen's \(U_2\) </h4>

The population effect on interest is the proportion of measurement ***a*** scores that exceeds the same proportion in measurement ***b*** scores. Thus a value of 0.7 means that the top 70% of measurement ***a*** scores exceed the bottom 70% of measurement ***b*** scores. It is described by the following formula under the assumption of normality and homoscedasticity (Cohen, 1988):  

$$ U2 = \Phi \left( \frac{\delta}{2} \right) $$

with $\delta$ being Cohen's $\delta$ (as defined above)---which is effectively a deviate in the unit normal curve---and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.  

A parametric estimator of the above quantity is given by:  

$$ \hat{U}_2 = \Phi \left( \frac{d}{2} \right) $$

with $d$ being Cohen's $d$---which again is effectively a deviate in the unit normal curve.  

We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.  

<br>

<h4 id = "DG_P_U3"> 2.2.5 Cohen's \(U_3\) </h4>

For the following description we assume that the measurement ***a*** scores have a higher mean than the measurement ***b*** scores.  

The population effect of interest is given by:

$$ U_3 = F_b(Q_a(0.5)) $$

with $F_b(\cdot)$ being the cumulative distribution function of measurement ***b*** and $Q_a(\cdot)$ being the quantile function of measurement ***a***. Consequently, Cohen's measure of nonoverlap $U_3$ is the proportion of scores of the measurement with the lower mean (***b***) which the upper half of scores (the top 50%) of the measurement with the higher mean (***a***) exceeds (Cohen, 1988). Thus, a value of 0.7 for example means that the top 50% of measurement ***a*** scores exceed 70% of measurement ***b*** scores. Alternatively, one could conclude that the median score of measurement ***a*** exceeds 70% of the scores of measurement ***b***. Under the assumption of normality and homoscedasticity this quantity can be expressed by simply plugging Cohen's $\delta$ into the normal cumulative distribution function, giving the formula:  

$$ U_3 = \Phi \left( |\delta| \right) $$

with $\delta$ being Cohen's $\delta$ (as defined above)---which is effectively a deviate in the unit normal curve---and  $\Phi \left( . \right)$ being the normal cumulative distribution function which gives the proportion of the area falling below a given normal deviate.  

A parametric estimator of the above quantity is given by:    

$$ \hat{U}_3 = \Phi \left( |d| \right) $$

with $d$ being Cohen's $d$---which again is effectively a deviate in the unit normal curve.  

We could not identify a closed form formula for the CI for this ES. Thus, a $1 - \alpha$ percentile bootstrap CI is implemented exclusively.  

<br>

<h2 id = "DG_P_normality"> 3 Measures assuming normally distributed population(s) </h2>

<h3 id = "DG_P_normality_SLD"> 3.1 Measures of standardised location difference </h3>
<h4 id = "DG_P_glass_d"> 3.1.1 Glass' \(d_{G,\,j}\) </h4>

The population effect of interest is given by:

$$\Delta_j = \frac{\mu_a - \mu_b}{\sigma_j} $$

with two groups this reduces to:

$$\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a} $$

$$\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b} $$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by the population standard deviation of population ***a*** or population ***b*** $\sigma_{(a|b)}$.  

Treatments can increase the variance in an outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & Kim, 2012, pp. 17-20). Thus, the variance of the population receiving treatment might be higher than the variance of the population without said treatment. In such cases $\Delta_a$ and $\Delta_b$ provide distinct population effects. However, even when the contrasted populations are homoscedastic, the two estimators will yield different estimates due to sample standard deviation within each group being most likely different. In either case, it is up to the user to decide which estimate to interpret. A common recommendation is to consult the estimate using the standard deviation of a comparison (e.g., control) group (e.g., Grissom & Kim, 2001). Here, if this effect size is chosen by the user, both estimators are provided denoted as $d_{G, 1}$---using the first group's standard deviation in the denominator---and $d_{G, 2}$---using the second group's standard deviation in the denominator.  

$\Delta_b$ tells us how many population ***b*** standard deviation units ($\sigma_b$) $\mu_a$ (e.g., $\mu_{post}$) lies below or above $\mu_b$ (e.g., $\mu_{pre}$) and $\Delta_a$ tells us how many population ***a*** standard deviation units ($\sigma_a$) $\mu_a$ (e.g., $\mu_{post}$) lies below or above $\mu_b$ (e.g., $\mu_{pre}$).  

More interestingly perhaps, $\Delta_j$ is rather similar to a *Z* score. Consequently, if the mean difference is standardised by the standard deviation of the population with the lower mean and if further that population follows a normal distribution, $\Delta_j$ can be used to determine what proportion of the population with the lower mean the average member of the population with the higher mean outscores. Like with a *Z* score, this information can be derived from the cumulative distribution function of the standard normal distribution. If scores are not normally distributed such convenient interpretations are no longer applicable.  

The sample estimator of this population effect is given by the formula (e.g., Becker (1988)):

$$d_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} $$

with two groups this results in the estimators:

$$d_{G,\,a} = \frac{\bar{X}_a - \bar{X}_a}{s_b} $$

$$d_{G,\,b} = \frac{\bar{X}_a - \bar{X}_b}{s_b} $$

With $\bar{X_a}$ being the sample mean of group ***a***, $\bar{X_b}$ being the sample mean of group ***b***, and $s_{a|b}$ being the bias corrected sample standard deviation of group ***a***/***b***. This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_{G,\,j}$.

An approximate large-sample CI is implemented according to Bonett (2015):

$$CI = d_{G,\,j} \pm z_{\frac{\alpha}{2}} * \sqrt{\widehat{Var}(d_{G,\,j})}$$

with

$$\widehat{Var}(d_{G,\,j}) = \frac{d^2_{Gj}}{2(n - 1)} + \frac{s^2_d}{s^2_j(n - 1)}$$

This estimate of the variance of $d_{G,\,j}$ does assume normality but not homoscedasticity.

Bonett (2015) examined this CI method under various conditions using simulations. The author reported coverage rates very close to the nominal $1 - \alpha$ rate (\~$\pm 1%$) under bivariate normality and low to relatively high levels of heteroscedasticity (with population variance ratios of up to $\sigma_a:\sigma_b = 16:1$ and $\sigma_a:\sigma_b = 1:16$). However, when the normality assumption is violated, the method fails to maintain a consistent coverage rate close to the nominal $1 - \alpha$ rate. The largest deviations from the nominal coverage rate (\~$\pm 5%$) were observed for rather large effect size ($\Delta \le 0.6$) and large correlations ($\rho \le 0.9$) under the conditions studied.

Algina et al. (2005b) proposed a noncentral t based approximate CI and examined its behaviour under nonnormality and heteroscedasticity. While this method performed identically well under normality, it did show lower coverage rates under the cases of nonnormality studied by the authors with coverage rates decreasing with increasing size of $\Delta$. In general the CI method performed worse than the one implemented here, however, this might be due to the fact that Bonett (2015) and Algina et al. (2005b) considered differing cases of nonnormality. Consequently, Algina et al. (2005b) recommend a different effect size altogether, $d_{R,\,j}$, under nonnormality.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. Algina et al. (2005b) studied this method under nonnormality and heteroscedasticity. Nonnormality caused coverage rates to consistently fall below the nominal rate, decreasing with an increasing value of $\delta$. This effect was especially strong, when the variance of the population whose standard deviation estimate was used as the standardiser (population b) was higher than the variance of the other population (population a). Such a ratio of population variances ($\sigma^2_b > \sigma^2_a$) resulted in low coverage rates even under normality, dipping below 0.9 for some combinations of effect size and sample size.

<br>

<h4 id = "DG_P_hedges_g"> 3.1.2 Hedges' \(g_{G,\,j}\) </h4>

As mentioned above $d_{G,\,j}$ has a slight positive bias, which can be corrected. This alternative formula too (e.g., Becker, 1988) estimates $\Delta_j$:

$$ g_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} * J(\nu) $$

with two groups this results in the estimators:

$$g_{G,\,a} = \frac{\bar{X_a} - \bar{X_b}}{s_a} * J(\nu) $$

$$g_{G,\,b} = \frac{\bar{X_a} - \bar{X_b}}{s_b} * J(\nu) $$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being defined as above (see the documentation of Hedges' $g$). If this effect size is chosen by the user, both estimators are provided denoted as $g_{G, 1}$---using the first group's standard deviation in the denominator---and $g_{G, 2}$---using the second group's standard deviation in the denominator.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$).  

A approximate large-sample $1 - \alpha$ CI is implemented similarly as the CI for $d_{G,\,j}$ with $\widehat{Var}(d_{G,\,j})$ being multiplied by $J(\nu)^2$:

$$ CI = g_{G,\,j} \pm z_{\frac{\alpha}{2}} * \sqrt{\widehat{Var}(d_{G,\,j}) * J(\nu)^2} $$

Bonett (2015) recommends reporting the unbiased point estimate alongside with the CI calculated for $d_{G,\,j}$. The author argues that using the biased estimate in the formula should give slightly more accurate coverage rates. If the user of this shiny app wishes to follow this recommendation, they are advised to report the CI computed for $d_{G,\,j}$, since the estimated variance of $d_{G,\,j}$ is multiplied by $J(\nu)^2$ for the current implementation following Borenstein et al. (2009, p. 27).

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h4 id = "DG_P_bonett_d"> 3.1.3 Cohen's \(d'\) </h4>

The population effect size of interest is given by (e.g., Cohen, 1988):

$$\delta' = \frac{\mu_a - \mu_b}{\sigma'} $$

with $\sigma'$ being:

$$\sigma' = \sqrt{\frac{\sigma_a^2 + \sigma_b^2}{2}} $$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by the root mean square of the population variances $\sigma^2_a$ and $\sigma^2_b$. Thus, this population effect does not assume homoscedasticity. In return, the population mean difference is standardised by the standard deviation of a hypothetical population with a standard deviation between $\sigma_a$ and $\sigma_b$. Thus, $\delta'$ tells us how many $\sigma'$ units $\mu_b$ lies below or above $\mu_a$.  
Grissom and Kim (2012) note that some experts have a problem with this standardiser. Algina et al. (2005b) argue that under heteroscedasticity $\sigma'$ fails to represent the variability in either group and Bonett (2008), a proponent of the above ES definition, acknowledges that the population effect loses its meaningfulness when variances differ considerably. If heteroscedasticity is assumed to be considerable Bonett (2008) recommends estimating $\Delta_j$ instead of $delta'$---without giving an exact definition of considerable heteroscedasticity in terms of a variance ratio or the like. Additionally, as Cohen (1988) points out, $\delta'$ can not be converted into any of Cohen's *U* effects (or the *OVL* for that matter), which can be considered to reduce the interpretability of $\delta'$ since Cohen (1988) defined the *U* measures to aid the interpretation of the standardised mean difference. However, Bonett (2015) argues that $\delta'$ is still a more meaningful effect than $\delta_{RM}$ owing to the fact that it does not rely on the equality of variances assumption.    

Since $n_a = n_b$ in a dependent samples design, the estimator of $\delta'$ is identical to Cohen's $d$ for dependent samples (e.g., Bonett, 2008):

$$ d'= \frac{\bar{X}_a - \bar{X}_b}{s'} $$

With $$ s' = \sqrt{\frac{s_a^2 + s_b^2}{2}} = s_p $$

and thus

$$ d' = \frac{\bar{X}_a - \bar{X}_b}{\sqrt{\frac{s_a^2 + s_b^2}{2}}} = d $$

As Bonett (2008) notes, $d'$ is a biased estimator and has thus proposed a less biased estimator estimator as well---see $d'_{corr}$.  

An approximate large-sample CI is implemented according to Bonett (2015):

$$ CI = d' \pm z_{\frac{\alpha}{2}}\sqrt{\widehat{VAR}(d')} $$

with

$$ \widehat{VAR}(d') = \frac{d'^2(s^4_a + s^4_b + 2r^2s^2_as^2_b)}{8(n - 1)(\frac{s^2_a + s^2_b}{2})^2} + \frac{s^2_d}{(n - 1)\frac{s^2_a + s^2_b}{2}} $$

This estimator of the variance of $d'$ does assume normality but not homoscedasticity.  

Bonett (2015) examined this CI method under various conditions using simulations. The author reported coverage rates very close to the nominal $1 - \alpha$ rate (\~$\pm 1%$) under bivariate normality and low to relatively high levels of heteroscedasticity (with population variance ratios of up to $\sigma_a:\sigma_b = 16:1$ and $\sigma_a:\sigma_b = 1:16$). It should be noted though that the interpretability of the effect size gets increasingly more difficult with heteroscedasticity. When the normality assumption is violated, the method fails to maintain a consistent coverage rate close to the nominal $1 - \alpha$ rate. Though the largest deviations from the nominal coverage rate (\~$\pm 3%$) were observed for rather large effect size ($\delta' \le 0.6$) and large correlations ($\rho \le 0.9$) under the conditions studied. The noncentral *t* based approximate CI for $\delta'$ studied by Algina et al. (2005b) performed worse under the nonnormal conditions considered by them. However, this might be attributable to the fact that Bonett (2015) and Algina et al. (2005b) considered differing cases of nonnormality!

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. The simulation conducted by Algina et al. (2005b) resulted in rather poor coverage rates for bootstrap CI, even under normality (coverage rates varying between .90 and .94). An increase in sample size did lead to more accurate coverage rates (under normality) for all ES studied. The bootstrap method performed significantly worse under nonnormality though.

<br>

<h4 id = "DG_P_bonett_d_corr"> 3.1.4 Cohen's \(d'_{corr}\) </h4>

As mentioned above $d'$ has a slight positive bias, which can be corrected. Bonett (2008) gives the following formula for a less biased estimator of $\delta'$:  

$$ d'_{corr} = \sqrt{\frac{n - 2}{n - 1}}d' $$

An approximate large-sample CI is implemented according to Bonett (2015):

$$ CI = d' \pm z_{\frac{\alpha}{2}}\sqrt{\widehat{VAR}(d')} $$

with

$$ \widehat{VAR}(d') = \frac{d'^2(s^4_a + s^4_b + 2r^2s^2_as^2_b)}{8(n - 1)(\frac{s^2_a + s^2_b}{2})^2} + \frac{s^2_d}{(n - 1)\frac{s^2_a + s^2_b}{2}} $$

This estimator of the variance of $d'$ does assume normality but not homoscedasticity.

Note: The CI formula by Bonett (2015) uses the unbiased ES estimator $d'$. The shiny app works accordingly. It reports the bias corrected point estimate and the confidence interval using the uncorrected estimate. This is in accordance with the recommendation by Bonett (2015).  

For a review of the performance of this CI see above. Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h4 id = "DG_P_cohens_dz"> 3.1.5 Cohen's \(d_z\) </h4>

The population effect size of interest is given by the formula:

$$\delta_D = \frac{\mu_D}{\sigma_D} $$

The population mean of difference scores ($D = X_{post} - X_{pre}$) $\mu_D$ is standardised by the population standard deviation of difference scores $\sigma_D$. This effect size is used for power analysis for the dependent samples t-test. However, this effect size is entirely unique to the dependent samples design and cannot be compared with effect sizes frequently reported for independent samples designs, such as $\delta$ or $\delta_G$. The reason for this is that while $\mu_D = \mu_a - \mu_b$ and thus the numerator of $\delta$ and $\delta_D$ are identical, their denominators, i.e., their standardisers are not. Assuming homoscedasticity ($\sigma_a = \sigma_b = \sigma$) of populations a and b (e.g., pre- and post-treatment populations) the relationship between the standardisers for $\delta$ and $\delta_D$ is:

$$\sigma_D = \sigma\sqrt{2(1 - \rho)} $$

Thus, if $\rho > 0.5$ then $\sigma_D > \sigma$ and conversely, if $\rho < 0.5$ then $\sigma_D < \sigma$. As a result $\delta_D$ and $\delta$ can only be identical if $\rho = 0.5$.

However, if the difference score (also referred to as change score) is the outcome of interest, such as in longitudinal studies, it can be appropriate to estimate $\delta_D$. If the research question at hand is regarding how an individual's performance changes on average, then $\delta_D$ is the population effect of interest (Morris & DeShon, 2002).

$\delta_D$ tells us how many difference score standard deviations the mean difference score is removed from 0. More interestingly, the proportion of positive and negative difference scores can be determined by treating $\delta_D$ like a *Z* score and examining the cumulative distribution function of the standard normal distribution (Morris & DeShon, 2002). For example, a $\delta_D = 0.84$ would imply that roughly 80% of people improve their performance after a treatment, while 20% perform less well after treatment---see the *CLES* below. If normality of difference scores cannot be assumed, this convenient interpretation is no longer appropriate.  

The population effect size of interest can be estimated by the following formula (e.g., Cohen, 1988):

$$d_z = \frac{\bar{d}}{s_d} = \frac{\bar{X}_{post} - \bar{X}_{pre}}{s_d} $$

With $s_d$ being:

$$s_d = \sqrt{\frac{1}{(n - 1)}\sum_{i = 1}^n(d_i - \bar{d})^2} $$

with $d_i = X_{post_i} - X_{pre_i}$ and $\bar{d} = \frac{1}{n}\sum_{i = 1}^nd_i = \bar{X}_{post} - \bar{X}_{pre}$.

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected---see Hedges' $g_z$.

$1 - \alpha$ CI is implemented according to the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution.

Firstly, Cohen's $d_z$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_d$:

$$\hat{\lambda}_d = d_z * \sqrt{n} $$

Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n - 1$ degrees of freedom) which has $\hat{\lambda}_d$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n - 1$ degrees of freedom) which has $\hat{\lambda}_d$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_z$:

$$LL = \lambda_L * \frac{1}{\sqrt{n}} $$

$$UL = \lambda_U * \frac{1}{\sqrt{n}} $$

This CI formula is derived under the assumption that the population of difference scores follows a nomral distribution. In such a case the above method yields an exact CI for the mean of the difference scores.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h4 id = "DG_P_hedges_gz"> 3.1.6 Hedges' \(g_z\) </h4>

As mentioned above $d_z$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Gibbons et al. (1993)) estimates the same population parameter as $d_z$ and is given by:  

$$ g_z = \frac{\bar{d}}{s_d} * J(\nu) $$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ defined as above (see documentation of Hedges $g$).  

A $1 - \alpha$ CI is implemented the same way as for $d_z$ with $d_z$ simply being replaced by $g_z$ when computing $\hat{\lambda}_d$. The properties of this CI method should be comparable to the ones described for the noncentral t based method described for $d_z$.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h3 id = "DG_P_normality_prob_ES"> 3.2 Probabilistic measures of effect size </h3>

<h4 id = "DG_P_CLES"> 3.2.1 The Common Language ES (\(CLES\)) </h4>

The population effect of interest is given by:

$$ \mathbb{P} \left( D > 0 \right) = \mathbb{P} \left( X_{post} - X_{pre} > 0 \right) = \mathbb{P} \left( X_{post} - X_{pre} > 0 \right) $$

that is, the probability that a randomly selected score from the population of difference scores ($D = X_{post} - X_{pre}$) is greater than 0 (McGraw & Wong, 1992). This probability corresponds to the probability of someone's score from  measurement 2 (e.g., post treatment) exceeding their score from measurement 1 (e.g., pre treatment). The latter quantity can be interpreted as the probability of a randomly sampled person improving on the studied variable---if higher scores reflect better values of the variable---or the probability of a randomly drawn person worsening on the studied variable---if higher scores reflect worse values of the variable. Mastrich and Hernandez (2021) argue that the *CLES* can be considered to provide an intuitive way to understand statistical results and therefore helps laypeople and practitioners alike to better understand research findings and to make more informed decisions as a result. Under the assumption that the population of difference scores *D* follows a normal distribution, this population effect is a function of $\delta_z$ (see below):

$$ \mathbb{P} \left( D > 0 \right) = \mathbb{P} \left( X_{post} - X_{pre} > 0 \right) = \mathbb{P} \left( \frac{0 - \mu_D}{\sigma_D} \right) = \Phi \left( \delta_z \right) $$

Replacing population parameters with sample estimators in the above equation yields the parametric estimator (McGraw & Wong, 1992):

$$ CL = \Phi \left( d_z \right) $$

with $d_z$ being the ES discussed below.  

No closed form formulas were identified for the computation of a ($1-\alpha$) CI for the CL ES. Mastrich and Hernandez (2021) recommend to transform the bounds of the CI of $d_z$ "to provide a sense of uncertainty around the reported CLES" (p.733). The user of this application can transform the CI limits given by the application for $d_z$ using the above formula if they wish to do so. Otherwise, a $1 - \alpha$ percentile bootstrap CI is computed and can be used to communicate the uncertainty around the point estiamte.

Two nonparametric estimators of the above population effect are called the probability of superiority (*PS*; Grissom, 1994) and the *A* measure of stochastic superiority (Vargha & Delaney, 2000) (see the documentation tab of the page on nonparametric ES for the dependent groups design). As discussed by Grissom and Kim (2001) and Vargha and Delaney (2000) these estimators can be considered preferable to the  parametric estimator since they do not rely on the normality assumption. Therefore, the authors recommend to compute one of the nonparametric estimators alongside the *CLES* when raw data are available. 

<br>

<h3 id = "DG_P_normality_tail_and_spread_ES"> 3.3 Measures of difference in group spread and tails  </h3>

<h4 id = "DG_P_VR"> 3.3.1 Variance ratio \(VR\) </h4>

The population effect size of interest is given by:

$$ VR = \frac{\sigma_{a|b}^2}{\sigma_{b|a}^2} $$

It is simply the population ratio of variances with either the first measurement (measurement ***b***) being the reference group $\frac{\sigma_{a}^2}{\sigma_{b}^2}$ or the second measurement (measurement ***a***) being the reference group $\frac{\sigma_{b}^2}{\sigma_{a}^2}$. This effect size can be of interest for various reasons (Bonett, 2006):
- for assessing the effect of treatment on variability in a response variable
- for studying changes in variability in a response variable over time
- for assessing the extent of variance homogeneity/heterogeneity, instead of conducting a hypothesis test
- for informing the choices of ES  

The sample estimate of $VR$ is given by the ratio of sample variances:

$$ \widehat{VR} = \frac{s_{a|b}^2}{s_{a|b}^2} $$

Two different confidence interval procedures are implemented based on Bonett (2006). The first procedure can only be computed if raw data are available. The second procedure is implemented for the "Aggregate Data" mode of the app and is based on simple summary statistics that can be provided by the user. Firstly, the latter procedure is outlined. The confidence interval is computed as:

$$ CI = (\frac{s_{a|b}^2}{s_{a|b}^2})\{k \pm \sqrt{k^2 - 1}\} $$

with

$$ k = 1 + \frac{2(1 - r^2)t_{\frac{\alpha}{2};n - 2}^2}{n - 2} $$

$t_{\frac{\alpha}{2};n - 2}$ being the $\frac{\alpha}{2}$ quantile of the Student's *t* distribution with *n - 2* degrees of freedom.  
This procedure yields an exact confidence interval for the population effect size if bivariate normality of the two measurements is satisfied. Bonett (2006) showed that when the distributions of the two measurements slightly differ from normality, the coverage probability falls drastically below the nominal $1 - \alpha$ rate. Thus, the described method is sensitive to even mild departures from normality.  

When raw data are available an approximate confidence interval with asymptotic probability coverage of $1 - \alpha$ under bivariate nonnormality can be computed as follows:

$$CI = exp\{ln(\frac{s_{a|b}^2}{s_{a|b}^2}) \pm z_{\frac{\alpha}{2}}\sqrt{\nu_1 + \nu_2 - 2a}\} $$

with

$$a = r_d\sqrt{\nu_1\nu_2} $$

$$r_d = Cor(d_{ia}, d_{ib}) $$

$$d_{ij} = (X_{ij} - \bar{X}_{j})^2 $$

$$\nu_j = \frac{\bar{\gamma}_{2j} - \frac{n - 3}{n}}{n - 4} $$

$$\bar{\gamma}_{2j} = \frac{n\sum_{i = 1}^n{(X_{ia} - \bar{X}_{t,\,a})^4}}{\{\sum_{i = 1}^n{(X_{ia} - \bar{X}_{a})^2}\}^2} $$

where $\bar{X}_{t,\,a}$ is the trimmed mean with a trim-proportion of $\frac{1}{\{2(n - 4)^2\}}$.
The expression $\sqrt{\nu_1 + \nu_2 - 2a}$ is the estimate of the standard deviation of $\frac{s_{a|b}^2}{s_{a|b}^2}$.

Bonett (2006) reports that the above procedure has probability coverage close to the nominal $1 - \alpha$ level under bivariate normality with a tendency to be slightly more liberal, particularly when the sample size is low (*n = 10*). This approximate method is also not immune to violations of bivariate normality and it can have poor coverage probability when the population correlation is high (*r \> 0.5*) and the sample size is low (*n = 10*). In particular, Bonett (2006) remarks that the approximate procedure tends to be conservative with platykrutic (light-tailed) distributions and conservative with leptokrutic (heavy-tailed) distributions. However, the author notes that the exact method shows the same pattern of behaviour while being more conservative with light-tailed as well as more liberal with heavy-tailed distributions.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

<br>

<h4 id = "DG_P_TR"> 3.3.2 Tail ratio \(TR\) </h4>

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

The user of this application can compute tail ratios for a chosen cutoff value, a chosen tail region (i.e., the lower/left or the upper/right tail), and a chosen reference group (i.e. the proportion used as the denominator - either the proportion of group ***a*** or group ***b***).  

For a discussion of the history of the tail ratio, a proposal for a consensus regarding a naming and reporting convention, as well as for proposed benchmarks meant to aid the interpretation of tail ratios the reader is advised to turn to the article by Voracek et al. (2013).  

The tail ratio effect size measure is implemented as follows:
The tail ratio can be thought of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". This way we can characterise the data as *n* pairs of Bernoulli events, where the possible outcomes are referred to as "hit" (denoted by 1) and "miss" (denoted by 2). Thus, the data can fall in one of four combinations:

- two "hits" (11)  
- first observation a "hit", second observation a "miss" (12)  
- first observation a "miss", second observation a "hit" (21)  
- two "misses" (22)  

The paired binomial proportions of interest are the marginal proportion of scores from measurement ***a*** that are categorised as "hits" $p_a$ and the marginal proportion of scores from measurement ***b*** that are categorised as "hits" $p_b$. The population tail ratio for a given cutoff value and region of interest is thus given by:

$$ TR = \frac{p_{a|b}}{p_{b|a}} $$

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


The point estimator of the population tail ratio can be written as:

$$\widehat{TR} = \frac{\hat{p}_{a|b}}{\hat{p}_{b|a}} = \frac{n_{1.|.1}}{n_{.1|1.}}$$

with $\hat{p}_a = \frac{n_{1.}}{n}$ and $\hat{p}_b = \frac{n_{.1}}{n}$.

The cell frequencies are determined based on the assumption that the pairs of observation $(X_a, X_b)$ are sampled from a bivariate normal distribution: 

$$ \left(\begin{array}{t} X_a \\ X_b \end{array} \right) \sim N(\mu, \Sigma)$$

with $\mu = \left(\begin{array}{t}\bar{X}_a \\ \bar{X}_b \end{array}\right), \Sigma = \left(\begin{array}{cc} s_a^2 & Corr(X_a,X_b)s_as_b \\ Corr(X_a, X_b)s_as_b & s_b^2\end{array}\right)$

The number of pairs of scores which both fall below/above a cutoff *t* (i.e., the number of "hits") is determined by multiplying the number of observation with the proportion of pairs of scores falling below/above *t* in a bivariate normal distribution with the parameters given above  

When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = n \cdot F_{X_a,X_b}(t,t)$  
- $n_{12}$ is computed as: $n_{12} = n \cdot P(X_a \leq t, X_b > t) = n \cdot (F_{X_a}(t) - F_{X_a, X_b}(t,t))$  
- $n_{21}$ is computed as: $n_{21} = n \cdot P(X_a > t, X_b \leq t) = n \cdot (F_{X_b}(t) - F_{X_a, X_b}(t,t))$    
- $n_{22}$ is computed as:$n_{22} = n \cdot P(X_a > t, X_b > t) = n \cdot (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))$  
- $n_{1.}$ is simply computed as: $n_{1.} = n \cdot F_{X_a}(t) = n \cdot \Phi(\frac{t - \bar{X}_a}{s^2_a})$  
- $n_{.1}$ is simply computed as: $n_{.1} = n \cdot F_{X_b}(t) = n \cdot \Phi(\frac{t - \bar{X}_b}{s^2_b})$  
  
with $F_{X_a, X_b} = P(X_a \leq t, X_b \leq t)$ being the cumulative distribution function of a bivariate normal distribution with the parameters given above;  
with $F_{X_a}$ being the cumulative distribution function of $X_a: F_{X_a}(t) = F_{X_a, X_b}(t, \infty) = \Phi(\frac{t - \bar{X}_a}{s^2_a})$;  
and with $F_{X_b}$ being the cumulative distribution function of $X_b: F_{X_b}(t) = F_{X_a, X_b}(\infty, t) = \Phi(\frac{t - \bar{X}_b}{s_b^2})$  

When "hits" are defined as scores above *t*:  

- $n_{11}$ is computed as:$n_{11} = n \cdot (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))$  
- $n_{12}$ is computed as: $n_{12} = n \cdot P(X_a \geq c, X_b < c) = n \cdot [(1 - F_{X_a}(t)) - (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))]$  
- $n_{21}$ is computed as:$n_{21} = n \cdot P(X_a < c, X_b \geq c) = n \cdot [(1 - F_{X_b}(t)) - (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))]$  
- $n_{22}$ is computed as:$n_{22} = n \cdot F_{X_a, X_b}(t,t)$  
- $n_{1.}$ is computed as:$n_{1.} = n \cdot (1 - F_{X_a}(t)) = n \cdot (1 - \Phi(\frac{t - \bar{X}_a}{s^2_a})$    
- $n_{.1}$ is computed as:$n_{.1} = n \cdot (1 - F_{X_b}(t)) = n \cdot (1 - \Phi(\frac{t - \bar{X}_b}{s^2_b}))$  

With $n_{1.}$ and $n_{.1}$ defined the ratio of the binomial proportions $\hat{p}_a$ and $\hat{p}_b$ and consequently the point estimate of the tail ratio can be determined. The rest of the cell frequencies are relevant for the computation of the implemented confidence interval.  

Two approximate confidence intervals are implemented. Fagerland et al. (2014) analysed multiple confidence intervals for the ratio of paired binomial proportions. While none of the assessed procedures yielded appropriate coverage rates across the various conditions the authors examined, the Nam-Blackwelder and the Bonett-Price hybrid Wilson score confidence intervals performed the most adequately across many of the studied scenarios with the Nam-Blackwelder interval outperforming the Bonett-Price interval when marginal probabilities (i.e., $p_{a|b}$) are less than 0.2. Both methods have been recommended by the authors for general use.  
The Nam-Blackwelder confidence interval relies on iterative search and thus might result in an error under some conditions. Consequently, the following approach has been employed for the implementation of the confidence interval:  

- the Nam-Blackwelder confidence interval is reported if the iterative search of the confidence limits does not result in an error. The interval is computed as described by Nam and Blackwelder (2002).  
- in case the iterative search does result in an error the user of the app receives a corresponding notification in the user interface an the Bonett-Price confidence interval is reported. The Bonett-Price confidence interval is computed as described by Bonett and Price (2006b).  

Neither the computation of the Nam-Blackwelder nor of the Bonett-Price confidence interval is described in detail here as they both are rather elaborate - the reader is advised to study the cited literature for further details.  

However, Fagerland et al. (2014) emphasize that while the implemented intervals are in general the best performing, they can be somewhat liberal (average coverage probabilities between 0.91 and 0.95 for an $1 - \alpha$ level of 0.95) for combinations of a small sample size ($n = 20$), small marginal proportions ($p_{a|b} \leq 0.2$) and a large/small ratio of proportions ($\theta = 4.5$ or $\theta = 0.22$). The Bonett-Price confidence interval is more liberal than the Nam-Blackwelder confidence interval for the given combinations of sample size, marginal proportions and ratio of proportions.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<br>

<h2 id = "DG_P_outlier_resistent"> 4 Measures resistant to outliers </h2>

<h3 id = "DG_P_outlier_resistent_SLD"> 4.1 Measures of standardised location difference </h3>

<h4 id = "DG_P_d_R"> 4.1.1 \(d_R\) (robust Cohen's \(d\)) </h4>

The population effect size of interest is given by the formula:

$$\delta_R = c\frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_w} $$

The difference of $\gamma$-percent trimmed means of populations ***a*** and ***b*** $\mu_{t,\,a} - \mu_{t,\,b}$ is standardised by the (common) $\gamma$-percent winsorised population standard deviation $\sigma_w$ and scaled by $c$.

$\delta_{R}$ tells us how many rescaled $\gamma$-percent winsorised standard deviation units $\mu_{t,\,a}$ (e.g., $\mu_{t,\,post}$) lies below or above $\mu_{t,\,b}$ (e.g., $\mu_{t,\,pre}$). This measure of effect is applicable in all contexts in which $\delta$ is applicable.

Much like how Cohen's $d$ assumes homogeneity of population variances, this ES assumes homogeneity of population winsorised variances i.e., that $\sigma^2_{w,\,a} = \sigma^2_{w,\,b} = \sigma^2_{w}$.

By replacing the non-robust parameters (the mean and variance) with robust parameters (trimmed mean and winsorised variance), this population effect should more accurately be able to capture the degree of separation between two distributions even when those distributions are non-normal (e.g., have heavier tails than normal distributions). This is the idea underlying this and the other robust standardised location difference measures (like $d_{R,\,j}$ and $d_{Rz}$).  

It should be noted that the above population effect and its estimator are still robust if the winsorised variance is not rescaled by $c$. Dividing $\delta_R$ by $c$ gives the population effect $\delta_R^{\dagger} = \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_w}$. Keselman et al. (2008, p.119) write about the related ES $\delta_{R,\j}$ (see below) that "when the 20% trimmed distribution is similar in shape to a 20% trimmed normal distribution (just what trimming is intended to accomplish), using .642 will put the ES on a scale that is similar to the scale of Cohen’s (1965) ES. Not using .642 means that the ES will not be on a familiar scale in any situation. In addition, as was true in regard to the interpretation of $\delta$, the meaning of $\delta_{R_j}$ will emerge from repeated use of the ES."  

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Thus, if popualtions ***a*** and ***b*** follow bivariate normal distributions with equal variances, then $\frac{\sigma_{w}}{c} = \sigma$ and consequently $\delta_{R} = \delta$.

The estimator of the population effect is given by :

$$d_R = c\frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{wp}} $$

with $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ being the trimmed means of the dependent samples and $s_{wp}$ being the pooled winsorised standard deviation:

$$s_{wp} = \sqrt{\frac{(n_a - 1)s^2_{w,\,a} + (n_b - 1)s^2_{w,\,b}}{n_a + n_b - 2}} $$

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Algina et al. (Keselman et al., 2008) by setting $\gamma$ to 20 and thus $c = 0.642$. Should populations ***a*** and ***b*** follow bivariate normal distributions with equal variances, then $\frac{s_{wp}}{c}$ estimates $\sigma$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d_{R}$ would estimate $\delta$. This way the robust statistic $d_{R}$ estimates the same population effect as its non robust counterpart $d$ under normality and homoscedasticity.

In case the user of this app would prefer to estimate $\delta^{\dagger}_R$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d^{\dagger}_R$.  

This effect size has been developed for the independent groups design (e.g., Algina et al., 2005a) and consequently no closed form formula for CI computation in case of dependent samples has been described in the literature to the best of our knowledge. Therefore solely a $1 - \alpha$ percentile bootstrap CI is implemented which has performed well for the other robust effect sizes described below ($d'_R$ and $d_{R,\,j}$).  

<br>

<h4 id = "DG_P_d_GR"> 4.1.2 \(d_{R,\,j}\) (robust Glass' \(d_{G,\,j}\)) </h4>

The population effect size of interest is given by the formula:

$$\Delta_{R,\,j} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,j}} $$

with two groups this reduces to:

$$\Delta_{R,\,a} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,a}} $$

$$\Delta_{R,\,b} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,b}} $$

The difference of $\gamma$-percent trimmed means of populations ***a*** and ***b*** ($\mu_{t,\,a} - \mu_{t,\,b}$) is standardised by the $\gamma$-percent winsorised standard deviation of population ***a***/***b*** ($\sigma_{w(a|b)}$) and scaled by $c$.  

$\Delta_{R,\,j}$ tells us how many population *j* rescaled $\gamma$-percent winsorised standard deviation units $\mu_{t,\,a}$ (e.g., $\mu_{t,\,post}$) lies below or above $\mu_{t,\,b}$ (e.g., $\mu_{t,\,pre}$). This measure of effect is applicable in all contexts in which $\Delta_j$ is applicable (see above for some examples). When the contrasted populations are heteroscedastic $\Delta_{R,\,a}$ and $\Delta_{R,\,b}$ are distinct population effects and even under homoscedasticity (when the two population effects are identical) the sample estimates will differ depending on which group's winsorised standard deviation is used as the standardiser---simply due to the fact that the sample winsorised standard deviations within the groups will most likely differ. It is up to the user to decide which estimate to interpret and report. If this effect size is chosen by the user, both estimators are provided denoted as $d_{R, 1}$---using the first group's winsorised standard deviation in the denominator---and $d_{R, 2}$---using the second group's winsorised standard deviation in the denominator.  

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Should populations ***a*** and ***b*** follow normal distributions, then $\frac{s_{w,\,j}}{c}$ estimates $\sigma_j$ and $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ estimate $\mu_{b}$ and $\mu_{a}$ respectively. Consequently $d_{R,\,j}$ would estimate $\Delta_j$. This way the robust statistic $d_{R,\,j}$ estimates the same population effect as its non robust counterpart $d_{G,\,j}$ under normality.  

By replacing the non-robust parameters (the mean and variance) with robust parameters (trimmed mean and winsorised variance), this population effect should more accurately be able to capture the degree of separation between two distributions even when those distributions are non-normal (e.g., have heavier tails than normal distributions). This is the idea underlying this and the other robust standardised location difference measures (like $d_R$ and $d_{Rz}$).  

It should be noted that the above population effect and its estimator are still robust if the winsorised variance is not rescaled by $c$. Dividing $\delta_{R,\,j}$ gives the population effect $\delta^{\dagger}_{R,\,j} = \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,j}}$. Keselman et al. (2008, p.119) write that "when the 20% trimmed distribution is similar in shape to a 20% trimmed normal distribution (just what trimming is intended to accomplish), using .642 will put the ES on a scale that is similar to the scale of Cohen’s (1965) ES. Not using .642 means that the ES will not be on a familiar scale in any situation. In addition, as was true in regard to the interpretation of $\delta$, the meaning of $\delta_{R_j}$ will emerge from repeated use of the ES."  

The sample estimate of the population effect is given by (Algina et al., 2005b):

$$d_{R,\,j} = c \cdot \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,j}} $$

with two groups this results in the estiamtors:

$$d_{R,\,a} = c \cdot \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,a}} $$

$$d_{R,\,b} = c \cdot \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,b}} $$

with $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ being the $\gamma$-percent trimmed means of the dependent samples and $s_{w,\,a}$ being the $\gamma$-percent sample winsorised standard deviation of group ***a*** and $s_{w,\,b}$ being the $\gamma$-percent sample winsorised standard deviation of group ***b***.

$c$ is a constant with a value depending on $\gamma$. Should populations ***a*** and ***b*** follow a normal distribution, then $\frac{s_{w,\,j}}{c}$ estimates $\sigma_j$ and $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ estimate $\mu_{b}$ and $\mu_{a}$ respectively. Consequently $d_{R,\,j}$ would estimate $\Delta_j$. This way the robust statistic $d_{R,\,j}$ estimates the same population effect as its non robust counterpart $d_{G,\,j}$ under normality.

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Algina et al. (2005b) by setting $\gamma$ to 20 and thus $c = 0.642$. Should populations ***a*** and ***b*** follow a bivariate normal distribution then $\frac{s_{w,\,j}}{c}$ estimates $\sigma_j$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d_{R,\,j}$ would estimate $\Delta_j$. This way the robust statistic $d_{R,\,j}$ estimates the same population effect as its non robust counterpart $d_{G,\,j}$ under normality.  

In case the user of this app would prefer to estimate $\delta^{\dagger}_{R,\,j}$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d^{\dagger}_{R,\,j}$.  

An approximate noncentral *t* based CI based on Algina et al. (2005b) is implemented:

Firstly, $d_{R,\,j}$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_R$:

$$\hat{\lambda}_R = \frac{d_{R,\,j}}{c} \sqrt{\frac{h(h - 1)s^2_{w,\,j}}{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2*Cov(X_{w,\,a}, X_{w,\,b})}} $$

with $X_{w,\,a}$ and $X_{w,\,b}$ being the winsorised sample data of the two dependent samples and $h$ being the number of observations left after trimming $h = n - 2(\gamma n)$

Then, the non-centrality parameter $\lambda_{RL}$ of the noncentral t distribution (with $\nu = h - 1$ degrees of freedom) which has $\hat{\lambda}_R$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_{RU}$ of the noncentral t distribution (with $\nu = h - 1$ degrees of freedom) which has $\hat{\lambda}_R$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_{R,\,j}$:

$$LL = \lambda_{RL} * c * \sqrt{\frac{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)s^2_{w,\,j}}} $$

$$UL = \lambda_{RU} * c * \sqrt{\frac{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)s^2_{w,\,j}}} $$

This CI formula is approximate because the distribution of $\frac{d_R}{c} \sqrt{\frac{h(h - 1)s^2_{w,\,j}}{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}}$ only approximately follows the t distribution. However, this formula is not based on homoscedasticity or normality of the investigated populations. Algina et al. (2005b) examined the coverage rate of this CI procedure for various combinations of population effect size, population correlation, and sample size and found that it yielded coverage rates that were close to the nominal $1 - \alpha$ rate for normal and a wide range of nonnormal data (the authors criterion interval for appropriate coverage rates was $[0.925,0.975]$). However, when data were sampled from a distribution alike the exponential distribution the procedure was too liberal for large population effect size $\Delta_{RGj} > 1.2$ and the population correlation was medium $\rho = 0.4$. With low population correlation $\rho \le 0.2$ this tendency became worse and was also noticeable for a long-tailed skewed distribution. A large population correlation $\rho \ge 0.6$ ameliorated these tendencies of the CI method, resulting in coverage rates within the criterion interval.

An $1 - \alpha$ percentile bootstrap CI is computed. The simulations conducted by Algina et al. (2005b) resulted in appropriate coverage rates (i.e., within the range of $[0.925,0.975]$) for all investigated conditions. The estimated coverage rate tended to converge to the nominal level of 0.95 as the sample size increased. In general the coverage rate of the percentile bootstrap CI increased with increasing population effect size and population correlation. Overall, Algina et al. (2005b) recommend the percentile bootstrap CI method for $d_{R,\,j}$.

<br>

<h4 id = "DG_P_bonett_d_R"> 4.1.3 \(d'_R\) (robust Cohen's \(d'\)) </h4>

The population effect size of interest is given by the formula (Algina et al., 2005b):

$$ \delta'_R = c\frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma'_w} $$

with $\sigma'_w$ being:

$$ \sigma'_w = \sqrt{\frac{\sigma^2_{w,\,a} + \sigma^2_{w,\,b}}{2}} $$

The difference of two population $\gamma$-percent trimmed means is standardised by the root mean square of the population $\gamma$-percent winsorised variances $\sigma^2_{w,\,a}$ and $\sigma^2_{w,\,b}$ and scaled by $c$ which is a function of $\gamma$. Thus, this population effect does not assume homoscedasticity. In return, the population trimmed mean difference is standardised by the winsorised standard deviation of a hypothetical population with a winsorised standard deviation halfway between $\sigma_{w,\,a}$ and $\sigma_{w,\,b}$. This ES is a robust version of the Cohen's $d'$ which has been favoured by Bonett (2008) for situations in which population variances are (slightly) homoscedastic. While Keselman et al. (2008) too prefer using the unweighted average of (winsorised) standard deviations as a standardiser compared to a weighted average (such as Cohen's $d$ or Kulinskaya and Staudte's $d^2_{KS}$) when populations are heteroscedastic, they still favour estimating $\delta_{R,\,j}$ overall under heteroscedasticity.

By replacing the non-robust parameters (the mean and variance) with robust parameters (trimmed mean and winsorised variance), this population effect should more accurately be able to capture the degree of separation between two distributions even when those distributions are non-normal (e.g., have heavier tails than normal distributions). This is the idea underlying this and the other robust standardised location difference measures (like $d_{R,\,j}$ and $d_{Rz}$).  

It should be noted that the above population effect and its estimator are still robust if the winsorised variance is not rescaled by $c$. Dividing $\delta'_R$ by $c$ gives the population effect $\delta_R'^{\dagger} = \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma'_w}$. Keselman et al. (2008, p.119) write about the related ES $\delta_{R,\j}$ (see above) that "when the 20% trimmed distribution is similar in shape to a 20% trimmed normal distribution (just what trimming is intended to accomplish), using .642 will put the ES on a scale that is similar to the scale of Cohen’s (1965) ES. Not using .642 means that the ES will not be on a familiar scale in any situation. In addition, as was true in regard to the interpretation of $\delta$, the meaning of $\delta_{R_j}$ will emerge from repeated use of the ES."  

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Thus, if popualtions ***a*** and ***b*** follow bivariate normal distributions, then $\frac{\sigma'_w}{c} = \sigma'$ and consequently $\delta'_{R} = \delta'$ (Algina et al., 2005b).  

The estimator of the population effect is given by (Algina et al., 2005b):

$$ d'_{R} = c\frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s'_w} $$

with $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ being the $\gamma$-percent trimmed means of the dependent samples and $s'_w$ being the root mean square of the $\gamma$-percent winsorised standard deviations of the contrasted groups:

$$ s'_w = \sqrt{\frac{s^2_{w,\,a} + s^2_{w,\,b}}{2}} $$

$c$ is a constant with a value dependeing on $\gamma$. As recommended by Algina et al. (2005b) $\gamma$ is set to 20 for this application and thus $c = 0.642$.

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Algina et al. (2005b) by setting $\gamma$ to 20 and thus $c = 0.642$. Should populations ***a*** and ***b*** follow biariate normal distributions, then $\frac{s'_w}{c}$ estimates $\sigma'$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d'_{R}$ would estimate $\delta'$. This way the robust statistic $d'_{R}$ estimates the same population effect as its non robust counterpart $d'$ under normality.  

In case the user of this app would prefer to estimate $\delta'^{\dagger}_R$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d'^{\dagger}_R$.  

An approximate noncentral *t* based CI based on Algina et al. (2005b) is implemented:

Firstly, $d_R$ is transformed into an estimated noncentrality parameter $\hat{\lambda}_R$:

$$ \hat{\lambda}_R = \frac{ \sqrt{h(h - 1)} (\bar{X}_{t,\,a} - \bar{X}_{t,\,b}) }{ \sqrt{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}} $$

with $X_{w,\,a}$ and $X_{w,\,b}$ being the winsorised sample data of the two dependent samples and consequently $Cov(X_{w,\,a}, X_{w,\,b})$ being the winsorized covariance. In the above equation $h$ is the number of observations left after $\gamma$-percent trimming trimming $h = n - 2(\gamma n)$

Then the non-centrality parameter $\lambda_{RL}$ of the noncentral *t* distribution with $\nu = h - 1$ degrees of freedom which has $\hat{\lambda}_R$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_{RU}$ of the noncentral *t* distribution with $\nu = h - 1$ degrees of freedom which has $\hat{\lambda}_d$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda_R$ are then transformed back into $d_R$:

$$ LL = \lambda_{RL} \cdot c  \cdot \sqrt{\frac{2 (n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)(s^2_{w,\,a} + s^2_{w,\,b})}} $$

$$ UL = \lambda_{RU} \cdot c  \cdot \sqrt{\frac{2 (n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)(s^2_{w,\,a} + s^2_{w,\,b})}} $$

This CI formula is approximate because the distribution of $\hat{\lambda}_R$ only approximately follows the *t* distribution. However, while this CI formula is based on the assumption that both populations have identical winsorised variances, it is not based on the assumption of normality of populations. Algina et al. (2005b) examined the coverage rate of this CI procedure for various combinations of population effect size, population correlation, and sample size and found that the method yielded coverage rates that were close to the nominal $1 - \alpha$ rate for normal and a wide range of nonnormal data (the authors criterion interval for appropriate non-rejetcion rates was $[0.925,0.975]$). The authors noted that the CI procedure had a slight tendency to be somewhat conservative with an increasing size of $\delta'_R$ when samples were drawn from a bivariate normal distribution. Additionally, Algina et al. (2005b) reported that when data were sampled from a distribution alike the exponential distribution ($\gamma_1 = 2, \space \gamma_2 = 6$), the coverage rate became too liberal (i.e., less than their lower bound of appropriate coverage rates: $0.925$) when the correlation of the dependent samples was $0.6$ or larger and for various values of $\delta'_R$.

An $1 - \alpha$ percentile bootstrap CI is computed as well. The simulations conducted by Algina et al. (2005b) resulted in appropriate coverage rate (again, within the range of $[0.925,0.975]$) for the vast majority of population distributions, popluation effect sizes, sample sizes and correlations studied. However, the bootstrap method yielded conservative coverage rates (i.e., higher than their upper bound of appropriate coverage rates: $0.975$) when sample sizes were low ($n = 20$), the population effect size was large ($\delta'_R = 1.6$), correlations were $r \le 0.4$, and the data were obtained from a long-tailed skewed distribution. Overall, Algina et al. (2005b) recommend the percentile bootstrap CI method for $d'_R$.

<br>

<h4 id = "DG_P_d_Rz"> 4.1.4 \(d_{Rz}\) (robust Cohen's \(d_z\))</h4>

The population effect size of interest is given by the formula:

$$ \delta_{R,\,D} = c\frac{\mu_{t,\,D}}{\sigma_{w,\,D}} $$

wit *c* being 

$$ c = \left( \int_{\Phi^{-1}(\gamma)}^{\Phi^{-1}(1 - \gamma)}{\gamma^2 \phi(\gamma)} \right) + (2  \Phi^{-1}(\gamma)^2 \gamma) $$

The $\gamma$-percent trimmed mean of difference scores $\mu_{t,\,D}$ is standardised by the $\gamma$-percent winsorised standard deviation of difference scores $\sigma_{w,\,D}$ scaled by $c$.  

$\delta_{R,\,D}$ tells us how many rescaled $\gamma$-percent winsorised change score standard deviations the $\gamma$-percent trimmed mean of change scores lies above or blow 0. This measure of effect is applicable in all contexts in which $\delta_D$ is the appropriate population effect.  

By replacing the non-robust parameters (the mean and variance) with robust parameters (trimmed mean and winsorised variance), this population effect should more accurately be able to capture the degree of separation between two distributions even when those distributions are non-normal (e.g., have heavier tails than normal distributions). This is the idea underlying this and the other robust standardised location difference measures (like $d_{R,\,j}$ and $d'_{R}$).  

It should be noted that the above population effect and its estimator are still robust if the winsorised variance is not rescaled by $c$. Dividing $\delta_{R,\,D}$ by $c$ gives the population effect $\delta_{R,\,D}^{\dagger} = \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,D}}$. Keselman et al. (2008, p.119) write about the related ES $\delta_{R,\j}$ (see above) that "when the 20% trimmed distribution is similar in shape to a 20% trimmed normal distribution (just what trimming is intended to accomplish), using .642 will put the ES on a scale that is similar to the scale of Cohen’s (1965) ES. Not using .642 means that the ES will not be on a familiar scale in any situation. In addition, as was true in regard to the interpretation of $\delta$, the meaning of $\delta_{R_j}$ will emerge from repeated use of the ES."  

The value of $c$ is the value of the winsorised standard deviation of the standard normal distribution ($\mathbb{N}(0, 1)$) with $\gamma$-percent trimming. For $\gamma = 20$ trimming, as performed with this app, $c = 0.642$. This means that the ratio of the $\gamma$-percent winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if a population follows a normal distribution. Thus, if the population of difference scores follows a normal distribution, then $\frac{\sigma_{w,\,D}}{c} = \sigma_D$ and consequently $\delta_{R,\,D} = \delta_D$ (Wilcox, 2017a, p. 116).  

The sample estimate of the population effect is given by (Wilcox, 2017a, p. 213):

$$d_{Rz} = c\frac{\bar{d}_t}{s_{w,\,d}} $$

with $\bar{d}_t$ being the $\gamma$-percent trimmed mean of the observed difference scores $d_i$ and $s_{w,\,d}$ being the $\gamma$-percent winsorised standard deviation of the observed $d_i$.  

As stated above, $c$ is a constant with a value depending on $\gamma$. In this application we follow the recommendation of Keselman et al. (2008) by setting $\gamma$ to 20 and thus $c = 0.642$. Should the population of difference scores follow a normal distribution then $\frac{s_{w,\,d}}{c}$ estimates $\sigma_D$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d_{Rz}$ would estimate $\delta_D$. This way the robust statistic $d_{Rz}$ estimates the same population effect as its non robust counterpart $d_z$ under normality.  

In case the user of this app would prefer to estimate $\delta^{\dagger}_{R,\,D}$, the point and the interval estimates simply have to be multiplied with $\frac{1}{c}$ resulting in the estimator $d^{\dagger}_{R,\,D}$.  

A noncentral *t*-based confidence interval is not implemented for this measure as we did not identify a formula for its computation in the literature. However, in accordance with the recommendation of Wilcox (2017b) a $1 - \alpha$ percentile bootstrap confidence interval is implemented. Studies assessing the performance the percentile bootstrap method for other robust ES, namely $d'_R$ and $d_{R,\,j}$, found that it achieved coverage rates close to the nominal $1 - \alpha$ level (i.e., within the range of [0.925; 0.975] for $\alpha = 0.05$) for both normal and various nonnormal population ***a*** and ***b*** distributions (Algina et al., 2005b).  

<br>

<h4 id = "DG_P_SMD"> 4.1.5 Standardised median differences </h4>

Hedges and Olkin (1984) argued that since outliers present in the data can violate the normality assumption, ES estimators insensitive to the presence of outliers ought to be developed. They suggested to replace sample means and standard deviations, which are influenced by outliers, with robust estimators. More concretely, they recommended to estimate group means with sample medians and standard deviations with some linear combination of order statistics.  
Grissom and Kim (2001) reported on three such ES estimators that use robust estimators of location and scale. Each presented estimator computes the difference between medians and standardises it by some robust estimate of variability. Thus, the three estimators described are standardised median differences. These estimators have the following genreal structure:

$$\hat\delta_{a|b} =  \frac{Mdn_a - Mdn_b}{S_{a|b}}$$

with $Mdn_a$ being the Median of group ***a***/measurement 2, $Mdn_b$ being the median of group ***b***/measurement 1 and $S_{a|b}$ being the standardiser, which is some robust measure of variability of the baseline/control measurement/group (e.g., the median absolute  deviation of pretreatment measurements). Here, if this estimator is chosen by the user, both estimators are provided denoted as $d_{MAD, 1}$/$d_{R_{IQ}, 1}$/$d_{bw, 1}$---using the first group's/measurement's variability estimator in the denominator---and $d_{MAD, 2}$/$d_{R_{IQ}, 2}$/$d_{bw, 2}$---using the second group's/measurement's variability estimator in the denominator.  
<br>
The sampling variance of these estimators are currently unknown and thus only $1 - \alpha$ percentile bootstrap CI are implemented for these estimators exclusively.  
<br>
Grissom and Kim (2001) note that other standardised median differences could be conceived by using yet another robust measure of variability in the denominator. However, we agree with the comment of Grissom and Kim (2012) that "the field should settle on the use of a reduced number of appropriate measures" (p.75) and that a robust estimator with a well-behaved confidence interval should be determined and consistently used when outliers threaten to violate assumptions.  

<br>

<h5 id = "DG_P_d_MAD"> 4.1.5.1 \(d_{MAD}\) </h5>  

The difference in Medians can be standardised by the Median Absolute Deviation (MAD) of the baseline/control measurement/group.  
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):

$$d_{MAD} =  \frac{Mdn_a - Mdn_b}{MAD_{a|b}}$$

with MAD being: 

$$MAD = median(|X_i - median(X_i)|)$$

The MAD is more robust to outliers than the standard deviation and has a lower sampling variance.  
We follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($MAD$) of this estimator as well.  

<br>

<h5 id = "DG_P_d_RIQ"> 4.1.5.2 \(d_{R_{IQ}}\) </h5>

The difference in medians can be standardised by the interquartile range $R_{IQ}$, the difference between the third quartile (0.75-quantile) and the first quartile (0.25-quantile), of the baseline/control measurement/group.  
Then the standardised median difference is calculated with the following formula (Laird & Mosteller, 1990).

$$d_{R_{IQ}} = \frac{Mdn_a - Mdn_b}{0.75 \cdot R_{IQ_{a|b}}}$$

The interquartile range is more outlier resistant than the standard deviation. Multiplying $R_{IQ}$ with 0.75 results in an estimator that approximates the standard deviation under normality (Grissom & Kim, 2001).  
Grissom and Kim (2001) point to Shoemaker (1999) for a discussion of other possibly more robust ranges of quantiles that may yield alternative robust estimators of variability.  
We again follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($R_{IQ}$) of this estimator as well. 

<br>

<h5 id = "DG_P_d_bw"> 4.1.5.3 \(d_{bw}\) </h5>

The differences in medians can be standardised by the biweight standard deviation $s_bw$ of the baseline/control measurement/group (Grissom & Kim, 2001).  
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):  

$$d_{bw} = \frac{Mdn_a - Mdn_b}{S_{bw_{a|b}}}$$

with $s_{bw_{a|b}}$ being 

$$s_{bw_{a|b}} = \frac{\sqrt{n}\sqrt{\sum{a_i(X_i - median(X_i))^2(1 - Y_{i}^{2}}}}{|\sum{a_i(1 - 1 - Y_{i}^{2}}(1 - 5Y_{i}^{2})}$$

with $Y_i$ and $a_i$ being
$$ Y_i = \frac{X_i - median(X_i)}{9MAD}$$
$$a_i = \{_{1, \, if \, |Y_i| < 1}^{0, \, if \, |Y_i| \geq{1}}$$

Grissom and Kim (2001) note that compared to the $MAD$ $s_bw$ has a relatively small sampling variability. 
The naming convention of this estimtaor goes back to Grissom and Kim (2005).  

<br>

<hr>

<h2 id = "DG_P_refs"> 5 References </h2>

Algina, J., Keselman, H. J., & Penfield, R. D. (2005a). An alternative to Cohen’s standardized mean difference effect size: A robust parameter and confidence interval in the two independent groups case. *Psychological Methods*, *10*(3), 317--238. <https://doi.org/10.1037/1082-989X.10.3.317>  

Algina, J., Keselman, H. J., & Penfield, R. D. (2005b). Effect sizes and their intervals: The two-level repeated measures case. *Educational and Psychological Measurement*, *65*(2), 241--258. <https://doi.org/10.1177/0013164404268675>  

Becker, B. J. (1988). Synthesizing standardised mean-change measures. *British Journal of Mathematical and Statistical Psychology*, *41*(2), 257--278. <https://doi.org/10.1111/j.2044-8317.1988.tb00901.x>  

Bonett, D. G. (2006a). Confidence interval for a ratio of variances in bivariate nonnormal distributions. *Journal of Statistical Computation and Simulation*, *76*(7), 637---644. <https:://doi.org/10.1080/10629360500107733>  

Bonett, D. G., & Price, R. M. (2006b). Confidence intervals for a ratio of binomial proportions based on paired data. *Statistics in Medicine*, *25*(17), 3039--3047. <https://doi.org/10.1002/sim.2440>

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods*, *13*(2), 99--109.   <https://doi.org/10.1037/1082-989X.13.2.99>

Bonett, D. G. (2015). Interval estimation of standardized mean differences in paired-samples designs. *Journal of Educational and Behavioral Statistics*, *40*(4), 366--376. <https://doi.org/10.3102/1076998615583904>  

Borenstein, M., Hedges, L. V., Higgins, J. P. T., & Rothstein, H. R. (2009). *Introduction to meta-analysis*. John Wiley.   <https://doi.org/10.1002/9780470743386>

Bradley, E. L. (2006) Overlapping coefficient. In S. Kotz, C. B. Read, N. Balakrishnan, B. Vidakovic, & N. L. Johnson (Eds.), *Encyclopedia of statistical sciences* (1900). New York: Wiley. <https://doi.org/10.1002/0471667196.ess1900.pub2>

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Lawrence Erlbaum Associates. <https://doi.org/10.4324/9780203771587>  

Cousineau, D. (2020). Approximating the distribution of Cohen's $d_p$ in within-subjects designs. *The Quantitative Methods for Psychology*, *16*(4), 418--421. <https://doi.org/10.20982/tqmp.16.4.p418>  

Cousineau, D., & Goulett-Pelletier, J.-C. (2021). A study of confidence intervals for Cohen's $d$ in within-subject designs with new proposals. *The Quantitative Methods for Psychology*, *17*(1), 51--75. <https://doi.org/10.20982/tqmp.17.1.p051>  

Fagerland, M. W., Lydersen, S., & Laake, P. (2014). Recommended tests and confidence intervals for paired binomial proportions. *Statistics in Medicine*, *33*(16), 2850--2875. <https://doi.org/10.1002/sim.6148>  

Field, A., Miles, J., & Zoe, F. (2012). *Discovering statistics using R*. Sage. Gibbons, R. D., Hedeker, D. R., & Davis, J. M. (1993). Estimation of effect size from a series of experiments involving paired comparisons. *Journal of Educational Statistics*, *18*(3), 271--279.   <https://doi.org/10.3102%2F10769986018003271>


Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Routledge.  

Kraska, M. (2022). Repeated measures design. In Frey, B. (Ed.), *The SAGE encyclopedia of research design: Vol. 3* (2nd ed., pp.1395--1398). SAGE Publications, Inc. <https://dx.doi.org/10.4135/9781071812082>  

Mastrich, Z., & Hernandez, I. (2021). Results everyone can understand: A review of common language effect size indicators to bridge the research-practice gap. *Health Psychology*, *40*(10), 727--736. <https://doi.org/10.1037/hea0001112>  

McGraw, K. O., & Wong, S. P. (1992). A common language effect size statistic. *Psychological bulletin*, *111*(2), 361.

Morris, S. B., & DeShon, R. P. (2002). Combining effect size estimates in meta-analysis with repeated measures and independent-groups design. *Psychological Methods*, *7*(1), 105--125. <https://doi.org/10.1037//1082-989X.7.1.105>  

Nam, J., & Blackwelder, W. C. (2002). Analysis of the ratio of marginal probabilities in a matched-pair setting. *Statistics in Medicine*, *21*(5), 689--699. <https://doi.org/10.1002/sim.1017>  

Peng, C.-Y. J., & Chen, L.-T. (2014). Beyond Cohen's d: Alternative effect size measures for between-subject designs. *The Journal of Experimental Education*, *82*(1), 22--50. <https://doi.org/10.1080/00220973.2012.745471>  

Steiger, J. H., & Fouladi, R. T. (1997). Noncentrality interval estimation and the evaluation of statistical methods. In Harlow, L. L., Mulaik, S. A., & Steiger, J. H. (Eds.), *What if there were no significance tests?* (pp. 221--257). Erlbaum.  

Tukey, J. W., & McLaughlin, D. H. (1963). Less vulnerable confidence and significance procedures for location based on a single sample: Trimming/winsorization 1. *Sankhyā: The Indian Journal of Statistics, Series A (1961-2002)*, *25*(3), 331--352. <http://www.jstor.org/stable/25049278>  

Voracek, M., Mohr, E., & Hagmann, M. (2013). On the importance of tail ratios for psychological science. *Psychological Reports*, *112*(3), 872--886. <https://doi.org/10.2466/03.PR0.112.3.872-886>  

Wilcox, R. R. (2017a). *Introduction to robust estimation and hypothesis testing* (4th ed.). Academic Press.  

Wilcox, R. R. (2017b). *Understanding and applying basic statistical methods using R*. John Wiley & Sons  
