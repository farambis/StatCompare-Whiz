# Hypothesis tests  


## The Wilcoxon signed-rank test  

The nonparametric Wilcoxon signed-rank test tests the following null hypothesis (Hollander et al., 2014, p. 40)  

$$H_0: \theta = 0 \quad \quad Eq.(DGH4.1)$$

namely that the distribution of each sampled difference score $D_i = X_{bi} - X_{ai}$ is symmetric around zero . The major underlying assumption is that the distribution of every $D_i$ is symmetric around its median (Conover, 1999, p. 357).  

The *n'* observed difference scores $d_i = x_{bi} - x_{ai}$ are computed and any $d_i = 0$ are discarded leading to the final sample size of *n* $d_i$. The absolute values of the *n* $d_i$ are ranked resulting in *n* rank scores $r_i$. All $r_i$ belonging to positive $d_i$ are summed up. Let $\psi_i$ denote an indicator variable that takes on the value 0 for every $d_i < 0$ and the value 1 for every $d_i > 0$, then the test statistic will be computed as:

$$T^+ = \sum_{i = 1}^n{r_i*\psi_i} \quad \quad Eq.(DGH4.2)$$

The p value is computed based on this test statistic as follows:

$$p =2 * \begin{cases}
  F_{T^+}(T^+), \quad \quad \quad \quad \quad \space \space if \quad T^+ < \frac{n(n+1)}{2}\\
  1 - F_{T^+}(T^+ - 1), \quad \quad if \quad T^+ > \frac{n(n+1)}{2}
\end{cases} \quad \quad Eq.(DGH4.3)$$

with $F_{T^+}$ being the cumulative distribution function of the Wilcoxon signed-rank statistic under the null hypothesis.  

If the sample size *n* exceeds 50 observations, or if any two difference scores are identical $d_i = d_j, \ for \ i \neq j$ so that these difference scores have to be assigned the same averaged rank $r = \frac{\sum_{j = 1}^k{d_j}}{k}$, and/or if any $d_i = 0$ a p value is determined based on the large samples approximation of the distribution of $T^+$. The distribution of $T^+$ is asymptotically normal with

$$E[T^+] = \frac{n*(n + 1)}{4} \quad \quad Eq.(DGH4.4)$$

and

$$Var[T^+] = \frac{n(n+1)(2n+1) - \frac{1}{2}\sum_{j = 1}^g{(t_j^3 - t_j})}{24} \quad \quad Eq.(DGH4.5)$$

under the null hypothesis. *g* denotes the number of tied groups and $t_j$ the size of the the tied group - untied values of $|d_i|$ are considered a tied group of size 1. A continuity corrected z-score is computed:

$$z = \frac{T^+ - E[T^+] - c}{\sqrt{Var[T^+]}} \quad \quad Eq.(DGH4.6)$$

with $c = sign(T^+ - E[T^+]) * 0.5$

A p-value can be obtained with the cumulative distribution function of the standard normal distribution. The p-value is simply twice the smaller of the two one tailed p-values:

$$p = 2 * min\{\Phi(z), 1 - \Phi(z)\} \quad \quad Eq.(DGH4.7)$$

Large values of $T^+$ imply that a large proportion of the difference scores are positive and of larger absolute value, i.e., that the second measurement tends to yield larger values than the first measurement. Small values of $T^+$ imply that a large proportion of the difference scores are negative and of larger absolute value, i.e., that the second measurement tends to yield smaller values than the first measurement. For more details on the computation and interpretation of Wilcoxon signed-rank statistics see (Conover, 1999; Hollander et al., 2014).  


# References

Conover, W. J. (1999). *Practival nonparametric statistics* (3rd ed.). John Wiley & Sons. Cousineau, D. (2020). Approximating the distribution of Cohen's $d_p$ in within--subject designs. *The Quantitative Methods for Psychology*, *16*(4), 418--421. <https://doi.org/10.20982/tqmp.16.4.p418>  

Hollander, M., Wolfe, D. A., & Chicken E. (2014). *Nonparametric statistical methods* (3rd ed.). John Wiley & Sons Steiger, J.H, & Fouladi, R.T. (1997). Noncentrality interval estimation and the evaluation of statistical methods. In L.L. Harlow, S.A, Mulaik, & J.H. Steiger (Eds.), *What if There Were no Significance Tests?* (pp. 221--257). Mahwah: Lawrence Erlbaum Associates.  
