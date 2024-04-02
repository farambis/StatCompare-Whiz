# Set up data for testing
# Test functions from function_ready.R
source("function_ready.R")
# TO DO: specify package versions used for this test file!

# set parameters for simulated dataset:
## pretest measures across groups a and b
mu_pre <- 20
sigma_pre <- 5

### pretest measures of group a
n_a_pre <- 30
mu_a_pre <- mu_pre * 1.01
sigma_a_pre <- sigma_pre * 1.01

### pretest measures of group b
n_b_pre <- 20
mu_b_pre <- mu_pre * (2 - mu_a_pre/mu_pre)
sigma_b_pre <- sigma_pre * (2 - sigma_a_pre/sigma_pre)

## posttest measures across groups a and b
mu_post <- mu_pre + (sigma_pre * 0.45)
sigma_post <- sigma_pre * 1.2

### posttest measures of group a
n_a_post <- 30
mu_a_post <- mu_pre + (sigma_pre * 0.8)
sigma_a_post <- sigma_post * 1.15

### posttest measures of group b
n_b_post <- 20
mu_b_post <- mu_post * (2 - mu_a_post/mu_post)
sigma_b_post <- sigma_post * (2 - sigma_a_post/sigma_post)

## correlation between pre and posttest measures
cor_pre_post <- 0.8

#Simulate data set to work with
RNGversion("4.1.0")
set.seed(123)
mat_a <- MASS::mvrnorm(n = n_a_pre + n_a_post,
                      mu = c(mu_a_pre, mu_a_post),
                      Sigma = matrix(c(sigma_a_pre^2, sigma_a_pre * sigma_a_post * cor_pre_post,
                                       sigma_a_pre * sigma_a_post * cor_pre_post, sigma_a_post^2),
                                     ncol = 2, byrow = TRUE)
                      )

RNGversion("4.1.0")
set.seed(123)
mat_b <- MASS::mvrnorm(n = n_b_pre + n_b_post,
                       mu = c(mu_b_pre, mu_b_post),
                       Sigma = matrix(c(sigma_b_pre^2, sigma_b_pre * sigma_b_post * cor_pre_post,
                                        sigma_b_pre * sigma_b_post * cor_pre_post, sigma_b_post^2),
                                      ncol = 2, byrow = TRUE)
                       )

d <- data.frame(rbind(mat_a, mat_b), rep(c("a", "b"), times = c(n_a_pre + n_a_post, n_b_pre + n_b_post)))
names(d) <- c("x", "y", "INDEX")

# get relevant parameters from the simulated dataset
m_a_pre <- mean(d$x[d$INDEX == "a"])
s_a_pre <- sd(d$x[d$INDEX == "a"])

m_a_post <- mean(d$y[d$INDEX == "a"])
s_a_post <- sd(d$y[d$INDEX == "a"])

n_a <- n_a_pre + n_a_post

m_b_pre <- mean(d$x[d$INDEX == "b"])
s_b_pre <- sd(d$x[d$INDEX == "b"])

m_b_post <- mean(d$y[d$INDEX == "b"])
s_b_post <- sd(d$y[d$INDEX == "b"])

n_b <- n_b_pre + n_b_post

r <- cor(d$x, d$y)
r_a <- cor(d$x[d$INDEX == "a"], d$y[d$INDEX == "a"])
r_b <- cor(d$x[d$INDEX == "b"], d$y[d$INDEX == "b"])
sdiff_a <- sd(d$y[d$INDEX == "a"] - d$x[d$INDEX == "a"])
sdiff_b <- sd(d$y[d$INDEX == "b"] - d$x[d$INDEX == "b"])
n <- n_pre


# set various parameters necessary for some of the tested functions
alpha <- 0.05
trim <- 0.2
cutoff <- 15
tail <- "lower"
reference_group <- "group2"

# Cohen's d ----
fun_val <- cohens_d(x = d$y, INDEX = d$INDEX)
test_fun_val <- psych::cohen.d(y ~ INDEX, data = d)[["hedges.g"]][, "effect"]
all.equal(fun_val, test_fun_val)

# Cohen's d CI ----
fun_val <- unname(unlist(cohens_d_ci(x = d$y, INDEX = d$INDEX)))
test_fun_val <- unname(psych::cohen.d.ci(d = psych::cohen.d(y ~ INDEX, data = d)[["hedges.g"]][, "effect"],
                                  n1 = n_a, n2 = n_b)[, c("lower", "upper")])
all.equal(fun_val, test_fun_val)

fun_val <- cohens_d(x = d$x, y = d$y)

# Cohen's d for repeated measures ----
fun_val <- cohens_drm(x = d$x, y = d$y)
test_fun_val <- effsize::cohen.d(d = d$y, f = d$x, paired = TRUE, within = TRUE)[["estimate"]]
all.equal(fun_val, test_fun_val)

# Cohen's d for repeated measures CI ----
fun_val <- cohens_drm_ci(x = d$x, y = d$y)
test_fun_val <- effsize::cohen.d(d = d$y, f = d$x, paired = TRUE, within = TRUE)[["conf.int"]]
all.equal(fun_val, test_fun_val)

# Cohen's d for 
fun_val <- cohens_dz(x = d$x, y = d$y)
test_fun_val <- effsize::cohen.d(d = d$y, f = d$x, paired = TRUE, within = FALSE)[["estimate"]]
all.equal(fun_val, test_fun_val)

# Hedges g ----
fun_val <- hedges_g(x = d$y, INDEX = d$INDEX)
test_fun_val <- effsize::cohen.d(d = d$y, f = factor(d$INDEX, levels = c("b", "a")), hedges.correction = TRUE)[["estimate"]]
# values might differ slightly since hedges_g computes the bias correction using
# the gamma distribution while effsize::cohen.d computes the bias correction using
# an approximation
all.equal(fun_val, test_fun_val)

# Hedges g CI ----
fun_val <- unname(unlist(hedges_g_ci(x = d$y, INDEX = d$INDEX)))
test_fun_val <- unname(unlist(MBESS::ci.smd(smd = hedges_g(x = d$y, INDEX = d$INDEX),
                                         n.1 = n_a, n.2 = n_b))[-2])
# hedges_g_ci uses a somewhat different (noncentrality parameter based) approach to construct
# a confidence interval than MBESS::ci.smd which might result in somewhat different
# intervals
all.equal(fun_val, test_fun_val)

# Glass delta ----
fun_val <- glass_d(x = d$y, INDEX = d$INDEX)
test_fun_val <- MBESS::smd.c(Group.T = d$y[d$INDEX == "b"], Group.C = d$y[d$INDEX == "a"])
all.equal(fun_val, test_fun_val)

# Glass delta CI ----
fun_val <- unname(unlist(glass_d_ci(x = d$y, INDEX = d$INDEX)))
test_fun_val <- unname(unlist(MBESS::ci.smd.c(smd.c = MBESS::smd.c(Group.T = d$y[d$INDEX == "b"], Group.C = d$y[d$INDEX == "a"]),
                                n.E = n_b, n.C = n_a))[-2]) 
# glass_d_ci uses a different conversion factor to determine the noncentrality parameter
# (based on Algina, J., Keselman, H. J., & Penfield, R. D. (2006b). Confidence intervals for an effect size when variances are not equal. Journal of Modern Applied Statistical Methods, 5(1), 2–13. https://doi.org/10.22237/jmasm/1146456060)
# than MBESS::ci.smd.c which can lead to significantly different intervals
all.equal(fun_val, test_fun_val)

# Glass delta bias corrected ----
fun_val <- glass_d_corr(x = d$y, INDEX = d$INDEX)
test_fun_val <- effsize::cohen.d(d = d$y, f = factor(d$INDEX, levels = c("b", "a")),pooled = FALSE, hedges.correction = TRUE)[["estimate"]]
# values might differ slightly since hedges_g computes the bias correction using
# the gamma distribution while effsize::cohen.d computes the bias correction using
# an approximation. Additionally, effsize::cohen.d uses n_a + n_b to compute the 
# degrees of freedom (used to compute the bias correction factor) instead of just
# n_b - which to the best of our knowledge is wrong.
all.equal(fun_val, test_fun_val)

# Glass delta bias corrected CI ----
fun_val <- unname(unlist(glass_d_corr_ci(x = d$y, INDEX = d$INDEX)))
test_fun_val <- unname(effsize::cohen.d(d = d$y, f = factor(d$INDEX, levels = c("b", "a")), 
                                        pooled = FALSE, hedges.correction = TRUE,
                                        noncentral = TRUE)[["conf.int"]])
# glass_d_ci uses a different conversion factor to determine the noncentrality parameter
# (based on Algina, J., Keselman, H. J., & Penfield, R. D. (2006b). Confidence intervals for an effect size when variances are not equal. Journal of Modern Applied Statistical Methods, 5(1), 2–13. https://doi.org/10.22237/jmasm/1146456060)
# than MBESS::ci.smd.c which can lead to significantly different intervals
all.equal(fun_val, test_fun_val)




# variance ratio independent ci ----
fun_val <- unlist(variance_ratio_independent_ci(x = X, INDEX = INDEX, standardised_by_group_1 = FALSE), use.names = FALSE)
test_fun_val <- stats::var.test(x = X[INDEX == "a"], y = X[INDEX == "b"])$conf.int
attributes(test_fun_val) <- NULL
all.equal(fun_val, test_fun_val)

# parametric tail ratio independent ci  ----
x1 <- round(pnorm(cutoff, m_a_post, s_a_post) * n_post)
n1 <- n_post
x2 <- round(pnorm(cutoff, m_b_post, s_b_post) * n_post)
n2 <- n_post
conf.level <- 1 - alpha
fun_val <- unlist(tail_ratio_independent_ci(X, INDEX, reference_group = reference_group, tail = tail, cutoff = cutoff), use.names = FALSE)
test_fun_val <- unlist(PropCIs::riskscoreci(x1, n1, x2, n2, conf.level))
attributes(test_fun_val) <- NULL
all.equal(fun_val, test_fun_val)

# non-parametric tail ratio independent ci ----
x1 <- sum(X[INDEX == "a"] <= cutoff)
n1 <- n_post
x2 <- sum(X[INDEX == "b"] <= cutoff)
n2 <- n_post
conf.level <- 1 - alpha
fun_val <- unlist(non_parametric_tail_ratio_independent_ci(X, INDEX, reference_group, tail, cutoff), use.names = FALSE)
test_fun_val <- unlist(PropCIs::riskscoreci(x1, n1, x2, n2, conf.level))
attributes(test_fun_val) <- NULL
all.equal(fun_val, test_fun_val)

# robust cohen's d independent ----
fun_val <- robust_cohens_d(x = X, INDEX = INDEX)
test_fun_val <- -1*WRS2::akp.effect(val ~ grp, data.frame(grp = INDEX, val = X))$AKPeffect
all.equal(fun_val, test_fun_val)

# robust cohen's d dependent ----
fun_val <- robust_cohens_d(x = x, y = y)
test_fun_val <- -1*WRS2::akp.effect(val ~ grp, data.frame(grp = INDEX, val = c(x,y)))$AKPeffect
all.equal(fun_val, test_fun_val)

# robust glass' delta independent -----
fun_val <- robust_glass_d(x = X, INDEX = INDEX, standardised_by_group_1 = TRUE)
test_fun_val <- -1 * WRS2::akp.effect(val ~ grp, data.frame(grp = INDEX, val = X), EQVAR = FALSE)$AKPeffect
all.equal(fun_val, test_fun_val)

# robust glass' delta dependent ----
fun_val <- robust_glass_d(x = x, y = y, standardised_by_group_1 = TRUE)
test_fun_val <- -1 * WRS2::akp.effect(val ~ grp, data.frame(grp = INDEX, val = c(x,y)), EQVAR = FALSE)$AKPeffect
all.equal(fun_val, test_fun_val)

# robust cohen's dz ----
fun_val <- robust_cohens_dz(x, y)
test_fun_val <- WRS2:::D.akp.effect(y,x)
all.equal(fun_val, test_fun_val)


# cohens_d_dependent(x = mat[,1], y = mat[,2])
# cohens_d_dependent(x = mat[,1], y = mat[,2])
# cohens_d_dependent(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post, s2 = s_b_post, n = n)
# cohens_d_dependent(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post, s2 = s_b_post, n = n)
# 
# cohens_dz(mat[,1], mat[,2])
# cohens_dz(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post, s2 = s_b_post, r = r)
# hedges_gz(m1 = m_a_post, m2 = m_b_post, sdiff = sdiff, n = n)
# metafor::escalc(measure = "SMCC", ni = n, m1i = m_a_post, m2i = m_b_post, sd1i = s_a_post, sd2i = s_b_post, ri = r)
# 
# cohen_dav(mat[,1], mat[,2])
# cohen_dav(mat[,1], mat[,2])
# 
# cohen_drm(mat[,1], mat[,2])
# cohen_drm(mat[,1], mat[,2])
# cohen_drm(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post, s2 = s_b_post, r = r)
# cohen_drm(m1 = m_a_post, m2 = m_b_post, sdiff = sdiff, r = r)
# 
# glass_d(x = mat[,1], y = mat[,2])
# glass_d(x = mat[,1], y = mat[,2])
# glass_d(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post) * hedges_bias_correction(n - 1)
# metafor::escalc(measure = "SMCR", m1i = m_a_post, m2i = m_b_post, sd1i = s_a_post, sd2i = s_b_post, ri = r, ni = n)
# 
# glass_d_corr(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post, df = n - 1)
# glass_d_corr_dependent_ci(m1 = m_a_post, m2 = m_b_post, s1 = s_a_post, sdiff = sdiff, n = n)
# metafor::escalc(measure = "SMCRH", m1i = m_a_post, m2i = m_b_post, sd1i = s_a_post, sd2i = s_b_post, ri = r, ni = n)[[1]] + qnorm(alpha/2) * c(-sqrt(metafor::escalc(measure = "SMCRH", m1i = m_a_post, m2i = m_b_post, sd1i = s_a_post, sd2i = s_b_post, ri = r, ni = n)[[2]]), sqrt(metafor::escalc(measure = "SMCRH", m1i = m_a_post, m2i = m_b_post, sd1i = s_a_post, sd2i = s_b_post, ri = r, ni = n)[[2]]))

# Pretest-posttest-control design function tests ----

## d_PCC_change ----
### point estimate ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- d_PPC_change(x = d$x, y = d$y, INDEX = d$INDEX)
fun_val_summary_data1 <- d_PPC_change(m1 = m_a_pre, m2 = m_a_post, sdiff1 = sdiff_a, m3 = m_b_pre, m4 = m_b_post, sdiff2 = sdiff_b)
fun_val_summary_data2 <- d_PPC_change(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, s2 = s_a_post, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, s4 = s_b_post, r1 = r_a, r2 = r_b)
test_fun_val <- metafor::escalc(measure = "SMCC", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_post, sd2i = s_a_pre, ri = r_a)$yi/hedges_bias_correction(df = n_a - 1) - metafor::escalc(measure = "SMCC", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_post, sd2i = s_b_pre, ri = r_b)$yi/hedges_bias_correction(df = n_b - 1)
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data1)
all.equal(fun_val_raw_data, fun_val_summary_data2)
all.equal(fun_val_raw_data, test_fun_val)

### ci ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- d_PPC_change_ci(x = d$x, y = d$y, INDEX = d$INDEX, alpha = alpha)
fun_val_summary_data1 <- d_PPC_change_ci(m1 = m_a_pre, m2 = m_a_post, sdiff1 = sdiff_a, n1 = n_a, m3 = m_b_pre, m4 = m_b_post, sdiff2 = sdiff_b, n2 = n_b, alpha = alpha)
fun_val_summary_data2 <- d_PPC_change_ci(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, s2 = s_a_post, n1 = n_a, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, s4 = s_b_post, n2 = n_b, r1 = r_a, r2 = r_b, alpha = alpha)
test_fun_val <- (metafor::escalc(measure = "SMCC", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_post, sd2i = s_a_pre, ri = r_a)$yi/hedges_bias_correction(df = n_a - 1) - metafor::escalc(measure = "SMCC", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_post, sd2i = s_b_pre, ri = r_b)$yi/hedges_bias_correction(df = n_b - 1)) + c(qnorm(alpha/2), qnorm(1 - alpha/2)) * sqrt(metafor::escalc(measure = "SMCC", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_post, sd2i = s_a_pre, ri = r_a, vtype = "LS2")$vi/hedges_bias_correction(df = n_a - 1)^2 + metafor::escalc(measure = "SMCC", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_post, sd2i = s_b_pre, ri = r_b, vtype = "LS2")$vi/hedges_bias_correction(df = n_b - 1)^2)
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data1)
all.equal(fun_val_raw_data, fun_val_summary_data2)
all.equal(unname(unlist(fun_val_raw_data)), test_fun_val, tolerance = 0.0005)


## g_PCC_change ----
### point estimate ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- g_PPC_change(x = d$x, y = d$y, INDEX = d$INDEX)
fun_val_summary_data1 <- g_PPC_change(m1 = m_a_pre, m2 = m_a_post, n1 = n_a, sdiff1 = sdiff_a, m3 = m_b_pre, m4 = m_b_post, n2 = n_b, sdiff2 = sdiff_b)
fun_val_summary_data2 <- g_PPC_change(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, s2 = s_a_post, n1 = n_a, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, s4 = s_b_post, n2 = n_b, r1 = r_a, r2 = r_b)
test_fun_val <- metafor::escalc(measure = "SMCC", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_post, sd2i = s_a_pre, ri = r_a)$yi - metafor::escalc(measure = "SMCC", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_post, sd2i = s_b_pre, ri = r_b)$yi
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data1)
all.equal(fun_val_raw_data, fun_val_summary_data2)
all.equal(fun_val_raw_data, test_fun_val)

### ci ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- g_PPC_change_ci(x = d$x, y = d$y, INDEX = d$INDEX, alpha = alpha)
fun_val_summary_data1 <- g_PPC_change_ci(m1 = m_a_pre, m2 = m_a_post, sdiff1 = sdiff_a, n1 = n_a, m3 = m_b_pre, m4 = m_b_post, sdiff2 = sdiff_b, n2 = n_b, alpha = alpha)
fun_val_summary_data2 <- g_PPC_change_ci(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, s2 = s_a_post, n1 = n_a, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, s4 = s_b_post, n2 = n_b, r1 = r_a, r2 = r_b, alpha = alpha)
test_fun_val <- (metafor::escalc(measure = "SMCC", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_post, sd2i = s_a_pre, ri = r_a)$yi - metafor::escalc(measure = "SMCC", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_post, sd2i = s_b_pre, ri = r_b)$yi) + c(qnorm(alpha/2), qnorm(1 - alpha/2)) * sqrt(metafor::escalc(measure = "SMCC", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_post, sd2i = s_a_pre, ri = r_a, vtype = "LS2")$vi + metafor::escalc(measure = "SMCC", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_post, sd2i = s_b_pre, ri = r_b, vtype = "LS2")$vi)
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data1)
all.equal(fun_val_raw_data, fun_val_summary_data2)
all.equal(unname(unlist(fun_val_raw_data)), test_fun_val, tolerance = 0.0005)


## d_PCC_pre ----
### point estimate ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- d_PPC_pre(x = d$x, y = d$y, INDEX = d$INDEX)
fun_val_summary_data <- d_PPC_pre(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post)
test_fun_val <- metafor::escalc(measure = "SMCR", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_pre, sd2i = s_a_post, ri = r_a)$yi/hedges_bias_correction(df = n_a - 1) - metafor::escalc(measure = "SMCR", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_pre, sd2i = s_b_post, ri = r_b)$yi/hedges_bias_correction(df = n_b - 1)
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data)
all.equal(fun_val_raw_data, test_fun_val)

### ci ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- d_PPC_pre_ci(x = d$x, y = d$y, INDEX = d$INDEX, alpha = alpha)
fun_val_summary_data <- d_PPC_pre_ci(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, n1 = n_a, r1 = r_a, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, r2 = r_b, n2 = n_b, alpha = alpha)
test_fun_val <- (metafor::escalc(measure = "SMCR", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_pre, sd2i = s_a_post, ri = r_a)$yi/hedges_bias_correction(df = n_a - 1) - metafor::escalc(measure = "SMCR", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_pre, sd2i = s_b_post, ri = r_b)$yi/hedges_bias_correction(df = n_b - 1)) + c(qnorm(alpha/2), qnorm(1 - alpha/2)) * sqrt(metafor::escalc(measure = "SMCR", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_pre, sd2i = s_a_post, ri = r_a, vtype = "LS2")$vi/hedges_bias_correction(df = n_a - 1)^2 + metafor::escalc(measure = "SMCR", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_pre, sd2i = s_b_post, ri = r_b, vtype = "LS2")$vi/hedges_bias_correction(df = n_b - 1)^2)
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data)
all.equal(unname(unlist(fun_val_raw_data)), test_fun_val)



## g_PCC_pre ----
### point estimate ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- g_PPC_pre(x = d$x, y = d$y, INDEX = d$INDEX)
fun_val_summary_data <- g_PPC_pre(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, n1 = n_a, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, n2 = n_b)
test_fun_val <- metafor::escalc(measure = "SMCR", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_pre, sd2i = s_a_post, ri = r_a)$yi - metafor::escalc(measure = "SMCR", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_pre, sd2i = s_b_post, ri = r_b)$yi
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data)
all.equal(fun_val_raw_data, test_fun_val)

### ci ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}
fun_val_raw_data <- g_PPC_pre_ci(x = d$x, y = d$y, INDEX = d$INDEX, alpha = alpha)
fun_val_summary_data <- g_PPC_pre_ci(m1 = m_a_pre, s1 = s_a_pre, m2 = m_a_post, n1 = n_a, r1 = r_a, m3 = m_b_pre, s3 = s_b_pre, m4 = m_b_post, r2 = r_b, n2 = n_b, alpha = alpha)
test_fun_val <- (metafor::escalc(measure = "SMCR", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_pre, sd2i = s_a_post, ri = r_a)$yi - metafor::escalc(measure = "SMCR", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_pre, sd2i = s_b_post, ri = r_b)$yi) + c(qnorm(alpha/2), qnorm(1 - alpha/2)) * sqrt(metafor::escalc(measure = "SMCR", ni = n_a, m1i = m_a_post, m2i = m_a_pre, sd1i = s_a_pre, sd2i = s_a_post, ri = r_a, vtype = "LS")$vi + metafor::escalc(measure = "SMCR", ni = n_b, m1i = m_b_post, m2i = m_b_pre, sd1i = s_b_pre, sd2i = s_b_post, ri = r_b, vtype = "LS")$vi)
attributes(test_fun_val) <- NULL
all.equal(fun_val_raw_data, fun_val_summary_data)
all.equal(unname(unlist(fun_val_raw_data)), test_fun_val, tolerance = 0.0005)
