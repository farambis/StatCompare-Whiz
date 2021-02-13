#TODO beim Upload prüfen, dass in der Gruppierungsvariable eh keine NAs vorhanden
# sind - diese werden nämlich bei Funktionen wie tapply ohne Warnung ignoriert

#TODO User sollen angeben wie die Faktoren zu rangreihen sind, damit in der server
# funktion die Gruppierungsvariable richtig faktorisiert werden kann


#TODO ask UST why the degrees of freedom is different in stats::t.test for the 
# Welch t-test than on the wikipedia and the Bortz and Schuster text book



# variables for examples:
rm(list = ls())

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
winvar1 <- var(winsor((split(vals, grp))[[1]]))
winvar2 <- var(winsor((split(vals, grp))[[2]]))
trim <- 0.2
ntr1 <- n1 - (2 * floor(trim * n1))
ntr2 <- n2 - (2 * floor(trim * n2))
trm1 <- mean(split(vals, grp)[[1]], trim = trim)
trm2 <- mean(split(vals, grp)[[2]], trim = trim)

effsize <- list("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar")














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
effsizes <- lapply(effsize, smd_uni, x = vals, INDEX = grp)
effsizes_cis <- rep(list(numeric(length = 2)), times = length(effsizes))
for(i in seq_len(length(effsizes))){
  
  effsizes_cis[[i]] <- smd_ci(effsize = names(effsizes[[i]]), val = effsizes[[i]], n1 = n1, n2 = n2, var1 = var1, var2 = var2, winvar1 = winvar1, winvar2 = winvar2, ntr1 = ntr1, ntr2 = ntr2, trim = trim)
}

effsizes_cis





















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



mann_whitney_based_es <- function(dataset1, dataset2) {
  # Mann Whitney u -----
  u <- calculate_u_with_ties(dataset1, dataset2)
  u/(length(dataset1)*length(dataset2))
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



p_value_for_mann_whitney_based_es <- function(dataset1, dataset2) { # deviates by 0.02 from stat wilcoxin test which is continuity corrected
  calculate_p_value_from_z(calculate_z_for_u_statistic(dataset1, dataset2))
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

mann_whitney_es_ci <- function(dataset1, dataset2, alpha = 0.05) {
  #second method from Newcombe (2005)
  m <- length(dataset1)
  n <- length(dataset2)
  delta <- mann_whitney_based_es(dataset1, dataset2)
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




ps_for_dependent_groups <-
  function(dataset1, dataset2, ignore_ties = FALSE) {
    # probability of superiority for dependent groups ----
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

ps_depenent_groups_ci <- function(dataset1, dataset2, alpha = 0.05) {
  #Pratt's confidence interval 
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

generalized_odds_ratio <- function(dataset1, dataset2, dependent = FALSE) {
  # generalized odds ratio-----
  if (!dependent) ps <- mann_whitney_based_es(dataset1, dataset2) 
  else ps <- ps_for_dependent_groups(dataset1, dataset2)
  return (ps/(1-ps))
}

odds_ratio_ci<- function(x, INDEX) {
  #TODO implement method for exact confidence interal 
}

dominance_measure_based_es <- function(dataset1, dataset2, dependent = FALSE) {
  # dominance measure ----
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

dominance_measure_ci <- function(dataset1, dataset2, dependent = FALSE) {
  if (!dependent) cis <- mann_whitney_es_ci(dataset1, dataset2)
  else cis <- ps_depenent_groups_ci(dataset1, dataset2)
  lower_bound <- 2 * cis[[1]] - 1
  upper_bound <- 2 * cis[[2]] - 1
  return (list(lower_bound = lower_bound, upper_bound = upper_bound))
}


common_language_es <- function(x, INDEX) { 
  # common language effect size based on del guidice-----
  d <- smd_uni(effsize = "cohen_d", x= x, INDEX = INDEX)[[1]]
  return (pnorm(abs(d)/sqrt(2)))
}

common_language_es_ci <- function(dataset1, dataset2, cohen_d) {
  cis <- smd_ci(effsize = "cohen_d", val = abs(cohen_d), n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))
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
 return (list(c(lower_bound = lower_bound, upper_bound = upper_bound)))
}


# overlap measures ----
overlapping_coefficient <- function(dataset1, dataset2) {
  num_intervals <- 10
  d1 <- density(dataset1)
  d2 <- density(dataset2)
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

overlapping_coefficient_two <- function(dataset1, dataset2) {
  ovl <- overlapping_coefficient(dataset1, dataset2)
  return (ovl/(2-ovl))
}

cohens_coefficient_of_nonoverlap_u1 <- function(dataset1, dataset2) {
  ovl <- overlapping_coefficient(dataset1, dataset2) 
  return (1-ovl/(2-ovl))
}

cohens_u3_es <- function(x, INDEX) {
  pnorm(abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]))
}^

cohens_u3_ci <- function(x, INDEX) {
  dataset1 <- split(x, INDEX)[[1]]
  dataset2 <- split(x, INDEX)[[2]]
  cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX))
  cohen_d_cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))
  lower_bound <- pnorm(cohen_d_cis[[1]])
  upper_bound <- pnorm(cohen_d_cis[[2]])
  return (list(c(lower_bound = lower_bound, upper_bound = upper_bound)))
}


# Old versions ------------------------------------------------------------


# sd_combined -------------------------------------------------------------

#sd_combined2
sd_combined2 <- function(x = NULL, INDEX = NULL, sd1, sd2, n1, n2, type = c("equal", "unequal"), 
                    winsorize = FALSE, trim = 0.2, na.rm = FALSE){
  
  # this function computes different versions of combined standard variations (SDs)
  #
  # x ................. numeric vector
  # INDEX ............. vector indicating group membership of every element in x
  # sd1, sd2, n1, n2 .. summary data of two groups
  # type .............. computations type - depends on whether population 
  #                     SDs are considered equal/unequal
  #                     "equal": pooled standard deviation computed
  #                     "unequal": mean of the two SDs computed
  # winsorize ......... logical, indicating whether x should be winsorized
  # trim .............. the percentage of values at both tails to winsorize
  # na.rm ............. logical, indicating whether NAs in x should be removed
  #
  # Either a numeric vector and an INDEX vector of the same length are given or 
  # summary statistics of two groups are passed to combine the SDs of the groups.
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    if(!is.numeric(x)) stop("\nx must be numeric")
    
    if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
    
    if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
    
    if(!(winsorize %in% c(TRUE, FALSE))) stop("\nwinsorize must be set to TRUE or FALSE")
    
    i_NA <- is.na(x)
    if(na.rm) {
      x <- x[!i_NA]
      INDEX <- INDEX[!i_NA]
    }
    if(!na.rm && any(i_NA)){
      stop("\nNAs present in x")
    }
    if(winsorize == TRUE){
      x <- unlist(tapply(x, INDEX, winsor, na.rm = na.rm, trim = trim))
      INDEX <- sort(INDEX)
      
    } 
    
    ngroups <- length(unique(INDEX))
    
    sd_n <- function(x, na.rm = na.rm){
      std <- sd(x, na.rm = na.rm)
      n <- length(!is.na(x))
      return(list(std, n))
    }
    
    sds_ns <- tapply(X = x, INDEX = INDEX, sd_n, na.rm = na.rm) 
    sds_ns <- matrix(unlist(sds_ns), byrow = TRUE, nrow = ngroups)
    
    names_char <- matrix(c(paste0("sd", 1:ngroups), paste0("n", 1:ngroups)), nrow = ngroups)
    
    for(i in 1:ngroups){
      assign(names_char[i, 1], sds_ns[i, 1])
      assign(names_char[i, 2], sds_ns[i, 2])
    }
    
  }
  
  res <- switch(type,
                "equal" = sqrt((((n1 - 1) * sd1^2) + ((n2 - 1) * sd2^2)) / (n1 + n2 - 2)),
                "unequal" = sqrt((sd1^2 + sd2^2) / 2))
  
  return(list(res))
  
}




#sd_combined3
sd_combined3 <- function(x = NULL, INDEX = NULL, sd1, sd2, n1, n2, winsor = FALSE, trim = 0.2, type = c("pooled", "mean", "grp_1", "grp_2"),  na.rm = FALSE){
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    if(!is.numeric(x)) stop("\nx must be numeric")
    
    if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
    
    grps <- unique(INDEX)
    if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
    if(any(is.na(grps))) stop("\nNAs present in INDEX")
    
    if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
    
    if(!(winsor %in% c(TRUE, FALSE))) stop("\nwinsorize must be set to TRUE or FALSE")
    
    i_NA <- is.na(x)
    if(na.rm) {
      x <- x[!i_NA]
      INDEX <- INDEX[!i_NA]
    }
    if(!na.rm && any(i_NA)){
      return(NA)
      stop("\nNAs present in x")
    }
    
    if(winsor == TRUE){
      if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
      x <- unlist(tapply(x, INDEX, winsor, na.rm = na.rm, trim = trim))
      INDEX <- sort(INDEX)
    }
    
    if(type == "pooled") {
      
      var_n <- function(x){
        v <- var(x)
        n <- length(x)
        return(c(v, n))
      }
      
      vars_ns <- tapply(X = x, INDEX = INDEX, var_n)
      vars_ns <- matrix(unlist(vars_ns), byrow = TRUE, nrow = 2)
      
      res <- sqrt((((vars_ns[1, 2] - 1) * vars_ns[1, 1]) + ((vars_ns[2, 2] - 1) * vars_ns[2, 1])) / (sum(vars_ns[, 2]) - 2))
      return(res)
    }
    
    res <- switch(type,
                  "mean" = sqrt(mean(tapply(X = x, INDEX = INDEX, var))),
                  "grp_1" = sd(split(x, INDEX)[[1]]),
                  "grp_2" = sd(split(x, INDEX)[[2]]))
    
    
    return(res)
  }
  
  res <- switch(type,
                "pooled" = sqrt((((n1 - 1) * sd1^2) + ((n2 - 1) * sd2^2)) / (n1 + n2 - 2)),
                "mean" = sqrt((sd1^2 + sd2^2) / 2),
                "grp_1" = sd1,
                "grp_2" = sd2
  )
  
  return(res)
}















# correction factors -----------------------------------------------------

# hedges_corr

hedges_corr <- function(x = NULL, INDEX = NULL, n1, n2){
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    ngroups <- length(unique(INDEX))
    
    ns <- tapply(x, INDEX, length, simplify = FALSE)
    for(i in 1:ngroups){
      assign(paste0("n", i), ns[[i]])
    }
  }
  
 
  res <-  1 - (3/(4*(n1 + n2 -2)-1))

  
  return(list(res))
}















# smd_uni -----------------------------------------------------------------

# smd_uni2
smd_uni2 <- function(effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                                "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"), 
                    x = NULL, INDEX = NULL, m1, m2, sd1, sd2, n1, n2, na.rm = FALSE, trim = 0.2){
  
  # this function
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    if(!is.numeric(x)) stop("\nX must be numeric")
    
    if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
    
    grps <- unique(INDEX)
    if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
    if(any(is.na(grps))) stop("\nNAs present in INDEX")
    
    if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
    
    i_NA <- is.na(x)
    if(na.rm) {
      x <- x[!i_NA]
      INDEX <- INDEX[!i_NA]
    }
    if(!na.rm && any(i_NA)){
      stop("\nNAs present in x")
    }
    
    if(effsize %in% c("AKP_eqvar", "AKP_uneqvar")){
      if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
      means <- tapply(x, INDEX, mean, trim = trim)
    } else{
      means <- tapply(x, INDEX, mean)
    }
    
    
    
    for(i in 1:ngroups){
      assign(paste0("m", i), means[[i]])
    }
    
    res <- switch(effsize, 
                  "cohen_d" = (m1 - m2)/sd_combined(x, INDEX, type = "pooled"),
                  "hedges_g" = hedges_corr(x, INDEX) * (m1 - m2)/sd_combined(x, INDEX, type = "pooled"),
                  "glass_d" = (m1 - m2)/sd(split(x, INDEX)[[1]]),
                  "glass_d_corr" = hedges_corr(x, INDEX) * (m1 - m2)/sd(split(x, INDEX)[[1]]), 
                  "bonett_d" = (m1 - m2)/sd_combined(x, INDEX, type = "mean"),
                  "bonett_d_corr" = hedges_corr(x, INDEX) * (m1 - m2)/sd_combined(x, INDEX, type = "mean"),
                  "AKP_eqvar" = (m1 - m2)/sd_combined(x, INDEX, type = "pooled", winsor = TRUE, trim = trim),
                  "AKP_uneqvar" = (m1 - m2)/sd(winsor(split(x, INDEX)[[1]]))) # TODO check what the standardizer should be when variances are not thoought of as equal in the akp measure
    
    return(round(res, digits = 3))
  }
  
  res <- switch(effsize, 
                "cohen_d" = (m1 - m2)/sd_combined(sd1 = sd1, sd2 = sd2, n1 = n1, n2 = n2, type = "pooled"),
                "hedges_g" = hedges_corr(n1 = n1, n2 = n2) * (m1 - m2)/sd_combined(sd1 = sd1, sd2 = sd2, n1 = n1, n2 = n2, type = "pooled"),
                "glass_d" = (m1 - m2)/sd1,
                "glass_d_corr" = hedges_corr(n1 = n1, n2 = n2) * (m1 - m2)/sd1, 
                "bonett_d" = (m1 - m2)/sd_combined(sd1 = sd1, sd2 = sd2, type = "mean"),
                "bonett_d_corr" = hedges_corr(n1 = n1, n2 = n2) * (m1 - m2)/sd_combined(sd1 = sd1, sd2 = sd2, type = "mean"))
  
  return(round(res, digits = 3))
  
}




# smd_uni3
smd_uni3 <- function(effsize = c("cohen_d", "hedges_g", "glass_d", "glass_d_corr", 
                                "bonett_d", "bonett_d_corr", "AKP_eqvar", "AKP_uneqvar"), 
                    x = NULL, INDEX = NULL, m1, m2, sd1, sd2, n1, n2, na.rm = FALSE, trim = 0.2){
  
  # this function
  
  
  if(!is.null(x) && !is.null(INDEX)){
    
    if(!is.numeric(x)) stop("\nX must be numeric")
    
    if(length(x) != length(INDEX)) stop("\nx and INDEX must have the same length")
    
    grps <- unique(INDEX)
    if(length(grps) < 2 || length(grps) > 2) stop("\nINDEX should contain two unique values")
    if(any(is.na(grps))) stop("\nNAs present in INDEX")
    
    if(!(na.rm %in% c(TRUE, FALSE))) stop("\nna.rm must be set to TRUE or FALSE")
    
    i_NA <- is.na(x)
    if(na.rm) {
      x <- x[!i_NA]
      INDEX <- INDEX[!i_NA]
    }
    if(!na.rm && any(i_NA)){
      stop("\nNAs present in x")
    }
    if(effsize %in% c("AKP_eqvar", "AKP_uneqvar")){
      if(trim < 0 || trim > 0.5) stop("\ntrim < 0 or > 0.5, specify a value within these bounds")
      means <- tapply(x, INDEX, mean, trim = trim)
    } else{
      means <- tapply(x, INDEX, mean)
    }
    
    
    for(i in 1:ngroups){
      assign(paste0("m", i), means[[i]])
    }
    
  }
  
  res <- switch(effsize, 
                "cohen_d" = (m1 - m2)/sd_combined3(x, INDEX, sd1, sd2, n1, n2, type = "pooled"),
                "hedges_g" = hedges_corr(x, INDEX, n1, n2) * (m1 - m2)/sd_combined3(x, INDEX, sd1, sd2, n1, n2, type = "pooled"),
                "glass_d" = (m1 - m2)/sd_combined3(x, INDEX, sd1, type = "grp_1"),
                "glass_d_corr" = hedges_corr(x, INDEX, n1, n2) * (m1 - m2)/sd_combined3(x, INDEX, sd1, type = "grp_1"), 
                "bonett_d" = (m1 - m2)/sd_combined3(x, INDEX, sd1, sd2, type = "mean"),
                "bonett_d_corr" = hedges_corr(x, INDEX, n1, n2) * (m1 - m2)/sd_combined3(x, INDEX, sd1, sd2, type = "mean"),
                "AKP_eqvar" = (m1 - m2)/sd_combined3(x, INDEX, type = "pooled", winsor = TRUE, trim = trim),
                "AKP_uneqvar" = (m1 - m2)/sd_combined3(x, INDEX, type = "grp_1", winsor = TRUE))
  
  return(round(res, digits = 3))
  
}



















































