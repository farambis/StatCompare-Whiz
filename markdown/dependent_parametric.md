<h1> Dependent groups design  </h1>

<h2 id="DG_normality_homoscedasticity"> Assuming Normality but not Homoscedasticity </h2>

<h3 id="DG_cohens_d_z"> Cohen's \(d_z\) </h3>

The population effect size of interest is given by the formula:

$$\delta_D = \frac{\mu_D}{\sigma_D} \qquad Eq.(DG )$$

The population mean of difference scores ($D = X_{post} - X_{pre}$) $\mu_D$ is standardised by the population standard deviation of difference scores $\sigma_D$. This effect size is used for power analysis for the dependent samples t-test. However, this effect size is entirely unique to the dependent samples design and cannot be compared with effect sizes frequently reported for independent samples designs, such as $\delta_p$ or $\delta_G$. The reason for this is that while $\mu_D = \mu_a - \mu_b$ and thus the numerator of $\delta_p$ and $\delta_D$ are identical, their denominators, i.e., their standardisers are not. Assuming homoscedasticity ($\sigma_a = \sigma_b = \sigma$) of populations a and b (e.g., pre- and post-treatment populations) the relationship between the standardisers for $\delta_p$ and $\delta_D$ is:

$$\sigma_D = \sigma\sqrt{2(1 - \rho)} \qquad Eq.(DG )$$

Thus, if $\rho > 0.5$ then $\sigma_D > \sigma$ and conversely, if $\rho < 0.5$ then $\sigma_D < \sigma$. As a result $\delta_D$ and $\delta_p$ can only be identical if $\rho = 0.5$.

However, if the difference score (also referred to as change score) is the outcome of interest, such as in longitudinal studies, it can be appropriate to estimate $\delta_D$. If the research question at hand is regarding how an individual's performance changes on average, then $\delta_D$ is the population effect of interest (Morris & DeShon, 2002).

$\delta_D$ tells us how many change score standard deviations the mean change score is removed from 0. More interestingly, the percentage of positive and negative change scores can be determined by treating $\delta_D$ like a *Z* score and examining the cumulative distribution function of the standard normal distribution (Morris & DeShon, 2002). For example, a $\delta_D = 0.84$ would imply that roughly 80% of people improve their performance after a treatment, while 20% perform less well after treatment. If normality of change scores cannot be assumed, this convenient interpretation is no longer appropriate.

The population effect size of interest can be estimated by the following formula (e.g., Cohen, 1988):

$$d_z = \frac{\bar{d}}{s_d} = \frac{\bar{X}_{post} - \bar{X}_{pre}}{s_d} \qquad Eq.(DG )$$

With $s_d$ being:

$$s_d = \sqrt{\frac{1}{(n - 1)}\sum_{i = 1}^n(d_i - \bar{d})^2} \qquad Eq.(DG )$$

with $d_i = X_{post_i} - X_{pre_i}$ and $\bar{d} = \frac{1}{n}\sum_{i = 1}^nd_i = \bar{X}_{post} - \bar{X}_{pre}$.

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_z$.

$1 - \alpha$ CI is implemented according to the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution.

Firstly, Cohen's $d_z$ is transformed into an estimated noncentrality parameter $\widehat{\lambda_d}$:

$$\widehat{\lambda_d} = d_z * \sqrt{n} \qquad Eq.(DG )$$

Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = n - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = n - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_z$:

$$LL = \lambda_L * \frac{1}{\sqrt{n}} \qquad Eq.(DG )$$

$$UL = \lambda_U * \frac{1}{\sqrt{n}} \qquad Eq.(DG )$$

This CI formula is derived under the assumption that the population of difference scores follows a nomral distribution. In such a case the above method yields an exact CI for the mean of the difference scores.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<h3 id="DG_hedges_g_z"> Hedges' \(g_z\) </h3>

As mentioned above $d_z$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Gibbons et al. (1993)) estimates the same population parameter as $d_z$ given in $Eq.(DG )$\$:

$$g_z = \frac{\bar{d}}{s_d} * J(\nu) \qquad Eq.(DG)$$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being given by

$$J(\nu) = \frac{\Gamma(\frac{\nu}{2})}{\sqrt{\frac{\nu}{2}}\Gamma(\frac{\nu - 1}{2})} \qquad Eq.(DG)$$

$1 - \alpha$ CI is implemented the same way as for $d_z$ with $d_z$ simply being replaced by $g_z$ in $Eq (DG )$. The properties of this CI method should be comparable to the ones described for the noncentral t based method described for $d_z$!

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

<h3 id="DG_glass_d"> Glass' \(d_{G,\,j}\) </h3>

The population effect of interest is given by:

$$\Delta_j = \frac{\mu_a - \mu_b}{\sigma_j} \qquad Eq.(DG)$$

with two groups this reduces to:

$$\Delta_a = \frac{\mu_a - \mu_b}{\sigma_a} \qquad Eq.(DG)$$

$$\Delta_b = \frac{\mu_a - \mu_b}{\sigma_b} \qquad Eq.(DG)$$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by the population standard deviation of population *a* or population *b* $\sigma_{(a|b)}$. This population effect size is applicable in various design with dependent groups (Bonett, 2015):  
- a pretest-posttest design (e.g., $\mu_{post} - \mu_{pre}$)  
- a within-subjects design where some score is measured under two treatment conditions (e.g., $\mu_{novel\,treatment} - \mu_{gold\,standard\,treatment}$)  
- a longitudinal design where some score is measured at two points in time without any intermediate intervention (e.g., $\mu_{timepoint\,2} - \mu_{timepoint\,1}$)  
- or for a matched-pair design where subjects are paired based on covariates and randomly assigned to two conditions (e.g., $\mu_{experimental} - \mu_{control}$).  

Treatments can increase the variance in an outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & Kim, 2012, pp. 17-20). Thus, the variance of the population receiving treatment might be higher than the variance of the population without said treatment. In such cases $\Delta_a$ and $\Delta_b$ provide distinct population effects. However, even when the contrasted populations are homoscedastic, the two estimators will yield different estimates due to sample standard deviation within each group being most likely different. In either case, it is up to the user to decide which estimate to interpret. A common recommendation is to consult the estimate using the standard deviation of a comparison (e.g., control) group (e.g., Grissom & Kim, 2001). Here, if this effect size is chosen by the user, both estimators are provided denoted as $d_{G, 1}$&mdash;using the first group's standard deviation in the denominator&mdash;and $d_{G, 2}$&mdash;using the second group's standard deviation in the denominator.  

$\Delta_b$ tells us how many population *b* standard deviation units ($\sigma_b$) $\mu_a$ (e.g., $\mu_{post}$) lies below or above $\mu_b$ (e.g., $\mu_{pre}$) and $\Delta_a$ tells us how many population *a* standard deviation units ($\sigma_a$) $\mu_a$ (e.g., $\mu_{post}$) lies below or above $\mu_b$ (e.g., $\mu_{pre}$).  

More interestingly perhaps, $\Delta_j$ is rather similar to a *Z* score. Consequently, if the mean difference is standardised by the standard deviation of the population with the lower mean and if further that population follows a normal distribution, $\Delta_j$ can be used to determine what proportion of the population with the lower mean the average member of the population with the higher mean outscores. Like with a *Z* score, this information can be derived from the cumulative distribution function of the standard normal distribution. If scores are not normally distributed such convenient interpretations are no longer applicable.  

The sample estimator of this population effect is given by the formula (e.g., Becker (1988)):

$$d_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} \qquad Eq.(DG)$$

with two groups this results in the estimators:

$$d_{G,\,a} = \frac{\bar{X}_a - \bar{X}_a}{s_b} \qquad Eq.(DG)$$

$$d_{G,\,b} = \frac{\bar{X}_a - \bar{X}_b}{s_b} \qquad Eq.(DG)$$

With $\bar{X_a}$ being the sample mean of group *a*, $\bar{X_b}$ being the sample mean of group *b*, and $s_{a|b}$ being the bias corrected sample standard deviation of group *a*/*b*. This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_{G,\,j}$.

An approximate large-sample CI is implemented according to Bonett (2015):

$$CI = d_{G,\,j} \pm z_{\frac{\alpha}{2}}*\sqrt{\widehat{VAR}(d_{G,\,j})}$$

with

$$\widehat{VAR}(d_{G,\,j}) = \frac{d^2_{Gj}}{2(n - 1)} + \frac{s^2_d}{s^2_j(n - 1)}$$

This estimate of the variance of $d_{G,\,j}$ does assume normality but not homoscedasticity.

Bonett (2015) examined this CI method under various conditions using simulations. The author reported non-rejection rates very close to the nominal $1 - \alpha$ rate (\~$\pm 1%$) under bivariate normality and low to relatively high levels of heteroscedasticity (with population variance ratios of up to $\sigma_a:\sigma_b = 16:1$ and $\sigma_a:\sigma_b = 1:16$). However, when the normality assumption is violated, the method fails to maintain a consistent non-rejection rate close to the nominal $1 - \alpha$ rate. The largest deviations from the nominal non-rejection rate (\~$\pm 5%$) were observed for rather large effect size ($\Delta \le 0.6$) and large correlations ($\rho \le 0.9$) under the conditions studied.

Algina et al. (2005) proposed a noncentral t based approximate CI and examined its behaviour under nonnormality and heteroscedasticity. While this method performed identically well under normality, it did show lower non-rejection rates under the cases of nonnormality studied by the authors with non-rejection rates decreasing with increasing size of $\Delta$. In general the CI method performed worse than the one implemented here, however, this might be due to the fact that Bonett (2015) and Algina et al. (2005) considered differing cases of nonnormality. Consequently, Algina et al. (2005) recommend a different effect size alltogether, $d_{R,\,j}$, under nonnormality.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. Algina et al. (2005) studied this method under nonnormality and heteroscedasticity. Nonnormality caused non-rejection rates to consistently fall below the nominal rate, decreasing with an increasing value of $\delta$. This effect was especially strong, when the variance of the population whose standard deviation estimate was used as the standardiser (population b) was higher than the variance of the other population (population a). Such a ratio of population variances ($\sigma^2_b > \sigma^2_a$) resulted in low non-rejection rates even under normality, dipping below 0.9 for some combinations of effect size and sample size.

## Hedges' $g_{G,\,j}$

As mentioned above $d_{G,\,j}$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Becker, 1988) estimates the same population parameter as $d_{G,\,j}$ given in $Eq.(DG )$\$:

$$g_{G,\,j} = \frac{\bar{X_a} - \bar{X_b}}{s_j} * J(\nu) \qquad Eq.(DG)$$

with two groups this results in the estimators:

$$g_{G,\,a} = \frac{\bar{X_a} - \bar{X_b}}{s_a} * J(\nu) \qquad Eq.(DG)$$

$$g_{G,\,b} = \frac{\bar{X_a} - \bar{X_b}}{s_b} * J(\nu) \qquad Eq.(DG)$$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being given by $Eq.(DG)$. If this effect size is chosen by the user, both estimators are provided denoted as $g_{G, 1}$&mdash;using the first group's standard deviation in the denominator&mdash;and $g_{G, 2}$&mdash;using the second group's standard deviation in the denominator.The user can choose which to report/interpret (see documentation for $d_{G,\,j}$).  

A approximate large-sample $1 - \alpha$ CI is implemented similarly as the CI for $d_{G,\,j}$ with $\widehat{VAR}(d_{G,\,j})$ being multiplied by $J(\nu)^2$ in in $Eq (DG )$:

$$CI = g_{G,\,j} \pm z_{\frac{\alpha}{2}}*\sqrt{\widehat{VAR}(d_{G,\,j}) * J(\nu)^2}$$

Bonett (2015) recommends reporting the unbiased point estimate alongside with the CI calculated using the biased estimate in the variance formula $Eq. (DG)$. The author argues that using the biased estimate in the formula should give slightly more accurate non-rejection rates. If the user of this shiny app wishes to follow this recommendation, they are advised to report the CI computed for $d_{G,\,j}$, since the estimated variance of $d_{G,\,j}$ is multiplied by $J(\nu)^2$ for the current implementation following Borenstein et al. (2009, p. 27).

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

# Assuming Normality and Homoscedasticity

## Cohen's $d_p$

The population effect size of interest is given by the same formula as for the independent groups (IG) case:

$$\delta = \frac{\mu_a - \mu_b}{\sigma} \qquad Eq.(DG 3)$$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by their common population standard deviation $\sigma$. This population effect size is applicable for a pretest-posttest design (e.g., $\mu_{post} - \mu_{pre}$); a within-subjects design where some score is measured under two treatment conditions (e.g., $\mu_{novel treatment} \mu_{gold standard treatment}$); a longitudinal design where some score is measured at two points in time without any intermediate intervention (e.g., $\mu_{timepoint 2} - \mu_{timepoint 1}$); or for a matched-pair design where subjects are paired based on covariates and randomly assigned to two conditions (e.g., $\mu_{experimental} - \mu_{control}$)(Bonett, 2015).

$\delta$ tells us how many standard deviation units $\mu_b$ (e.g., $\mu_{post}$) lies below or above $\mu_a$ (e.g., $\mu_{pre}$). Once again, $\delta$ can also be thought of as a *Z* score and can be used to determine what proportion of population a the average member of population b outscores and vice versa.- See:

With this population effect homoscedasticity is assumed, i.e., that $\sigma^2_a = \sigma^2_b = \sigma^2$. Under this assumption $Eq.(DG)$ and $Eq.(DG3)$ are identical. However, heteroscedasticity is likely throughout various fields of research and it appears plausible that treatments increases variance in the outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & Kim, 2012, pp. 17-20). Unfortunately, traditional tests of homoscedasticity often fail to produce accurate *p* values, which makes it difficult to detect heteroscedasticity of population variances (Grissom & Kim, 2012, p. 20). If heteroscedasticity is plausible $Eq.(DG)$ should be estimated - as long as population b follows a normal distribution.

The population effect size of interest can be estimated by $d_G$ given in $Eq.(DG)$ if homoscedasticity can be assumed. However, in case of homoscedasticity using the pooled standard deviation $s_p = \sqrt{\frac{(n_a - 1) * s_a^2 + (n_b - 1) * s_b^2}{n_a + n_b - 2}} = \sqrt{\frac{s_a^2 + s^2_b}{2}}$ ($n_a = n_b$ ) is a better estimate of $\sigma$, since it is based on more data, is less biased and less variable than $s_b$.

Thus, a more useful sample estimate for $Eq.(DG3)$ is given by the formula (e.g., Hedges (1981)):

$$d_p = \frac{\bar{X_a} - \bar{X_b}}{s_p} \qquad Eq(DG 3.1)$$

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_p$.

CI implementation according to the method described by Steiger and Fouladi (1997) which uses the noncentral t distribution to construct a $1 - \alpha$ CI. The newly identified sampling distribution of $d_p$ for dependent samples is utilized (Cousineau, 2020) to create an approximate noncentral t based CI based on Cousineau and Goulet-Pelletier (2021).

Firstly, Cohen's $d_p$ is transformed into an estimated noncentrality parameter $\widehat{\lambda_d}$:

$$\widehat{\lambda_d} = d_p * \sqrt{\frac{n}{2(1-r\frac{s_a*s_b}{s^2_p})}} \qquad Eq.(DG 3.2)$$

Then the non-centrality parameter $\lambda_L$ of the noncentral t distribution (with $\nu = \frac{2(n - 1)}{1 + r^2}$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_U$ of the noncentral t distribution (with $\nu = \frac{2(n - 1)}{1 + r^2}$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_p$:

$$LL = \lambda_L * \sqrt{\frac{2(1 - r\frac{s_a*s_b}{s^2_p})}{n}} \qquad Eq.(DG 3.4)$$

$$UL = \lambda_U * \sqrt{\frac{2(1 - r\frac{s_a*s_b}{s^2_p})}{n}} \qquad Eq.(DG 3.4)$$

This CI formula is derived under the assumption that both populations follow a normal distribution and that the variance of the two populations are identical. Cousineau and Goulet-Pelletier (2021) examined the non-rejection rate of this (as well as other proposed CIs for $d_p$) and found that the above method frequently yielded non-rejection rates slightly lower (\~1%) than the nominal $1 - \alpha$ rate. However, the method was asymptotically exact (coverage rate = $1- \alpha$ rate) starting at around $n = 100$. It had other desirable properties such as yielding acceptably symmetric and short confidence intervals. The behaviour of this method under nonnormality and heteroscedasticity has not been reported in the study. Algina et al. (2005) studied the non-rejection rate of a highly similar noncentral t based approximate CI for $d_p$ (the only difference being somewhat different degrees of freedom) under nonnormality. The non-rejection rate was consistently below the nominal rate. This effect only worsening with increasing population effect size and sometimes even with increasing sample size. Consequently, Algina et al. (2005) advocate for the use of a robust version $d_{Rp}$ under nonnormality.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. The simulation conducted by Algina et al. (2005) resulted in rather poor non-rejection rates for bootstrap CI, even under normality (non-rejection rates varying between .9 and .94 under normaility). An increase in sample size did always lead to more accurate non-rejection rates (not even under normality) for all sizes of $\delta_p$ studied by the authors. The bootstrap method performed even worse under nonnormality. This was yet another reason for Algina et al. (2005) to recommend the robust version of $d_p$: $d_{Rp}$ when the normality assumption is violated.

## Hedges' $g_p$

As mentioned above $d_p$ has a slight positive bias, which can be corrected. This alternative formula estimates the same population parameter as $d_p$ given in $Eq.(DG )$\$:

$$g_p = \frac{\bar{X_a} - \bar{X_b}}{s_p} * J(\nu) \qquad Eq.(DG)$$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being given by $Eq.(DG )$.

$1 - \alpha$ CI is implemented the same way as for $d_p$ with $d_p$ simply being replaced by $g_p$ in $Eq (DG )$. The properties of this CI method should be comparable to the ones described for the noncentral t based method for $d_p$!

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

## $d_{RM}$

The population effect size being estimated is given by the formula (e.g., Bonett, 2015):

$$\delta_{RM} = \frac{\mu_{a} - \mu_{b}}{\frac{\sigma_d}{\sqrt{2(1-\rho)}}}$$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by the standard deviation of difference scores divided by $\sqrt{2(1-\rho)}$. An odd looking effect size at first. But if the relationship between homoscedastic populations $\sigma_a = \sigma_b = \sigma$ and $\sigma_D$ is considered (see Cohen's $d_z$), it becomes apparant that this population effect size simplifies to $\delta_p$ when homoscedasticity is assumed:

$$\frac{\mu_{a} - \mu_{b}}{\sigma_d}\sqrt{2(1-\rho)} = \frac{\mu_{a} - \mu_{b}}{\sqrt{\sigma^2 + \sigma^2 - 2\rho\sigma\sigma}}\sqrt{2(1-\rho)} = \frac{\mu_{a} - \mu_{b}}{\sigma\sqrt{2(1-\rho)}}\sqrt{2(1-\rho)} = \frac{\mu_{a} - \mu_{b}}{\sigma} = \delta_p$$

However, with heteroscedastic populations $\delta_{RM}$ becomes a somewhat curious population effect size (Bonett, 2015).

The population effect size is estimated with the formula given by (e.g., Morris & DeShon, 2002):

$$d_{RM} = \frac{\bar{X}_{a} - \bar{X}_{b}}{s_d}\sqrt{2(1-r)}$$

$d_{RM}$ will only equal $d_p$ when the sample standard deviation are equal $s_a = s_b = s$ and the sample correlation of group a and group b measurements is exactly $r = .5$. Due to the high variability of sample sizes, the sample ratio of variances can easily exceed the population ratio of variances even if that one is 1:1 (Grissom & Kim, 2012, p. 19). Additionally, pretest-posttest correlations for example often exceed .5 (Morris & DeShon, 2002). Therefore, it is unlikely that $d_p$ and $d_{RM}$ will be identical in any given sample.

This estimator has a bias. It systematically overestimates the size of the true population standardised mean difference. This bias can be corrected - see Hedges' $g_{RM}$.

The aforementioned relationship between $\delta_{RM}$ and $\delta_p$ is the reason why this population effect size and its estimate $d_{RM}$ have been recommended for repeated measures designs. This effect size is supposed to transform $d_z$ into the metric of $d_p$ for independent groups. Meaning, that $d_{RM}$ is supposed to transform an effect size of changes in an individual's performance into an effect size quantifying group difference in performance (Morris & DeShon, 2002). This transformation could be motivated by meta-analysis, where effect sizes coming from studies with differing designs (e.g., independent groups and repeated measures) should have a common metric, i.e.,that they estimate the same population parameter (e.g., $\delta_p$) (Morris & DeShon, 2002). Transforming $d_z$ into $d_{RM}$ has been favoured over computing $d_p$ as described above mainly for two reasons: Firstly, because the likely unit of deviation used and reported in a dependent groups design is the standard deviation of difference scores, making the computation of $d_p$ from summary statistics impossible (since $s_a$ and $s_b$ might not be reported) (Borenstein et al., 2009, p. 29). Secondly, an exact estimate of the distribution of $d_p$ for dependent groups could not be obtained previously, since the degrees of freedom of a pooled standard deviation of dependent groups was not known (Morris & DeShon, 2002). As reported above Cosineau (2020) identified an approach to compute the degrees of freedom associated with $d_p$. While the approach is not perfect, since the degrees of freedom depend on the unknown population value of $\rho$, but the degrees of freedom can be estimated as described by Cousineau and Goulet-Pelletier (2021) to construct CI for $d_p$. To conclude, if the aim is to estimate $\delta_p$ for dependent groups, $d_p$ might be the better choice as of writing this description.

An approximate $1 - \alpha$ large-sample CI is implemented according to Bonett (2015):

$$CI = d_{RM} \pm z_{\frac{\alpha}{2}}\sqrt{\widehat{VAR}(d_{RM})}$$

with $\widehat{Var}(d_{RM})$ being given in Borenstein et al. (2009, p. 29)

$$\widehat{Var}(d_{RM}) = 2(1-r)(\frac{d^2_{RM}}{2n} + \frac{1}{n})$$

This estimate of the variance of $d_{RM}$ assumes normality of difference scores and homoscedasticity of populations a and b. Bonett (2015) assessed the performance of the above CI method under varying conditions. The method could not produce non-rejection rates consistently close to the nominal $1 - \alpha$ rate even under bivariate normality and homoscedasticity, when $\rho \le 0.6$ and when $\delta_p = \delta_{RM} \le 1.2$. This pattern only worsened under (even slight) heteroscedasticity.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

## Hedges' $g_{RM}$

As mentioned above $d_{RM}$ has a slight positive bias, which can be corrected. This alternative formula (e.g., Borenstein et al., 2009, p. 29) estimates the same population parameter as $d_{RM}$ given in $Eq.(DG )$\$:

$$g_{RM} = \frac{\bar{X}_{post} - \bar{X}_{pre}}{s_d}\sqrt{2(1-r)} * J(\nu) \qquad Eq.(DG)$$

with $\nu = n - 1$ denoting the degrees of freedom and $J(\nu)$ being given by $Eq.(DG)$.

A approximate large-sample $1 - \alpha$ CI is implemented similarly as the CI for $d_{RM}$ with $\widehat{VAR}(d_{RM})$ being multiplied by $J(\nu)^2$ in in $Eq (DG )$:

$$CI = g_{RM} \pm z_{\frac{\alpha}{2}}*\sqrt{\widehat{VAR}(d_{RM}) * J(\nu)^2}$$

Bonett (2015) recommends reporting the unbiased point estimate alongside with the CI calculated using the biased estimate in the variance formula $Eq. (DG)$. The author argues that using the biased estimate in the formula should give slightly more accurate non-rejection rates. If the user of this shiny app wishes to follow this recommendation, they are advised to report the CI computed for $d_{RM}$, since the estimated variance of $d_{RM}$ is multiplied by $J(\nu)^2$ for the current implementation following Borenstein et al. (2009, p. 27).

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

## Cohen's $d'$

The population effect size of interest is given by the formula (e.g., Cohen, 1988):

$$\delta' = \frac{\mu_a - \mu_b}{\sigma'} \qquad Eq.()$$

with $\sigma'$ being:

$$\sigma' = \sqrt{\frac{\sigma^2_a + \sigma^2_b}{2}} \qquad Eq.(DG)$$

The mean difference of two dependent populations of interest $\mu_a - \mu_b$ is standardised by the root mean square of the population variances $\sigma^2_a$ and $\sigma^2_b$. Thus, this population effect does not assume homoscedasticity. In return, the population mean difference is standardised by the population standard deviation of a hypothetical population with a standard deviation between $\sigma_a$ and $\sigma_b$. Grissom and Kim (2012) report that some experts have a problem with this standardiser. Algina et al. (2005) argued that under heteroscedasticity the standardiser in $\delta'$ fails to represent the variability in either group. However, Bonett (2008) states the noncentral t CI method for Cohen's $d_p$ is only exact under the assumptions of normality and homoscedasticity. However, the author notes that it is difficult to assess homoscedasticity and the extent to which population variances differ, especially when samples are of small to moderate size. Therefore he advocated using the above population effect size. Nonetheless, Bonett (2008) also acknowledges that the population effect loses its meaningfulness under stronger levels of heteroscedasticity.

Cohen (1988) also recommends this standardiser when population variances differ (as long as sample sizes are identical). However, Cohen points out, that this population effect can no longer be converted into many of the highly intuitive and practical effect sizes discussed above, such the OVL or any of Cohen's U statistics.

Since $n_a = n_b$ in a dependent samples design, the estimator of $\delta'$ is always identical to the value of $d_p$ for dependent samples (e.g., Bonett, 2008):

$$d'= \frac{\bar{X_a} - \bar{X_b}}{s'} \qquad Eq.(DG)$$

With $$s' = \sqrt{\frac{s^2_a + s^2_b}{2}} = s_p$$

and thus

$$d' = d_p$$

for dependent samples. For this reason the bias corrected estimate of $Eq.(DG)$ is calculated by the app (since $d'$ is a biased estimator of $\delta'$). The bias depends on $\rho$ which is unknown and can only be estimated by $r$. Bonett (2015) gives the following formula computing a less biased estimate of $\delta'$:

$$d' = \sqrt{\frac{n - 2}{n - 1}}d' \qquad Eq.(DG)$$

This is the effect size that the shiny app returns when selecting $d'$.

An approximate large-sample CI is implemented according to Bonett (2015):

$$CI = d' \pm z_{\frac{\alpha}{2}}\sqrt{\widehat{VAR}(d')} \qquad Eq.(DG)$$

with

$$\widehat{VAR}(d') = \frac{d'^2(s^4_a + s^4_b + 2r^2s^2_as^2_b)}{8(n - 1)(\frac{s^2_a + s^2_b}{2})^2} + \frac{s^2_d}{(n - 1)\frac{s^2_a + s^2_b}{2}} \qquad Eq.(DG)$$

This estimate of the variance of $d'$ does assume normality but not homoscedasticity.

Notice: The CI formula by Bonett (2015) uses the unbiased effect size estimate. The shiny app works accordingly. It reports the bias corrected point estimate and the confidence interval using the uncorrected estimate. This is in accordance with the recommendation by Bonett (2015).

Bonett (2015) examined this CI method under various conditions using simulations. The author reported non-rejection rates very close to the nominal $1 - \alpha$ rate (\~$\pm 1%$) under bivariate normality and low to relatively high levels of heteroscedasticity (with population variance ratios of up to $\sigma_a:\sigma_b = 16:1$ and $\sigma_a:\sigma_b = 1:16$). It should be noted though that the interpretability of the effect size gets increasingly more difficult with heteroscedasticity. When the normality assumption is violated, the method fails to maintain a consistent non-rejection rate close to the nominal $1 - \alpha$ rate. Though the largest deviations from the nominal non-rejection rate (\~$\pm 3%$) were observed for rather large effect size ($\delta' \le 0.6$) and large correlations ($\rho \le 0.9$) under the conditions studied. The noncentral t based approximate CI for $\delta'$ studied by Algina et al. (2005) performed worse under the nonnormal conditions considered by them. However, this might be attributable to the fact that Bonett (2015) and Algina et al. (2005) considered differing cases of nonnormality!

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed. The simulation conducted by Algina et al. (2005) resulted in rather poor non-rejection rates for bootstrap CI, even under normality (non-rejection rates varying between .90 and .94). An increase in sample size did lead to more accurate non-rejection rates (under normality) for all effect sizes studied. The bootstrap method performed significantly worse under nonnormality though.
<br>

<h3 id = "DG_P_robust">ES robust to outliers</h3>
<h3 id = "DG_NP_SMD"> standardised Median differences</h3>

Hedges and Olkin (1984) argued that since outliers present in the data can violate the normality assumption, ES estimators insensitive to the presence of outliers ought to be developed. They suggested to replace sample means and standard deviations, which are influenced by outliers, with robust estimators. More concretely, they recommended to estimate group means with sample medians and standard deviations with some linear combination of order statistics.  
Grissom and Kim (2001) reported on three such ES estimators that use robust estimators of location and scale. Each presented estimator computes the difference between medians and standardises it by some robust estimate of variability. Thus, the three estimators described are standardised median differences. These estimators have the following genreal structure:

$$\hat\delta_{a|b} =  \frac{Mdn_a - Mdn_b}{S_{a|b}}$$

with $Mdn_a$ being the Median of group a/measurement 2, $Mdn_b$ being the median of group b/measurement 1 and $S_{a|b}$ being the standardiser, which is some robust measure of variability of the baseline/control measurement/group (e.g., the median absolute  deviation of pretreatment measurements). Here, if this estimator is chosen by the user, both estimators are provided denoted as $d_{MAD, 1}$/$d_{R_{IQ}, 1}$/$d_{bw, 1}$&mdash;using the first group's/measurement's variability estimator in the denominator&mdash;and $d_{MAD, 2}$/$d_{R_{IQ}, 2}$/$d_{bw, 2}$&mdash;using the second group's/measurement's variability estimator in the denominator.  
<br>
The sampling variance of these estimators are currently unknown and thus only $1 - \alpha$ percentile bootstrap CI are implemented for these estimators exclusively.  
<br>
Grissom and Kim (2001) note that other standardised median differences could be conceived by using yet another robust measure of variability in the denominator. However, we agree with the comment of Grissom and Kim (2012) that "the field should settle on the use of a reduced number of appropriate measures" (p.75) and that a alternate robust estimator which has a well-behaved confidence interval should be determined and consistently used when outliers threaten to violate assumptions.  
<br>
  
<h4 id = "DG_P_d_MAD"> \(d_{MAD}\) </h4>  

The difference in Medians can be standardised by the Median Absolute Deviation (MAD) of the baseline/control measurement/group.  
Then the standardised median difference is calculated with the following formula (Grissom & Kim, 2001):

$$d_{MAD} =  \frac{Mdn_a - Mdn_b}{MAD_{a|b}}$$

with MAD being: 

$$MAD = median(|X_i - median(X_i)|)$$

The MAD is more robust to outliers than the standard deviation and has a lower sampling variance.  
We follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($MAD$) of this estimator as well.  
<br>
  
<h4 id = "DG_P_d_RIQ"> \(d_{R_{IQ}}\) </h4>  

The difference in medians can be standardised by the interquartile range $R_{IQ}$, the difference between the third quartile (0.75-quantile) and the first quartile (0.25-quantile), of the baseline/control measurement/group.  
Then the standardised median difference is calculated with the following formula (Laird & Mosteller, 1990).

$$d_{R_{IQ}} = \frac{Mdn_a - Mdn_b}{0.75 \cdot R_{IQ_{a|b}}}$$

The interquartile range is more outlier resistant than the standard deviation. Multiplying $R_{IQ}$ with 0.75 results in an estimator that approximates the standard deviation under normality (Grissom & Kim, 2001).  
Grissom and Kim (2001) point to Shoemaker (1999) for a discussion of other possibly more robust ranges of quantiles that may yield alternative robust estimators of variability.  
We again follow the naming convention of Grissom and Kim (2005) who designated the median difference standardised by the biweight standard deviation as $d_{bw}$. Consequently, the subscript highlights the standardiser ($R_{IQ}$) of this estimator as well.  
<br>
  
<h4 id="DG_P_d_bw"> \(d_{bw}\) </h4>

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


## Variance ratio (VR)

The population effect size of interest is given by:

$$\theta = \frac{\sigma_{a|b}^2}{\sigma_{a|b}^2} \qquad Eq.(DG)$$

It is simply the population ratio of variances with either the first measurement being the reference group $\frac{\sigma_{b}^2}{\sigma_{a}^2}$ or the second measurement being the reference group $\frac{\sigma_{a}^2}{\sigma_{b}^2}$. This effect size can be of interest in the context of dependent groups for various reasons (Bonett, 2006):\
- for assessing the effect of treatment on variability in a response variable
- for studying changes in variability in a response variable over time
- for assessing the extent of variance homogeneity/heterogeneity, instead of conducting a hypothesis test
- for assisting in the choosing of effect size or of a variance as the standardiser for some of the effect sizes described above.

The sample estimate of $Eq.(DG)$ is given by the ratio of sample variances:

$$\hat{\theta} = \frac{s_{a|b}^2}{s_{a|b}^2} \qquad Eq.(DG)$$

Two different confidence interval procedures are implemented based on Bonett (2006). The first procedure can only be computed if raw data is uploaded. The second procedure is implemented for the "Educational mode" of the app and is based on simple summary statistics that can be provided by the user. Firstly, the latter procedure is outlined. The confidence interval is computed as:

$$CI = (\frac{s_{a|b}^2}{s_{a|b}^2})\{k \pm \sqrt{k^2 - 1}\} \qquad Eq.(DG)$$

with

$$k = 1 + \frac{2(1 - r^2)t_{\frac{\alpha}{2};n - 2}^2}{n - 2} \qquad Eq.(DG)$$

$t_{\frac{\alpha}{2};n - 2}$ being the $\frac{\alpha}{2}$ quantile of the Student's t distribution with *n - 2* degrees of freedom.\
This procedure yields an exact confidence interval for the population effect size if bivariate normality of the two measurements is satisfied. However, the described method is sensitive to even mild departures from normality. Bonett (2006) showed that when the distributions of the two measurements lightly differ from normality, the coverage probability of $Eq.(DG)$ falls drastically below the nominal $1 - \alpha$ rate.

When raw data are available an approximate confidence interval with asymptotic probability coverage of 1 - $\alpha$ under bivariate nonnormality can be computed as follows:

$$CI = exp\{ln(\frac{s_{a|b}^2}{s_{a|b}^2}) \pm z_{\frac{\alpha}{2}}\sqrt{\nu_1 + \nu_2 - 2a}\} \qquad Eq.(DG)$$

with

$$a = r_d\sqrt{\nu_1\nu_2} \qquad Eq.(DG)$$

$$r_d = Cor(d_{ia}, d_{ib}) \qquad Eq.(DG)$$

$$d_{ij} = (X_{ij} - \bar{X}_{j})^2 \qquad Eq.(DG)$$

$$\nu_j = \frac{\bar{\gamma}_{2j} - \frac{n - 3}{n}}{n - 4} \qquad Eq.(DG)$$

$$\bar{\gamma}_{2j} = \frac{n\sum_{i = 1}^n{(X_{ia} - \bar{X}_{t,\,a})^4}}{\{\sum_{i = 1}^n{(X_{ia} - \bar{X}_{a})^2}\}^2} \qquad Eq.(DG)$$

where $\bar{X}_{t,\,a}$ is the trimmed mean with a trim-proportion of $\frac{1}{\{2(n - 4)^2\}}$.\
The expression $\sqrt{\nu_1 + \nu_2 - 2a}$ in $Eq.(DG)$ is the estimate of the standard deviation of $\frac{s_{a|b}^2}{s_{a|b}^2}$.

Bonett (2006) reports that the above procedure has probability coverage close to the nominal $1 - \alpha$ level under bivariate normality, tending to be slightly more liberal particularly when the sample size is low (*n = 10*). This approximate method is also not immune to violations of bivariate normality and it can have poor coverage probability when the population correlation is high (*r \> 0.5*) and the sample size is low (*n = 10*). In particular Bonett (2006) remarks that the approximate procedure tends to be conservative with platykurtic (light-tailed) distributions and conservative with leptokrutic (heavy-tailed) distributions. However, the author notes that the exact method shows the same pattern of behaviour while being more conservative with light-tailed as well as more liberal with heavy-tailed distributions.  




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
The tail ratio can be thought of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". This way we can characterise the data as *n* pairs of Bernoulli events, where the possible outcomes are referred to as "hit" (denoted by 1) and "miss" (denoted by 2). Thus, the data can fall in one of four combinations:

- two "hits" (11)  
- first observation a "hit", second observation a "miss" (12)  
- first observation a "miss", second observation a "hit" (21)  
- two "misses" (22)  

The paired binomial proportions of interest are the marginal proportion of scores from group a that are categorised as "hits" $p_a$ and the marginal proportion of scores from group b that are categorised as "hits" $p_b$. The population tail ratio for a given cutoff value and region of interest is thus the ratio:

$$\theta = \frac{p_{a|b}}{p_{b|a}}$$

The observed data can be thought of as 2 x 2 table of the following form:

<table border = "1">
	<col>
	<colgroup span = "2"></colgroup>
	<colgroup span = "2"></colgroup>
	<tr>
		<td rowspan = "2" colspan="2" scope="colgroup"></td>
		<th colspan = "2" scope = "colgroup">Group a</th>
		<td></td>
	</tr>
	<tr>
		<th>hits&nbsp;&nbsp;</th>
		<th>missess&nbsp;&nbsp;</th>
		<th>sum&nbsp;&nbsp;</th>
	</tr>
	<tbody>
		<tr>
			<th rowspan="2" scope="rowgroup">Group b&nbsp;&nbsp;</th>
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

$$\hat{\theta} = \frac{\hat{p}_{a|b}}{\hat{p}_{b|a}} = \frac{n_{1.|.1}}{n_{.1|1.}}$$

with $\hat{p}_a = \frac{n_{1.}}{n}$ and $\hat{p}_b = \frac{n_{.1}}{n}$.

For the "parametric mode" of the application the cell frequencies are determined based on the assumption that the pairs of observation $(X_a, X_b)$ are sampled from a bivariate normal distribution: $$ \left(\begin{array}{t} X_a \\ X_b \end{array} \right) \sim N(\mu, \Sigma)$$

with $\mu = \left(\begin{array}{t}\bar{X}_a \\ \bar{X}_b \end{array}\right), \Sigma = \left(\begin{array}{cc} s_a^2 & Corr(X_a,X_b)s_as_b \\ Corr(X_a, X_b)s_as_b & s_b^2\end{array}\right)$

The number of pairs of scores which both fall below/above a cutoff *t* (i.e., the number of "hits") is determined by multiplying the number of observation with the proportion of pairs of scores falling below/above *t* in a bivariate normal distribution with the parameters given above\
When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = n * F_{X_a,X_b}(t,t)$  
- $n_{12}$ is computed as: $n_{12} = n * P(X_a \leq t, X_b > t) = n * (F_{X_a}(t) - F_{X_a, X_b}(t,t))$  
- $n_{21}$ is computed as: $n_{21} = n * P(X_a > t, X_b \leq t) = n * (F_{X_b}(t) -F_{X_a, X_b}(t,t))$    
- $n_{22}$ is computed as:$n_{22} = n * P(X_a > t, X_b > t) = n * (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))$  
- $n_{1.}$ is simply computed as: $n_{1.} = n * F_{X_a}(t) = n * \Phi(\frac{c - \bar{X}_a}{s^2_a})$  
- $n_{.1}$ is simply computed as: $n_{.1} = n * F_{X_b}(t) = n * \Phi(\frac{c - \bar{X}_b}{s^2_b})$  
  
with $F_{X_a, X_b} = P(X_a \leq t, X_b \leq t)$ being the cumulative distribution function of a bivariate normal distribution with the parameters given above;  
with $F_{X_a}$ being the cumulative distribution function of $X_a: F_{X_a}(t) = F_{X_a, X_b}(t, \infty) = \Phi(\frac{t - \bar{X}_a}{s^2_a})$;  
and with $F_{X_b}$ being the cumulative distribution function of $X_b: F_{X_b}(t) = F_{X_a, X_b}(\infty, t) = \Phi(\frac{t - \bar{X}_b}{s_b^2})$  

When "hits" are defined as scores above *t*:  

- $n_{11}$ is computed as:$n_{11} = n * (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))$  
- $n_{12}$ is computed as: $n_{12} = n * P(X_a \geq c, X_b < c) = n * [(1 - F_{X_a}(t)) - (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))]$  
- $n_{21}$ is computed as:$n_{21} = n * P(X_a < c, X_b \geq c) = n * [(1 - F_{X_b}(t)) - (1 - F_{X_a}(t) - F_{X_b}(t) + F_{X_a,X_b}(t,t))]$  
- $n_{22}$ is computed as:$n_{22} = n * F_{X_a, X_b}(t,t)$  
- $n_{1.}$ is computed as:$n_{1.} = n * (1 - F_{X_a}(t)) = n * (1 - \Phi(\frac{t - \bar{X}_a}{s^2_a})$    
- $n_{.1}$ is computed as:$n_{.1} = n * (1 - F_{X_b}(t)) = n * (1 - \Phi(\frac{t - \bar{X}_b}{s^2_b}))$  

For the "non-parametric mode" of the application the cell frequencies are determined more straightforwardly as the number of observed scores below/above a cutoff *t*. No assumption is made regarding the underlying distribution of the pairs of observed scores.\
When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$  
- $n_{12}$ is computed as: $n_{12} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$  
- $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$  
- $n_{22}$ is computed as: $n_{22} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$  
- $n_{1.}$ is computed as:$n_{1.} = \sum_{i=1}^{n_{1.}} I_{\{x \leq t\}}(x_{a_i})$  
- $n_{.1}$ is computed as:$n_{.1} = \sum_{i=1}^{n_{.1}}I_{\{x \leq t\}}(x_{b_i})$  

with

$$ I_{\{x \leq t\})}(x) = \begin{cases}
1 & \text{if} \qquad x \leq t \\
0 & \text{if} \qquad x \gt t 
\end{cases}
$$

and 

$$ I_{\{x \geq t\}}(x) = \begin{cases}
1 & \text{if} \qquad x \geq t \\
0 & \text{if} \qquad x \lt t 
\end{cases}
$$

and when "hits" are defined as scores above *t*:  

- $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$  
- $n_{12}$ is computed as: $n_{12} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$  
- $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \geq t\}}(x_{b_i})$  
- $n_{22}$ is computed as: $n_{22} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})*I_{\{x \leq t\}}(x_{b_i})$  
- $n_{1.}$ is computed as:$n_{1.} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})$  
- $n_{.1}$ is computed as:$n_{.1} = \sum_{i=1}^{n_{.1}}I_{\{x \geq t\}}(x_{b_i})$  


With $n_{1.}$ and $n_{.1}$ defined and computed the ratio of the binomial proportions $\hat{p}_a$ and $\hat{p}_b$ and consequently the point estimate of the tail ratio can be determined. The rest of the cell frequencies are relevant for the computation of the implemented confidence interval.

Two approximate confidence intervals are implemented for both the parametric and the non-parametric analyses. Fagerland et al. (2014) analysed multiple confidence intervals for the ratio of paired binomial proportions. While none of the assessed procedures yielded appropriate coverage rates across the various conditions the authors examined, the Nam-Blackwelder and the Bonett-Price hybrid Wilson score confidence intervals performed the most adequately across many of the studied scenarios with the Nam-Blackwelder interval outperforming the Bonett-Price interval when marginal probabilities (i.e., $p_{a|b}$) are less than 0.2. Both methods have been recommended by the authors for general use.  
The Nam-Blackwelder confidence interval relies on iterative search and thus might result in an error under some conditions. Consequently, the following approach has been employed for the implementation of the confidence interval:  

- the Nam-Blackwelder confidence interval is reported if the iterative search of the confidence limits does not result in an error. The interval is computed as described by Nam and Blackwelder (2002).  
- in case the iterative search does result in an error the user of the app receives a corresponding notification in the user interface an the Bonett-Price confidence interval is reported. The Bonett-Price confidence interval is computed as described by Bonett and Price (2006b).  

Neither the computation of the Nam-Blackwelder nor of the Bonett-Price confidence interval is described in detail here as they both are rather elaborate - the reader is advised to study the cited literature for further details.  

However, Fagerland et al. (2014) emphasize that while the implemented intervals are in general the best performing, they can be somewhat liberal (average coverage probabilities between 0.91 and 0.95 for an $1 - \alpha$ level of 0.95) for combinations of a small sample size ($n = 20$), small marginal proportions ($p_{a|b} \leq 0.2$) and a large/small ratio of proportions ($\theta = 4.5$ or $\theta = 0.22$). The Bonett-Price confidence interval is more liberal than the Nam-Blackwelder confidence interval for the given combinations of sample size, marginal proportions and ratio of proportions.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.

## The Common Language ES

The population effect of interest is given by:

$$ \mathbb{P}\(D > 0\) = \mathbb{X_{i,\,post} > X_{i,\,pre}}$$

that is, the probability that a randomly selected score from the population of difference scores ($D = X_{post} - X_{pre}$) is greater than 0 (McGraw & Wong, 1992). This probability corresponds to the probability of someone's score from  measurement 2 (e.g., post treatment) exceeding the person's score from measurement 1 (e.g., pre treatment). The latter quantity can be interpreted as the probability of a subject improving themselves in the studied variable&mdash;if higher scores reflect betterment in the said variable&mdach; or the probability of someone ameliorating in the studied variable&mdash;if higher scores reflect amelioration in said variable. As argued by Mastrich & Hernandez (2021), The CL es can be considered to provide a more intuitive way to understand statistical results and therefore aids practitioners in understanding research findings and making informed decisions. 

A parametric estimator assuming normality and homogeneity of the two measurement distribution is given by (McGraw & Wong, 1992):

$$CL = \Phi\(d_z\)$$

with $d_z$ being the ES discussed above.  

No closed form formulas were identified for the computation of a ($1-\alpha$) CI for the CL ES. Mastrich & Hernandez (2021) recommends to transform the bounds of the CI of $d_z$ "to provide a sense of uncertainty around the reported CLES" (p.733). The user of this application can transform the CI limits given by the application for $d_z$ using the above formula if they wish to do so. Otherwise, a $1 - \alpha$ percentile bootstrap CI is computed and can be used to communicate said uncertainty.

A nonparametric estimator of the above population effect that does not make the normality or homoscedasticity assumptions of the CL ES, called the probability of superiority (PS; Grissom, 1994), is described in the documentation tab of the page on nonparametric ES for the dependent groups design.


## Measures of Nonoverlap


If the populations being compared are normal and with equal variability it is possible to define measures of nonoverlap which are related with cohen's d and with themselves through the cumulative normal distribution. (Cohen, 1988).

### Parametric Coefficient of Overlapping for dependent groups
The coefficient of overlapping (OVL) is defined as the common area under two probability densities and is used as a measure of agreement of two distributions(Bradley, 2006). Under the assumption of normality and homoscedasticity it can be simply estimated by plugging Cohen's d into the normal cumulative distribution function (DelGiudice, 2019)::
$$ OVL = 2 \phi (\frac{-|d|}{2})$$
$OVL (X, Y)$ = 1 if and only if the distributions of X and Y are equal and OVL(X, Y) = 0 if and only if the supports of the distributions of X and Y have no interior points in common which is the reason why $OVL (X, Y)$ can be interpreted as a measure of agreement of the two distributions.
Nonparametric estimations can be obtained by replacing the densities by appropriate kernel density estimators and the integrals by an appropriate quadrature formula or the sample mean(see documentation of the nonparametric coefficient of overlapping).
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.

### Parametric Coefficient of Overlapping Two for dependent groups
The overlapping coefficient two ($OVL_2$) is the proportion of overlap relative to the joint distribution and can be estimated with the following formula under the assumption of normality and homoscedasticity (DelGiudice, 2019):
$$ OVL_2 = \frac{OVL}{2-OVL}$$
with OVL being calculated as described above.
Grice and Barret(2014) argue that OVL is to be preferred over $OVL_2$ in most contexts, because $OVL_2$ gives information about overlap and nonoverlap with respect to the joint distribution or combined area of the two distributions, which is unitutitive. OVL, on the other hand, indicates what percentage of the area a distribution shares with the other distribution which is easier to interpret.    
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.


### Cohen's U1


$U_1$ can be interpreted as percentage of nonoverlap and is characterized by the following formula under the assumption of normality and homoscedasticity(Cohen, 1988):
$$U_1 = \frac{2\Phi_{d/2}-1}{\Phi_{d/2}} = \frac{2U_2-1}{U_2}$$
with $d_p$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.
<br>



### Cohen's U2

When examing two populations, Cohen's measure of nonoverlap$ U_2$ is the percentage of one population that exceeds the same percentage in the other population. It is described by the following formula under the assumption of normality and homoscedasticity (Cohen, 1988):
$$U2 = \Phi_{d/2}$$
with $d$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.
<br>



### Cohen's U3

When examining two populations, Cohen's measure of nonoverlap $U_3$ is the percentage of one population which the upper half of the cases of the other population exceeds (Cohen, 1988). Cohen's $U_3$ is described by the following formula under the assumption of normality and homoscedasticity:
$$U_3 = \Phi_{d}$$
with $d$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
We could not identify a closed form formula for the confidence interval of this effect size. Thus, a $1 - \alpha$ percentile bootstrap confidence interval is implemented exclusively.  
<br>


## $d_{R, z} (robust Cohen's $d_z$)

The population effect size of interest is given by the formula:

$$\delta_{RD} = c\frac{\mu_{tD}}{\sigma_{wD}} \qquad Eq.(DG)$$

$$c = \{\int_{\Phi^{-1}(\gamma)}^{\Phi^{-1}(1 - \gamma)}{\gamma^2 \phi(\gamma)}\} + (2  \Phi^{-1}(\gamma)^2 \gamma) \qquad Eq.(DG)$$

The population trimmed mean of difference scores $\mu_{tD}$ is standardised by the population winsorised standard deviation of difference scores $\sigma_{wD}$ scaled by $c$. The value of the constant $c$ depends on the chosen trim factor $\gamma$ ($\gamma = 0.2$ by default, in which case $c = 0.642)$.

$\delta_{RD}$ tells us how many winsorised change score standard deviations the trimmed mean of change scores is removed from 0. This measure of effect is applicable in all contexts in which $\delta_D$ is the appropriate population effect (see above for examples).

The value of $c$ is the winsorised standard deviation of the standard normal distribution with $\gamma$ trimming. As noted, if $\gamma = 0.2$ then $c = 0.642$. This means that the ratio of winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if the population follows a normal distribution. Thus, if the population of difference scores is normal, then $\frac{\sigma\_{wD}}{c} = \sigma\_{D}$ and consequently $\delta_{RD} = \delta_D$ (Wilcox, 2017a, p.116).

The sample estimate of the population effect is given by (Wilcox, 2017a, p. 116):

$$d_{Rz} = c\frac{\bar{d}_t}{s_{wd}} \qquad Eq.(DG)$$

with $\bar{d}_t$ being the trimmed mean of the observed difference scores $d_i = x_{bi} - x_{ai}$ and $s_{wd}$ being the winsorised standard deviation of the observed $d_i$. As mentioned above, $c$ is a constant with a value dependeing on $\gamma$. Should the population follow a normal distribution, then $\frac{s_{wd}}{c}$ estimates $\sigma_D$ and $\bar{d}_t$ estimates $\mu_D$. Consequently $d_{Rz}$ would estimate $\delta_D$. This way the robust statistic $d_{Rz}$ estimates the same population effect as its non robust counterpart $d_z$ under normality.

A noncentral t based confidence interval is not implemented for this measure as no formula for its computation could be found in the sighted literature. However, in accordance with the recommendation of Wilcox (2017b) a $1 - \alpha$ percentile bootstrap confidence interval is implemented. Studies assessing the performance of such a procedure for other robust effect sizes, namely $d_{Rp}$ and $d_{RG}$, found that the percentile bootstrap method achieved non-rejection rates close to the nominal $1 - \alpha$ (i.e., within the range [0.925; 0.975] for $\alpha = 0.05$) for various nonnormal distributions of populations a and b (Algina et al., 2005).

## $d_{R,\,j}$ (robust Glass' $d_{G,\,j}$)

The population effect size of interest is given by the formula:

$$\Delta_{R,\,j} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,j}} \qquad Eq.(DG)$$

with two groups this reduces to:

$$\Delta_{R,\,a} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,a}} \qquad Eq.(DG)$$

$$\Delta_{R,\,b} = c \cdot \frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_{w,\,b}} \qquad Eq.(DG)$$

The difference of population trimmed means of populations *a* and *b* $\mu_{t,\,a} - \mu_{t,\,b}$ is standardised by the winsorised standard deviation of population *a*/*b* $\sigma_{w(a|b)}$ scaled by $c$.

$\Delta_{R,\,j}$ tells us how many population *j* winsorised standard deviation units $\mu_{t,\,a}$ (e.g., $\mu_{t,\,post}$) lies below or above $\mu_{t,\,b}$ (e.g., $\mu_{t,\,pre}$). This measure of effect is applicable in all contexts in which $\Delta_j$ is applicable (see above for some examples). As described above, under heteroscedasticity $\Delta_{R,\,a}$ and $\Delta_{R,\,b}$ are distinct population effects and even under homoscedasticity (when the two population effects are identical) the sample estimate will differ depending on which group's winsorised standard deviation is used as standardiser simply due to the fact that the sample winsorised standard deviation within the groups will most likely differ. It is up to the user to decide which estimate to interpret and report. If this effect size is chosen by the user, both estimators are provided denoted as $d_{R, 1}$&mdash;using the first group's winsorised standard deviation in the denominator&mdash;and $d_{R, 2}$&mdash;using the second group's winsorised standard deviation in the denominator.   

The sample estimate of the population effect is given by (Algina et al., 2005):

$$d_{R,\,j} = c \cdot \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,j}} \qquad Eq.(DG)$$

with two groups this results in the estiamtors:

$$d_{R,\,a} = c \cdot \frac{\bar{X}_{t,\ma} - \bar{X}_{t,\,b}}{s_{w,\,a}} \qquad Eq.(DG)$$

$$d_{R,\,b} = c \cdot \frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{w,\,b}} \qquad Eq.(DG)$$

with $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ being the trimmed means of the dependent samples and $s_{w,\,a}$ being the sample winsorised standard deviation of group *a* and $s_{w,\,b}$ being the sample winsorised standard deviation of group *b*.

$c$ is a constant with a value depending on $\gamma$. Should populations *a* and *b* follow a normal distribution, then $\frac{s_{w,\,j}}{c}$ estimates $\sigma_j$ and $\bar{X}_{t,\,b}$ and $\bar{X}_{t,\,a}$ estimate $\mu_{b}$ and $\mu_{a}$ respectively. Consequently $d_{R,\,j}$ would estimate $\Delta_j$. This way the robust statistic $d_{R,\,j}$ estimates the same population effect as its non robust counterpart $d_{G,\,j}$ under normality.

An approximate noncentral t based CI based on Algina et al. (2005) is implemented:

Firstly, $d_{R,\,j}$ is transformed into an estimated noncentrality parameter $\widehat{\lambda_R}$:

$$\widehat{\lambda_R} = \frac{d_{R,\,j}}{c} \sqrt{\frac{h(h - 1)s^2_{w,\,j}}{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2*Cov(X_{w,\,a}, X_{w,\,b})}} \qquad Eq.(DG )$$

with $X_{w,\,a}$ and $X_{w,\,b}$ being the winsorised sample data of the two dependent samples and $h$ being the number of observations left after trimming $h = n - 2(\gamma n)$

Then, the non-centrality parameter $\lambda_{RL}$ of the noncentral t distribution (with $\nu = h - 1$ degrees of freedom) which has $\widehat{\lambda_R}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_{RU}$ of the noncentral t distribution (with $\nu = h - 1$ degrees of freedom) which has $\widehat{\lambda_R}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_{R,\,j}$:

$$LL = \lambda_{RL} * c * \sqrt{\frac{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)s^2_{w,\,j}}} \qquad Eq.(DG )$$

$$UL = \lambda_{RU} * c * \sqrt{\frac{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)s^2_{w,\,j}}} \qquad Eq.(DG)$$

This CI formula is approximate because the distribution of $\frac{d_{Rp}}{c} \sqrt{\frac{h(h - 1)s^2_{w,\,j}}{(n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}}$ only approximately follows the t distribution. However, this formula is not based on homoscedasticity or normality of the investigated populations. Algina et al. (2005) examined the non-rejection rate of this CI procedure for various combinations of population effect size, population correlation, and sample size and found that it yielded non-rejection rates that were close to the nominal $1 - \alpha$ rate for normal and a wide range of nonnormal data (the authors criterion interval for appropriate non-rejection rates was $[0.925,0.975]$). However, when data were sampled from a distribution alike the exponential distribution the procedure was too liberal for large population effect size $\Delta_{RGj} > 1.2$ and the population correlation was medium $\rho = 0.4$. With low population correlation $\rho \le 0.2$ this tendency became worse and was also noticeable for a long-tailed skewed distribution. A large population correlation $\rho \ge 0.6$ ameliorated these tendencies of the CI method, resulting in non-rejection rates within the criterion interval.

An $1 - \alpha$ percentile bootstrap CI is computed. The simulations conducted by Algina et al. (2005) resulted in appropriate non-rejection rates (i.e., within the range of $[0.925,0.975]$) for all investigated conditions. The estimated non-rejection rate tended to converge to the nominal level of 0.95 as the sample size increased. In general the non-rejection rate of the percentile bootstrap CI increased with increasing population effect size and population correlation. Overall, Algina et al. (2005) recommend the percentile bootstrap CI method for $d_{R,\,j}$.

## Robust Cohen's $d_p$

The population effect size of interest is given by the formula:

$$\delta_{Rp} = c\frac{\mu_{t,\,a} - \mu_{t,\,b}}{\sigma_w} \qquad Eq.(DG)$$

The difference of population trimmed means of populations a and b $\mu_{t,\,a} - \mu_{t,\,b}$ is standardised by the (common) winsorised population standard deviation $\sigma_w$ scaled by $c$.

$\delta_{Rp}$ tells us how many winsorised standard deviation units $\mu_{t,\,a}$ (e.g., $\mu_{tpost}$) lies below or above $\mu_tb$ (e.g., $\mu_{tpre}$). This measure of effect is applicable in all contexts in which $\delta_p$ is applicable (see above for some examples).

Since the population trimmed means difference is standardised by the common winsorised population standard deviation an equality of population winsorised variances is assumed, i.e., that $\sigma^2_{w,\,a} = \sigma^2_{w,\,b} = \sigma^2_{w}$. This assumption is like the homoscedasticity assumption of $d_p$, however instead of population variances/standard deviations it applies to population winsorised variances/standard deviations.

The value of $c$ is the winsorised standard deviation of the standard normal distribution with $\gamma$ trimming. As noted, if $\gamma = 0.2$ then $c = 0.642$. This means that the ratio of winsorised standard deviation to the "regular" standard deviation is $0.642 : 1$ if the population follows a normal distribution. Thus, if the distributions of popualtions a and b follow a normal distribution with equal variances/standard deviations, then $\frac{\sigma\_{w}}{c} = \sigma$ and consequently $\delta_{Rp} = \delta_p$ (Wilcox, 2017b, p.294).

The sample estimate of the population effect is given by (Algina et al., 2005):

$$d_{Rp} = c\frac{\bar{X}_{t,\,a} - \bar{X}_{t,\,b}}{s_{wp}} \qquad Eq.(DG)$$

with $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ being the trimmed means of the dependent samples and $s_{wp}$ being the pooled winsorised standard deviation:

$$s_{wp} = \sqrt{\frac{(n_a - 1)s^2_{w,\,a} + (n_b - 1)s^2_{w,\,b}}{n_a + n_b - 2}} \qquad Eq.(DG)$$

$c$ is a constant with a value dependeing on $\gamma$. Should the populations a and b follow a normal distribution with equal population variances, then $\frac{s_{wp}}{c}$ estimates $\sigma$ and $\bar{X}_{t,\,a}$ and $\bar{X}_{t,\,b}$ estiamte $\mu_a$ and $\mu_b$ respectively. Consequently $d_{Rp}$ would estimate $\delta_p$. This way the robust statistic $d_{Rp}$ estimates the same population effect as its non robust counterpart $d_p$ under normality.

An approximate noncentral t based CI based on Algina et al. (2005) is implemented:

Firstly, $d_{Rp}$ is transformed into an estimated noncentrality parameter $\widehat{\lambda_R}$:

$$\widehat{\lambda_R} = \frac{d_{Rp}}{c} \sqrt{\frac{h(h - 1)s^2_{wp}}{2 (n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}} \qquad Eq.(DG )$$

with $X_{w,\,a}$ and $X_{w,\,b}$ being the winsorised sample data of the two dependent samples and $h$ being the number of observations left after trimming $h = n - 2(\gamma n)$

Then the non-centrality parameter $\lambda_{RL}$ of the noncentral t distribution (with $\nu = h - 1$ degrees of freedom) which has $\widehat{\lambda_R}$ as its $1 - \frac{\alpha}{2}$ quantile is iteratively searched for.

Next, the non-centrality parameter $\lambda_{RU}$ of the noncentral t distribution (with $\nu = h - 1$ degrees of freedom) which has $\widehat{\lambda_d}$ as its $\frac{\alpha}{2}$ quantile is iteratively searched for.

The identified upper and lower confidence limits of $\lambda$ are then transformed back into $d_{Rp}$:

$$LL = \lambda_{RL} * c * \sqrt{\frac{2 (n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)s^2_{wp}}} \qquad Eq.(DG )$$

$$UL = \lambda_{RU} * c * \sqrt{\frac{2 (n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}{h(h - 1)s^2_{wp}}} \qquad Eq.(DG)$$

This CI formula is approximate because the distribution of $\frac{d_{Rp}}{c} \sqrt{\frac{h(h - 1)s^2_{wp}}{2 (n - 1) (s^2_{w,\,a} + s^2_{w,\,b} - 2Cov(X_{w,\,a}, X_{w,\,b})}}$ only approximately follows the t distribution. However, while this CI formula is based on the assumption that both populations have identical winsorised variances, it is not based on the assumption of normality of populations. Algina et al. (2005) examined the non-rejection rate of this CI procedure for various combinations of population effect size, population correlation, and sample size and found that the method yielded non-rejection rates that were close to the nominal $1 - \alpha$ rate for normal and a wide range of nonnormal data (the authors criterion interval for appropriate non-rejetcion rates was $[0.925,0.975]$). The authors noted that the CI procedure had a slight tendency to be somewhat conservative with an increasing size of $\delta_{Rp}$ when samples were drawn from a bivariate normal distribution. Additionally, Algina et al. (2005) reported that when data were sampled from a distribution alike the exponential distribution ($\gamma_1 = 2, \space \gamma_2 = 6$), the non-rejection rate became too liberal (i.e., less than their lower bound of appropriate non-rejection rates: $0.925$) when the correlation of the dependent samples was $0.6$ or larger and for various values of $\delta_{Rp}$.

An $1 - \alpha$ percentile bootstrap CI is computed. The simulations conducted by Algina et al. (2005) resulted in appropriate non-rejection rate (again, within the range of $[0.925,0.975]$) for the vast majority of population distributions, popluation effect sizes, sample sizes and correlations studied. However, the bootstrap method yielded conservative non-rejection rates (i.e., higher than their upper bound of appropriate non-rejection rates: $0.975$) when sample sizes were low ($n = 20$), the population effect size was large ($\delta_{R} = 1.6$), correlations were $r \le 0.4$, and the data were obtained from a long-tailed skewed distribution. Overall, Algina et al. (2005) recommend the percentile bootstrap CI method for $d_{Rp}$.


# Hypothesis tests

## The dependent Student's t-test

The dependent Student's t-test (e.g., Wilcox, 2017b, p. 354) as implemented here tests the following null hypothesis:

$$H_0: \mu_a = \mu_b \qquad Eq.(DGH 1.1) $$

which is equivalent to

$$H_0: \mu_D = 0 \qquad Eq.(DGH 1.2)$$

since $\mu_D = \mu_b - \mu_a$. The null hypothesis states that the the population means of two dependent groups are equal or, put differently, that the population mean of difference scores $D = X_{b} - X_{a}$ is equal to 0. Since the difference scores $D$ can be viewed as a single population, the dependent Student's t-test is equivalent to a one-sample Student's t-test. The test statistics computed is:

$$t = \frac{\bar{d} - 0}{\frac{s_d}{\sqrt{n}}} \qquad Eq.(DGH 1.3)$$

The degrees of freedom associated with the dependent Student's t-test are given by:

$$df = n - 1 \qquad Eq.(DGH 1.4)$$

with n being the number of sampled dependent observations.

The p value is determined by computing:

$$p = F_t(-|t| + (1 - F_t(|t|)) \qquad Eq.(DGH 1.5)$$

i.e., the p value reported by the app is the sum of cumulative distribution function evaluated at t plus 1 minus the cumulative distribution function evaluated at t. This gives the probability that *t* will take a value equally as extreme or even more extreme than the *t* computed based on the collected data under the assumption of the null hypothesis.

The value of the test statistics, the degrees of freedom and the p-value are reported.



## The Tukey-McLaughlin t-test

The Tukey-McLaughlin test (1963) in general tests the following null hypothesis:

$$H_0: \mu_t = \mu_0 \qquad Eq.(DGH 2.1)$$

i.e., that the population trimmed mean $\mu_t$ equal the null hypothesis value of the population trimmed mean (e.g., 0).

This procedure is implemented based on the recommendation of Wilcox (2017a, pp. 115, 212) to test the null hypothesis:

$$H_0: \mu_{tD} = 0 \qquad Eq.(DGH 2.2)$$

i.e., that the population trimmed mean of difference scores is equal to 0. Thus, the $\mu_t$ of interest is $\mu_{tD}$ and $\mu_0$ is simply set to 0 per default.

A key difference between means and trimmed means is that while $\mu_D = \mu_b - \mu_a$, (if $D = X_b - X_a$), $\mu_{tD} \neq \mu_{t,\,b} - mu_{t,\,a}$ under general conditions (Wilcox, 2017a, p. 212). Thus, the dependent Student's t-test is suited both for assessing whether the population mean of difference scores is equal to 0, as well as for assessing whether the population means of two dependent groups are identical (Wilcox, 2017b, p. 354). Conversely, the Tukey-McLaughlin test implemented is only suited for assessing whether the population trimmed mean of difference scores is equal to 0 and not suited to assess whether the population trimmed means of two dependent groups are qual (Wilcox, 2017b, p. 358). The latter null hypothesis is given by $Eq.(DGH 3)$ and can be tested with the dependent samples Yuen's t-test as given below.

$Eq.(DgH 2.2)$ can be of interest, for example, if a study intends to assess the changes within participants, e.g., the changes in a depression score after a novel treatment (Wilcox, 2017b, p. 358). Testing $Eq.(DGH 2.2)$ is appropriate, since it allows to appraise whether the average change within individuals is significantly different from 0.

The test statistic of the Tukey-McLauglin test is implemented as:

$$T_t = \frac{(1 - 2\gamma)\sqrt{n}(\bar{d_t})}{s_{wd}} \qquad Eq.(DGH 2.3)$$

with $\gamma$ being the trimming factor (set to 0.20 by default) and $s_{wd}$ being the winsorised standard deviation of the difference scores. According to Tukey and McLaughlin (1963), the distribution of the test statistics approximately follows a Student's t-distribution with degrees of freedom:

$$df = (n - 2(\gamma n)) - 1 \qquad Eq.(DGH 2.4)$$

where $n - 2(\gamma n)$ is the number of observations left after trimming.

The p value is thus determined by computing:

$$p = F_t(-|T_t| + (1 - F_t(|T_t|)) \qquad Eq.(DGH 1.5)$$

The value of the test statistics, the degrees of freedom and the p-value are reported.



## The dependent Yuen's t-test

The dependent Yuen's t-test as described by Wilcox (2017b) tests the following null hypothesis:

$$H_0: \mu_{t,\,a} = \mu_{t,\,b} \qquad Eq.(DGH 3)$$

i.e., that the population trimmed means of two dependent groups are equal. As stated above, this null hypothesis is not equivalent to the one given by $Eq.(DGH 2)$, since in the case of comparing population trimmed means $\mu_{tD} = \mu_{t,\,b} - \mu_{t,\,a}$ does not generally hold and thus $\mu_{tD} \neq \mu_{t,\,b} - \mu_{t,\,a}$ is more likely (Wilcox, 2017a, p. 212). Whether one chooses to test $Eq.(DGH 2)$ or $Eq.(DGH 3)$ depends on the research question at hand. For example, in a repeated measures design assessing the efficacy of a certain treatment, once could test $Eq.(DGH 3)$ if the research is intended to find differences between the untreated and the treated population (Wilcox, 2017b, p. 358)

The test statistic of the dependent Yuen's t-test is implemented based on Wilcox (2017a, pp.213-215):

$$T_y = \frac{\bar{X}_{t,\,b} - \bar{X}_{t,\,a}}{\sqrt{d_a + d_b - 2d_{ab}}} \qquad Eq.(DGH3.2)$$

where $d_j$ is computed as:

$$d_j = \frac{1}{h(h - 1)}\sum_{i=1}^n{(Y_{ij} - \bar{Y_j})^2}\qquad Eq.(DGH3.3)$$

with $h = n - 2(\gamma n)$ being the number of observation after trimming ($\gamma$ is the trimming factor) and with $Y_ij$ being the $\gamma$-percent winsorized scores of the first measurement $j = 1$ and the second measurement $j = 2$.

$d_{ab}$ is given by:

$$d_{ab} = \frac{1}{h(h - 1)}\sum_{i = 1}^n{(Y_{ia} - \bar{Y_a})(Y_{ib} - \bar{Y_b})} \qquad Eq.(DGH3.4)$$

$\sqrt{d_a + d_b - 2d_{ab}}$ estimates the standard error of $\bar{X}_{t,\,b} - \bar{X}_{t,\,a} \qquad Eq.(DGH3.5)$ given by:

$$\sqrt{\frac{1}{(1 - 2\gamma)^2n}(\sigma_{w,\,a}^2 + \sigma_{w,\,b}^2 - 2Cov(Y_a,Y_b))} \qquad Eq.(DGH3.6)$$

The df are identical to the Tukey-McLaughlin test $df = (n - 2(\gamma n)) - 1$ and the test statistics distribution can be approximated by a t-distribution with given degrees of freedom. Consequently, the p value is determined by computing:

$$p = F_t(-|T_y| + (1 - F_t(|T_y|)) \qquad Eq.(DGH 1.5) \qquad Eq.(DGH3.7)$$

Wilcox (2017b, p. 357) lists among the potential benefits of hypothesis tests based on trimmed means relatively high power over various conditions and an improved control of Type I error probabilities when compared to the dependent Student's t-test. Additionally, when the compared populations are indeed normal a test based on trimmed means performs similarly well as the dependent Student's t-test. However, in some cases the mean certainly makes for a better measure of the location of typical observed values.

The value of the test statistics, the degrees of freedom and the p-value are reported.



# References

Algina, J., Keselman, H. J., & Penfield, R. D. (2005). Effect sizes and their intervals: The two-level repeated measures case. *Educational and Psychological Measurement*, *65*(2), 241--258. <https://doi.org/10.1177/0013164404268675>  

Becker, B. J. (1988). Synthesizing standardised mean-change measures. *British Journal of Mathematical and Statistical Psychology*, *41*(2), 257--278. <https://doi.org/10.1111/j.2044-8317.1988.tb00901.x>  

Bonett, D. G. (2006a). Confidence interval for a ratio of variances in bivariate nonnormal distributions. *Journal of Statistical Computation and Simulation*, *76*(7), 637---644. <https:://doi.org/10.1080/10629360500107733>  

Bonett, D. G., & Price, R. M. (2006b). Confidence intervals for a ratio of binomial proportions based on paired data. *Statistics in Medicine*, *25*(17), 3039--3047. <https://doi.org/10.1002/sim.2440>

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. *Psychological Methods*, *13*(2), 99--109.   <https://doi.org/10.1037/1082-989X.13.2.99>

Bonett, D. G. (2015). Interval estimation of standardized mean differences in paired-samples designs. *Journal of Educational and Behavioral Statistics*, *40*(4), 366--376. <https://doi.org/10.3102/1076998615583904>  

Borenstein, M., Hedges, L. V., Higgins, J. P. T., & Rothstein, H. R. (2009). *Introduction to meta-analysis*. John Wiley.   <https://doi.org/10.1002/9780470743386>

Bradley, E. L. (2006) Overlapping coefficient. In S. Kotz, C. B. Read, N. Balakrishnan, B. Vidakovic, & N. L. Johnson (Eds.), *Encyclopedia of statistical sciences* (1900). New York: Wiley. <https://doi.org/10.1002/0471667196.ess1900.pub2>

Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2nd ed.). Routledge. <https://doi.org/10.4324/9780203771587>  

Cousineau, D., & Goulett-Pelletier, J.-C. (2021). A study of confidence intervals for Cohen's $d_p$ in within-subject designs with new proposals. *The Quantitative Methods for Psychology*, *17*(1), 51--75. <https://doi.org/10.20982/tqmp.17.1.p051>  

Fagerland, M. W., Lydersen, S., & Laake, P. (2014). Recommended tests and confidence intervals for paired binomial proportions. *Statistics in Medicine*, *33*(16), 2850--2875. <https://doi.org/10.1002/sim.6148>  

Field, A., Miles, J., & Zoe, F. (2012). *Discovering statistics using R*. Sage. Gibbons, R. D., Hedeker, D. R., & Davis, J. M. (1993). Estimation of effect size from a series of experiments involving paired comparisons. *Journal of Educational Statistics*, *18*(3), 271--279.   <https://doi.org/10.3102%2F10769986018003271>


Grissom, R. J., & Kim, J. J. (2001). Review of assumptions and problemns in the appropriate conceptualization of effect size. *Psychological Methods*, *6*(2), 135--146. <https://doi.org/10.1037//1082-989X.6.2.135>

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Mastrich, Z., & Hernandez, I. (2021). Results everyone can understand: A review of common language effect size indicators to bridge the research-practice gap. *Health Psychology*, *40*(10), 727.

McGraw, K. O., & Wong, S. P. (1992). A common language effect size statistic. *Psychological bulletin*, *111*(2), 361.

Nam, J., & Blackwelder, W. C. (2002). Analysis of the ratio of marginal probabilities in a matched-pair setting. *Statistics in Medicine*, *21*(5), 689--699. <https://doi.org/10.1002/sim.1017>  

Peng, C.-Y. J., & Chen, L.-T. (2014). Beyond Cohen's d: Alternative effect size measures for between-subject designs. *The Journal of Experimental Education*, *82*(1), 22--50. <https://doi.org/10.1080/00220973.2012.745471>  

Tukey, J. W., & McLaughlin, D. H. (1963). Less vulnerable confidence and significance procedures for location based on a single sample: Trimming/winsorization 1. *Sankhyā: The Indian Journal of Statistics, Series A (1961-2002)*, *25*(3), 331--352. <http://www.jstor.org/stable/25049278>  

Voracek, M., Mohr, E., & Hagmann, M. (2013). On the importance of tail ratios for psychological science. *Psychological Reports*, *112*(3), 872--886. <https://doi.org/10.2466/03.PR0.112.3.872-886>  

Wilcox, R. R. (2017a). *Introduction to robust estimation and hypothesis testing* (4th ed.). Academic Press.  

Wilcox, R. R. (2017b). *Understanding and applying basic statistical methods using R*. John Wiley & Sons  
