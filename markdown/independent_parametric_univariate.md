# Assuming Normality but not Homoscedasticity

## Glass' $d_G$  

The population effect size of interest is given by the formula:

$$\Delta = \frac{\mu_a - \mu_b}{\sigma_b} \quad \quad Eq.(1)$$

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by the population standard deviation of population b $\sigma_b$.  

The populations of interest might be an experimental group (e.g., a group that receives some form of psychotherapy) and a control group (e.g., a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could be thought of as $\mu_E$, i.e., as the population mean of the experimental group, and $\mu_a$ could be thought of as $mu_C$, i.e., the population mean of the control group. $\Delta$ tells us how many (population b) standard deviation units $\mu_b$ (e.g.,$\mu_E$) lies below or above $\mu_a$ (e.g.,$\mu_C$). As noted by Glass (1976) $\Delta$ is rather similar to a *Z* score. Consequently, if population b follows a normal distribution, $\Delta$ can be used to determine what proportion of population b the average member of population a outscores. Like with a *Z* score, this information can be derived from the cumulative distribution function of the standard normal distribution - See: ----what effect size was that again? ----  

The sample estimate of this population effect is given by the formula (e.g.,Glass (1976)):

$$d_g = \frac{\bar{X}_a - \bar{X}_b}{s_b} \quad \quad Eq.(1.1)$$

With $\bar{X}_a$ being the sample mean of group a, $\bar{X}_b$ being the sample mean of group b, and $s_b$ being the bias corrected sample standard deviation of group b. This estimator has a bias. It systematically overestimates the size of the true population standardized mean difference. This bias can be corrected - see Hedges' $g_G$.  

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

$$g_G = \frac{\bar{X}_a - \bar{X}_b}{s_b} * J(\nu) \quad \quad Eq.(2.1)$$

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

The mean difference of two populations of interest $\mu_a - \mu_b$ is standardised by their common population standard deviation $\sigma$. The populations of interest might again be an experimental group (e.g., a group that receives some form of psychotherapy) and a control group (e.g., a group that does not receive any form of psychotherapy). In such a case $\mu_a$ could again be thought of as $\mu_E$, i.e., as the population mean of the experimental group, and $\mu_a$ could be thought of as $mu_C$, i.e., the population mean of the control group. 

$\delta$ tells us how many standard deviation units $\mu_b$ (e.g.,$\mu_E$) lies below or above $\mu_a$ (e.g.,$\mu_C$). Once again, $\delta$ can also be thought of as a *Z* score and can be used to determine what proportion of population a the average member of population b outscores and vice versa.- See:  

With this population effect homoscedasticity is assumed, i.e., $\sigma^2_a = \sigma^2_b = \sigma^2$. Under this assumption $Eq.(1)$ and $Eq.(3)$ are identical. However, heteroscedasticity is likely throughout various fields of research and it appears plausible that treatments increases variance in the outcome of interest due to differential responsiveness of treatment subjects to the treatment (Grisson & KIm, 2012, pp. 17-20). Unfortunately, traditional tests of homoscedasticity often fail to produce accurate *p* values, which makes it difficult to detect heteroscedasticity of population variances (Grissom & Kim, 2012, p. 20). If heteroscedasticity is plausible $Eq.(DG)$ should be estimated - as long as population b follows a normal distribution.  

The population effect size of interest can be estimated by $d_G$ given in $Eq.(1)$ if homoscedasticity can be assumed. However, in case of homoscedasticity using the pooled standard deviation $s_p = \sqrt{\frac{(n_a - 1) * s_a^2 + (n_b - 1) * s_b^2}{n_a + n_b - 2}}$ is a better estimate of $\sigma$, since it is based on more data, is less biased and less variable than $s_b$. 

Thus, the most widely used sample estimate for $Eq.(3)$ is given by the formula (e.g.,Hedges (1981)):

$$d_p = \frac{\bar{X}_a - \bar{X}_b}{s_p} \quad \quad Eq(3.1)$$ 

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

If $n_a = n_b$, then $s_p$ will be equal to $s'$ and thus $d_p$ will be equal to $d'$. This estimator has a bias. It systematically overestimates the size of the true population standardized mean difference. This bias can be corrected - see Hedges' $g_{d'}$.  

An approximate large-sample CI is implemented according to Bonett (2008):

$$CI = d' \pm z_{\frac{\alpha}{2}}*\sqrt{VAR(d')}$$

with

$$VAR(d') = \frac{d'^2(\frac{s^4_a}{n_a - 1} + \frac{s^4_b}{n_b - 1})}{8s'^4} + \frac{s_a^2}{(n_a-1)s'^2} + \frac{s_b^2}{(n_b-1)s'^2}$$

Bonett (2008) reprted that this CI method produced coverage probabilities that were consistent and close to the nominal $1 - \alpha$ level under homoscedasticity as well as under mild heteroscedasticity combined with unequal sample sizes. Under the latter condition Bonett (2008) found that approximate large-sample CIs for Cohen's $d_p$ failed to maintain consistent coverage probabilities close to the nominal level.

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.




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
The tail ratio can be though of as a risk ratio by considering scores below/above a cutoff value as "successes"/"hits" and scores above/below a cutoff as "failures"/"misses". The number of "hits" in group a is binomially distributed with parameters $n_a$ and $p_a$, where $p_a$ is the proportion of scores in population a below/above a cutoff. Conversely, the number of "hits" in group b is also binomially distributed with parameters $n_b$ and $p_b$, where $p_b$ is the proportion of scores in population b below/above a cutoff. The population tail ratio for a given cutoff value and region of interest is thus the ratio:  

$$\frac{p_{a|b}}{p_{b|a}}$$

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


For the "non-parametric mode" of the application the cell frequencies are determined more straightforwardly as the number of observed scores below/above a cutoff *t*. No assumption is made regarding the underlying distribution of the scores.  
When "hits" are defined as scores below *t*:  

- $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \leq t\}}(x_{a_i})$  
- $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{2.}}I_{\{x \leq t\}}(x_{b_i})$  

with 

$$ I_{\{x \leq t\}}(x) = \begin{cases}
    1 & \text{if} \qquad x \leq t \\
    0 & \text{if} \qquad x \gt t 
   \end{cases}
$$

and when "hits" are defined as scores above *t*:  

- $n_{11}$ is computed as: $n_{11} = \sum_{i=1}^{n_{1.}}I_{\{x \geq t\}}(x_{a_i})$  
- $n_{21}$ is computed as: $n_{21} = \sum_{i=1}^{n_{2.}}I_{\{x \geq t\}}(x_{b_i})$  

with 

$$ I_{\{x \geq t\}}(x) = \begin{cases}
    1 & \text{if} \qquad x \geq t \\
    0 & \text{if} \qquad x \lt t 
   \end{cases}
$$

When "hits" are defined as scores below *t* 

and when "hits" are defined as scores above *t* 

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

This confidence interval is exact only when the data stem from normal populations. However, this method is highly sensitive to even slight deviations from normality and cannot be recommended for non-normal populations (Banga & Fox, 2013; Bonett, 2006).  

Bonett (2006) modified a confidence interval procedure by Shoemaker (2003) which is based on the Layard test for homogeneity of variances (Layard, 1973) and analysed its performance for both normal and non-normal populations. The Bonett confidence interval procedure performed well when samples were drawn from normal (average coverage rates ranging from 0.951 to 0.958 for an $\alpha$-level of 0.95) as well as from moderately non-normal distributions (average coverage rates ranging from 0.925 to 0.969 for an $\alpha$-level of 0.95) (Bonett, 2006).  

Banga and Fox (2013) further improved upon the Bonett procedure and compared the performance of their confidence interval to other robust confidence intervals. The Banga-Fox-Bonett confidence interval procedure yielded the most stable coverage probabilities when sampling data from a wide variety of distributions.  

The Banga-Fox-Bonett confidence interval relies on iterative search and thus might result in an error under some conditions. Consequently, the following approach has been employed for the implementation of a "non-parametric" confidence interval for the variance ratio:  

- the Banga-Fox-Bonett confidence interval is reported if the iterative search of the confidence limits does not result in an error. The interval is computed as described by Banga and Fox (2013).  
- in case the iterative search does result in an error the user of the app receives a corresponding notification in the user interface and the Bonett confidence interval is reported. The Bonett confidence interval is computed as described by Bonett (2006).  

If the sample of either group a or that of group b consists of less than 4 observations, NAs are returned as confidence limits due to the nature of the formula for the implemented confidence intervals. Neither the computation of the Banga-Fox-Bonett nor of the Bonett confidence interval is described in detail here as they both are rather elaborate - the reader is advised to study the cited literature for further details.  

Additionally, an $1 - \alpha$ percentile bootstrap CI is computed.  



## Measures of Nonoverlap  


If the populations being compared are normal and with equal variability it is possible to define measures of nonoverlap which are related with cohen's d and with themselves through the cumulative normal distribution. (Cohen, 1988). 


### Cohen's U1  


$U_1$ can be interpreted as percentage of nonoverlap and is characterized by the following formula (Cohen, 1988):
$$U_1 = \frac{2\Phi_{d_p/2}-1}{\Phi_{d_p/2}} = \frac{2U_2-1}{U_2}$$
with $d_p$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
The confidence interval is calculated by transforming the lower and upper confidence limits of Cohens'd ($d_p$) with the cumulative normal distribution:
$$LL = \frac{2\Phi_{d_{p_{upper}}/2}-1}{\Phi_{d_{p_{upper/2}}}}$$
$$UL = \frac{2\Phi_{d_{p_{lower}}/2}-1}{\Phi_{d_{p_{lower/2}}}}$$  



### Cohen's U2  

When examing two populations, Cohen's measure of nonoverlap$ U_2$ is the percentage of one population that exceeds the same percentage in the other population. It is described by the following formular (Cohen, 1988): 
$$U2 = \Phi_{d_p/2}$$
with $d_p$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.
The confidence interval is calculated by transforming the lower and upper confidence limits of Cohens'd ($d_p$)  with the cumulative normal distribution:
$$LL =  \Phi_{d_{p_{lower}/2}}$$
$$UL =  \Phi_{d_{p_{upper}/2}}$$  



### Cohen's U3  
 
When examining two populations, Cohen's measure of nonoverlap $U_3$ is the percentage of one population which the upper half of the cases of the other population exceeds (Cohen, 1988). However, the interpretation of $U_3$ changes slightly when one is dealing with a multivariate distribution (Del Giudice, 2019). Cohen's $U_3$ is decribed by the following formular:
$$U_3 = \Phi_{d_p}$$
with $d_p$ being a deviate in the unit normal curve and  $\Phi$ being the percentage of the population of cases falling below a given normal deviate.

The confidence interval is calculated by transforming the lower and upper confidence limits of Cohens'd ($d_p$)  with the cumulative normal distribution:
$$LL = \Phi_{d_{p_{lower}}}$$
$$UL = \Phi_{d_{p_{upper}}}$$








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

Grissom, R. J., & Kim, J. J. (2012). *Effect sizes for research: Univariate and multivariate applications* (2nd ed.). Taylor and Francis Group.  

Hedges, L. V. (1981). Distribution theory of glass’s Estimator of effect size and related estimators. *Journal of Educational and Behavioral Statistics*, *6*(2), 107--128. <https://doi.org/10.3102%2F10769986006002107>  

Koopman, P. A. R. (1984). Confidence intervals for the ratio of two binomial proportions. *Biometrics*, *40*(2), 513--517. <https://doi.org/10.2307/2531405>  

Layard, M. W. J. (1973). Robust large-sample tests for homogeneity of variances. *Journal of the American Statistical Association*, *68*(341), 195-198. <https://doi.org/10.1080/01621459.1973.10481363>  

Nam, J. (1995). Confidence limits for the ratio of two binomial proportions based on likelihood scores: Non-iterative method. *Biometrical Journal*, *37*(3), 375--379. <https://doi.org/10.1002/bimj.4710370311>  

Shoemaker, L. H. (2003). Fixing the F test for equal Variances. *The American Statistician*, *57*(2), 105–114. <https://doi.org/10.1198/0003130031441>  

Voracek, M., Mohr, E., & Hagmann, M. (2013). On the importance of tail ratios for psychological science. *Psychological Reports*, *112*(3), 872--886. <https://doi.org/10.2466/03.PR0.112.3.872-886>  
