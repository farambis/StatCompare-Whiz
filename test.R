# Test functions from functio_ready.R
source("function_ready.R")
# TO DO: specify package versions used for this test file!

# simulate a dataset to work with:
RNGversion("4.1.0")
set.seed(123)
mat <- MASS::mvrnorm(n = 200, mu = c(20, 18), Sigma = matrix(c(5^2, 5 * 5 * 0.8, 5 * 5 * 0.8, 5^2), byrow = 2, nrow = 2))

# get relevant parameters from the simulated dataset
m1 <- mean(mat[,1])
m2 <- mean(mat[,2])
s1 <- sd(mat[,1])
s2 <- sd(mat[,2])
r <- cor(mat[,1], mat[,2])
sdiff <- sd(mat[,2] - mat[,1])
n <- nrow(mat)
n1 <- n
n2 <- n
x <- mat[,1]
y <- mat[,2]
X <- c(x[sample(1:length(x))],y)
INDEX <- rep(c(1,2), each = n)

# set various parameters necessary for some of the tested functions
alpha <- 0.05
trim <- 0.2
cutoff <- 15
tail <- "lower"
reference_group <- "group2"


# variance ratio independent ci ----
fun_val <- unlist(variance_ratio_independent_ci(x = X, INDEX = INDEX, group_1_reference = FALSE), use.names = FALSE)
test_fun_val <- stats::var.test(x = X[INDEX == 1], y = X[INDEX == 2])$conf.int
attributes(test_fun_val) <- NULL
all.equal(fun_val, test_fun_val)

# parametric tail ratio independent ci  ----
x1 <- round(pnorm(cutoff, m1, s1) * n1)
n1 <- n
x2 <- round(pnorm(cutoff, m2, s2) * n2)
n2 <- n
conf.level <- 1 - alpha
fun_val <- unlist(tail_ratio_independent_ci(X, INDEX, reference_group = reference_group, tail = tail, cutoff = cutoff), use.names = FALSE)
test_fun_val <- unlist(PropCIs::riskscoreci(x1, n1, x2, n2, conf.level))
attributes(test_fun_val) <- NULL
all.equal(fun_val, test_fun_val)

# non-parametric tail ratio independent ci ----
x1 <- sum(X[INDEX == 1] <= cutoff)
n1 <- n
x2 <- sum(X[INDEX == 2] <= cutoff)
n2 <- n
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
# cohens_d_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
# cohens_d_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
# 
# cohens_dz(mat[,1], mat[,2])
# cohens_dz(m1 = m1, m2 = m2, s1 = s1, s2 = s2, r = r)
# hedges_gz(m1 = m1, m2 = m2, sdiff = sdiff, n = n)
# metafor::escalc(measure = "SMCC", ni = n, m1i = m1, m2i = m2, sd1i = s1, sd2i = s2, ri = r)
# 
# cohen_dav(mat[,1], mat[,2])
# cohen_dav(mat[,1], mat[,2])
# 
# cohen_drm(mat[,1], mat[,2])
# cohen_drm(mat[,1], mat[,2])
# cohen_drm(m1 = m1, m2 = m2, s1 = s1, s2 = s2, r = r)
# cohen_drm(m1 = m1, m2 = m2, sdiff = sdiff, r = r)
# 
# glass_d(x = mat[,1], y = mat[,2])
# glass_d(x = mat[,1], y = mat[,2])
# glass_d(m1 = m1, m2 = m2, s1 = s1) * hedges_bias_correction(n - 1)
# metafor::escalc(measure = "SMCR", m1i = m1, m2i = m2, sd1i = s1, sd2i = s2, ri = r, ni = n)
# 
# glass_d_corr(m1 = m1, m2 = m2, s1 = s1, df = n - 1)
# glass_d_corr_dependent_ci(m1 = m1, m2 = m2, s1 = s1, sdiff = sdiff, n = n)
# metafor::escalc(measure = "SMCRH", m1i = m1, m2i = m2, sd1i = s1, sd2i = s2, ri = r, ni = n)[[1]] + qnorm(alpha/2) * c(-sqrt(metafor::escalc(measure = "SMCRH", m1i = m1, m2i = m2, sd1i = s1, sd2i = s2, ri = r, ni = n)[[2]]), sqrt(metafor::escalc(measure = "SMCRH", m1i = m1, m2i = m2, sd1i = s1, sd2i = s2, ri = r, ni = n)[[2]]))

