

RNGversion("4.1.0")
set.seed(123)
mat <- MASS::mvrnorm(n = 200, mu = c(20, 18), Sigma = matrix(c(5^2, 5 * 5 * 0.8, 5 * 5 * 0.8, 5^2), byrow = 2, nrow = 2))
m1 <- mean(mat[,1])
m2 <- mean(mat[,2])
s1 <- sd(mat[,1])
s2 <- sd(mat[,2])
r <- cor(mat[,1], mat[,2])
sdiff <- sd(mat[,2] - mat[,1])
n <- nrow(mat)
x <- mat[,1]
y <- mat[,2]
trim <- 0.2
cutoff <- 20
tail <- "lower"
reference_group <- "group1"
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

