# Assuming Normality but not Homoscedasticity

## Glass' $d_{G,\,j}$  

The population effect of interest is given by:

$$\Delta_j = \frac{\mu_a - \mu_b}{\sigma_j} \qquad Eq.(DG)$$

with two groups this results in the effects:

$$\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a} \qquad Eq.(DG)$$

$$\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b} \qquad Eq.(DG)$$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by the population standard deviation of population *a* or population *b* $\sigma_{(a|b)}$.  

The populations of interest might be an experimental group (e.g., a group that receives some form of psychotherapy) and a control group (e.g., a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could be thought of as $\mu_E$, i.e., as the mean of the population receiving some form of treatment, and $\mu_b$ could be thought of as $mu_C$, i.e., the mean of the population not receiving said treatment. $\Delta_a$ tells us how many population *a* standard deviation units $\mu_a$ (e.g.,$\mu_E$) lies below or above $\mu_b$ (e.g.,$\mu_C$). $\Delta_b$ tells us how many population *b* standard deviation units $\mu_a$ (e.g., $\mu_E$) lies below or above $\mu_b$ (e.g., $\mu_c$).  

Treatments can increase the variance in an outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & Kim, 2012, pp. 17-20). Thus, the variance of the population receiving treatment might be higher than the variance of the population without said treatment. In such cases $\Delta_a$ and $\Delta_b$ provide distinct population effects. However, even when the contrasted populations are homoscedastic, the two estimators will yield different estimates due to sample standard deviation within each group being most likely different. In either case, it is up to the user to decide which estimate to interpret. A common recommendation is to consult the estimate using the standard deviation of a comparison (e.g., control) group (e.g., Grissom & Kim, 2001). Here, if this effect size is chosen by the user, both estimators are provided denoted as $d_{G, 1}$&mdash;using the first group's standard deviation in the denominator&mdash;and $d_{G, 2}$&mdash;using the second group's standard deviation in the denominator.    

More interestingly perhaps, $\Delta_j$ is rather similar to a *Z* score. Consequently, if the mean difference is standardised by the standard deviation of the population with the lower mean and if further that population follows a normal distribution, $\Delta_j$ can be used to determine what proportion of the population with the lower mean the average member of the population with the higher mean outscores. Like with a *Z* score, this information can be derived from the cumulative distribution function of the standard normal distribution. If scores are not normally distributed such convenient interpretations are no longer applicable. 

The sample estimate of this population effect is given by the formula (e.g.,Grissom & Kim, 2001):

$$d_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} \qquad Eq.(DG)$$

with two groups this results in the estimators:

$$d_{G,\,a} = \frac{\bar{X}_a - \bar{X}_a}{s_b} \qquad Eq.(DG)$$

$$d_{G,\,b} = \frac{\bar{X}_a - \bar{X}_b}{s_b} \qquad Eq.(DG)$$

With $\bar{X_a}$ being the sample mean of group *a*, $\bar{X_b}$ being the sample mean of group *b*, and $s_{a|b}$ being the bias corrected sample standard deviation of group *a*/*b*. This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_{G,\,j}$.  

CI was implemented according to Algina et al. (2006b) employing the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ confidence interval.  

Firstly Glass' $d_{G,\,j}$ is transformed into an estimated non-centrality parameter $\widehat{\lambda}$: 

$$\widehat{\lambda} = \frac{d_{G,\,j}}{\sqrt{\frac{1}{n_i} + \frac{s_i^2}{n_j \cdot s_j^2}}} \quad \quad Eq.(1.2)$$ 

with $n_i$ and $s_i$ being the sample and the standard deviation of the group not being standardised by. Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n_j - 1$ degrees of freedom) which has $\widehat{\lambda}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n_j - 1$ degrees of freedom) which has $\widehat{\lambda}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. 

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_{G,\,j}$: 

$$LL = \lambda_L * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} \quad \quad Eq.(1.3)$$ 

$$UL = \lambda_U * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} \quad \quad Eq.(1.4)$$ 

This method yields a noncentral t based approximate CI, since the limits of the CI for $\lambda$ are multiplied by the random variable $\sqrt{\frac{1}{n_i} + \frac{s_i^2}{n_j*s_j^2}}$. This CI formula is derived under the assumption that both populations follow a normal distribution. Simulations by Algina et al. (2006b) found that when assumptions are met, this method showed close to nominal $1-\alpha$ coverage rates for various values of $\Delta$. However, under nonnormality the coverage rates dropped, especially for larger values of $\Delta$. 

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. This method has been found to produce worse coverage rates than  approximate noncentral t CI under normality when sample sizes are small ($n_a$ = $n_b$ $\le$ 20) and $\Delta$ is large. Under nonnormality the percentile bootstrap CI performed comparably bad to the approximate CI method. Consequently, Algina et al. (2006b) recommend using a different effect size, $d_{R,\,j}$, and the percentile bootstrap method when nonnormality is the case.  



## Hedges' $g_G$  

As mentioned above $d_{G,\,j}$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Hedges, 1981 ) estimates the same population parameter as $d_{G,\,j}$ given in $Eq.(DG )$\$:

$$g_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} * J(\nu) \qquad Eq.()$$

with two groups this results in the estimators:

$$g_{G,\,a} = \frac{\bar{X_a} - \bar{X_b}}{s_a} * J(\nu) \qquad Eq.()$$

$$g_{G,\,b} = \frac{\bar{X_a} - \bar{X_b}}{s_b} * J(\nu) \qquad Eq.()$$

with $\nu = n_j - 1$ denoting the degrees of freedom and $J(\nu)$ being given by 

$$J(\nu) = \frac{\Gamma(\frac{\nu}{2})}{\sqrt{\frac{\nu}{2}}\Gamma(\frac{\nu - 1}{2})} \quad \quad Eq.(2.2)$$

If this effect size is chosen by the user, both estimators are provided denoted as $g_{G, 1}$&mdash;using the first group's standard deviation in the denominator&mdash;and $g_{G, 2}$&mdash;using the second group's standard deviation in the denominator.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$).  

CI implementation is the same as for $d_{G,\,j}$, employing the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ CI.

Firstly Glass' $g_{G,\,j}$ is transformed into an estimated non-centrality parameter $\widehat{\lambda}$: 

$$\widehat{\lambda} = \frac{g_{G,\,j}}{\sqrt{\frac{1}{n_i} + \frac{s_i^2}{n_j*s_j^2}}} \quad \quad Eq.(2.3)$$ 

with $n_i$ and $s_i$ being the sample and the standard deviation of the group not being standardised by. Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n_j - 1$ degrees of freedom) which has $\widehat{\lambda}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.  

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n_j - 1$ degrees of freedom) which has $\widehat{\lambda}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.  

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $g_{G,\,j}$:  

$$LL = \lambda_L * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} \quad \quad Eq.(1.3)$$ 

$$UL = \lambda_U * \sqrt{\frac{1}{n_j} + \frac{s_i^2}{n_i \cdot s_j^2}} \quad \quad Eq.(1.4)$$ 

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  




# Assuming Normality and Homoscedasticity  

## Cohen's $d_p$  

The population effect size of interest is given by the formula:

$$\delta = \frac{\mu_a - \mu_b}{\sigma} \quad \quad Eq.(3)$$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by their common population standard deviation $\sigma$. The populations of interest might again be an experimental group (e.g., a group that receives some form of psychotherapy) and a control group (e.g., a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could again be thought of as $\mu_E$, i.e., as the population mean of the experimental group, and $\mu_a$ could be thought of as $mu_C$, i.e., the population mean of the control group. 

$\delta$ tells us how many standard deviation units $\mu_b$ (e.g.,$\mu_E$) lies below or above $\mu_a$ (e.g.,$\mu_C$). Once again, $\delta$ can also be thought of as a *Z* score and can be used to determine what proportion of population a the average member of population b outscores and vice versa.- See:  

With this population effect homoscedasticity is assumed, i.e., $\sigma^2_a = \sigma^2_b = \sigma^2$. Under this assumption $Eq.(1)$ and $Eq.(3)$ are identical. However, heteroscedasticity is likely throughout various fields of research and it appears plausible that treatments increases variance in the outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & KIm, 2012, pp. 17-20). Unfortunately, traditional tests of homoscedasticity often fail to produce accurate *p* values, which makes it difficult to detect heteroscedasticity of population variances (Grissom & Kim, 2012, p. 20). If heteroscedasticity is plausible $Eq.(DG)$ should be estimated - as long as population b follows a normal distribution.  

The population effect size of interest can be estimated by $d_G$ given in $Eq.(1)$ if homoscedasticity can be assumed. However, in case of homoscedasticity using the pooled standard deviation $s_p = \sqrt{\frac{(n_a - 1) * s_a^2 + (n_b - 1) * s_b^2}{n_a + n_b - 2}}$ is a better estimate of $\sigma$, since it is based on more data, is less biased and less variable than $s_b$. 

Thus, the most widely used sample estimate for $Eq.(3)$ is given by the formula (e.g.,Hedges (1981)):

$$d_p = \frac{\bar{X}_a - \bar{X}_b}{s_p} \quad \quad Eq(3.1)$$ 

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_p$.  

CI implementation according to the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ CI. 

Firstly, Cohen's $d_p$ is transformed into an estimated noncentrality parameter $\widehat{\lambda_d}$: 

$$\widehat{\lambda_d} = \frac{d_p}{\sqrt{\frac{1}{n_a} + \frac{1}{n_b}}} \quad \quad Eq.(3.2)$$ 

Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n_a + n_b - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n_a + n_b - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. 

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_p$ : 

$$LL = \lambda_L * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} \quad \quad Eq.(3.4)$$ 

$$UL = \lambda_U * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} \quad \quad Eq.(3.4)$$ 

This CI formula is derived under the assumption that both populations follow a normal distribution and that the variance of the two populations are identical. Fitts (2021) found that the procedure yields consistent coverage rates equivalent to the nominal $1 - \alpha$ level when assumptions are met. Cousineau and Goulet-Pelletier (2020) also reported an excellent coverage rate for this method. The coverage rate was on par with the computation method they have ended up favouring in their article, namely CI based on the non-central $\Lambda'$ distribution. 

When sample sizes are small ($n \se 30$Computation of CI based on the noncentral t distribution has been found to perform better than techniques for CI derivation based on various approximations of the sampling distribution of $d_p$ (Goulet-Pelletier & Cousineau, 2018; Cousineau & Goulet-Pelletier, 2020). However, approximation methods have the advantage of simplified computation and should not be dismissed since with sufficiently large sample sizes they can be very accurate (for a review see Viechtbauer, 2007).  

Simulations by Algina et al. (2006a) found that when only one of the populations deviated from normal distributions, the noncentral t based CI maintained close to nominal $1-\alpha$ coverage rates for various combinations of $\delta$ and $n_a \& n_b$. However, under nonnormality and especially asymmetry of both populations coverage rates dropped, especially for larger values of $\delta$. 

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. Under the cases of nonnormality studied by Algina et al. (2006a) the percentile bootstrap CI performed comparably  to the approximate CI method. While still relatively stable in terms of coverage rates when only one group does not follow normality, the method performs increasingly worse with increasing deviation from normality and an increasing size of $\delta$, especially when sample sizes are small($n_a$ = $n_b$ $\le$ 25). The authors found similar results for the bias-corrected and accelerated (BCa) bootstrap CI method. Although, it should be noted that, while the BCa method also started to be affected with decreased coverage rates as nonnormality became more severe, $\delta$ was larger and $n_a$ and $n_b$ were small, it did perform better than the noncentral t based or the percentile bootstrap method. However, Algina et al. (2006b) recommend using a different effect size, $d_{R_p}$, and the percentile bootstrap method when nonnormality is the case!



## Hedges' $g_p$  

As mentioned above $d_p$ has a slight positive bias, which can be corrected. This alternative formula given by Hedges (1981) estimates the same population parameter as $d_p$ given in $Eq.(3)$$:

$$g_p = \frac{\bar{X}_a - \bar{X}_b}{s_p} * J(\nu) \quad \quad Eq.(4.1)$$

with $\nu = n_a + n_b - 2$ denoting the degrees of freedom and $J(\nu)$ being given by $Eq.(2.2)$.

CI implementation according to the method described by Hedges and Olkin (1985) which uses the noncentral t distribution to construct a $1 - \alpha$ CI. 

Firstly, hedges' $g_p$ is transformed into an estimated noncentrality parameter $\widehat{\lambda_d}$: 

$$\widehat{\lambda_d} = \frac{g_p}{\sqrt{\frac{1}{n_a} + \frac{1}{n_b}}} \quad \quad Eq(4.3)$$ 

Next the $\frac{\alpha}{2}$ and the  $1 - \frac{\alpha}{2}$ quantiles of the noncentral t distribution with non-centrality parameter $\widehat{\lambda_d}$ are identified. 
Lastly these quantiles are transformed back into $g_p$: 

$$LL = t_{df = \nu, \frac{\alpha}{2},ncp = \widehat{\lambda_d}} * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} \quad \quad Eq.(4.4)$$

$$UL = t_{df = \nu, 1 - \frac{\alpha}{2},ncp = \widehat{\lambda_d}} * \sqrt{\frac{1}{n_a} + \frac{1}{n_b}} \quad \quad Eq.(4.5)$$ 

Fitts (2021) found that the above procedure yields the most consistent coverage rates for $g_p$ close to the nominal $1 - \alpha$ level among the noncentral t based confidence intervals he compared - when assumptions are met (normality, independence and homogeneity of variances).  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.



## Cohen's $d'$

The population effect size of interest is given by the formula (e.g.,Cohen, 1988):

$$\delta = \frac{\mu_a - \mu_b}{\sigma'} \quad \quad Eq.()$$

with $\sigma'$ being:

$$\sigma' = \sqrt{\frac{\sigma^2_a + \sigma^2_b}{2}}$$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by the root mean square of the population variances $\sigma^2_a$ and $\sigma^2_b$. Thus, this population effect does not assume homoscedasticity. In return, the population mean difference is standardised by the population standard deviation of a hypothetical population with a standard deviation between $\sigma_a$ and $\sigma_b$. Grissom and Kim (2012) report that some experts have a problem with this standardiser. However, Bonett (2008) states the noncentral t CI method for Cohen's $d_p$ is only exact under the assumptions of normality and homoscedasticity. However, the author notes that it is difficult to assess homoscedasticity and the extent to which population variances differ, especially when samples are of small to moderate size. Therefore he advocated using the above population effect size. Nonetheless, Bonett (2008) also acknowledges that the population effect loses its meaningfulness under stronger levels of heteroscedasticity.

Cohen (1988) also recommends this standardiser when population variances differ (as long as sample sizes are identical). However, Cohen points out, that this population effect can no longer be converted into many of the highly intuitive and practical effect sizes discussed above, such the OVL or any of Cohen's U statistics. 

$\delta'$ tells us how many $\sigma'$ units $\mu_b$ lies below or above $\mu_a$ .  

The sample estimate of this population effect is given by the formula (e.g.,Bonett (2008)):

$$d'= \frac{\bar{X}_a - \bar{X}_b}{s'} \quad \quad Eq.()$$

With $$s' = \sqrt{\frac{s_a^2 + s_b^2}{2}}$$

If $n_a = n_b$, then $s_p$ will be equal to $s'$ and thus $d_p$ will be equal to $d'$. This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_{d'}$.  

An approximate large-sample CI is implemented according to Bonett (2008):

$$CI = d' \pm z_{\frac{\alpha}{2}}*\sqrt{VAR(d')}$$

with

$$VAR(d') = \frac{d'^2(\frac{s^4_a}{n_a - 1} + \frac{s^4_b}{n_b - 1})}{8s'^4} + \frac{s_a^2}{(n_a-1)s'^2} + \frac{s_b^2}{(n_b-1)s'^2}$$

Bonett (2008) reprted that this CI method produced coverage probabilities that were consistent and close to the nominal $1 - \alpha$ level under homoscedasticity as well as under mild heteroscedasticity combined with unequal sample sizes. Under the latter condition Bonett (2008) found that approximate large-sample CIs for Cohen's $d_p$ failed to maintain consistent coverage probabilities close to the nominal level.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.


<h3 id = "IG_P_robust">ES robust to outliers</h3>
<h3 id = "IG_NP_SMD"> standardised Median differences</h3>

Hedges and Olkin (1984) argued that since outliers present in the data can violate the normality assumption, ES estimators insensitive to the presence of outliers ought to be developed. They suggested to replace sample means and standard deviations, which are influenced by outliers, with robust estimators. More concretely, they recommended to estimate group means with sample medians and standard deviations with some linear combination of order statistics.  
Grissom and Kim (2001) reported on three such ES estimators that use robust estimators of location and scale. Each presented estimator computes the difference between medians and standardises it by some robust estimate of variability. Thus, the three estimators described are standardised median differences. These estimators have the following genreal structure:

$$\hat\delta_{a|b} =  \frac{Mdn_a - Mdn_b}{S_{a|b}}$$

with $Mdn_a$ being the Median of group a, $Mdn_b$ being the median of group b and $S_{a|b}$ being the standardiser, which is some robust measure of variability of the baseline/control group (e.g., the median absolute  deviation of a gold standard treatment). Here, if this estimator is chosen by the user, both estimators are provided denoted as $d_{MAD, 1}$/$d_{R_{IQ}, 1}$/$d_{bw, 1}$&mdash;using the first group's variability estimator in the denominator&mdash;and $d_{MAD, 2}$/$d_{R_{IQ}, 2}$/$d_{bw, 2}$&mdash;using the second group's variability estimator in the denominator.  
<br>
The sampling variance of these estimators are currently unknown and thus only $1 - \alpha$ percentile bootstrap CI are implemented for these estimators exclusively.  
<br>
Grissom and Kim (2001) note that other standardised median differences could be conceived by using yet another robust measure of variability in the denominator. However, we agree with the comment of Grissom and Kim (2012) that "the field should settle on the use of a reduced number of appropriate measures" (p.75) and that a alternate robust estimator which has a well-behaved confidence interval should be determined and consistently used when outliers threaten to violate assumptions.
  
<h4 id = "IG_P_d_MAD"> \(d_{MAD}\) </h4>  

The difference in Medians can be standardised by the Median Absolute Deviation (MAD) of the baseline/control group. 
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):

$$d_{MAD} =  \frac{Mdn_a - Mdn_b}{MAD_{a|b}}$$

with MAD being: 

$$MAD = median(|X_i - median(X_i)|)$$

The MAD is more robust to outliers than the standard deviation and has a lower sampling variance.  
We follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($MAD$) of this estimator as well.  
  
  
  
<h4 id = "IG_P_d_RIQ"> \(d_{R_{IQ}}\) </h4>  

The difference in medians can be standardised by the interquartile range $R_{IQ}$, the difference between the third quartile (0.75-quantile) and the first quartile (0.25-quantile), of the baseline/control group.  
Then the standardised median difference is calculated with the following formula (Laird & Mosteller, 1990).

$$d_{R_{IQ}} = \frac{Mdn_a - Mdn_b}{0.75 \cdot R_{IQ_{a|b}}}$$

The interquartile range is more outlier resistant than the standard deviation. Multiplying $R_{IQ}$ with 0.75 results in an estimator that approximates the standard deviation under normality (Grissom & Kim, 2001).  
Grissom and Kim (2001) point to Shoemaker (1999) for a discussion of other possibly more robust ranges of quantiles that may yield alternative robust estimators of variability.  
We again follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser (R_{IQ}) of this estimator as well.   
  
  
<h4 id="IG_P_d_bw"> \(d_{bw}\) </h4>

The differences in medians can be standardised by the biweight standard deviation $s_bw$ of the baseline/control group (Grissom & Kim, 2001).  
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):  

$$d_{bw} = \frac{Mdn_a - Mdn_b}{S_{bw_{a|b}}}$$

with $s_{bw_{a|b}}$ being 

$$s_{bw_{a|b}} = \frac{\sqrt{n}\sqrt{\sum{a_i(X_i - median(X_i))^2(1 - Y_{i}^{2}}}}{|\sum{a_i(1 - 1 - Y_{i}^{2}}(1 - 5Y_{i}^{2})}$$

with $Y_i$ and $a_i$ being
$$ Y_i = \frac{X_i - median(X_i)}{9MAD}$$
$$a_i = \{_{1, \, if \, |Y_i| < 1}^{0, \, if \, |Y_i| \geq{1}}$$

Grissom and Kim (2001) note that compared to the $MAD$ $s_bw$ has a relatively small sampling variability. 


## Tail ratio (TR)  

Standardised mean differences such as Cohen's $d_p$ narrow their assessment on the centers of distributions, i.e., on typical observations. For many psychological, biological, and medical models which predict that the probability of some outcome or manifestation only starts increasing after some threshold the tails of distributions are more relevant (Voracek et al., 2013), e.g.,:  

- diathesis-stress  
- vulnerability  
- susceptibility  
- exposure  
- excellence models  

If group differences in the tails of distribution is of interest then the ratio of the proportion of scores found in the lower or upper tail of the distribution of the analysed groups can be assessed. The ratio of proportions of scores in the distributional extremes can be much higher than one might expect based on the inspection of Cohen's $d_p$ and the variance ratio in the following cases (Voracek et al., 2013):  

- when the difference between means is small and the variance ratio equals 1;  
- when a difference between means is absent but the variance ratio differs from 1;   
- when both means and variances differ;  
- when a difference between means as well as between variances is absent, but the distributions of the groups differ in higher order distributional moments (skewness and kurtosis).  

Consequently, an assessment of tail ratios can be of importance for any two-group research design regardless of the absence of differences between means and/or variances.  

The user of this application can compute tail ratios for a chosen cutoff value, a chosen tail region (i.e., the lower/left or the upper/right tail), and a chosen reference group (i.e. the proportion used as the denominator - either the proportion of group a or group b).  

For a discussion of the history of the tail ratio, a proposal for a consensus regarding a naming and reporting convention, as well as for proposed benchmarks meant to aid the interpretation of tail ratios the reader is advised to turn to the article by Voracek et al. (2013).  

The tail ratio effect size measure is implemented as follows:  
The tail ratio can be thought of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". The number of "hits" in group a is binomially distributed with parameters $n_a$ and $p_a$, where $p_a$ is the proportion of scores in population a below/above a cutoff. Conversely, the number of "hits" in group b is also binomially distributed with parameters $n_b$ and $p_b$, where $p_b$ is the proportion of scores in population b below/above a cutoff. The population tail ratio for a given cutoff value and region of interest is thus the ratio:  

$$\theta = \frac{p_{a|b}}{p_{b|a}}$$

The observed data can be thought of as 2 x 2 table of the following form:  

| Group | hits | misses | sum |
|-------|------|--------|-----|
|a|$n_{11}$|$n_{12}$|$n_{1.}$ |
|b|$n_{21}$|$n_{22}$|$n_{2.}$ |

The point estimate of the population tail ratio can be written as:  

$$\hat{\theta} = \frac{\hat{p}_{a|b}}{\hat{p}_{b|a}}$$

with $\hat{p}_a = \frac{n_{11}}{n_{1.}}$ and $\hat{p}_b = \frac{n_{21}}{n_{2.}}$.  

For the "parametric mode" of the application the cell frequencies are determined based on the assumption that the data are sampled from a normal distribution. The number of scores below/above a cutoff *t* is determined by multiplying the number of observations in a group (i.e., $n_{1.}$ or $n_{2.}$) with the proportion of scores falling below/above *t* in a normal distribution with a mean equal to the sample mean (i.e., $\bar{X}_a$ or $\bar{X}_b$) and a variance equal to the sample variance (i.e., $s_a^2$ or $s_b^2$).  
When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = n_{1.} * \Phi(\frac{t - \bar{X}_a}{s_a^2})$  
- $n_{21}$ is computed as: $n_{21} = n_{2.} * \Phi(\frac{t - \bar{X}_b}{s_b^2})$  

and when "hits" are defined as scores above *t*:

- $n_{11}$ is computed as: $n_{11} = n_{1.} * (1 - \Phi(\frac{t - \bar{X}_a}{s_a^2}))$  
- $n_{21}$ is computed as: $n_{21} = n_{2.} * (1 - \Phi(\frac{t - \bar{X}_b}{s_b^2}))$  
  
With $n_{11}, n_{21}, n_{1.}$ and $n_{2.}$ defined and computed the ratio of the binomial proportions $\hat{p}_a$ and $\hat{p}_b$ and consequently the point estimate of the tail ratio can be determined.  

An approximate confidence interval is implemented for both the parametric and the non-parametric analyses. Fagerland et al. (2015) analysed multiple approximate and exact confidence intervals for the ratio of binomial proportions. While none of the assessed procedures yielded appropriate coverage rates across the various conditions the authors examined, the Koopman confidence interval (Koopman, 1984) performed decently across most of the studied scenarios and has been recommended by the authors. However, Fagerland et al. (2015) emphasize that while the Koopman interval is in general closest to the nominal level, it can be somewhat liberal (average coverage probabilities between 0.92 and 0.95 for an $1 - \alpha$ level of 0.95) for combinations of unequal sample sizes and small population proportions ($p_{a|b} \leq 0.2$). Koopman (1984) described an iterative search algorithm for finding the confidence limit, however Nam (1995) found a closed form formula, which has been implemented for this application. Since both the iterative search and the closed form solution are quite elaborate and have been described in detail in the cited literature, neither is described in detail here.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.



## Variance ratio (VR)  

The population effect size of interest is given by:  

$$\theta = \frac{\sigma_{a|b}^2}{\sigma_{a|b}^2} \quad \quad Eq.(IG)$$

It is simply the ratio of population variances with either population a being the reference group $\frac{\sigma_{b}^2}{\sigma_{a}^2}$ or population b being the reference group $\frac{\sigma_{a}^2}{\sigma_{b}^2}$.
Among various contexts, the variance ratio can be of particular interest:  

- in psychometric studies assessing the variability of scores of a measurement tool (Bonett, 2006);  
- for selecting an appropriate effect size, since as mentioned throughout this documentation the homogeneity of variances is a relevant factor for this choice;  
- as an informative aspects of treatment effect, since it too can signal practical significance just as a difference of means can (Grissom & Kim, 2012).  

Thus, it is advisable to compute and inspect variance ratios and their confidence intervals.  

The sample estimate of $Eq.(IG)$ is given by the ratio of sample variances:

$$\hat{\theta} = \frac{s_{a|b}^2}{s_{a|b}^2} \quad \quad Eq.(DG)$$

The general approach to assess homogeneity of variances is to conduct an appropriate hypothesis test, like the traditional F-test. However, a hypothesis test at best can only inform about the presence of homogeneity of variances, but does not inform about the magnitude of the ratio of variances. Additionally, traditional hypothesis tests have non-nominal Type-I error probabilities when data are sampled from non-normal populations or simply when sample sizes are unequal and/or small (Grissom & Kim, 2012). Therefore, it is more informative to consult the point estimate as well as a confidence interval that is robust to common violations of assumptions.   

Three different confidence interval procedures are implemented. The first procedure is based on the classical F-test and thus relies on the assumption of normal populations. This exact procedure is implemented for the "parametric raw data mode" as well as the "parametric educational mode". The confidence interval is computed as:    

$$LL = \frac{s_a^2}{s_b^2} * F_{\frac{\alpha}{2}, \nu_2, \nu_1}^{-1}$$  

or  

$$LL = \frac{s_b^2}{s_a^2} * F_{\frac{\alpha}{2}, \nu_1, \nu_2}^{-1}$$  

and  

$$UL = \frac{s_a^2}{s_b^2} * F_{1 - \frac{\alpha}{2}, \nu_2, \nu_1}^{-1}$$

or  

$$UL = \frac{s_a^2}{s_b^2} * F_{1 - \frac{\alpha}{2}, \nu_1, \nu_2}^{-1}$$

This confidence interval is exact only when the data stem from normal populations. However, this method is highly sensitive to even slight deviations from normality and cannot be recommended for non-normal populations (Banga & Fox, 2013; Bonett, 2006). Consequently, if any deviation from normality might be expected, the user is advised to inspect the "non-parametric" variance-ratio (found as an effect size in the "non-parametric" mode). As detailed in the documentation on the corresponing page, the point estimate will be identical to the one provided for the "parametric raw data" mode, however, a more robust confidence interval procedure is implemented.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  

## The Common Language ES


The population effect of interest is given by:

$$ \mathbb{P}\(X_a > X_b\)$$

that is, the probability that a randomly selected score from population *a* exceeds a randomly selected score from population *b*. As argued by Mastrich & Hernandez (2021), The CL es can be considered to provide a more intuitive way to understand statistical results and therefore aids practitioners in understanding research findings and making informed decisions. 

The parametric estimator assuming normality and homogeneity of the two populations implemented in this application is given by (McGraw & Wong, 1992):

$$CL = \Phi\(\frac{\bar{X}_a - \bar{X_b}}{\sqrt{s_a^2 + s_b^2}}\)$$

One of many parametric approximate estimators (e.g., see Grissom, 1994) of the above population effect is:  

$$CL_d = \Phi\(\frac{d_p}{sqrt(2)}\)$$

No closed form formulas were identified for the computation of a ($1-\alpha$) CI for the CL ES. Mastrich & Hernandez (2021) recommends to transform the bounds of the CI of $d_p$ "to provide a sense of uncertainty around the reported CLES" (p.733). The user of this application can use the above formula on the CI limits given by the application for $d_p$ to transform these limits into $CL_d$ values, if they wish to do so. Otherwise, a $1 - \alpha$ percentile bootstrap CI is computed and can be used to communicate said uncertainty.  

A nonparametric estimator of the above population effect that does not make the normality or homoscedasticity assumptions of the CL ES, called the probability of superiority (PS; Grissom, 1994), is described in the documentation tab of the page on nonparametric ES for the dependent groups design. As discussed by Grissom and Kim (2001) the PS ES is a better estimator of the above described population effect and if raw data is available the user is best advised to compute it alongside the CL ES.  


## Measures of Nonoverlap


If the populations being compared are normal and with equal variability it is possible to define measures of nonoverlap which are related with cohen's d and with themselves through the cumulative normal distribution. (Cohen, 1988).

### Parametric Coefficient of Overlapping for independent groups
The coefficient of overlapping (OVL) is defined as the common area under two probability densities and is used as a measure of agreement of two distributions(Bradley, 2006). Under the assumption of normality and homoscedasticity it can be simply estimated by plugging Cohen's d into the normal cumulative distribution function (DelGiudice, 2019)::
$$ OVL = 2 \phi (\frac{-|d|}{2})$$
$OVL (X, Y)$ = 1 if and only if the distributions of X and Y are equal and OVL(X, Y) = 0 if and only if the supports of the distributions of X and Y have no interior points in common which is the reason why $OVL (X, Y)$ can be interpreted as a measure of agreement of the two distributions.
Nonparametric estimations can be obtained by replacing the densities by appropriate kernel density estimators and the integrals by an appropriate quadrature formula or the sample mean(see documentation of the nonparametric coefficient of overlapping).
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

### Parametric Coefficient of Overlapping Two for independent groups
The overlapping coefficient two ($OVL_2$) is the proportion of overlap relative to the joint distribution and can be estimated with the following formula under the assumption of normality and homoscedasticity (DelGiudice, 2019):
$$ OVL_2 = \frac{OVL}{2-OVL}$$
with OVL being calculated as described above.
Grice and Barret(2014) argue that OVL is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. OVL, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.    
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.


### Cohen's U1


$U_1$ can be interpreted as percentage of nonoverlap and is characterized by the following formula under the assumption of normality and homoscedasticity (Cohen, 1988):
$$U_1 = \frac{2\Phi_{d/2}-1}{\Phi_{d/2}} = \frac{2U_2-1}{U_2}$$
with $d$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.




### Cohen's U2

When examing two populations, Cohen's measure of nonoverlap$ U_2$ is the percentage of one population that exceeds the same percentage in the other population. It is described by the following formula under the assumption of normality and homoscedasticity(Cohen, 1988):
$$U2 = \Phi_{d/2}$$
with $d$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.




### Cohen's U3

When examining two populations, Cohen's measure of nonoverlap $U_3$ is the percentage of one population which the upper half of the cases of the other population exceeds (Cohen, 1988). Cohen's $U_3$ is described by the following formula under the assumption of normality and homoscedasticity:
$$U_3 = \Phi_{d}$$
with $d$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.



# References

Algina, J., Keselman, H. J., & Penfield, R. D. (2006a). Confidence interval coverage for Cohen’s effect size statistic. *Educational and Psychological Measurement*, *66*(6), 945--960. <https://doi.org/10.1177/0013164406288161>  

Algina, J., Keselman, H. J., & Penfield, R. D. (2006b). Confidence intervals for an effect size when variances are not equal. *Journal of Modern Applied Statistical Methods*, *5*(1), 2--13. <https://doi.org/10.22237/jmasm/1146456060>  

Banga, s. J., & Fox, G. D. (2013). Bonett's method. State College, PA: Minitab, Inc. <https://support.minitab.com/en-us/minitab/21/media/pdfs/translate/Bonetts_Method_Two_Variances.pdf>

Bonett, D. G. (2006). Robust confidence interval for a ratio of standard deviations. *Applied Psychological Measurement*, *30*(5), 432--439. <https://doi.org/10.1177/0146621605279551>  

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods*, *13*(2), 99--109. <https://doi.org/10.1037/1082-989X.13.2.99>    

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Routledge. <https://doi.org/10.4324/9780203771587>  

Cousineau, D., & Goulet-Pelletier, J. (2020, July 24). A review of five techniques to derive confidence intervals with a special attention to the Cohen's dp in the between-group design. <https://doi.org/10.31234/osf.io/s2597>  


Del Giudice, M. (2019). Measuring sex differences and similarities. *Gender and sexuality development: Contemporary theory and research.*  

Fagerland, M. W., Lydersen, S., & Laake, P. (2015). Recommended confidence intervals for two independent binomial proportions. *Statistical Methods in Medical Research*, *24*(2), 224--254. <https://doi.org/10.1177/0962280211415469>  

Fitts, D. A. (2021). Expected and empirical coverages of different methods for generating noncentral t confidence intervals for a standardized mean difference.*Behavior Research Methods*, <https://doi.org/10.3758/s13428-021-01550-4>  

Gart, J. J., & Nam, J. (1988). Approximate interval estimation of the ratio of binomial parameters: A review and corrections for skewness. *Biometrics*, *44*(2), 323--338. <https://doi.org/10.2307/2531848>  

Glass, G. V. (1976). Primary, secondary, and meta-analysis of research. *Educational researcher*, *5*(10), 3--8. <https://doi.org/10.3102/0013189X005010003>  

Goulet-Pelletier, J.-C., & Cousineau, D. (2018). A review of effect sizes and their confidence intervals, Part I: The Cohen's d family. *The Quantitative Methods for Psychology*, *14*, 242--265. <https://doi.org/10.20982/tqmp.14.4.p242>  

Grissom, R. J. (1994). Probability of the superior outcome of one treatment over another. *Journal of Applied Psychology*, *79*(2), 314--316. <https://doi.org/10.1037/0021-9010.79.2.314>

Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>  

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Hedges, L. V. (1981). Distribution theory of glass’s Estimator of effect size and related estimators. *Journal of Educational and Behavioral Statistics*, *6*(2), 107--128. <https://doi.org/10.3102%2F10769986006002107>  

Koopman, P. A. R. (1984). Confidence intervals for the ratio of two binomial proportions. *Biometrics*, *40*(2), 513--517. <https://doi.org/10.2307/2531405>  

Laird, N. M., & Mosteller, F. (1990). Some statistical methods for combining experimental results. *International Journal of Technology Assessment in Health Care*, *6*(1), 5--30. <https://doi.org/10.1017/s0266462300008916>  

Layard, M. W. J. (1973). Robust large-sample tests for homogeneity of variances. *Journal of the American Statistical Association*, *68*(341), 195-198. <https://doi.org/10.1080/01621459.1973.10481363>  

Mastrich, Z., & Hernandez, I. (2021). Results everyone can understand: A review of common language effect size indicators to bridge the research-practice gap. *Health Psychology*, *40*(10), 727.  

McGraw, K. O., & Wong, S. P. (1992). A common language effect size statistic. *Psychological bulletin*, *111*(2), 361.  

Nam, J. (1995). Confidence limits for the ratio of two binomial proportions based on likelihood scores: Non-iterative method. *Biometrical Journal*, *37*(3), 375--379. <https://doi.org/10.1002/bimj.4710370311>  

Peng, C.-Y. J., & Chen, L.-T. (2014). Beyond Cohen's d: Alternative effect size measures for between-subject designs. *The Journal of Experimental Education*, *82*(1), 22--50. <https://doi.org/10.1080/00220973.2012.745471>  

Shoemaker, L. H. (1999). Interquantile tests for dispersion in skewed distributions. *Communications in Statistics B: Simulation and Computation*, *28*(1), 189--205. <https://doi.org/10.1080/03610919908813543>  

Shoemaker, L. H. (2003). Fixing the F test for equal Variances. *The American Statistician*, *57*(2), 105–114. <https://doi.org/10.1198/0003130031441>  

Viechtbauer, W. (2007). Approximate confidence intervals for standardized effect sizes in the two-independent and two-dependent samples design. *Journal of Educational and Behavioral Statistics*, *32*(1), 39--60. <https://doi.org/10.3102/1076998606298034>  

Voracek, M., Mohr, E., & Hagmann, M. (2013). On the importance of tail ratios for psychological science. *Psychological Reports*, *112*(3), 872--886. <https://doi.org/10.2466/03.PR0.112.3.872-886>  
