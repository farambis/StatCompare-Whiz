<link rel="stylesheet" href="markdown_documentation_style.css">

<div class="toc_container">
<h2 class="toc_title">Table of contents</h2>
 <ul>
  <li><a href="#PPC-intro"><h3>1. The pretest-posttest-control design</h3></a>
  <li><a href="#PPC-change-focused-measures"><h3>2. Change-focused measures of effect size</h3></a>
    <ul>
      <li><a href="#PPC-d_PPC-Change"><h4>2.1. \(d_{PPC-Change}\)</h4></a></li>
      <li><a href="#PPC-g_PPC-Change"><h4>2.2. \(g_{PPC-Change}\)</h4></a></li>
    </ul>
  </li>
  <li><a href="#PPC-difference-focused_measures"><h3>3. Difference-focused measures of effect size</h3></a>
    <ul>
     <li><a href="#d_PPC1"><h4>3.1. \(d_{PPC,\,pre}\)</h4></a></li>
     <li><a href="#g_PPC1"><h4>3.2. \(g_{PPC,\,pre}\)</h4></a></li>
     <li><a href="#d_PPC2"><h4>3.4. \(d_{PPC,\,pooled-pre}\)</h4></a></li>
     <li><a href="#g_PPC2"><h4>3.3. \(g_{PPC,\,pooled-pre}\)</h4></a></li>
     <li><a href="#d_PPC3"><h4>3.5. \(d_{PPC,\,pooled-pre-post}\)</h4></a></li>
     <li><a href="#g_PPC3"><h4>3.6. \(g_{PPC,\,pooled-pre-post}\)</h4></a></li>
    </ul>
  </li>
  <li><a href="#PPC-refs"><h3>4. References</h3></a></li>
 </ul>
</div>

<article>
<h2 id="PPC-intro">The Pretest-posttest-control design</h2>  

The pretest-posttest-control (PPC) design, also know as the pretest-posttest control-group design or the independent groups pretest-posttest (IGPP) design amongst other synonyms entails the random/quasirandom assignement of research participants to one of two conditions(e.g., a treatment or a control condition; a novel treatment and a gold-standard treatment condition; etc.)  and the measurement of an outcome variable at two points in time (i.e., both prior to and after treatment) (Morris, 2008).  

A standardised effect size for the PPC design relates the difference of the mean changes between the two conditions (the numerator) to some measure of variability (the denominator). Different standardised effect sizes can be considered depending on the choice of the denominator, i.e., of the standardiser (Morris & DeShon, 2002; Morris, 2008; Feingold, 2009).  

Two major "groups" of standardised effect sizes for the PPC design can be characterised based on whether the mean change within each groups is standardised by the variability of change scores (change-focused measures) or by the variability of raw scores (difference-focused measures) (Morris & DeShon, 2002; Feingold, 2009). A research question regarding changes in individual performance after some treatment might motivate the former definition while a research question focusing on group differences in the level of performance might motivate the latter definition (Morris & DeShon, 2002).  

<h2 id="PPC-change-focused-measures">Change-focused measures of effect size </h1>  

As described above, a standardised effect size for the PPC design might employ different standardisers based on the focus of the research question at hand (Morris & DeShon, 2002). According to Morris and DeShon (2002). If a researcher is primarily interested in the way a certain outcome changes within individuals as a result of some treatment, then the standard deviation of change scores is an appropriate standardiser of the mean change within a group. This way the population of change scores becomes the metric of the effect size.  

Such a change-focused measure of effect size is closely related to Cohen's $d_z$ as can read below. A change-focused measure of effect could be employed for example in order to assess the extent to which environmentally conscious behaviour increases as a response to a certain treatment (e.g., information campaign, social-psychological intervention, behavioural-economics based incentive scheme) compared to the change that occurs without that treatment.  



<h3 id="PPC-d_PPC-Change">\(d_{PPC-Change}\)</h3>  

The population effect size of interest is given by the formula:

$$\delta_{PPC-Change} = \frac{\mu_{post, a} - \mu_{pre, a}}{\sigma_{D, a}} - \frac{\mu_{post, b} - \mu_{pre, b}}{\sigma_{D, b}} = \frac{\mu_{D, a}}{\sigma_{D, a}} - \frac{\mu_{D, b}}{\sigma_{D, b}} = \delta_{D, a} - \delta_{D, b} \qquad Eq.(PPC )$$

The population *b* mean change score standardised  by the population *b* standard deviation of change scores is subtracted from the population *a* mean change score  standardised by the population *a* standard deviation of change score. Population *a* could be the treatment population and population *b* the control population. If homogeneity of change score variances between populations *a* and *b* can be assumed, the formula for the population effect can be simplified as (e.g., (Feingold, 2009):  

$$\delta_{PPC-Change} = \frac{\mu_{D, a} - \mu_{D, b}}{\sigma_D} \qquad Eq.(PPC )$$

where $\sigma_D$ is the common population standard deviation of difference scores.  

This population effect size informs how many (treatment population) change score standard deviations the treatment population's mean change score lies above zero minus the number of (control population) change score standard deviations the control population's mean change score lies above zero. Under the assumption that both treatment and control populations are equally affected by time effects (e.g., maturation, history, or fatigue), the mean change score in the control group is a measure of the size of these time effects, which also impact the treatment population (for a detailed discussion see Morris & DeShon, 2002). Consequently, and under the additional assumption of homogeneity of change score variances $delta_{PPC-Change}$ is a measure of the average change within an individual after some treatment corrected for time effects.  

The population effect size of interest can be estimated by the following formula (e.g., Morris & DeShon, 2002):

$$d_{PPC-Change} = \frac{\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}}{s_{d,\,a}} - \frac{\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}}{s_{d,\,b}} = d_{z,\,a} - d_{z,\,b} \qquad Eq.(PPC )$$

With $s_{d,\,a}$ being:

$$s_{d,\,a} = \sqrt{\frac{1}{(n_a - 1)}\sum_{i = 1}^{n_a}(d_{i, a} - \bar{d_{a}})^2} \qquad Eq.(PPC )$$

and $s_{d,\,b}$ being:

$$s_{d, b} = \sqrt{\frac{1}{(n_b - 1)}\sum_{i = 1}^{n_b}(d_{i, b} - \bar{d_{b}})^2} \qquad Eq.(PPC )$$

with $d_i = X_{post_i} - X_{pre_i}$ and $\bar{d} = \frac{1}{n}\sum_{i = 1}^nd_i = \bar{X}_{post} - \bar{X}_{pre} $.

Note that this estimator simplifies to the difference between $d_z$, i.e., Cohen's $d_{z,\,a}$ for group *a*, and $d_{z,\,b}$, i.e., Cohen's $d_z$ for group *b*.  

Morris and DeShon (2002) have described this effect size but did not name it, while Feingold (2009) termed it $d_{IGPP-change}$. Since we are referring to effect sizes not corrected for bias as $d$, we have opted for $d$ instead of $g$. Additionally, we have put information about the study design (PPC) and the standardiser ( pretest standard deviations) in the subscript, much like Feingold (2009) did. 

This estimator has a bias. It systematically overestimates the size of the true population effect. This bias can be corrected - see $g_{PCC-Change}$.

<h4>Mathematical details of the implemented confidence interval procedure</h4>  

Since the treatment and the control group are independent, an estimate of the sampling variance of $d_{PPC-Change}$ is given by the sum:

$$\widehat{Var}(d_{PPC-Change}) = \widehat{Var}(d_{z,\,a} - d_{z,\,b}) = \widehat{Var}(d_{z,\,a}) + \widehat{Var}(d_{z,\,b})$$

Viechtbauer (2007) compared the performance of confidence interval procedures based on various approximations of  sampling variance of $d_z = \frac{\bar{X}_{post} - \bar{X}_{pre}}{s_{d}}$. The author recommends using the following formula for the sampling variance of $d_z$:

$$\hat{\sigma}^2_{d_z} = \frac{1}{n} + \frac{d_z^2}{2(n - 1)}$$

Consequently, the $1 - \alpha$ level confidence interval procedure implemented here uses:

$$\widehat{Var}(d_{PPC-Change}) =  \hat{\sigma}^2_{d_{z,\,a}} + \hat{\sigma}^2_{d_{z,\,b}} = \frac{1}{n_a} + \frac{d_{z,\,a}^2}{2(n_a - 1)} + \frac{1}{n_b} + \frac{d_{z,\,b}^2}{2(n_b - 1)}$$

The confidence limits are given by:

$$LL = d_{PCC-Change} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \sqrt{\widehat{Var}(d_{PPC-Change})}$$

$$UL = d_{PCC-Change} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \sqrt{\widehat{Var}(d_{PPC-Change})}$$

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  




<h3 id="PPC-g_PPC-Change">\(g_{PPC-Change}\)</h3>

As mentioned above $d_{PCC-Change}$ has a slight positive bias, which can be corrected. This alternative formula estimates $\delta_{PPC-Change}$ as well:

$$g_{PPC-Change} = J(\nu_a) \left(\frac{\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}}{s_{d, a}}\right) - J(\nu_b)\left(\frac{\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}}{s_{d,\,b}}\right) = g_{z,\,a} - g_{z,\,b}\qquad Eq.(PPC )$$

with $\nu_{a|b} = n_{a|b} - 1$ denoting the degrees of freedom for group *a* and *b* and $J(\nu)$ being given by

$$J(\nu) = \frac{\Gamma(\frac{\nu}{2})}{\sqrt{\frac{\nu}{2}}\Gamma(\frac{\nu - 1}{2})} \qquad Eq.(PPC )$$

While Morris and DeShon (2002) as well as Feingold (2009) only provided formulas using biased estimates of the standardised mean change score, i.e., $d_z$, here we additionally implement an effect size estimate using the unbiased estimates of the standardised mean change score, i.e. $g_z$ (see documentation for the dependent groups parametric design). Since we are referring to the bias-corrected effect sizes with a $g$, we have opted for $g$ with information about the study design (PPC) and the standardiser (change score standard deviations) in the subscript.

<h4>Mathematical details of the implemented confidence interval procedure</h4>  

An approximate large-sample $1 - \alpha$ CI is implemented similarly as the CI for $d_{PPC-Change}$ with $\widehat{Var}(g_{PPC-Change})$ replacing $\widehat{Var}(d_{PPC-Change})$:

$$\widehat{Var}(g_{PPC-Change} = J(\nu_a)^2\hat{\sigma}^2_{d_{z,\,a}} + J(\nu_b)^2\hat{\sigma}^2_{d_{z,\,b}} \qquad Eq.(PPC )$$

Thus the sampling variance for $d_{z,\,a}$ is multiplied by $J(\nu_a)^2$ and the sampling variance for $d_{z,\,b}$ is multipied by $J(\nu_b)^2$ before being summed up. The confidence limits are given by:

$$LL = g_{PCC-Change} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \sqrt{\widehat{Var}(g_{PPC-Change})}$$

$$UL = g_{PCC-Change} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \sqrt{\widehat{Var}(g_{PPC-Change})}$$

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  




<h2 id="PPC-difference-focused_measures">Difference-focused measures of effect size</h1>

If the focus of a research question lies on a group difference in the level of a certain outcome variable, then the variability of the outcome measure (and not that of change scores) is the appropriate standardiser of the mean difference between pre- and posttest scores within each compared group (Morris & DeShon, 2002). After a decision in favour of a difference-focused effect size, there still remain multiple measures of variability to choose from (Morris, 2008).  

Under the assumption of random sampling from two populations (*a* and *b*) each with a bivariate normal distribution of pre- and posttest scores, equal correlation $\rho_a = \rho_b = \rho$ of pre- and posttest scores across the two populations as well as equal standard deviations across populations and times of measurement $\sigma_{a,\,pre} = \sigma_{a,\,post} = \sigma_{b,\,pre} = \sigma_{b,\,post} = \sigma$, all discussed effect sizes measure a common population effect (Morris, 2008):  

$$\Delta_{PPC-Difference} = \frac{\left(\mu_{a,\,post} - \mu_{a,\,pre}\right) - \left(\mu_{b,\,post} - \mu_{b,\,pre}\right)}{\sigma} \qquad Eq.(PPC)$$
  
However, if any of the assumptions do not hold then the population effects will differ as well. The effects of the violation of the homogeneity of variances assumption will be discussed for each effect size based on Morris (2008).   

If group *a* is a treatment group and group *b* is a control group and in case both groups are equally affected by various time effects (e.g. maturation, history, or fatigue), then this population effect captures the mean change caused by treatment with time effects removed (e.g., Becker, 1988; Morris & DeShon, 2002).   

A difference-focused measure of effect size might be employed in order to assess the difference in mean changes of environmentally conscious behaviour between a treatment (e.g, behavioural-economics based incentive scheme) and a control group or between two different treatment groups (e.g., a standard information campaign versus a social-psychological intervention). Thus, a difference-focused effect size measures the difference between the pre-posttest difference in the level of an outcome in one group (e.g., a treatment group) and the pre-posttest difference in the level of an outcome in a different group (e.g., a control group).  

As can be noted by comparing the given examples for the applications of change-focused and difference-focused effect size measures, sometimes either option can be sensible for the collected data depending on the framing of the research question (Morris & DeShon, 2002). The difference between a change-focused and a difference-focused framing of a research question may be subtle but it is imperative to be aware of this difference. Amongst other reasons due to the fact that change- and difference-focused effect size measures can tremendously differ in size due to the differing choices of standardisers (Dunlap et al., 1996; Morris & DeShon, 2002) owing to the fact that the standard deviation of change scores is smaller than the standard deviation of raw scores when the pre-posttest correlation is larger than 0.5. Thus, great care should be taken when reporting and synthesising effect sizes from designs including dependent groups (Morris & DeShon, 2002).  


<h3 id="d_PPC1">\(d_{PPC,\,pre}\)</h3>

In general the population effect size of interest is given by the formula (Morris & DeShon, 2002):

$$\delta_{PPC,\,pre} = \frac{\mu_{post,\,a} - \mu_{pre,\,a}}{\sigma_{pre,\,a}} - \frac{\mu_{post,\,b} - \mu_{pre,\,b}}{\sigma_{pre,\,b}} =  \Delta_{pre,\,a} - \Delta_{pre,\,b} \qquad Eq.(PPC )$$

The population *a* mean change standardised by the pretest standard deviation of population *a*, from which the population *b* mean change standardised  by the pretest standard deviation of population *b* is subtracted. Population *a* would be the treatment population and population *b* would be the control population. If homogeneity of pretest variances across populations *a* and *b* can be assumed, then $\delta_{PPC,\,pre}$ is identical to $\delta_{PPC,\,pre}$. Further, if homogeneity of variances across times of measurement and populations can be assumed $\delta_{PPC,\,pre}$ is identical with $\Delta_{PPC-Difference}$.  


This population effect size informs how many treatment population pretest standard deviations the posttest mean of the treatment population lies above the pretest mean of the treatment population minus the number of control population pretest standard deviations the posttest mean of the control population lies above the pretest mean of the control population. Under the assumption that both treatment and control populations are equally affected by time effects (e.g., maturation, history, or fatigue), the mean change in the control group is a measure of the size of these time effects, which also impact the treatment population (for a detailed discussion see Morris & DeShon, 2002). Consequently, and under the additional assumption of homogeneity of pretest variances $\delta_{PPC,\,pre}$ is a measure of the standardised difference of the average score after some treatment compared to the average score prior to said treatment corrected for time effects.  

The population effect size of interest can be estimated by the following formula (e.g., Morris & DeShon, 2002):

$$d_{PPC,\,pre} = \frac{\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}}{s_{pre,\,a}} - \frac{\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}}{s_{pre,\,b}} = d_{G,\,pre,\,a} - d_{G,\,pre,\,b} \qquad Eq.(PPC )$$

Note that this estimator simplifies to the difference between $d_{G, pre, a}$, i.e., Glass $d_G$ for group *a* with the pretest score standard deviation as the standardiser, and $d_{G,\,pre,\,b}$, i.e., Glss $d_G$ for group *b* with the pretest score standard deviation as the standardiser.  

Morris and DeShon (2002) termed the population effect $\delta_{IGPP}$ and its estimator $d_{IGPP}$. Morris (2008) called it $g_{PPC1}$ and Feingold (2009) named it $d_{IGPP-raw}$. Since we are referring to effect sizes not corrected for bias as $d$, we have opted for $d$ instead of $g$. Additionally, we have put information about the study design (PPC) and the standardiser ( pretest standard deviations) in the subscript.  

This estimator has a bias. It systematically overestimates the size of the true population effect. This bias can be corrected - see $g_{PCC,\,pre}$.  

<h4>Mathematical details of the implemented confidence interval procedure</h4>  

Since the treatment and the control group are independent, an estimate of the sampling variance of $d_{PPC, pre}$ is given by the sum:

$$\widehat{Var}(d_{PPC,\,pre}) = \widehat{Var}(d_{G,\,pre\, a} - d_{G,\,pre,\,b}) = \widehat{Var}(d_{G,\,pre,\,a}) + \widehat{Var}(d_{G,\,pre,\,b}) = \hat{\sigma}^2_{d_{G,\,pre,\,a}} + \hat{\sigma}^2_{d_{G,\,pre,\,b}}$$

Viechtbauer (2007) compared the performance of confidence interval procedures based on various formulas for the approximate sampling variance of $d_{G,\,pre} = \frac{\bar{X}_{post} - \bar{X}_{pre}}{s_{pre}}$. While none of the methods was superior in all analysed aspects and with in fact all of the procedures yielding coverage probabilities below the nominal $1 - \alpha$ level, the author generally concludes that the following formula for the sampling variance of $d_{G,\,pre}$ was the most accurate:

$$\hat{\sigma}^2_{d_{G,\,pre}} = \frac{2(1-r)}{n} + \frac{d_{G,\,pre}^2}{2n}$$

Consequently, the $1 - \alpha$ level confidence interval procedure implemented here uses:

$$\widehat{Var}(d_{PPC,\,pre}) =  \hat{\sigma}^2_{d_{G,\,pre,\,a}} + \hat{\sigma}^2_{d_{G,\,pre,\,b}} = \frac{2(1-r_a)}{n_a} + \frac{d_{G,\,pre,\,a}^2}{2n_a} + \frac{2(1-r_b)}{n_b} + \frac{d_{G,\,pre,\,b}^2}{2n_b}$$

$$LL = d_{PCC,\,pre} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(d_{PPC,\,pre})$$

$$UL = d_{PCC,\,pre} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(d_{PPC,\,pre})$$

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.






<h3 id="g_PPC1">\(g_{PPC,\,pre}\)</h3>

As mentioned above $d_{PCC,\,pre}$ has a slight positive bias, which can be corrected. This alternative formula (Becker, 1988) also estimates $\delta_{PPC,\,pre}$:

$$g_{PPC,\,pre} = J(\nu_a) \left(\frac{\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}}{s_{pre,\,a}}\right) - J(\nu_b) \left(\frac{\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}}{s_{pre,\,b}}\right) = g_{G, pre,\,a} - g_{G,\,pre,\,b} \qquad Eq.(PPC )$$

with $\nu_{a|b}= n_{a|b} - 1$ denoting the degrees of freedom and $J(\nu)$ being given by $Eq.(PPC)$

Becker (1988) termed the population effect size given by $Eq.(PPC)$ $\Delta$ and its estimate $\hat{\Delta}$ and Morris (2008) called it $d_{PPC1}$. Since we are referring to the bias-corrected effect sizes with a $g$, we have opted for $g$ instead of $d$. Additionally, we have put information about the study design (PPC) and the standardiser (pretest standard deviations) in the subscript.

<h4>Mathematical details of the implemented confidence interval procedure</h4>  

An approximate large-sample $1 - \alpha$ CI is implemented. Viechtbauer (2007) recommends the following approximate large-sample formula for the sampling variance of $g_{G, pre}$:

$$\hat{\sigma}^2_{g_{G,\,pre}} = \frac{2(1-r)}{n} + \frac{g_{G,\,pre}^2}{2(n-1)}$$

and given that the contrasted groups are independent, the sampling variance of $g_{PPC, pre}$ is given by:

$$\widehat{Var}(g_{PPC,\,pre} = \hat{\sigma}^2_{g_{G,\,pre,\,a}} + \hat{\sigma}^2_{g_{G,\,pre,\,b}} \qquad Eq.(PPC )$$

The confidence limits are computed as:

$$LL = g_{PCC, pre} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \sqrt{\widehat{Var}(g_{PPC,\,pre})}$$

$$UL = g_{PCC, pre} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \sqrt{\widehat{Var}(g_{PPC,\,pre})}$$

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  




<h3 id="d_PPC2">\(d_{PPC,\,pooled-pre}\)</h3>

The population effect size being estimated is given by the formula (Morris, 2008):

$$\delta_{PPC,\,pooled-pre} = \frac{\left(\mu_{post,\,a} - \mu_{pre,\,a}\right) - \left(\mu_{post,\,b} - \mu_{pre,\,b}\right)}{\sigma_{pre}}\qquad Eq.(PPC )$$

The difference between the population *a* mean change and the population *b* mean change is standardised  by the pretest standard deviation, which is assumed to be equal within the populations *a* and *b*. For our discussion, let's say population *a* is a treatment population and population *b* is a control population. If homogeneity of pretest and posttest variances across populations *a* and *b* can be assumed, then $\delta_{PPC,\,pooled-pre}$ is identical to $\Delta_{PPC-Difference}$. 

Thus, $\delta_{PPC,\,pooled-pre}$ conveys how many population pretest standard deviations the treatment population's mean change lies above the control population's mean change. Under the assumption that both treatment and control populations are equally affected by time effects (e.g., maturation, history, or fatigue), the mean change in the control group is a measure of the size of these common time effects (for a detailed discussion see Morris & DeShon, 2002). Consequently, $\delta_{PPC,\,pooled-pre}$ is a standardised measure of the difference of the average score after some treatment compared to the average score prior to said treatment corrected for time effects.  

$\delta_{PPC,\,pooled-pre}$ can be estimated by the following formula (e.g., Morris, 2008):

$$d_{PPC,\,pooled-pre} = \frac{\left(\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}\right) - \left(\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}\right)}{s_{pre,\,pooled}} \qquad Eq.(PPC )$$

with

$$s_{pre,\,pooled} = \sqrt{\frac{(n_a - 1)s_{pre,\,a}^2 + (n_b - 1)s_{pre,\,b}^2}{n_a + n_b - 2}}$$

Carlson and Schmidt (1999) termed this estimate $ES_{PPWC}$ (with PPWC standing for pretest-posttest with control) and Morris (2008) called it $g_{PPC2}$. Since we are referring to effect sizes not corrected for bias as $d$, we have opted for $d$ instead of $g$. Additionally, we have put information about the study design (PPC) and the standardiser (pooled pretest standard deviations) in the subscript. 

This estimator has a bias. It systematically overestimates the size of the true population effect. This bias can be corrected - see $g_{PCC,\,pooled-pre}$.

<h4>Mathematical details of the implemented confidence interval procedure</h4>  

Morris (2008) details the derivation of the theoretical sampling distribution of $d_{PPC,\,pooled-pre}$. It is important to note that, while $\delta_{PPC,\,pooled-pre}$ only assumes homogeneity of pretest variances, the formula for the sampling distribution of $d_{PPC,\,pooled-pre}$ given by Morris (2008) and the one given here both assume homogeneity of variances across populations and times of measurement as well as a common correlation of pre- and posttest scores in both populations! The formula for the estimate of the sampling variance implemented here is a delta-method approximation suggested by Pustejovsky (2016):

$$\widehat{Var}(d_{PPC,\,pooled-pre}) = \frac{2(1-r_p)(n_a+n_b)}{n_an_b} + \frac{d_{PPC,\,pooled-pre}}{2\nu}$$ 

with $r_p$ being the pooled pre-posttest correlations from the two samples and $\nu = n_a + n_b - 2$ being the degrees of freedom. The pooled correlation is computed as an inverse-variance weighted average of the two sample pre-posttest correlations. This method is identical to the computation of the inverse-variance weighted average effect in a meta-analysis (e.g. Harrer et al., 2021)!  

First the pre-posttest correlations of both groups are transformed into Fisher's z values:

$$z_{a|b} = 0.5log(\frac{1 + r_{a|b}}{1 - r_{a|b}})$$

Then the sampling variances of these Fisher's z values are computed:

$$\widehat{Var}(z_{a|b}) = \frac{1}{\sqrt{n_{a|b} - 3}}$$

The weights of the Fisher's z values are simply the inverse of their respective sampling variances:

$$w_{a|b} = \frac{1}{\widehat{Var}(z_a|b)}$$

The inverse-variance weighted average of the Fisher's z values is computed:

$$z_p = \frac{w_a * z_a + w_b * z_b}{w_a + w_b}$$

Lastly, $z_p$ is transformed back into a correlation coefficient:

$$r_p = \frac{e^{2z_p} - 1}{1 + e^{2z_p}} \qquad Eq.(PPC)$$

The $1 - \alpha$ level confidence interval procedure implemented here returns the following lower and upper limits:

$$LL = d_{PCC,\,pooled-pre} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(d_{PPC,\,pooled-pre})$$

$$UL = d_{PCC,\,pooled-pre} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(d_{PPC,\,pooled-pre})$$

Morris (2008) compared the sampling variance of $d_{PPC,\,pre}$ and $d_{PPC,\,pooled-pre}$ using Monte Carlo simulations with various combinations of true population effect, population pre-posttest correlations and sample sizes. The sampling variance of $d_{PPC,\,pooled-pre}$ was consistently smaller than that of $d_{PPC,\,pre}$ with differences being rather small when the control group mean change was 0, correlations were modest ($\rho = 0$ or $\rho = 0.45$) and sample sizes were "large" ($n_a = n_b = 50$). However, the greater precision of $d_{PPC,\,pooled-pre}$ is clearly noticeable for combinations of a small control group mean change of 0.2 (e.g. due to time effects), large pre-posttest correlations of $\rho = 0.9$ and small sizes of $n_a = n_b = 10$ or $n_a = n_b = 25$. See Morris (2008) for further details.  

As noted above, the formula for the sampling variance of $d_{PPC,\,pooled-pre}$ is derived under the assumption of homogeneous variances across populations and times of measurement (amongst other assumptions). Problems arise if the posttest variance in one or both examined populations is larger than the pretest variance. An increased post-treatment variance could result from the fact that some test subjects improve more strongly than others (Morris, 2008).  

In such a case using the closed form formula for the CI described here is not advisable. Not only is the formula of the theoretical sampling variance inaccurate under heteroscedasticity of pre- and posttest scores, but the empirical sampling variances of both $d_{PPC,\,pre}$ and $d_{PPC,\,pooled-pre}$ increase under such circumstances. Read more on the effects of violations of the homogeneity of variance assumption on the sampling variance of $d_{PPC,\,pooled-pre}$ in Morris (2008). An $1 - \alpha$ percentile bootstrap CI is implemented, which should give a better estimate of the magnitude of the true sampling variance of $d_{PPC,\,pooled-pre}$ under such circumstances and thus provide a more accurate confidence interval.



 
<h3 id="g_PPC2">\(g_{PPX,\,pooled-pre}\)</h3>  

As mentioned above $d_{PCC,\,pooled-pre}$ has a slight positive bias, which can be corrected. This alternative formula (Morris, 2008) also estimates $\delta_{PPC,\,pooled-pre}$:

$$g_{PPC,\,pooled-pre} = J(\nu) \frac{\left(\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}\right) - \left(\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}\right)}{s_{pre,\,pooled}} = J(\nu) d_{PPC,\,pooled-pre} \qquad Eq.(PPC )$$

with $\nu= n_a + n_b - 2$ denoting the degrees of freedom and $J(\nu)$ being given by $Eq.(PPC)$

Morris (2008) termed this estimator $d_{PPC2}$. Since we are referring to the bias-corrected effect sizes with a $g$, we have opted for $g$ instead of $d$. Additionally, we have put information about the study design (PPC) and the standardiser (pooled pretest standard deviations) in the subscript.  

<h4>Mathematical details of the implemented confidence interval procedure</h4>   

Same as for $d_{PPC,\,pooled-pre}$ Morris (2008) details the derivation of the theoretical sampling distribution of $g_{PPC,\,pooled-pre}$. Both the sampling variance formula given by Morris (2008) as well as the implemented delta-method approximation suggested by Pustejovsky (2016) assume homogeneity of variances across populations and times of measurement as well as a common correlation of pre- and posttest scores in both populations! The estimate of the sampling variance is given by:


$$\widehat{Var}(g_{PPC,\,pooled-pre}) = \widehat{Var}(J(\nu)d_{PPC,\,pooled-pre}) = J(\nu)^2\widehat{Var}(d_{PPC,\,pooled-pre}) = J(\nu)^2\frac{2(1-r_p)(n_a+n_b)}{n_an_b} + \frac{d_{PPC,\,pooled-pre}}{2\nu}$$  

For the computation of $r_p$ see $Eq.(PPC)$ above.

The $1 - \alpha$ level confidence interval procedure implemented here returns the following lower and upper limits:

$$LL = g_{PCC,\,pooled-pre} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(g_{PPC,\,pooled-pre})$$

$$UL = g_{PCC,\,pooled-pre} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(g_{PPC,\,pooled-pre})$$

The discussion regarding the precision of $d_{PPC,\,pooled-pre}$ as compared to $d_{PPC,\,pooled-pre}$ as well as the effects of heterogeneity of variances on the sampling variance of $d_{PPC,\,pooled-pre}$ applies to $g_{PPC,\,pooled-pre}$ as well (see above). Thus, especially if there is reason to believe that the posttreatment variance is different than the pretreatment variance, it is advised to inspect the $1 - \alpha$ percentile bootstrap CI provided by this application instead of the CI based on the closed form formula described.  




<h3 id="d_PPC3">\(d_{PPC,\,pooled-pre-post}\)</h3>

The population effect size being estimated has already been defined further above (Morris, 2008):

$$\delta_{PPC,\,pooled-pre-post} = \Delta_{PPC-Difference} = \frac{\left(\mu_{post,\,a} - \mu_{pre,\,a}\right) - \left(\mu_{post,\,b} - \mu_{pre,\,b}\right)}{\sigma}\qquad Eq.(PPC )$$

The difference between the population *a* mean change and the population *b* mean change is standardised  by a population standard deviation, which is assumed to be equal across times of measurement and populations *a* and *b*. For our discussion, let's say population *a* is a treatment population and population *b* is a control population.  

Thus, $\delta_{PPC,\,pooled-pre-post}$ conveys how many population standard deviations the treatment population's mean change lies above the control population's mean change. Under the assumption that both treatment and control populations are equally affected by time effects (e.g., maturation, history, or fatigue), the mean change in the control group is a measure of the size of these common time effects (for a detailed discussion see Morris & DeShon, 2002). Consequently, $\delta_{PPC,\,pooled-pre-post}$ is a standardised measure of the difference of the average score after some treatment compared to the average score prior to said treatment corrected for time effects.  

$\delta_{PPC,\,pooled-pre-post}$ can be estimated by the following formula (e.g., Morris, 2008):

$$d_{PPC,\,pooled-pre-post} = \frac{\left(\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}\right) - \left(\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}\right)}{s_{pre+post,\,pooled}} \qquad Eq.(PPC )$$

with

$$s_{pre+post,\,pooled} = \sqrt{\frac{(n_a - 1)(s_{pre,\,a}^2 +s_{post,\,a}) + (n_b - 1)(s_{pre,\,b}^2 + s_{post,\,b})}{2(n_a + n_b - 2)}}$$

Morris (2008) termed this estimator $g_{PPC3}$. Since we are referring to effect sizes not corrected for bias as $d$, we have opted for $d$ instead of $g$. Additionally, we have put information about the study design (PPC) and the standardiser (pooled pretest and posttest standard deviations) in the subscript. 

This estimator has a bias. It systematically overestimates the size of the true population effect. This bias can be corrected - see $g_{PCC,\,pooled-pre-post}$.  

<h4> Mathematical details of the implemented confidence interval procedure </h4>  

Morris (2008) notes that the exact theoretical sampling distribution of $d_{PPC,\,pooled-pre-post}$ is unknown. Even though the derivation of the theoretical sampling distribution of $d_{PPC,\,pooled-pre-post}$ is identical to the derivation for $d_{PPC,\,pooled-pre}$ given by Morris (2008), the exact degrees of freedom remained unknown at the time of Morris' (2008) publication. The problem was that the degrees of freedom associated with pooling pretest and posttest standard deviations across two independent groups could at best be estimated as $\nu = 2(n_a + n_b - 2)$ at the time. This surely overestimates the correct degrees of freedom since these degrees of freedom would result from pooling across four independent groups - two of size $n_a$ and two of size $n_b$ (Morris, 2008). But since the pooling is done including nonindependent pretest and posttest scores, the gain in information/precision by pooling certainly has to be less than the degrees of freedom associated with pooling across independent groups - except of course if the pre- and posttest correlations were 0.  

However, by now the degrees of freedom in question are no longer unknown (see for example Pustejovsky, 2016). This allows us to use the same delta-method approximation to estimate the sampling variance of $d_{PPC,\,pooled-pre-post}$  as for $d_{PPC,\,pooled-pre}$, with slightly different degrees of freedom (Pustejovsky, 2016): 

$$\widehat{Var}(d_{PPC,\,pooled-pre-post}) = \frac{2(1-r_p)(n_a+n_b)}{n_an_b} + \frac{d_{PPC,\,pooled-pre}}{2\nu}$$ 

with $r_p$ being the pooled pre-posttest correlations (see equations $Eq.(PPC)$ through $Eq.(PPC)$) and $\nu = \frac{2(n_a + n_b - 2)}{1 + r_p^2}$ being the degrees of freedom (Pustejovsky, 2016). It should be noted that much like the closed form formula for the sampling variance of $d_{PPC,\,pooled-pre}$ is derived under the assumption of homogeneous variances across times of measurements and poulations, so is the formula given above for the sampling variance of $d_{PPC,\,pooled-pre-post}$.  

The $1 - \alpha$ level confidence interval procedure implemented here returns the following lower and upper limits:

$$LL = d_{PCC,\,pooled-pre-post} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(d_{PPC,\,pooled-pre-post})$$

$$UL = d_{PCC,\,pooled-pre-post} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(d_{PPC,\,pooled-pre-post})$$

While Morris (2008) did not provide a closed form formula for the sampling distribution of $d_{PPC,\,pooled-pre-post}$ for reasons mentioned above, the author scrutinised the empirical sampling distribution of the effect size using Monte Carlo simulations. When data were simulated from bivariate normal distributions with equal variances across times of measurement and populations as well as with equal population pre-posttest correlations, the empirical sampling distribution of $d_{PPC,\,pooled-pre-post}$ was generally the smallest of the three effect sizes Morris (2008) compared. However, it should be noted that the sampling variance of $d_{PPC,\,pooled-pre-post}$ consistently proved to be a marginal improvement over the sampling variance of $d_{PPC,\,pooled-pre}$ (Morris, 2008).  

As noted above, the formula for the sampling variance of $d_{PPC,\,pooled-pre-post}$ is derived under the assumption of homogeneous variances across populations and times of measurement (amongst under assumptions). Should the posttest variance in one or both examined populations be larger than the pretest variance - for example due to some test subjects improving more strongly as a result of a treatment than others - then the given formula for the sampling variance and consequently of the confidence interval of $d_{PPC,\,pooled-pre-post}$ is inaccurate. Further, the Monte Carlo simulations of Morris (2008) have shown that sampling under heteroscedasticity increases the empirical sampling variance of $d_{PPC,\,pooled-pre-post}$  (much like the sampling variance of the other analysed effect size estimates) as compared to sampling under homoscedasticity.  

However, heteroscedasticity not only ameliorates the precision of $d_{PPC,\,pooled-pre-post}$, it also introduces bias. The standardiser of $d_{PPC,\,pooled-pre-post}$ pools all standard deviations and if the population posttest standard deviation of the treatment group is larger than the population pretest standard deviations of the treatment and the control group, then the standardiser of $d_{PPC,\,pooled-pre-post}$ will tend to be larger than the standardiser of $d_{PPC,\,pooled-pre}$ or $d_{PPC,\,pre}$, since these only incorporate pretest standard deviations. Thus, heteroscedasticity can lead to vastly different estimates between $d_{PPC,\,pooled-pre-post}$ on the one hand and $d_{PPC,\,pooled-pre}$ and $d_{PPC,\,pre}$ on the other hand. In general, when variances are not homogeneous across populations and times of measurement estimating $\delta_{PPC,\,pooled-pre-post}$ becomes ill advised since it assumes said homogeneity of variances which is violated.

An $1 - \alpha$ percentile bootstrap CI is implemented, which should give a better estimate of the magnitude of the true sampling variance of $d_{PPC,\,pooled-pre-post}$ under heteroscedasticity and thus provide a more accurate confidence interval if one is still interested in employing $d_{PPC,\,pooled-pre-post}$ as an effect size.




<h3 id="g_PPC3">\(g_{PPC,\,pooled-pre-Post}\)</h3>

As mentioned above $d_{PCC,\,pooled-pre-post}$ has a slight positive bias, which can be corrected. The bias-corrected estimate implemented here is based on Morris (2008) with the now identified degrees of freedom (Pustejovsky, 2016):

$$g_{PPC,\,pooled-pre-post} = J(\nu) \frac{\left(\bar{X}_{post,\,a} - \bar{X}_{pre,\,a}\right) - \left(\bar{X}_{post,\,b} - \bar{X}_{pre,\,b}\right)}{s_{pre+post,\,pooled}} = J(\nu) d_{PPC,\,pooled-pre-post} \qquad Eq.(PPC )$$

with $\nu= \frac{2(n_a + n_b - 2)}{1 + r_p^2}$ denoting the degrees of freedom (for the computation of $r_p$ see equations $Eq.(PPC)$ through $Eq.(PPC)$) and $J(\nu)$ being given by $Eq.(PPC)$. This effect size also estimates $\delta_{PPC,\,pooled-pre-post}$.

Morris (2008) termed this estimator $d_{PPC3}$. Since we are referring to the bias-corrected effect sizes with a $g$, we have opted for $g$ instead of $d$. Additionally, we have put information about the study design (PPC) and the standardiser (pooled pretest and posttest standard deviations) in the subscript.  

<h4>Mathematical details of the implemented confidence interval procedure</h4>   

Same as for $d_{PPC,\,pooled-pre-post}$ a delta-method approximation suggested by Pustejovsky (2016) is implemented which importantly assumes homogeneity of variances across times of measurements and populations (for furhter assumptions see the introduction to the difference-focused PPC effect sizes). The estimate of the sampling variance is given by:

$$\widehat{Var}(g_{PPC,\,pooled-pre-post}) = \widehat{Var}(J(\nu)d_{PPC,\,pooled-pre-post}) = J(\nu)^2\widehat{Var}(d_{PPC,\,pooled-pre-post}) = J(\nu)^2\frac{2(1-r_p)(n_a+n_b)}{n_an_b} + \frac{d_{PPC,\,pooled-pre}}{2\nu}$$  

The $1 - \alpha$ level confidence interval procedure implemented here returns the following lower and upper limits:

$$LL = g_{PCC,\,pooled-pre-post} - \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(g_{PPC,\,pooled-pre-post})$$

$$UL = g_{PCC,\,pooled-pre-post} + \Phi^{-1}(1 - \frac{\alpha}{2}) * \widehat{Var}(g_{PPC,\,pooled-pre-post})$$

The discussion regarding the precision of $d_{PPC,\,pooled-pre-post}$ as well as the effects of heterogeneity of variances on the effect size estimate and its sampling variance applies to $g_{PPC,\,pooled-pre-post}$ as well (see above). Thus, especially if there is reason to believe that the posttreatment variance is different than the pretreatment variance in at least one of the contrasted populations, one is advised to reconsider the use of $g_{PPC,\,pooled-pre-post}$ and in the case of one still choosing $g_{PPC,\,pooled-pre-post}$ given heterogeneity of variances, it is advised to inspect the $1 - \alpha$ percentile bootstrap CI provided by this application instead of the CI based on the closed form formula given above.  



<h2 id="PPC-refs">References</h1>

Dunlap, W. P., Cortina, J. M., Vaslow, J. B., & Burke, M. J. (1996). Meta-analysis of experiments with matched groups or repeated measures designs. *Psychological Methods*, *1*(2), 170--177. <https://doi.org/10.1037/1082-989X.1.2.170>  

Feingold, A. (2009). Effect sizes for growth-modeling analysis for controlled clinical trials in the same metric as for classical analysis. *Psychological Methods*, *14*(1), 43--53. <https://doi.org/10.1037/a0014699>  

Harrer, M., Cuijpers, P., Furukawa, T.A., & Ebert, D.D. (2021). *Doing Meta-Analysis with R: A Hands-On Guide*. CRC Press. <https://bookdown.org/MathiasHarrer/Doing_Meta_Analysis_in_R/>  

Morris, S. B. (2008). Estimating effect sizes from pretest-posttest-control group designs. *Organizational Research Methods*, *11*(2), 364--386. <https://doi.org/10.1177/1094428106291059>  

Morris, S. B., & DeShon, R. P. (2002). Combining effect size estimates in meta-analysis with repeated measures and independent-groups design. *Psychological Methods*, *7*(1), 105--125. <https://doi.org/10.1037//1082-989X.7.1.105>  

Pustejovsky, J. E. (2016, June 3). Alternative formulas for the standardized mean difference. jepusto. <https://www.jepusto.com/alternative-formulas-for-the-smd/>  

Viechtbauer, W. (2007). Approximate confidence intervals for standardized effect sizes in the two-independent and two-dependent samples design. *Journal of Educational and Behavioral Statistics*, *32*(1), 39--60. <https://doi.org/10.3102/1076998606298034>  
</article>