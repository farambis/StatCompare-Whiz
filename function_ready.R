#TODO beim Upload prüfen, dass in der Gruppierungsvariable eh keine NAs vorhanden
# sind - diese werden nämlich bei Funktionen wie tapply ohne Warnung ignoriert

#TODO User sollen angeben wie die Faktoren zu rangreihen sind, damit in der server
# funktion die Gruppierungsvariable richtig faktorisiert werden kann

# Grand functions computing every effect size and test statistic for the app ----
## List of every effect size and test statistic ----
all_eff_sizes <- list(cohen_d = "cohen_d", hedges_g = "hedges_g", glass_d = "glass_d", glass_d_corr = "glass_d_corr",
                      bonett_d = "bonett_d", bonett_d_corr = "bonett_d_corr", AKP_eqvar = "AKP_eqvar", AKP_uneqvar = "AKP_uneqvar",
                      mann_whitney_based_ps = "mann_whitney_based_ps", ovl_parametric = "ovl_parametric", ps_dependent = "ps_dependent",
                      ovl_nonparametric = "ovl_nonparametric", generalized_odds_ratio = "generalized_odds_ratio",
                      generalized_odds_ratio_dependent = "generalized_odds_ratio_dependent", common_language = "common_language", ovl2 = "ovl2", ovl2_parametric = "ovl2_parametric")

all_test_statistics <- list(student_t_test = "student_t_test", dependent_student_t_test = "dependent_student_t_test",
                            welch_t_test = "welch_t_test", yuen_t_test = "yuen_t_test", mann_whitney = "mann_whitney", mann_whitney_dependent = "mann_whitney_dependent")

es_list <- c("cohen_d", "hedges_g", "glass_d", "glass_d_corr", "bonett_d", "bonett_d_corr")
ts_list <- c("student_t_test", "welch_t_test", "yuen_t_test")
## ES for raw data ----
generate_es_raw_data_dataframe <- function(es_list, INDEX = NULL, x, y) {

  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)

  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("this is no offered effect size!\n")
    res <- switch(i,
                  "cohen_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "hedges_g" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "glass_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "glass_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "bonett_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "bonett_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "AKP_eqvar" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "AKP_uneqvar" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX)),
                  "mann_whitney_based_ps" = c(mann_whitney_based_ps(x = x, INDEX = INDEX), mann_whitney_based_ps_ci(x = x, INDEX = INDEX)),
                  "ovl_parametric" = c(ovl_parametric(x = x, INDEX = INDEX), ovl_parametric_ci(x = x, INDEX = INDEX)),
                  "ovl_nonparametric" = c(non_parametric_overlapping_coefficient(x, INDEX), ovl_parametric_ci(x, INDEX)), # parametric ci
                  "ps_dependent" = c(ps_dependent_groups(x, y), ps_dependent_groups_ci(x, y)),
                  "generalized_odds_ratio" = c(generalized_odds_ratio(x = x, INDEX = INDEX), generalized_odds_ratio_ci(x = x, INDEX = INDEX)),
                  "generalized_odds_ratio_dependent" = c(generalized_odds_ratio(x = x, INDEX = INDEX, y = y), generalized_odds_ratio_ci(x = x, y = y)),
                  "common_language" = c(common_language_es(x = x, INDEX = INDEX), common_language_es_ci(x = x, INDEX = INDEX))
    )
    es_result <- c(es_result, res[[1]])
    es_ci_lower <- c(es_ci_lower, res[[2]])
    es_ci_upper <- c(es_ci_upper, res[[3]])
  }
  es_dataframe <- data.frame(
    es_list,
    es_result,
    es_ci_lower,
    es_ci_upper
  )
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci lower limit", "Ci upper limit")
  return(es_dataframe)
}

## ES for educational mode ----
generate_es_educational_dataframe <- function(es_list, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("this is no offered effect size!\n")
    res <- switch(i,
                  "cohen_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "hedges_g" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "glass_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "glass_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "bonett_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "bonett_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "ovl_parametric" = c(ovl_parametric(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), ovl_parametric_ci(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2))
    )
    es_result <- c(es_result, res[[1]])
    es_ci_lower <- c(es_ci_lower, res[[2]])
    es_ci_upper <- c(es_ci_upper, res[[3]])
  }
  es_dataframe <- data.frame(
    es_list,
    es_result,
    es_ci_lower,
    es_ci_upper
  )
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci lower limit", "Ci upper limit")
  return(es_dataframe)
}

## Test statistics for raw data & educational mode ----
generate_ts_dataframe <- function(ts_list, INDEX = NULL, x = NULL, m1, m2, standardDeviation1, standardDeviation2, n1, n2) {
  ts_t_value <- vector(mode = "double", length = 0L)
  ts_df <- vector(mode = "double", length = 0L)
  ts_p_value <- vector(mode = "double", length = 0L)
  for (i in ts_list) {
    if (!i %in% all_test_statistics) stop("this is no offered test statistic!\n")
    if (!is.null(x)) {
      res <- switch(i,
                    "student_t_test" = t_test(type = i, x = x, INDEX = INDEX),
                    "welch_t_test" = t_test(type = i, x = x, INDEX = INDEX),
                    "yuen_t_test" = t_test(type = i, x = x, INDEX = INDEX),
                    "dependent_student_t_test" = t_test(type = i, x = x, y = y),
      ) }
    else {
      res <- switch(i,
                    "student_t_test" = t_test(type = i, m1 = m1, m2 = m2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = n1, n2 = n2),
                    "welch_t_test" = t_test(type = i, m1 = m1, m2 = m2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = n1, n2 = n2)
      ) }
    ts_t_value <- c(ts_t_value, res[[1]])
    ts_df <- c(ts_df, res[[2]])
    ts_p_value <- c(ts_p_value, res[[3]])
  }
  ts_dataframe <- data.frame(
    ts_list,
    ts_t_value,
    ts_df,
    ts_p_value
  )
  colnames(ts_dataframe) <- c("Name", "t", "df", "p")
  return(ts_dataframe)
}

generate_non_parametric_ts_dataframe <- function(ts_list, INDEX, x, y) {
  ts_p_value <- vector(mode = "double", length = 0L)
  ts_z_value <- vector(mode = "double", length = 0L)
  for (i in ts_list) {
    res <- switch(i,
                  "mann_whitney" = ts_for_mann_whitney_based_ps(x = x, INDEX = INDEX),
                  "mann_whitney_dependent" = ts_for_mann_whitney_based_ps(x = x, y = y)
    )
    ts_p_value <- c(ts_p_value, res[1])
    ts_z_value <- c(ts_z_value, res[2])
  }
  ts_dataframe <- data.frame(
    ts_list,
    ts_p_value,
    ts_z_value
  )
  colnames(ts_dataframe) <- c("Name", "p", "z")
  return(ts_dataframe)
}

# Helper functions ----
## Error detector function ----
error_detector <- function(x, INDEX, trim, na.rm) {
  if (!is.numeric(x)) stop("\nx must be numeric")

  if (length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")

  n_grps <- unique(INDEX[!is.na(INDEX)])
  if (length(n_grps) < 2 || length(n_grps) > 2) stop("\nINDEX should contain two unique values")

  if (typeof(na.rm) != "logical") stop("\nna.rm must be set to TRUE or FALSE")

  if (trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")

  i_NA <- complete.cases(x, INDEX)
  if (!na.rm && any(!i_NA)) {
    stop("\nNAs present in x and/or INDEX")
  }

}

## Winsorized Variances ----

winsor <- function(x, trim = 0.2, na.rm = TRUE) {

  # this function winsorizes a vector
  # 
  # x ...... vector to winsorize
  # trim ... percent of the values in the upper and lower tail to be replaced
  #          should be a number between 0 and 0.5
  #
  # the lower *trim* percent of the sorted vector is replaced with the lowest 
  # score that is not trimmed, and the upper *trim* percent of the sorted
  # vector is replaced by the largest non trimmed  score.

  if (na.rm) x <- x[!is.na(x)]

  if (trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")


  y <- sort(x)

  i_lower <- floor(trim * length(y)) + 1
  i_upper <- (length(y) + 1) - i_lower

  val_lower <- y[i_lower]
  val_upper <- y[i_upper]

  y[1:i_lower] <- val_lower
  y[i_upper:length(y)] <- val_upper

  nmbr_nas <- sum(is.na(x))
  if (nmbr_nas != 0) {
    warning("\nNAs present in x - these will be ignored for winsorization\nNAs will be added to the end of the winsorized vector\nSet na.rm = TRUE if you want NAs removed")
    nas <- rep(NA, times = nmbr_nas)
    return(c(y, nas))
  }

  return(y)

}

## Determine sample size after trimming ----

n_trim <- function(x = NULL, n, trim = 0.2) {
  if (!is.null(x)) n <- length(x)
  ntr <- n - (2 * floor(trim * n))
  return(ntr)
}

## Determine degrees of freedom -----
degrees_freedom <- function(effsize, n1, n2, ntr1, ntr2, comparison_group = NULL) {

  df <- switch(effsize,
               "cohen_d" = n1 + n2 - 2,
               "hedges_g" = n1 + n2 - 2,
               "glass_d" = ifelse(comparison_group == "a", n1, n2) - 1,
               "glass_d_corr" = ifelse(comparison_group == "a", n1, n2) - 1,
               "bonett_d" = n1 + n2 - 2,
               "bonett_d_corr" = n1 + n2 - 2,
               "AKP_eqvar" = ntr1 + ntr2 - 2,
               "AKP_uneqvar" = ifelse(comparison_group == "a", ntr1, ntr2) - 1)

  return(df)
}

## Various correction factors ----

smd_corr <- function(n1, n2, df, trim, type = c("hedges", "AKP", "bonett")) {


  res <- switch(type,
                "hedges" = exp(lgamma(df / 2) -
                                 log(sqrt(df / 2)) -
                                 lgamma((df - 1) / 2)),
                "bonett" = sqrt((n1 + n2 - 2) / (n1 + n2 - 1)),
                "AKP" = sqrt(integrate(f = function(x) { x^2 * dnorm(x) }, lower = qnorm(trim), upper = qnorm(1 - trim))$value + 2 * qnorm(trim)^2 * trim)
  )

  return(res)
}

## Summary statistics functions ----
### Univariate summary statistics ----
univar_stats <- function(x, trim = trim, winvar = winvar) {
  m <- mean(x)
  n <- length(x)
  v <- var(x)
  trm <- mean(x, trim = trim)
  ntr <- n_trim(n = n, trim = trim)
  if (winvar) {
    winvar <- var(winsor(x, trim = trim))
  } else {
    winvar <- NULL
  }
  return(list(m = m, n = n, var = v, trm = trm, ntr = ntr, winvar = winvar))
}

### Grand summary statistics function ----
smd_stats <- function(x, INDEX, trim = 0.2, type = c("univariate", "multivariate"),
                      winvar = FALSE, na.rm = TRUE) {

  error_detector(x, INDEX, trim, na.rm)
  i_NA <- complete.cases(x, INDEX)
  if (na.rm) {
    x <- x[i_NA]
    INDEX <- INDEX[i_NA]
  }

  if ("univariate" %in% type) {
    univariate_stats <- tapply(X = x, INDEX = INDEX, FUN = univar_stats, trim = trim, winvar = winvar, simplify = FALSE)
    stats_names <- names(univariate_stats[[1]])
    stats_names <- paste0(stats_names, rep(1:2, each = length(stats_names)))
    univariate_stats <- unlist(univariate_stats, recursive = FALSE)
    names(univariate_stats) <- stats_names
    return(univariate_stats)
  }

}

## Various standard deviations: ----
sd_combined <- function(x = NULL, INDEX = NULL, var1, var2, n1, n2, winvar1,
                        winvar2, ntr1, ntr2, winsor = FALSE, trim = 0.2, na.rm = TRUE,
                        type = c("pooled", "mean", "grp_1", "grp_2", "se_pooled", "se_welch", "se_yuen")) {


  if (!is.null(x) && !is.null(INDEX)) {
    error_detector(x, INDEX, trim, na.rm)
    i_NA <- complete.cases(x, INDEX)
    if (na.rm) {
      x <- x[i_NA]
      INDEX <- INDEX[i_NA]
    }

    univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, type = "univariate", winvar = winsor)
    n1 <- univar_stats[["n1"]]
    n2 <- univar_stats[["n2"]]
    if (!winsor) {
      var1 <- univar_stats[["var1"]]
      var2 <- univar_stats[["var2"]]
    } else {
      var1 <- univar_stats[["winvar1"]]
      var2 <- univar_stats[["winvar2"]]
      ntr1 <- univar_stats[["ntr1"]]
      ntr2 <- univar_stats[["ntr2"]]
    }


  } else {
    if (winsor) {
      var1 <- winvar1
      var2 <- winvar2
    }
  }

  res <- switch(type,
                "pooled" = sqrt((((n1 - 1) * var1) + ((n2 - 1) * var2)) / (n1 + n2 - 2)),
                "mean" = sqrt((var1 + var2) / 2),
                "grp_1" = sqrt(var1),
                "grp_2" = sqrt(var2),
                "se_pooled" = sqrt((((n1 - 1) * var1) + ((n2 - 1) * var2)) / (n1 + n2 - 2) * ((1 / n1) + (1 / n2))),
                "se_welch" = sqrt((var1 / n1) + (var2 / n2)),
                "se_yuen" = sqrt(((n1 - 1) * var1 / (ntr1 * (ntr1 - 1))) + ((n2 - 1) * var2 / (ntr2 * (ntr2 - 1))))
  )

  return(res)
}


# Univariate SMDs for independent groups design ----

smd_uni <- function(effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr",
                                "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"),
                    x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2, trm1,
                    trm2, winvar1, winvar2, ntr1, ntr2, na.rm = TRUE, trim = 0.2) {

  # this function


  if (!is.null(x) && !is.null(INDEX)) {
    error_detector(x, INDEX, trim, na.rm)
    i_NA <- complete.cases(x, INDEX)
    if (na.rm) {
      x <- x[i_NA]
      INDEX <- INDEX[i_NA]
    }

    if ("AKP_eqvar" %in% effsize || "AKP_uneqvar" %in% effsize) {
      winvar <- TRUE
    } else {
      winvar <- FALSE
    }
    univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar,
                              type = "univariate")
    for (i in 1:length(univar_stats)) {
      assign(names(univar_stats)[[i]], univar_stats[[i]])
    }

  }

  res <- switch(effsize,
                "cohen_d" = (m1 - m2) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "pooled"),
                "hedges_g" = smd_corr(df = degrees_freedom(effsize, n1, n2), type = "hedges") * (m1 - m2) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "pooled"),
                "glass_d" = (m1 - m2) / sd_combined(var1 = var1, type = "grp_1"),
                "glass_d_corr" = smd_corr(df = degrees_freedom(effsize, n1, comparison_group = "a"), type = "hedges") * (m1 - m2) / sd_combined(var1 = var1, type = "grp_1"),
                "bonett_d" = (m1 - m2) / sd_combined(var1 = var1, var2 = var2, type = "mean"),
                "bonett_d_corr" = smd_corr(df = degrees_freedom(effsize, n1, n2), type = "hedges") * (m1 - m2) / sd_combined(var1 = var1, var2 = var2, type = "mean"),
                "AKP_eqvar" = smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * (trm1 - trm2) / sd_combined(winvar1 = winvar1, winvar2 = winvar2, n1 = n1, n2 = n2, type = "pooled", winsor = TRUE, trim = trim),
                "AKP_uneqvar" = smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * (trm1 - trm2) / sd_combined(winvar1 = winvar1, winvar2 = winvar2, type = "grp_1", winsor = TRUE, trim = trim))

  names(res) <- effsize
  return(res)

}

# CIs for univariate SMDs  ----
## confidence intervals for noncentrality parameters ----
ncp_ci <- function(ncp, df, alpha) {
  cibound_candidates <- c(min(-5, -abs(ncp) * 7), max(5, abs(ncp) * 7))

  ncp_ci_lower <- suppressWarnings(
    uniroot(f = function(x) {
      pt(q = ncp, df = df, ncp = x) - (1 - (alpha / 2))
    },
            interval = cibound_candidates)
  )$root


  ncp_ci_upper <- suppressWarnings(
    uniroot(f = function(x) {
      pt(q = ncp, df = df, ncp = x) - alpha / 2
    },
            interval = cibound_candidates)
  )$root

  ncp_cis <- c(ncp_ci_lower, ncp_ci_upper)
  return(ncp_cis)
}

## CI for univariate independent samples SMD ----
smd_ci <- function(effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr",
                               "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"),
                   x = NULL, INDEX = NULL, val, n1, n2, n, var1, var2, ntr1, ntr2,
                   winvar1, winvar2, trim = 0.2, alpha = 0.05) {

  # this function computes confidence intervals (ci) for various effect sizes using 
  # exact/approximate formulas 
  # 
  # effsize ... name of the effect size for which to compute the ci
  # val ....... value of the effect size
  # n1 ........ sample size of group 1 
  # n2 ........ sample size of group 2
  # n ......... total sample size
  # var1 ...... variance in group 1
  # var2 ...... variance in group 2
  # ntr1 ...... sample size of group 1 after trimming
  # ntr2 ...... sample size of group 2 after trimming
  # winvar1 ... winsorized variance in group 1
  # winvar2 ... winsorized variance in group 2
  # trim ...... percent of the values trimmed in the upper and lower tail of each group
  #
  # for cohen's d, hedges' g, glass' delta, hedges corrected glass' delta, the 
  # robust effect sizes akp for equal and unequal variances, confidence intervals
  # based on noncentral t-distributions are computed. For the effect size 
  # recommended by Bonett (2008), the confidence interval is computed using the 
  # formula for the variance of the effect size based on large sample theory. 


  if (!is.null(x) && !is.null(INDEX)) {
    if ("AKP_eqvar" %in% effsize || "AKP_uneqvar" %in% effsize) {
      winvar <- TRUE
    } else {
      winvar <- FALSE
    }
    univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar,
                              type = "univariate")
    for (i in 1:length(univar_stats)) {
      assign(names(univar_stats)[[i]], univar_stats[[i]])
    }

  }

  df <- degrees_freedom(effsize, n1, n2, ntr1, ntr2, comparison_group = "a")

  if (effsize %in% c("bonett_d", "bonett_d_corr")) {
    sdm <- sd_combined(var1 = var1, var2 = var2, type = "mean")

    ls_var <- switch(effsize,
                     "bonett_d" = val^2 * (var1^2 / (n1 - 1) + var2^2 / (n2 - 1)) / (8 * sdm^4) +
                       (var1 / (sdm^2 * (n1 - 1))) +
                       var2 / (sdm^2 * (n2 - 1)),
                     "bonett_d_corr" = (val^2 * (var1^2 / (n1 - 1) + var2^2 / (n2 - 1)) / (8 * sdm^4) +
                       (var1 / (sdm^2 * (n1 - 1))) +
                       var2 / (sdm^2 * (n2 - 1))) * (smd_corr(df = n1 + n2 - 2, type = "hedges")^2)
    )
  } else {

    ncp <- switch(effsize,
                  "cohen_d" = val / sqrt((1 / n1) + (1 / n2)),
                  "hedges_g" = val / (smd_corr(df = df, type = "hedges") * sqrt((1 / n1) + (1 / n2))),
                  "glass_d" = val / sqrt((1 / n1) + (var2 / (n2 * var1))),
                  "glass_d_corr" = val / (smd_corr(df = df, type = "hedges") * sqrt((1 / n1) + (var2 / (n2 * var1)))),
                  "AKP_eqvar" = sqrt((ntr1 * ntr2) / (ntr1 + ntr2)) * ((trm1 - trm2) / sqrt(((n1 + n2 - 2) * (sd_combined(winvar1 = winvar1, winvar2 = winvar2, n1 = n1, n2 = n2, type = "pooled", winsor = TRUE, trim = trim)^2)) / (ntr1 + ntr2 - 2))),
                  "AKP_uneqvar" = val / (smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * sqrt(((n1 - 1) / (ntr1 * (ntr1 - 1))) + (((n2 - 1) * winvar2) / ((ntr2 * (ntr2 - 1)) * winvar1))))
    )

    ncp_cis <- ncp_ci(ncp, df, alpha)

  }

  smd_ci <- switch(effsize,
                   "cohen_d" = ncp_cis * sqrt((1 / n1) + (1 / n2)),
                   "hedges_g" = ncp_cis * (smd_corr(df = df, type = "hedges") * sqrt((1 / n1) + (1 / n2))),
                   "glass_d" = ncp_cis * sqrt((1 / n1) + (var2 / (n2 * var1))),
                   "glass_d_corr" = ncp_cis * (smd_corr(df = df, type = "hedges") * sqrt((1 / n1) + (var2 / (n2 * var1)))),
                   "bonett_d" = val + (c(qnorm(alpha / 2), qnorm(1 - (alpha / 2))) * sqrt(ls_var)),
                   "bonett_d_corr" = val + (c(qnorm(alpha / 2), qnorm(1 - (alpha / 2))) * sqrt(ls_var)),
                   "AKP_eqvar" = ncp_cis * (smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * sqrt(((ntr1 + ntr2) * (n1 + n2 - 2)) / (ntr1 * ntr2 * (ntr1 + ntr2 - 2)))),
                   "AKP_uneqvar" = ncp_cis * (smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * sqrt(((n1 - 1) / (ntr1 * (ntr1 - 1))) + (((n2 - 1) * winvar2) / ((ntr2 * (ntr2 - 1)) * winvar1))))
  )

  res <- list(effsize = unname(val),
              cil = smd_ci[[1]],
              ciu = smd_ci[[2]])
  return(res)
}


# Percentile Bootstrap CI function ----

smd_boot <- function(x, INDEX, effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr",
                                           "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"),
                     alpha = 0.05, nboot = 200, trim = 0.2, na.rm = TRUE) {


  if (!is.numeric(x)) stop("\nX must be numeric")

  if (length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")

  grps <- unique(INDEX)
  if (length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
  if (any(is.na(grps))) stop("\nNAs present in INDEX")

  if (trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")

  if (!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")

  if (alpha < 0 || alpha > 0.99) stop("\alpha < 0 or > 0.99, specify a value within these bounds")


  original <- split(x = x, f = INDEX)
  INDEX <- sort(as.factor(INDEX))
  boot_dat <- rep(list(numeric(length = length(x))), times = nboot)
  for (i in 1:nboot) {
    boot_dat[[i]] <- c(sample(original[[1]], replace = TRUE),
                       sample(original[[2]], replace = TRUE))
  }
  boot_val <- sort(
    unlist(
      lapply(boot_dat, FUN = smd_uni, effsize = effsize, INDEX = INDEX, trim = trim),
      use.names = FALSE)
  )
  lower <- nboot * (alpha / 2)
  upper <- nboot - lower
  cl_lower <- boot_val[lower + 1]
  cl_upper <- boot_val[upper]
  return(list(cil = cl_lower, ciu = cl_upper))

}

boot <- function(x, INDEX, alpha = 0.05, n_boot = 200, FUN) {

  original <- split(x = x, f = INDEX)
  boot_dat <- rep(list(numeric(length = length(x))), times = n_boot)
  boot_dat <- lapply(boot_dat, function(y) { c(sample(original[[1]], size = length(original[[1]]), replace = TRUE), sample(original[[2]], size = length(original[[2]]), replace = TRUE)) })
  boot_val <- sort(
    unlist(
      lapply(boot_dat, function(x) { FUN(x[1:length(original[[1]])], x[length(original[[1]] + 1):length(x)]) }), # give datasets to es function
      use.names = FALSE)
  )
  lower <- n_boot * (alpha / 2)
  upper <- n_boot - lower
  cl_lower <- boot_val[lower + 1]
  cl_upper <- boot_val[upper]
  return(list(cil = cl_lower, ciu = cl_upper))
}


# t-test functions(student, welch, yuen, ...) ----
## independent groups student's t-test: ----
student_t <- function(m1, m2, var1, var2, n1, n2) {
  t_val <- (m1 - m2) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_pooled")
  df <- n1 + n2 - 2
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## dependent groups student's t-test: ----
dependent_student_t <- function(m1, m2, sd_diff, n_diff) {
  t_val <- (m1 - m2) / (sd_diff / sqrt(n_diff))
  df <- n_diff - 1
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## independent groups welch's t-test: ----
welch_t <- function(m1, m2, var1, var2, n1, n2) {
  se_welch <- sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_welch")
  t_val <- (m1 - m2) / se_welch
  df_num <- se_welch^4
  df_denom <- (var1^2 / (n1^2 * (n1 - 1))) + (var2^2 / (n2^2 * (n2 - 1)))
  df <- df_num / df_denom
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## independent groups yuen's t-test: ----
yuen_t <- function(trm1, trm2, winvar1, winvar2, n1, n2, ntr1, ntr2) {
  d1 <- (n1 - 1) * winvar1 / (ntr1 * (ntr1 - 1))
  d2 <- (n2 - 1) * winvar2 / (ntr2 * (ntr2 - 1))
  t_val <- (trm1 - trm2) / sqrt(d1 + d2)
  df_num <- (d1 + d2)^2
  df_denom <- d1^2 / (ntr1 - 1) + d2^2 / (ntr2 - 1)
  df <- df_num / df_denom
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## grand t-test function: ----
t_test <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, var1, var2, n1, n2, trm1, trm2,
                   winvar1, winvar2, ntr1, ntr2, dependent = FALSE, n_diff, sd_diff, alpha = 0.05,
                   na.rm = TRUE, type = c("student_t_test", "dependent_student_t_test", "welch_t_test", "yuen_t_test")) {
  if (!dependent) {

    if (!is.null(x) && !is.null(INDEX)) {
      error_detector(x, INDEX, trim, na.rm)
      i_NA <- complete.cases(x, INDEX)
      if (na.rm) {
        x <- x[i_NA]
        INDEX <- INDEX[i_NA]
      }

      if ("yuen_t_test" %in% type) {
        winvar <- TRUE
      } else {
        winvar <- FALSE
      }
      univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar,
                                type = "univariate")
      for (i in 1:length(univar_stats)) {
        assign(names(univar_stats)[[i]], univar_stats[[i]])
      }

    }

  }

  res <- switch(type,
                student_t_test = student_t(m1, m2, var1, var2, n1, n2),
                #     dependent_student_t_test = dependent_student_t(m1, m2, sd_diff, n_diff),
                welch_t_test = welch_t(m1, m2, var1, var2, n1, n2),
                yuen_t_test = yuen_t(trm1, trm2, winvar1, winvar2, n1, n2, ntr1, ntr2))


  return(res)

}

# standardized median differences
standardized_median_difference_mad <- function(x, INDEX, y) {
  if(missing(y)) {
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  mad <- median(unlist(lapply(dataset1, function(x) { abs(x - median(dataset1)) })))
  return((median(dataset1) - median(dataset2)) / mad)
}

standardized_median_difference_riq <- function(x, INDEX, y) {
  if(missing(y)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  riq <- quantile(dataset1)[['75%']] - quantile(dataset1)[['25%']]
  return((median(dataset1) - median(dataset2)) / (0.75 * riq))
}

standardized_median_difference_biweight <- function(x, INDEX, y) {
  if(missing(y)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  return ((median(dataset1) - median(dataset2))/sbwab(dataset1))
}

sbwab <- function(x) {
  dataset_x <- x
  sqrt_n <- sqrt(length(dataset_x))
  mad <- median(unlist(lapply(dataset_x, function(x) { abs(x - median(dataset_x)) })))
  median_x <- median(dataset_x)
  yis <- unlist(lapply(dataset_x, function(x) {
    (x - median_x) / (9*mad)
  }))
  ais <- ifelse(abs(yis) < 1, 1,0)
  index <- 1:length(x)
  sum <- sum(unlist(lapply(index, function(x) {
    ais[x] * (dataset_x[x] - median_x)^2 * (1 - yis[x])^4
  })))
  numerator <- sqrt_n * sqrt(sum)
  denominator <-abs(sum(unlist(lapply(index, function(x){
    ais[x]*(1-yis[x]^2)*(1-5*yis[x]^2)
  }))))
  return (numerator/denominator)
}

# Effect Sizes that go beyond comparison of the mean  -------------------------------------------

## Variance ratio ----
variance_ratio <- function(x = NULL, INDEX = NULL, s1, s2, ref = c("grp1", "grp2"), log = FALSE) {
  if (!is.null(x) & !is.null(INDEX)) {
    sds <- tapply(x, INDEX, sd)
    s1 <- sds[[1]]
    s2 <- sds[[2]]
  }

  denom <- ifelse(ref %in% "grp1", s1^2, s2^2)
  num <- ifelse(ref %in% "grp1", s2^2, s1^2)
  vr <- ifelse(log, log(denom / num), denom / num)
  return(vr)
}


## Tail ratios: ----
### Parametric tail ratios: ----
parametric_tr <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, ref = c("grp1", "grp2"),
                          tail = c("lower", "upper"), cutoff) {

  if (!is.null(x) && !is.null(INDEX)) {
    univar_stats <- smd_stats(x, INDEX, type = "univariate")
    for (i in names(univar_stats)) {
      assign(i, univar_stats[[i]])
    }
    s1 <- sqrt(var1)
    s2 <- sqrt(var2)
  }

  cdf_grp1 <- pnorm(cutoff, m1, s1)
  cdf_grp2 <- pnorm(cutoff, m2, s2)

  tr <- switch(ref,
               "grp1" = ifelse(tail %in% "lower", cdf_grp1 / cdf_grp2, (1 - cdf_grp1) / (1 - cdf_grp2)),
               "grp2" = ifelse(tail %in% "lower", cdf_grp2 / cdf_grp1, (1 - cdf_grp2) / (1 - cdf_grp1)),
               NULL)
  return(tr)
}

### Non-parametric tail ratios: ----
# Apprxomiate tail ratios based on a kernel density estimator of choice:
non_parametric_tr_approx <- function(x, INDEX, ref = c("grp1", "grp2"), tail = c("lower", "upper"),
                                     cutoff, bw = "nrd0", kernel = c("gaussian",
                                                                     "epanechnikov",
                                                                     "rectangular",
                                                                     "triangular",
                                                                     "biweight",
                                                                     "cosine",
                                                                     "optcosine")) {
  dat <- split(x, INDEX)
  num_intervals <- abs(diff(range(unlist(dat)))) * 10
  d1 <- density(dat[[1]], bw = bw, kernel = kernel)
  d2 <- density(dat[[2]], bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  min <- ifelse(tail %in% "lower", max(min(d1$x), min(d2$x)), cutoff)
  max <- ifelse(tail %in% "lower", cutoff, min(max(d1$x), max(d2$x)))
  interval <- seq(min, max, length.out = num_intervals)
  grp1_tail <- integrate(f1, min, max)$value
  grp2_tail <- integrate(f2, min, max)$value
  tr <- ifelse(ref %in% "grp1", grp1_tail / grp2_tail, grp2_tail / grp1_tail)
  return(tr)

}

# give exact tail ratios (equivalent to risk ratios) when enough observations are
# present below the cutoff in each group - otherwise call non_parametric_approx
# to yield approximate tail ratios.
non_parametric_tr <- function(x, INDEX, ref = c("grp1", "grp2"), tail = c("lower", "upper"), cutoff,
                              bw = "nrd0", kernel = c("gaussian",
                                                      "epanechnikov",
                                                      "rectangular",
                                                      "triangular",
                                                      "biweight",
                                                      "cosine",
                                                      "optcosine")) {
  dat <- split(x, INDEX)
  n1 <- length(dat[[1]])
  n2 <- length(dat[[2]])

  n1_below <- sum(dat[[1]] <= cutoff)
  n1_above <- sum(dat[[1]] >= cutoff)

  n2_below <- sum(dat[[2]] <= cutoff)
  n2_above <- sum(dat[[2]] >= cutoff)

  bool <- ifelse(tail %in% "lower", any(c(n1_below, n2_below) == 0), any(c(n1_above, n2_above) == 0))
  if (bool) {
    return(non_parametric_tr_approx(x, INDEX, ref, tail, cutoff, bw, kernel))
  } else {
    grp1_below <- n1_below / n1
    grp1_above <- n1_above / n1
    grp2_below <- n2_below / n2
    grp2_above <- n2_above / n2

    tr <- switch(ref,
                 grp1 = ifelse(tail %in% "lower", grp1_below / grp2_below, grp1_above / grp2_above),
                 grp2 = ifelse(tail %in% "lower", grp2_below / grp1_below, grp2_above / grp1_above)
    )

    return(tr)
  }

}

## Mann Whitney ----

mann_whitney_based_ps <- function(x, INDEX, ignore_ties = FALSE) {
  # Mann Whitney u -----
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  if (!ignore_ties) {
    u <- calculate_u_with_ties(dataset1, dataset2)
    return(u / (length(dataset1) * length(dataset2)))
  }
  calculate_ps_ignoring_ties(dataset1, dataset2)
}

calculate_u_with_ties <- function(dataset1, dataset2) {
  u <- 0
  for (i in dataset1)
    for (j in dataset2) {
      if (i > j)
        u <- u + 1
      else if (i == j)
        u <- u + 0.5
    }
  u
}

calculate_ps_ignoring_ties <- function(dataset1, dataset2) {
  ties <- 0
  count <- 0
  for (x in seq_along(dataset1)) {
    for (y in seq_along(dataset2)) {
      if (dataset1[x] > dataset2[y]) count <- count + 1
      else if (dataset1[x] == dataset2[y]) ties <- ties + 1
    }
  }
  count / (length(dataset1) * length(dataset2) - ties)
}

ts_for_mann_whitney_based_ps <- function(INDEX, x, y = NULL) { # deviates by 0.02 from stat wilcoxin test which is continuity corrected
  if (is.null(y)) {
    dataset <- split(x, INDEX)
    x <- dataset[1]
    y <- dataset[2] }
  z_value <- calculate_z_for_u_statistic(x, y)
  p_value <- calculate_p_value_from_z(z_value)
  return(list(p = p_value, z = z_value))
}

calculate_p_value_from_z <- function(z) {
  result <- 2 * pnorm(-abs(z))
}

calculate_z_for_u_statistic <- function(dataset1, dataset2) {
  u <- calculate_u_with_ties(dataset1, dataset2)
  n1 <- length(dataset1)
  n2 <- length(dataset2)
  numerator <- u - ((n1 * n2) / 2)
  denominator <- sqrt((n1 * n2 * (n1 + n2 + 1)) / 12)
  result <- numerator / denominator
  result
}

mann_whitney_based_ps_ci <- function(x, INDEX, alpha = 0.05) {
  #second method from Newcombe (2005)
  dataset <- split(vals, grp)
  m <- length(dataset[[1]])
  n <- length(dataset[[2]])
  delta <- mann_whitney_based_ps(x, INDEX)
  variance <- delta *
    (1 - delta) *
    (1 + (n - 1) * (1 - delta) / (2 - delta) + (m - 1) * delta / (1 + delta)) / (m * n)
  z <- qnorm(1 - alpha)
  lower_limit <- delta - z * sqrt(variance)
  if (lower_limit < 0) {
    lower_limit <- 0
    warning("The lower limit of the confidence interval was set to 0 since it can not be smaller than 0")
  }
  upper_limit <- delta + z * sqrt(variance)
  if (upper_limit > 1) {
    upper_limit <- 1
    warning("The upper limit of the confidence interval was set to 1 since it cannot be larger than 1")
  }
  return(list(lower_limit = lower_limit, upper_limit = upper_limit))
}


ps_dependent_groups <-
  function(x, y, ignore_ties = FALSE) {
    # probability of superiority for dependent groups ----
    dataset1 <- x
    dataset2 <- y
    if (length(dataset1) != length(dataset2))
      stop("\n length of datasets for dependent groups has to be the same!")
    n <- length(dataset1)
    w <- 0
    ties <- 0
    for (i in seq_along(dataset1)) {
      if (dataset1[i] > dataset2[i]) {
        w <- w + 1
      }
      else if (dataset1[i] == dataset2[i]) {
        if (!ignore_ties) {
          w <- w + 0.5
        }
        else
          ties <- ties + 1
      }
    }
    return(w / (n - ties))
  }


ps_dependent_groups_ci <- function(x, y, alpha = 0.05) {
  #Pratt's confidence interval
  dataset1 <- x
  dataset2 <- y
  if (length(dataset1) != length(dataset2))
    stop("\n length of datasets for dependent groups has to be the same!")
  n <- length(dataset1)
  w <- 0
  for (i in seq_along(dataset1)) {
    if (dataset1[i] > dataset2[i]) w <- w + 1
    else if (dataset1[i] > dataset2[i]) w <- w + 0.5
  }
  # upper boundary of ci
  z <- qnorm(1 - alpha / 2)
  a <- ((w + 1) / (n - w))^2
  b <- 81 * (w + 1) * (n - w) - 9 * n - 8
  c <- -3 * z * sqrt(9 * (w + 1) * (n - w) * (9 * n + 5 - z^2) + n + 1)
  d <- 81 * (w + 1)^2 - 9 * (w + 1) * (2 + z^2) + 1
  e <- 1 + a * ((b + c) / d)^3
  upper_bound <- 1 / e
  # lower boundary of ci
  a <- (w / n - w - 1)^2
  b <- 81 * w * (n - w - 1) - 9 * n - 8
  c <- 3 * z * sqrt(9 * (n - w - 1) * (9 * n + 5 - z^2) + n + 1)
  d <- 81 * w^2 - 9 * w * (2 + z^2) + 1
  e <- 1 + a * ((b + c) / d)^3
  lower_bound <- 1 / e
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

generalized_odds_ratio <- function(x, INDEX = NULL, y = NULL, ignore_ties = FALSE) {
  # generalized odds ratio-----
  # ties are counted as 0.5
  if (is.null(y)) ps <- mann_whitney_based_ps(x, INDEX, ignore_ties = ignore_ties)
  else {
    ps <- ps_dependent_groups(x, y, ignore_ties = ignore_ties) }
  return(ps / (1 - ps))
}

generalized_odds_ratio_ci <- function(INDEX, x, y = NULL, reverse = FALSE) {
  if (is.null(y)) {
    dataset1 <- split(x, INDEX)[[1]]
    dataset2 <- split(x, INDEX)[[2]]
  }
  else {
    dataset1 <- x
    dataset2 <- y
  }
  if (!reverse)cohen_d <- smd_uni(effsize = "cohen_d", n1 = length(dataset1), n2 = length(dataset2), m1 = mean(dataset1), m2 = mean(dataset2), var1 = var(dataset1), var2 = var(dataset2))
  else cohen_d <- smd_uni(effsize = "cohen_d", n1 = length(dataset2), n2 = length(dataset1), m1 = mean(dataset2), m2 = mean(dataset1), var1 = var(dataset2), var2 = var(dataset1))
  cohen_d_ci <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))[2:3]
  delta_l <- cohen_d_ci[[1]]
  delta_u <- cohen_d_ci[[2]]
  w_l <- pnorm(delta_l / sqrt(2))
  w_u <- pnorm(delta_u / sqrt(2))
  lower_bound <- w_l / (1 - w_l)
  upper_bound <- w_u / (1 - w_u)
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

dominance_measure_based_es <- function(x, INDEX, y = NULL) {
  # dominance measure ----
  if (!is.null(y)) { dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  }
  if (!is.null(y))return(ps_without_counting_ties(dataset1, dataset2) - ps_without_counting_ties(dataset2, dataset1))
  return(ps_dependent_groups(x, y) - ps_dependent_groups(x, y))
}

ps_without_counting_ties <- function(dataset1, dataset2) {
  u <- 0
  n <- length(dataset1)
  m <- length(dataset2)
  for (x in dataset1)
    for (y in dataset2) {
      if (x > y) u <- u + 1
    }
  return(u / (n * m))
}

dominance_measure_ci <- function(x, INDEX, dependent = FALSE) {
  if (!dependent) cis <- mann_whitney_based_ps_ci(x, INDEX)
  else cis <- ps_dependent_groups_ci(x, INDEX)
  lower_bound <- 2 * cis[[1]] - 1
  upper_bound <- 2 * cis[[2]] - 1
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}


common_language_es <- function(x, INDEX) {
  # common language effect size based on del guidice-----
  d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  return(pnorm(abs(d) / sqrt(2)))
}

common_language_es_ci <- function(x, INDEX, cohen_d) {
  cohen_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)
  cis <- smd_ci(effsize = "cohen_d", val = cohen_d, x = x, INDEX = INDEX)[2:3]
  lower_bound <- pnorm(cis[[1]] / sqrt(2))
  upper_bound <- pnorm(cis[[2]] / sqrt(2))
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

probability_of_correct_classification_es <- function(x, INDEX) {
  # probability of correct classification----
  # when assumptions of normality and equality of variances/coveriances are not satisfied this gives inadequate results
  d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  return(pnorm(abs(d) / 2))
}

probability_of_correct_classification_ci <- function(x, INDEX) {
  dataset1 <- split(x, INDEX)[[1]]
  dataset2 <- split(x, INDEX)[[2]]
  cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]])
  cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))[2:3]
  lower_bound <- pnorm(cis[[1]] / 2)
  upper_bound <- pnorm(cis[[2]] / 2)
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}


# overlap measures ----
non_parametric_overlapping_coefficient <-
  function(x,
           INDEX,
           bw = "nrd0",
           kernel = c(
             "gaussian",
             "epanechnikov",
             "rectangular",
             "triangular",
             "biweight",
             "cosine",
             "optcosine"
           )) {
    original_dataset <- split(x, INDEX)
    num_intervals <- 10
    d1 <- density(original_dataset[[1]], bw = bw, kernel = kernel)
    d2 <- density(original_dataset[[2]], bw = bw, kernel = kernel)
    f1 <- approxfun(d1$x, d1$y)
    f2 <- approxfun(d2$x, d2$y)
    min <-
      max(min(d1$x), min(d2$x)) #we need the max value of the minimums since the other function is not defined in the true min of both functions
    max <-
      min(max(d1$x), max(d2$x)) #we need the min value of the maximums since the other function is not defined in the true max of both functions
    stepsize <- (max - min) / num_intervals
    interval <- seq(min, max, by = stepsize)
    sum <- 0
    #approximation based on Trapezoid rule
    for (x in seq(length(interval) - 1)) {
      sum <-
        sum + 1 / 2 * (min(f1(interval[x]), f2(interval[x])) + min(f1(interval[x +
                                                                                 1]), f2(interval[x + 1])))
    }
    return((max - min) / num_intervals * sum)
  }

ovl_parametric <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x)) cohens_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  else cohens_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
  2 * pnorm(-abs(cohens_d) / 2)
}

ovl_parametric_ci <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x)) {
    dataset1 <- split(x, INDEX)[[1]]
    dataset2 <- split(x, INDEX)[[2]]
    cohen_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  }
  else cohen_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
  if (!is.null(x))cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))[2:3]
  else cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = m1, n2 = m2, var1 = var1, var2 = var2)[2:3]
  lower_bound <- 2 * pnorm(-abs(cohen_d_cis[[1]]) / 2)
  upper_bound <- 2 * pnorm(-abs(cohen_d_cis[[2]]) / 2)
  list(lower_bound = lower_bound, upper_bound = upper_bound)
}


overlapping_coefficient_two <- function(x, INDEX, parametric = FALSE) {
  if (!parametric) ovl <- non_parametric_overlapping_coefficient(x, INDEX)
  else ovl <- ovl_parametric(x, INDEX)
  return(ovl / (2 - ovl))
}


cohens_coefficient_of_nonoverlap_u1 <- function(x, INDEX, parametric = FALSE) {
  if (!parametric) ovl <- non_parametric_overlapping_coefficient(x, INDEX)
  else ovl <- ovl_parametric(x, INDEX)
  return(1 - ovl / (2 - ovl))
}

non_parametric_cohens_u3 <- function(x, INDEX) {
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  median_1 <- median(dataset1)
  median_2 <- median(dataset2)
  if (median_1 < median_2) {
    dataset1 <- dataset[[2]]
    dataset2 <- dataset[[1]]
  }
  median <- median(dataset1)
  result <- 1/length(dataset2) * sum(unlist(lapply(dataset2, function(x){ if (x<median) 1 else 0})))
  return(result)
}

parametric_cohens_u3_es <- function(x, INDEX, m1, m2, var1, var2, n1, n2, var_equal = TRUE) {
  if(var_equal){
    if (!missing(x) && !missing(INDEX)) cohens_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)
    else cohens_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
    return(pnorm(abs(cohens_d)))
  } else if(!var_equal){
    if(!missing(x) && !missing(INDEX)){
      original_dataset <- split(x, INDEX)
      dataset1 <- original_dataset[[1]]
      dataset2 <- original_dataset[[2]]
      if (mean(dataset1) > mean(dataset2)) {
        tmp <- dataset1
        dataset1 <- dataset2
        dataset2 <- tmp
      }
      glass_d <- smd_uni("glass_d", x = c(dataset1, dataset2), INDEX = rep(c(1,2), times = c(length(dataset1), length(dataset2))))
    }else{
      temp <- var1
      var1 <- ifelse(m2 > m1, var1, var2)
      var2 <- ifelse(m2 > m1, var2, temp)
      
      temp <- min(m1, m2)
      m2 <- max(m1, m2)
      m1 <- temp
      
      glass_d <- smd_uni("glass_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
    }
    return(pnorm(abs(glass_d)))
  }
}

parametric_cohens_u3_ci <- function(x, INDEX) {
  dataset1 <- split(x, INDEX)[[1]]
  dataset2 <- split(x, INDEX)[[2]]
  cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX))
  cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))[2:3]
  lower_bound <- pnorm(cohen_d_cis[[1]])
  upper_bound <- pnorm(cohen_d_cis[[2]])
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}


