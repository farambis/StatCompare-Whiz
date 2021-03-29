#TODO beim Upload prüfen, dass in der Gruppierungsvariable eh keine NAs vorhanden
# sind - diese werden nämlich bei Funktionen wie tapply ohne Warnung ignoriert

#TODO User sollen angeben wie die Faktoren zu rangreihen sind, damit in der server
# funktion die Gruppierungsvariable richtig faktorisiert werden kann


#TODO ask UST why the degrees of freedom is different in stats::t.test for the 
# Welch t-test than on the wikipedia and the Bortz and Schuster text book



# variables for examples:
#rm(list = ls())

m1 <- 100
m2 <- 110
sd1 <- 10
sd2 <- 15
n1 <-30
n2 <- 37
# n_NA <- 10

vals <- c(rnorm(n1, m1, sd1), rnorm(n2, m2, sd2))
# vals <- c(rnorm(n = n1 - n_NA/2, mean = m1, sd = sd1), rnorm(n = n2 - n_NA/2, mean = m2, sd = sd2), rep(NA, times = n_NA))
# vals <- vals[sample(1:length(vals))]
grp <- factor(rep(1:2, times = c(n1, n2)))
mat <- cbind(vals, c(rnorm(n1, m1, sd1), rnorm(n2, m2, sd2)), grp)



m1 <- mean(split(vals, grp)[[1]])
m2 <- mean(split(vals, grp)[[2]])
sd1 <- sd(split(vals, grp)[[1]])
sd2 <- sd(split(vals, grp)[[2]])
var1 <- var(split(vals, grp)[[1]])
var2 <- var(split(vals, grp)[[2]])
#winvar1 <- var(winsor((split(vals, grp))[[1]]))
#winvar2 <- var(winsor((split(vals, grp))[[2]]))
trim <- 0.2
ntr1 <- n1 - (2 * floor(trim * n1))
ntr2 <- n2 - (2 * floor(trim * n2))
trm1 <- mean(split(vals, grp)[[1]], trim = trim)
trm2 <- mean(split(vals, grp)[[2]], trim = trim)

effsize <- list("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar")

all_eff_sizes <- list(cohen_d = "cohen_d", hedges_g = "hedges_g", glass_d = "glass_d", glass_d_corr = "glass_d_corr", 
                      bonnet_d = "bonett_d", bonnet_d_corr = "bonett_d_corr", AKP_equvar = "AKP_eqvar", AKP_uneqvar = "AKP_uneqvar", mann_whitney_based_ps = "mann_whitney_based_ps", ovl_parametric = "ovl_parametric", ps_dependent = "ps_dependent")

all_test_statistics <- list(student_t_test = "student_t_test", mann_whitney = "mann_whitney")


generate_es_raw_data_dataframe <- function(es_list, INDEX = NULL, x, y) {
  if(!is.null(INDEX))dataset1 <- split(unlist(x), unlist(INDEX))[[1]] # if interface of smd_ci function fits in the x, INDEX structure we do not need to do this here
  if(!is.null(INDEX))dataset2 <- split(unlist(x), unlist(INDEX))[[2]]
  es_result <- c()
  es_ci_lower <- c()
  es_ci_upper <- c()
  for (i in es_list) {
    if (! i %in% all_eff_sizes) stop ("this is no offered effect size!\n")
    res <- switch(i, 
           "cohen_d" = c(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX), smd_ci(effsize = "cohen_d",val = smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX), n1 = length(dataset1), n2 = length(dataset2))),
           "mann_whitney_based_ps" = c(mann_whitney_based_ps(x = x, INDEX = INDEX), mann_whitney_based_ps_ci(x = x, INDEX = INDEX)), 
           "ovl_parametric" = c(ovl_parametric(x = x, INDEX = INDEX), ovl_parametric_ci(x = x, INDEX = INDEX)), 
           "ps_dependent" = c(ps_dependent_groups(x, y), ps_dependent_groups_ci(x, y))
           )
    es_result <- c(es_result,res[[1]])
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
   es_dataframe
}

generate_es_educational_dataframe <- function(es_list,  mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
   es_result <- c() 
   es_ci_lower <- c()
   es_ci_upper <- c()
  for (i in es_list) {
    if (! i %in% all_eff_sizes) stop ("this is no offered effect size!\n")
    res <- switch(i, 
                  "cohen_d" = c(smd_uni(effsize = "cohen_d", m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2 ), smd_ci("cohen_d", val = smd_uni(effsize = "cohen_d", m1 = mean1, m2 = mean2, var1 = standardDeviation1, var2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), n1 = mean1, n2 = mean2, var1 = standardDeviation1, var2 = standardDeviation2 )),
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
  es_dataframe
}

generate_ts_dataframe <- function(ts_list, INDEX = NULL, x = NULL, m1, m2, standardDeviation1, standardDeviation2, n1, n2) {
  ts_t_value <- c()
  ts_p_value <- c()
  ts_df <- c()
  for (i in ts_list) {
    if (! i %in% all_test_statistics) stop ("this is no offered test statistic!\n")
    if (!is.null(x)){
      res <- switch(i, 
              "student_t_test" = t_test(x = x, INDEX = INDEX, type = "student")[1:3]
              )}
    else {
      res <- switch(i, 
                       "student_t_test" = t_test(m1 = m1, m2 = m2, var1 = standardDeviation1^2, var2 = standardDeviation2^2,n1 =  n1, n2 = n2, type = "student")[1:3]
    )}
  ts_t_value <- c(ts_t_value, res[[1]])
  ts_p_value <- c(ts_p_value, res[[2]])
  ts_df <- c(ts_df, res[[3]])
  }
  ts_dataframe <- data.frame(
    ts_list, 
    ts_t_value, 
    ts_p_value, 
    ts_df
  )
  colnames(ts_dataframe) <- c("Name", "df", "t", "p")
  ts_dataframe
}


# winsor function
winsor <- function(x, trim = 0.2, na.rm = FALSE){
  
  # this function winsorizes a vector
  # 
  # x ...... vector to winsorize
  # trim ... percent of the values in the upper and lower tail to be replaced
  #          should be a number between 0 and 0.5
  #
  # the lower *trim* percent of the sorted vector is replaced with the lowest 
  # score that is not trimmed, and the upper *trim* percent of the sorted
  # vector is replaced by the largest non trimmed  score.
  
  if(na.rm) x <- x[!is.na(x)]
  
  if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
 
  
  y <- sort(x)
  
  i_lower <- floor(trim * length(y)) + 1
  i_upper <- (length(y) + 1) - i_lower
  
  val_lower <- y[i_lower]
  val_upper <- y[i_upper]
  
  y[1:i_lower] <- val_lower
  y[i_upper:length(y)] <- val_upper
  
  nmbr_nas <- sum(is.na(x))
  if(nmbr_nas != 0){
    warning("\nNAs present in x - these will be ignored for winsorization\nNAs will be added to the end of the winsorized vector\nSet na.rm = TRUE if you want NAs removed")
    nas <- rep(NA, times = nmbr_nas)
    return(c(y, nas))
  }
  
  return(y)
  
}








smd_corr <- function(x = NULL, INDEX = NULL, n1, n2, df, trim, type = c("hedges", "AKP", "bonett")){
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    ngroups <- length(unique(INDEX))
    
    ns <- tapply(x, INDEX, length, simplify = FALSE)
    for(i in 1:ngroups){
      assign(paste0("n", i), ns[[i]])
    }
  }
  

  res <-switch(type,
               "hedges" = exp(lgamma(df/2) - log(sqrt(df/2)) - lgamma((df - 1)/2)),
               "bonett" = sqrt((n1 + n2 - 2)/(n1 + n2 - 1)),
               "AKP" = sqrt(integrate(function(x){x^2*dnorm(x)}, qnorm(trim), qnorm(1 - trim))$value + 2 * qnorm(trim)^2 * trim)
                )

  return(res)
}













# smd_stats ---------------------------------------------------------------



smd_stats <- function(x, INDEX, trim = 0.2, type = c("univariate", "multivariate"), 
                      winvar = FALSE, na.rm = FALSE){
  
  
  
  if(!is.numeric(x)) stop("\nx must be numeric")
  
  if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
  
  grps <- unique(INDEX)
  if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
  if(any(is.na(grps))) stop("\nNAs present in INDEX")
  
  if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
  
  if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
  
  i_NA <- is.na(x)
  if(na.rm) {
    x <- x[!i_NA]
    INDEX <- INDEX[!i_NA]
  }
  if(!na.rm && any(i_NA)){
    return(NA)
    stop("\nNAs present in x")
  }
  
  if("univariate" %in% type){
    univar_stats <- function(x, trim = trim, winvar = winvar){
      m <- mean(x)
      n <- length(x)
      v <- var(x)
      trm <- mean(x, trim = trim)
      ntr <- n - (2 * floor(trim * n))
      if(winvar){
        winvar <- var(winsor(x, trim = trim))
      } else{
        winvar <- NULL
      }
      return(list(m = m, n = n, var = v, trm = trm, ntr = ntr, winvar = winvar))
    }
    
    univariate_res <- tapply(x, INDEX, univar_stats, trim = trim, winvar = winvar, simplify = FALSE)
    var_names <- names(univariate_res[[1]])
    univariate_res_names <- paste0(var_names, rep(1:2, each = length(var_names)))
    univariate_res <- unlist(univariate_res, recursive = FALSE)
    names(univariate_res) <- univariate_res_names
    
  }
  return(univariate_res)
}














sd_combined <- function(x = NULL, INDEX = NULL, var1, var2, n1, n2, winvar1, 
                        winvar2, ntr1, ntr2, winsor = FALSE, trim = 0.2, na.rm = FALSE,
                        type = c("pooled", "mean", "grp_1", "grp_2", "se_pooled", "se_welch", "se_yuen")){
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    if(!is.numeric(x)) stop("\nx must be numeric")
    
    if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
    
    grps <- unique(INDEX)
    if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
    if(any(is.na(grps))) stop("\nNAs present in INDEX")
    
    if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
    
    if(!(winsor %in% c(TRUE, FALSE))) stop("\nwinsorize must be set to TRUE or FALSE")
    
    if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
    
    i_NA <- is.na(x)
    if(na.rm) {
      x <- x[!i_NA]
      INDEX <- INDEX[!i_NA]
    }
    if(!na.rm && any(i_NA)){
      return(NA)
      stop("\nNAs present in x")
    }
    
    univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, type = "univariate", winvar = winsor)
    n1 <- univar_stats[["n1"]]
    n2 <- univar_stats[["n2"]]
    if(!winsor){
      var1 <- univar_stats[["var1"]]
      var2 <- univar_stats[["var2"]]
    } else{
      var1 <- univar_stats[["winvar1"]]
      var2 <- univar_stats[["winvar2"]]
    }
    
    
  } else{
    if(winsor){
      var1 <- winvar1
      var2 <- winvar2
    }
  }
  
  
  res <- switch(type,
                "pooled" = sqrt((((n1 - 1) * var1) + ((n2 - 1) * var2)) / (n1 + n2 - 2)),
                "mean" = sqrt((var1 + var2) / 2),
                "grp_1" = sqrt(var1),
                "grp_2" = sqrt(var2),
                "se_pooled" = sqrt((((n1 - 1) * var1) + ((n2 - 1) * var2)) / (n1 + n2 - 2) * ((1/n1)+ (1/n2))), 
                "se_welch" = sqrt((var1/n1) + (var2/n2)),
                "se_yuen" = sqrt(((n1 - 1) * var1/(ntr1*(ntr1 - 1))) + ((n2 - 1) * var2/(ntr2*(ntr2 - 1))))
  )
  
  return(res)
}








# standard mean deviation univariate -------------------------------------------------


smd_uni <- function(effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                                 "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"), 
                     x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2, trm1, 
                    trm2, winvar1, winvar2, ntr1, ntr2, na.rm = FALSE, trim = 0.2){
  
  # this function
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    if(!is.numeric(x)) stop("\nX must be numeric")
    
    if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
    
    grps <- unique(INDEX)
    if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
    if(any(is.na(grps))) stop("\nNAs present in INDEX")
    
    if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
    
    if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
    
    i_NA <- is.na(x)
    if(na.rm) {
      x <- x[!i_NA]
      INDEX <- INDEX[!i_NA]
    }
    if(!na.rm && any(i_NA)){
      stop("\nNAs present in x")
    }
    if("AKP_eqvar" %in% effsize || "AKP_uneqvar" %in% effsize){
      winvar <- TRUE
    } else{
      winvar <- FALSE
    }
    univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar, 
                              type = "univariate")
    for(i in 1:length(univar_stats)){
      assign(names(univar_stats)[[i]], univar_stats[[i]])
    }
    
  }
  
  res <- switch(effsize, 
                "cohen_d" = (m1 - m2)/sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "pooled"),
                "hedges_g" = smd_corr(df = n1 + n2 - 2, type = "hedges") * (m1 - m2)/sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "pooled"),
                "glass_d" = (m1 - m2)/sd_combined(var1 = var1, type = "grp_1"),
                "glass_d_corr" = smd_corr(df = n1 - 1, type = "hedges") * (m1 - m2)/sd_combined(var1 = var1, type = "grp_1"), 
                "bonett_d" = (m1 - m2)/sd_combined(var1 = var1, var2 = var2, type = "mean"),
                "bonett_d_corr" = smd_corr(df = n1 + n2 - 2, type = "hedges") * (m1 - m2)/sd_combined(var1 = var1, var2 = var2, type = "mean"),
                "AKP_eqvar" = smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * (trm1 - trm2)/sd_combined(winvar1 = winvar1, winvar2 = winvar2, n1 = n1, n2 = n2, type = "pooled", winsor = TRUE, trim = trim),
                "AKP_uneqvar" = smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * (trm1 - trm2)/sd_combined(winvar1 = winvar1, winvar2 = winvar2, type = "grp_1", winsor = TRUE, trim = trim))
  
  names(res) <- effsize

  
  return(res)

}




































smd_boot <- function(x, INDEX, effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                                           "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"),
                     alpha = 0.05, nboot = 200, trim = 0.2, na.rm = TRUE){
  
  
  
  if(!is.numeric(x)) stop("\nX must be numeric")
  
  if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
  
  grps <- unique(INDEX)
  if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
  if(any(is.na(grps))) stop("\nNAs present in INDEX")
  
  if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
  
  if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
  
  if(alpha < 0 || alpha > 0.99) stop("\alpha < 0 or > 0.99, specify a value within these bounds")
  
  
  
    original <- split(x = x, f = INDEX)
    INDEX <- sort(as.factor(INDEX))
    boot_dat <- rep(list(numeric(length = length(x))), times = nboot)
    for(i in 1:nboot){
      boot_dat[[i]] <- c(sample(original[[1]], replace = TRUE), 
                         sample(original[[2]], replace = TRUE))
    }
    boot_val <- sort(
      unlist(
        lapply(boot_dat, FUN = smd_uni, effsize = effsize, INDEX = INDEX, trim = trim), 
        use.names = FALSE)
    )
    lower <- nboot * (alpha/2)
    upper <- nboot - lower
    cl_lower <- boot_val[lower + 1]
    cl_upper <- boot_val[upper]
    return(list(cil = cl_lower, ciu = cl_upper))
  
}

boot <- function(x, INDEX, alpha = 0.05, n_boot = 200,  FUN) {
  
  original <- split(x = x, f = INDEX)
  boot_dat <- rep(list(numeric(length = length(x))), times = n_boot)
  boot_dat <- lapply(boot_dat, function(y){c(sample(original[[1]], size = length(original[[1]]),  replace = TRUE), sample(original[[2]], size = length(original[[2]]),  replace = TRUE))})
  boot_val <- sort(
    unlist(
      lapply(boot_dat, function(x) {FUN(x[1:length(original[[1]])], x[length(original[[1]]+1): length(x)])}), # give datasets to es function
      use.names = FALSE)
  )
  lower <- n_boot * (alpha/2)
  upper <- n_boot - lower
  cl_lower <- boot_val[lower + 1]
  cl_upper <- boot_val[upper]
  return(list(cil = cl_lower, ciu = cl_upper))
}

















# exact/approximate cis for standardized mean differences
smd_ci <- function(effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                               "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"),
                   val, n1, n2, n, var1, var2, ntr1, ntr2, winvar1, winvar2, trim, alpha = 0.05){
  
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
  
  
  tail <- 1 - alpha/2
  
  df <- switch(effsize,
               "cohen_d" = n1 + n2 - 2,
               "hedges_g" = n1 + n2 - 2,
               "glass_d" = n1 - 1,
               "glass_d_corr" = n1 - 1,
               "bonett" = n1 + n2 - 2,
               "bonett_d_corr" = n1 + n2 - 2,
               "AKP_eqvar" = ntr1 + ntr2 - 2,
               "AKP_uneqvar" = ntr1 - 1)
  
  if(effsize %in% c("bonett_d", "bonett_d_corr")){
    sdm <- sd_combined(var1 = var1, var2 = var2, type = "mean")
    
    ls_var <- switch(effsize,
                     "bonett_d" = val^2 * (var1^2/(n1 - 1) + var2^2/(n2 - 1))/(8 * sdm^4) + (var1/(sdm^2 * (n1 - 1))) + var2/(sdm^2 * (n2 - 1)),
                     "bonett_d_corr" = (val^2 * (var1^2/(n1 - 1) + var2^2/(n2 - 1))/(8 * sdm^4) + (var1/(sdm^2 * (n1 - 1))) + var2/(sdm^2 * (n2 - 1))) * (smd_corr(df = n1 + n2 - 2, type = "hedges")^2)
    )
  } else{
    
    ncp <- switch(effsize,
                  "cohen_d" = val/sqrt((1/n1) + (1/n2)),
                  "hedges_g" = val/(smd_corr(df = df, type = "hedges") * sqrt((1/n1) + (1/n2))),
                  "glass_d" = val/sqrt((1/n1) +(var2/(n2 * var1))),
                  "glass_d_corr" = val/(smd_corr(df = df, type = "hedges") * sqrt((1/n1) +(var2/(n2 * var1)))),
                  "AKP_eqvar" = sqrt((ntr1 * ntr2)/(ntr1 + ntr2)) * ((trm1 - trm2)/sqrt(((n1 + n2 - 2) * (sd_combined(winvar1 = winvar1, winvar2 = winvar2, n1 = n1, n2 = n2, type = "pooled", winsor = TRUE, trim = trim)^2))/(ntr1 + ntr2 - 2))),
                  "AKP_uneqvar" = val/(smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * sqrt(((n1 - 1)/(ntr1*(ntr1 - 1))) + (((n2 - 1) * winvar2)/((ntr2 * (ntr2 - 1)) * winvar1))))
    )
    
    
    
    
    
    cibound_candidates <- c(min(-5, -abs(ncp) * 7), max(5, abs(ncp)*7))
    
    
    ncp_ci_lower <- suppressWarnings(
      uniroot(f = function(x){
        pt(q = ncp, df = df, ncp = x) - tail
      },
      interval = cibound_candidates)
    )$root
    
    
    ncp_ci_upper <- suppressWarnings(
      uniroot(f = function(x){
        pt(q = ncp, df = df, ncp = x) - alpha/2
      },
      interval = cibound_candidates)
    )$root
    
    ncp_cis <- c(ncp_ci_lower, ncp_ci_upper)
    
  } 
  
  
  
  smd_ci <- switch(effsize,
                   "cohen_d" = ncp_cis * sqrt((1/n1) + (1/n2)),
                   "hedges_g" = ncp_cis * (smd_corr(df = df, type = "hedges") * sqrt((1/n1) + (1/n2))),
                   "glass_d" = ncp_cis * sqrt((1/n1) +(var2/(n2 * var1))),
                   "glass_d_corr" = ncp_cis * (smd_corr(df = df, type = "hedges") * sqrt((1/n1) +(var2/(n2 * var1)))),
                   "bonett_d" = val + (c(qnorm(alpha/2), qnorm(tail)) * sqrt(ls_var)),
                   "bonett_d_corr" = val + (c(qnorm(alpha/2), qnorm(tail)) * sqrt(ls_var)),
                   "AKP_eqvar" = ncp_cis * (smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * sqrt(((ntr1 + ntr2)*(n1 + n2 - 2))/(ntr1 * ntr2 * (ntr1 + ntr2 - 2)))),
                   "AKP_uneqvar" = ncp_cis * (smd_corr(n1 = n1, n2 = n2, trim = trim, type = "AKP") * sqrt(((n1 - 1)/(ntr1*(ntr1 - 1))) + (((n2 - 1) * winvar2)/((ntr2 * (ntr2 - 1)) * winvar1))))
  )
  
  res <- list(cil = smd_ci[[1]], ciu = smd_ci[[2]])
  return(res)
}


# smd_cis example:
#effsizes <- lapply(effsize, smd_uni, x = vals, INDEX = grp)
#effsizes_cis <- rep(list(numeric(length = 2)), times = length(effsizes))
#for(i in seq_len(length(effsizes))){
  
 # effsizes_cis[[i]] <- smd_ci(effsize = names(effsizes[[i]]), val = effsizes[[i]], n1 = n1, n2 = n2, var1 = var1, var2 = var2, winvar1 = winvar1, winvar2 = winvar2, ntr1 = ntr1, ntr2 = ntr2, trim = trim)
#}

#effsizes_cis



t_test <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2, trm1, trm2, winvar1, winvar2, ntr1, ntr2,
                   paired = FALSE, alpha = 0.05, na.rm = TRUE, type = c("student", "welch", "yuen")){
  
  
  
  if(!(paired %in% c(TRUE, FALSE))) stop("\npaired must be set to TRUE or FALSE")
  
  if(!paired){
    
    if(!is.null(x) && !is.null(INDEX)){
      
      if(!is.numeric(x)) stop("\nX must be numeric")
      
      if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
      
      grps <- unique(INDEX)
      if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
      if(any(is.na(grps))) stop("\nNAs present in INDEX")
      
      if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
      
      if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
      
      i_NA <- is.na(x)
      if(na.rm) {
        x <- x[!i_NA]
        INDEX <- INDEX[!i_NA]
      }
      if(!na.rm && any(i_NA)){
        stop("\nNAs present in x")
      }
      if("yuen" %in% type){
        winvar <- TRUE
      } else{
        winvar <- FALSE
      }
      univar_stats <- smd_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar, 
                                type = "univariate")
      for(i in 1:length(univar_stats)){
        assign(names(univar_stats)[[i]], univar_stats[[i]])
      }
      
    }
    
    if("student" %in% type){
      t_student <- (m1 - m2)/sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_pooled")
      df_student <- n1 + n2 - 2
      p_student <- 2 * (1 - pt(q = abs(t_student), df = df_student))
    } else{
      t_student <- NULL
      df_student <- NULL
      p_student <- NULL
    }
    
    if("welch" %in% type){
      se_welch <- sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_welch")
      t_welch <- (m1 - m2)/se_welch
      df_welch_num <- se_welch^4
      df_welch_denom <- (var1^2/(n1^2 * (n1 - 1))) + (var2^2/(n2^2 * (n2 - 1)))
      df_welch <- df_welch_num/df_welch_denom
      p_welch <- 2 * (1 - pt(q = abs(t_welch), df = df_welch))
    } else{
      t_welch <- NULL
      df_welch <- NULL
      p_welch <- NULL
    }
    
    if("yuen" %in% type){
      d1 <- (n1 - 1) * winvar1/(ntr1*(ntr1 - 1))
      d2 <- (n2 - 1) * winvar2/(ntr2*(ntr2 - 1))
      t_yuen <- (trm1 - trm2)/sqrt(d1 + d2)
      df_yuen_num <- (d1 + d2)^2
      df_yuen_denom <- d1^2/(ntr1 - 1) + d2^2/(ntr2 - 1)
      df_yuen <- df_yuen_num/df_yuen_denom
      p_yuen <- 2 * (1 - pt(q = abs(t_yuen), df = df_yuen))
    } else{
      t_yuen <- NULL
      df_yuen <- NULL
      p_yuen <- NULL
    }
    
    return(list(t_student = t_student, df_student = df_student, p_student = p_student, 
                t_welch = t_welch, df_welch = df_welch, p_welch = p_welch, 
                t_yuen = t_yuen, df_yuen = df_yuen, p_yuen = p_yuen))
  }
  
  
}



# Effect Sizes that go beyond comparison of the mean  -------------------------------------------



mann_whitney_based_ps <- function(x, INDEX, ignore_ties = FALSE) {
  # Mann Whitney u -----
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  if(!ignore_ties) {
    u <- calculate_u_with_ties(dataset1, dataset2)
    return (u/(length(dataset1)*length(dataset2)))
  }
  calculate_ps_ignoring_ties(dataset1, dataset2)
}

calculate_u_with_ties <- function(dataset1, dataset2) { 
  u<- 0
  for (i in dataset1)
    for (j in dataset2) {
      if (i > j)
        u<-u+ 1
      else if (i == j)
        u<-u+ 0.5
    }
  u
}

calculate_ps_ignoring_ties <- function(dataset1, dataset2) {
  ties <- 0 
  count <- 0 
  for (x in seq_along(dataset1)) {
    for (y in seq_along(dataset2)){
      if (dataset1[x]>dataset2[y]) count <- count + 1
      else if (dataset1[x] == dataset2[y]) ties <- ties +1
    }
  }
  count/(length(dataset1)*length(dataset2)-ties)
}

p_value_for_mann_whitney_based_ps <- function(x, INDEX) { # deviates by 0.02 from stat wilcoxin test which is continuity corrected
  dataset <- split(x, INDEX)
  return(calculate_p_value_from_z(calculate_z_for_u_statistic(dataset[[1]], dataset[[2]])))
}

calculate_p_value_from_z <- function(z) {
  result <- 2*pnorm(-abs(z))
}

calculate_z_for_u_statistic <- function(dataset1, dataset2) {
  u <- calculate_u_with_ties(dataset1, dataset2)
  n1 <- length(dataset1) 
  n2 <- length(dataset2) 
  numerator <- u-((n1*n2)/2)
  denominator <- sqrt((n1*n2*(n1+n2+1))/12)
  result <- numerator/denominator
  result
}

mann_whitney_based_ps_ci <- function(x, INDEX, alpha = 0.05) {
  #second method from Newcombe (2005)
  dataset <- split(vals, grp)
  m <- length(dataset[[1]])
  n <- length(dataset[[2]])
  delta <- mann_whitney_based_ps(x, INDEX)
  variance <- delta * (1-delta) *(1+(n-1)*(1-delta)/(2-delta)+(m-1)*delta/(1+delta))/(m*n)
  z <- qnorm(1 - alpha)
  lower_limit <- delta - z * sqrt(variance)
  if (lower_limit < 0) {
    lower_limit <- 0 
    warning("The lower limit of the confidence interval was set to 0 since it can not be smaller than 0")
  } 
  upper_limit <- delta + z * sqrt(variance)
  if (upper_limit>1) {
    upper_limit <- 1 
    warning("The upper limit of the confidence interval was set to 1 since it cannot be larger than 1")
  } 
  return (list(lower_limit = lower_limit, upper_limit =  upper_limit))
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
    return (w / (n - ties))
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
  z <- qnorm(1 - alpha/2)
  a <- ((w+1)/(n-w))^2
  b <- 81*(w+1)*(n-w)-9*n - 8 
  c <- -3*z*sqrt(9*(w+1)*(n-w)*(9*n+5-z^2)+n+1) 
  d <- 81*(w + 1)^2 - 9*(w+1)*(2+z^2) + 1
  e <- 1+a*((b+c)/d)^3
  upper_bound <- 1/e
  # lower boundary of ci 
  a <- (w/n-w-1)^2
  b <- 81*w*(n-w-1) - 9*n - 8 
  c <- 3*z*sqrt(9*(n-w-1)*(9*n+5-z^2)+n+1)
  d <- 81*w^2 - 9 *w*(2+z^2)+1
  e <- 1+a*((b+c)/d)^3
  lower_bound <- 1/e
  return (list(lower_bound = lower_bound, upper_bound = upper_bound))
}

generalized_odds_ratio <- function(x, INDEX, dependent = FALSE, ignore_ties = FALSE) {
  # generalized odds ratio-----
  # ties are counted as 0.5
  if (!dependent) ps <- mann_whitney_based_ps(x, INDEX, ignore_ties = ignore_ties) 
  else {
    dataset <- split(x, INDEX)
    ps <- ps_for_dependent_groups(dataset[[1]], dataset[[2]], ignore_ties = ignore_ties)}
  return (ps/(1-ps))
}

generalized_odds_ratio_ci<- function(x, INDEX, reverse = FALSE) {
  dataset1 <- split(x, INDEX)[[1]]
  dataset2 <- split(x, INDEX)[[2]]
  if (!reverse)cohen_d <- smd_uni(effsize = "cohen_d", x, INDEX)
  else cohen_d <- smd_uni(effsize = "cohen_d",n1 = length(dataset2), n2=length(dataset1), m1 = mean(dataset2), m2 = mean(dataset1), var1 = var(dataset2), var2 = var(dataset1))
  cohen_d_ci <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))
  delta_l <- cohen_d_ci[[1]] 
  delta_u <- cohen_d_ci[[2]] 
  w_l <- pnorm(delta_l/sqrt(2))
  w_u <- pnorm(delta_u/sqrt(2))
  lower_bound <- w_l/(1-w_l)
  upper_bound <- w_u/(1 - w_u)
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

dominance_measure_based_es <- function(x, INDEX, dependent = FALSE) {
  # dominance measure ----
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  if (!dependent)return (ps_without_counting_ties(dataset1, dataset2) - ps_without_counting_ties(dataset2, dataset1))
  return (ps_for_dependent_groups(dataset1, dataset2) - ps_for_dependent_groups(dataset2, dataset1))
}

ps_without_counting_ties <- function(dataset1, dataset2) {
  u <- 0 
  n <- length(dataset1)
  m <- length(dataset2)
  for (x in dataset1)
    for (y in dataset2){
      if (x > y) u <- u+1
    }
  return (u / (n * m))
}

dominance_measure_ci <- function(x, INDEX, dependent = FALSE) {
  if (!dependent) cis <- mann_whitney_based_ps_ci(x, INDEX)
  else cis <- ps_dependent_groups_ci(x, INDEX)
  lower_bound <- 2 * cis[[1]] - 1
  upper_bound <- 2 * cis[[2]] - 1
  return (list(lower_bound = lower_bound, upper_bound = upper_bound))
}


common_language_es <- function(x, INDEX) { 
  # common language effect size based on del guidice-----
  d <- smd_uni(effsize = "cohen_d", x= x, INDEX = INDEX)[[1]]
  return (pnorm(abs(d)/sqrt(2)))
}

common_language_es_ci <- function(x, INDEX, cohen_d) {
  split(x, INDEX)
  cis <- smd_ci(effsize = "cohen_d", val = abs(cohen_d), n1 = length(dataset[[1]]), n2 = length(dataset[[2]]), var1 = var(dataset[[1]]), var2 = var(dataset[[2]]))
  lower_bound <- pnorm(cis[[1]]/sqrt(2))
  upper_bound <- pnorm(cis[[2]]/sqrt(2))
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

probability_of_correct_classification_es <- function(x, INDEX) {
 # probability of correct classification----
  # when assumptions of normality and equality of variances/coveriances are not satisfied this gives inadequate results
  d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  return (pnorm(abs(d)/2))
}

probability_of_correct_classification_ci <- function(x, INDEX) {
 dataset1 <- split(x, INDEX)[[1]]
 dataset2 <- split(x, INDEX)[[2]]
 cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]])
 cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))
 lower_bound <- pnorm(cis[[1]]/2)
 upper_bound <- pnorm(cis[[2]]/2)
 return (list(lower_bound = lower_bound, upper_bound = upper_bound))
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
    return ((max - min) / num_intervals * sum)
  }

ovl_parametric <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2 ) {
  if (!is.null(x)) cohens_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  else cohens_d <- smd_uni(effsize = "cohen_d", m1 =  m1, m2 =  m2, var1 =  var1, var2 = var2, n1 =  n1, n2 = n2)
  2*pnorm(-abs(cohens_d)/2)
}

ovl_parametric_ci <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x)) {
    dataset1 <- split(x, INDEX)[[1]]
    dataset2 <- split(x, INDEX)[[2]]
    cohen_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  }
  else cohen_d <- smd_uni(effsize = "cohen_d", m1 =  m1, m2 =  m2, var1 =  var1, var2 = var2, n1 =  n1, n2 = n2)
  if(!is.null(x))cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))
  else cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = m1, n2 = m2, var1 = var1, var2 = var2 )
  lower_bound <- 2*pnorm(-abs(cohen_d_cis[[1]])/2)
  upper_bound <- 2*pnorm(-abs(cohen_d_cis[[2]])/2)
  list(lower_bound = lower_bound, upper_bound = upper_bound)
}


overlapping_coefficient_two <- function(x, INDEX, parametric = FALSE) {
  if (!parametric) ovl <- non_parametric_overlapping_coefficient(x, INDEX)
  else ovl <- parametric_overlapping_coefficient(x, INDEX)
  return (ovl/(2-ovl))
}


cohens_coefficient_of_nonoverlap_u1 <- function(x, INDEX, parametric = FALSE) {
  if(!parametric) ovl <- non_parametric_overlapping_coefficient(x, INDEX)
  else ovl <- parametric_overlapping_coefficient(x, INDEX)
  return (1-ovl/(2-ovl))
}

non_parametric_cohens_u3_ci <- function(x, INDEX) {
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  mean_1 <- mean(dataset1)
  mean_2 <- mean(dataset2) 
  if (mean_1 < mean_2) {
    dataset1 <- dataset[[2]]
    dataset2 <- dataset[[1]]
  }
  median <- median(dataset2) 
  result <- 1/length(dataset1) * sum(unlist(lapply(dataset1, function(x){ if (x>median) 1 else 0})))
  return(result)
}

parametric_cohens_u3_es <- function(x, INDEX) {
  pnorm(abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]))
}

parametric_cohens_u3_ci <- function(x, INDEX) {
  dataset1 <- split(x, INDEX)[[1]]
  dataset2 <- split(x, INDEX)[[2]]
  cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX))
  cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))
  lower_bound <- pnorm(cohen_d_cis[[1]])
  upper_bound <- pnorm(cohen_d_cis[[2]])
  return (list(lower_bound = lower_bound, upper_bound = upper_bound))
}


