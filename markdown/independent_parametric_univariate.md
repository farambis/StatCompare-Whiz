# Assuming Normality but not Homoscedasticity

## Glass' $d_G$  

The population effect size of interest is given by the formula:

$$\Delta = \frac{\mu_a - \mu_b}{\sigma_b} \quad \quad Eq.(1)$$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by the population standard deviation of population b $\sigma_b$.  

The populations of interest might be an experimental group (e.g. a group that receives some form of psychotherapy) and a control group (e.g. a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could be thought of as $\mu_E$, i.e. as the population mean of the experimental group, and $\mu_a$ could be thought of as $mu_C$, i.e. the population mean of the control group. $\Delta$ tells us how many (population b) standard deviation units $\mu_b$ (e.g. $\mu_E$) lies below or above $\mu_a$ (e.g. $\mu_C$). As noted by Glass (1976) $\Delta$ is rather similar to a *Z* score. Consequently, if population b follows a normal distribution, $\Delta$ can be used to determine what proportion of population b the average member of population a outscores. Like with a *Z* score, this information can be derived from the cumulative distribution function of the standard normal distribution - See: ----what effect size was that again? ----  

The sample estimate of this population effect is given by the formula (e.g. Glass (1976)):

$$d_g = \frac{\bar{X_a} - \bar{X_b}}{s_b} \quad \quad Eq.(1.1)$$

With $\bar{X_a}$ being the sample mean of group a, $\bar{X_b}$ being the sample mean of group b, and $s_b$ being the bias corrected sample standard deviation of group b. This estimator has a bias. It systematically overestimates the size of the true population standardized mean difference. This bias can be corrected - see Hedges' $g_G$.  

CI was implemented according to Algina et al. (2006b) employing the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ confidence interval.

Firstly Glass' $d_G$ is transformed into an estimated non-centrality parameter $\widehat{\lambda_d}$: 

$$\widehat{\lambda_d} = \frac{d_G}{\sqrt{\frac{1}{n_a} + \frac{s_a^2}{n_b*s_b^2}}} \quad \quad Eq.(1.2)$$ 

Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n_b - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n_b - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. 

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_G$: 

$$LL = \lambda_L * \sqrt{\frac{1}{n_a} + \frac{s_a^2}{n_b*s_b^2}} \quad \quad Eq.(1.3)$$ 

$$UL = \lambda_U * \sqrt{\frac{1}{n_a} + \frac{s_a^2}{n_b*s_b^2}} \quad \quad Eq.(1.4)$$ 

This method yields a noncentral t based approximate CI, since the limits of the CI for $\lambda$ are multiplied by the random variable $\sqrt{\frac{1}{n_a} + \frac{s_a^2}{n_b*s_b^2}}$. This CI formula is derived under the assumption that both populations follow a normal distribution. Simulations by Algina et al. (2006b) found that when assumptions are met, this method showed close to nominal $1-\alpha$ coverage rates for various values of $\Delta$. However, under nonnormality the coverage rates dropped, especially for larger values of $\Delta$. 

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. This method has been found to produce worse coverage rates than  approximate noncentral t CI under normality when sample sizes are small ($n_a$ = $n_b$ $\le$ 20) and $\Delta$ is large. Under nonnormality the percentile bootstrap CI performed comparably bad to the approximate CI method. Consequently, Algina et al. (2006b) recommend using a different effect size, $d_{R_G}$, and the percentile bootstrap method when nonnormality is the case.



## Hedges' $g_G$  

As mentioned above $d_G$ has a slight positive bias, which can be corrected. This alternative formula given by Hedges (1981) estimates the same population parameter as $d_G$ given in $Eq.(1)$:

$$g_G = \frac{\bar{X_a} - \bar{X_b}}{s_b} * J(\nu) \quad \quad Eq.(2.1)$$

with $\nu = n_a + n_b - 2$ denoting the degrees of freedom and $J(\nu)$ being given by 

$$J(\nu) = \frac{\Gamma(\frac{\nu}{2})}{\sqrt{\frac{\nu}{2}}\Gamma(\frac{\nu - 1}{2})} \quad \quad Eq.(2.2)$$

CI implementation is the same as for $d_G$, employing the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ CI.

Firstly Glass' $g_G$ is transformed into an estimated non-centrality parameter $\widehat{\lambda_d}$: 

$$\widehat{\lambda_d} = \frac{g_G}{\sqrt{\frac{1}{n_a} + \frac{s_a^2}{n_b*s_b^2}}} \quad \quad Eq.(2.3)$$ 

Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n_b - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n_b - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for. 

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $g_G$ using equations $Eq.(1.3)$ and $Eq.(1.4)$  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.




# Assuming Normality and Homoscedasticity  

## Cohen's $d_p$  

The population effect size of interest is given by the formula:

$$\delta = \frac{\mu_a - \mu_b}{\sigma} \quad \quad Eq.(3)$$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by their common population standard deviation $\sigma$. The populations of interest might again be an experimental group (e.g. a group that receives some form of psychotherapy) and a control group (e.g. a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could again be thought of as $\mu_E$, i.e. as the population mean of the experimental group, and $\mu_a$ could be thought of as $mu_C$, i.e. the population mean of the control group. 

$\delta$ tells us how many standard deviation units $\mu_b$ (e.g. $\mu_E$) lies below or above $\mu_a$ (e.g. $\mu_C$). Once again, $\delta$ can also be thought of as a *Z* score and can be used to determine what proportion of population a the average member of population b outscores and vice versa.- See:  

With this population effect homoscedasticity is assumed, i.e., $\sigma^2_a = \sigma^2_b = \sigma^2$. Under this assumption $Eq.(1)$ and $Eq.(3)$ are identical. However, heteroscedasticity is likely throughout various fields of research and it appears plausible that treatments increases variance in the outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & KIm, 2012, pp. 17-20). Unfortunately, traditional tests of homoscedasticity often fail to produce accurate *p* values, which makes it difficult to detect heteroscedasticity of population variances (Grissom & Kim, 2012, p. 20). If heteroscedasticity is plausible $Eq.(DG)$ should be estimated - as long as population b follows a normal distribution.  

The population effect size of interest can be estimated by $d_G$ given in $Eq.(1)$ if homoscedasticity can be assumed. However, in case of homoscedasticity using the pooled standard deviation $s_p = \sqrt{\frac{(n_a - 1) * s_a^2 + (n_b - 1) * s_b^2}{n_a + n_b - 2}}$ is a better estimate of $\sigma$, since it is based on more data, is less biased and less variable than $s_b$. 

Thus, the most widely used sample estimate for $Eq.(3)$ is given by the formula (e.g. Hedges (1981)):

$$d_p = \frac{\bar{X_a} - \bar{X_b}}{s_p} \quad \quad Eq(3.1)$$ 

This estimator has a bias. It systematically overestimates the size of the true population standardized mean difference. This bias can be corrected - see Hedges' $g_p$.  

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

$$g_p = \frac{\bar{X_a} - \bar{X_b}}{s_p} * J(\nu) \quad \quad Eq.(4.1)$$

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

The population effect size of interest is given by the formula (e.g. Cohen, 1988):

$$\delta = \frac{\mu_a - \mu_b}{\sigma'} \quad \quad Eq.()$$

with $\sigma'$ being:

$$\sigma' = \sqrt{\frac{\sigma^2_a + \sigma^2_b}{2}}$$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by the root mean square of the population variances $\sigma^2_a$ and $\sigma^2_b$. Thus, this population effect does not assume homoscedasticity. In return, the population mean difference is standardised by the population standard deviation of a hypothetical population with a standard deviation between $\sigma_a$ and $\sigma_b$. Grissom and Kim (2012) report that some experts have a problem with this standardiser. However, Bonett (2008) states the noncentral t CI method for Cohen's $d_p$ is only exact under the assumptions of normality and homoscedasticity. However, the author notes that it is difficult to assess homoscedasticity and the extent to which population variances differ, especially when samples are of small to moderate size. Therefore he advocated using the above population effect size. Nonetheless, Bonett (2008) also acknowledges that the population effect loses its meaningfulness under stronger levels of heteroscedasticity.

Cohen (1988) also recommends this standardiser when population variances differ (as long as sample sizes are identical). However, Cohen points out, that this population effect can no longer be converted into many of the highly intuitive and practical effect sizes discussed above, such the OVL or any of Cohen's U statistics. 

$\delta'$ tells us how many $\sigma'$ units $\mu_b$ lies below or above $\mu_a$ .  

The sample estimate of this population effect is given by the formula (e.g. Bonett (2008)):

$$d'= \frac{\bar{X_a} - \bar{X_b}}{s'} \quad \quad Eq.()$$

With $$s' = \sqrt{\frac{s^2_a + s^2_b}{2}}$$

If $n_a = n_b$, then $s_p$ will be equal to $s'$ and thus $d_p$ will be equal to $d'$. This estimator has a bias. It systematically overestimates the size of the true population standardized mean difference. This bias can be corrected - see Hedges' $g_{d'}$.  

An approximate large-sample CI is implemented according to Bonett (2008):

$$CI = d' \pm z_{\frac{\alpha}{2}}*\sqrt{VAR(d')}$$

with

$$VAR(d') = \frac{d'^2(\frac{s^4_a}{n_a - 1} + \frac{s^4_b}{n_b - 1})}{8s'^4} + \frac{s^2_a}{(n_a-1)s'^2} + \frac{s^2_b}{(n_b-1)s'^2}$$

Bonett (2008) reprted that this CI method produced coverage probabilities that were consistent and close to the nominal $1 - \alpha$ level under homoscedasticity as well as under mild heteroscedasticity combined with unequal sample sizes. Under the latter condition Bonett (2008) found that approximate large-sample CIs for Cohen's $d_p$ failed to maintain consistent coverage probabilities close to the nominal level.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.



## Variance ratio (VR)  

## Measures of Nonoverlap
If the populations being compared are normal and with equal variability it is possible to define measures of nonoverlap which are related with cohen's d and with themselves through the cumulative normal distribution. (Cohen, 1988).
### Cohen's U1
U1 can be interpreted as percentage of nonoverlap and is characterized by the following formula (Cohen, 1988):
$$U_1 = \frac{2\Phi_{d_p/2}-1}{\Phi_{d_p/2}} = \frac{2U_2-1}{U_2}$$
with $d_p$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
The confidence interval is calculated by transforming the lower and upper confidence limits of Cohens'd ($d_p$) with the cumulative normal distribution:
$$LL = \frac{2\Phi_{d_{p_{upper}}/2}-1}{\Phi_{d_{p_{upper/2}}}}$$
$$UL = \frac{2\Phi_{d_{p_{lower}}/2}-1}{\Phi_{d_{p_{lower/2}}}}$$
### Cohen's U2
When examing two populations, Cohen's measure of nonoverlap U2 is the percentage of one population that exceeds the same percentage in the other population. It is described by the following formular (Cohen, 1988): 
$$U2 = \Phi_{d_p/2}$$
with $d_p$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
The confidence interval is calculated by transforming the lower and upper confidence limits of Cohens'd ($d_p$)  with the cumulative normal distribution:
$$LL =  \Phi_{d_{p_{lower}/2}}$$
$$UL =  \Phi_{d_{p_{upper}/2}}$$


### Cohen's U3
When examing two populations, Cohen's measure of nonoverlap U3 is the percentage of one population which the upper half of the cases of the other population exceeds (Cohen, 1988). However, the interpretation of U3 changes slightly when one is dealing with a multivariate distribution (Del Giudice, 2019). Cohen's U3 is decribed by the following formular:
$$U3 = \Phi_{d_p}$$
with d being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.

The confidence interval is calculated by transforming the lower and upper confidence limits of Cohens'd ($d_p$)  with the cumulative normal distribution:
$$LL = \Phi_{d_{p_{lower}}}$$
$$UL = \Phi_{d_{p_{upper}}}$$








# References

Algina, J., Keselman, H. J., & Penfield, R. D. (2006a). Confidence interval coverage for Cohen’s effect size statistic. *Educational and Psychological Measurement*, *66*(6), 945--960. <https://doi.org/10.1177/0013164406288161>  

Algina, J., Keselman, H. J., & Penfield, R. D. (2006b). Confidence intervals for an effect size when variances are not equal. *Journal of Modern Applied Statistical Methods*, *5*(1), 2--13. <https://doi.org/10.22237/jmasm/1146456060>  

Bonett, D. G. (2006). Robust confidence interval for a ratio of standard deviations. *Applied Psychological Measurement*, *30*(5), 432--439. <https://doi.org/10.1177/0146621605279551>  

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods*, *13*(2), 99--109. <https://doi.org/10.1037/1082-989X.13.2.99>    

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Routledge. https://doi.org/10.4324/9780203771587  

Cousineau, D., & Goulet-Pelletier, J. (2020, July 24). A review of five techniques to derive confidence intervals with a special attention to the Cohen's dp in the between-group design. <https://doi.org/10.31234/osf.io/s2597>  

Del Giudice, M. (2019). Measuring sex differences and similarities. *Gender and sexuality development: Contemporary theory and research.* 

Fitts, D. A. (2021). Expected and empirical coverages of different methods for generating noncentral t confidence intervals for a standardized mean difference.*Behavior Research Methods*, <https://doi.org/10.3758/s13428-021-01550-4>  

Glass, G. V. (1976). Primary, secondary, and meta-analysis of research. *Educational researcher*, *5*(10), 3-–8. <https://doi.org/10.3102/0013189X005010003>  

Goulet-Pelletier, J.-C., & Cousineau, D. (2018). A review of effect sizes and their confidence intervals, Part I: The Cohen's d family. *The Quantitative Methods for Psychology*, *14*, 242--265. <https://doi.org/10.20982/tqmp.14.4.p242>  

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Hedges, L. V. (1981). Distribution theory of glass’s Estimator of effect size and related estimators. *Journal of Educational and Behavioral Statistics*, *6*(2), 107--128. <https://doi.org/10.3102%2F10769986006002107>
