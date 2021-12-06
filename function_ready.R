#TODO beim Upload prüfen, dass in der Gruppierungsvariable eh keine NAs vorhanden
# sind - diese werden nämlich bei Funktionen wie tapply ohne Warnung ignoriert

#TODO User sollen angeben wie die Faktoren zu rangreihen sind, damit in der server
# funktion die Gruppierungsvariable richtig faktorisiert werden kann

# Grand functions computing every effect size and test statistic for the app ----
## List of every effect size and test statistic ----
all_eff_sizes <- list(
  # Effect sizes for independent groups:
  cohen_d = "cohen_d",
  hedges_g = "hedges_g",
  glass_d = "glass_d",
  glass_d_corr = "glass_d_corr",
  bonett_d = "bonett_d",
  bonett_d_corr = "bonett_d_corr",
  AKP_eqvar = "AKP_eqvar",
  AKP_uneqvar = "AKP_uneqvar",
  mann_whitney_based_ps = "mann_whitney_based_ps",
  parametric_ovl = "parametric_ovl",
  ps_dependent = "ps_dependent",
  non_parametric_ovl = "non_parametric_ovl",
  generalized_odds_ratio = "generalized_odds_ratio",
  generalized_odds_ratio_dependent = "generalized_odds_ratio_dependent",
  common_language = "common_language",
  non_parametric_ovl_two = "non_parametric_ovl_two",
  parametric_ovl_two = "parametric_ovl_two",
  standardized_median_difference_mad = "standardized_median_difference_mad",
  standardized_median_difference_riq = "standardized_median_difference_riq",
  standardized_median_difference_biweight = "standardized_median_difference_biweight",
  parametric_cohens_u1 = "parametric_cohens_u1",
  parametric_cohens_u2 = "parametric_cohens_u2",
  cohens_u1 = "cohens_u1",
  cohens_u1 = "cohens_u1",
  cohens_u2 = "cohens_u2",
  non_parametric_u1 = "non_parametric_u1",
  variance_ratio = "variance_ratio",
  parametric_tail_ratio = "parametric_tail_ratio",
  non_parametric_tail_ratio = "non_parametric_tail_ratio",
  non_parametric_ovl_two = "non_parametric_ovl_two",
  parametric_cohens_u3 = "parametric_cohens_u3",
  non_parametric_u3 = "non_parametric_u3",
  #Effect sizes for dependent groups:
  cohens_d_dependent = "cohens_d_dependent",
  hedges_g_dependent = "hedges_g_dependent",
  cohens_drm = "cohens_drm",
  hedges_grm = "hedges_grm",
  bonett_d_dependent = "bonett_d_dependent",
  cohens_dz = "cohens_dz",
  hedges_gz = "hedges_gz",
  glass_d_dependent = "glass_d_dependent",
  glass_d_corr_dependent = "glass_d_corr_dependent",
  common_language_es_dependent = "common_language_es_dependent",
  parametric_ovl_dependent = "parametric_ovl_dependent",
  parametric_ovl_two_dependent = "parametric_ovl_two_dependent",
  parametric_cohens_u1_dependent = "parametric_cohens_u1_dependent",
  parametric_cohens_u2_dependent = "parametric_cohens_u2_dependent",
  parametric_cohens_u3_dependent = "parametric_cohens_u3_dependent",
  variance_ratio_dependent = "variance_ratio_dependent",
  parametric_tail_ratio_dependent = "parametric_tail_ratio_dependent",
  robust_cohens_dz = "robust_cohens_dz",
  robust_cohens_d_dependent = "robust_cohens_d_dependent",
  robust_glass_d_dependent = "robust_glass_d_dependent",
  non_parametric_tail_ratio_dependent = "non_parametric_tail_ratio_dependent",
  standardized_median_difference_biweight_dependent = "standardized_median_difference_biweight_dependent",
  standardized_median_difference_mad_dependent = "standardized_median_difference_mad_dependent",
  standardized_median_difference_riq_dependent = "standardized_median_difference_riq_dependent"
)

all_test_statistics <- list(student_t_test = "student_t_test",
                            dependent_student_t_test = "dependent_student_t_test",
                            welch_t_test = "welch_t_test",
                            yuen_t_test = "yuen_t_test",
                            dependent_yuen_t_test = "dependent_yuen_t_test",
                            tukey_mclaughlin_t_test = "tukey_mclaughlin_t_test",
                            mann_whitney = "mann_whitney",
                            mann_whitney_dependent = "mann_whitney_dependent",
                            wilcoxon_signed_rank_test = "wilcoxon_signed_rank_test")

all_plots <- list(parametric_ovl = "parametric_ovl",
                  parametric_cohens_u1 = "parametric_cohens_u1",
                  parametric_cohens_u3 = "parametric_cohens_u3",
                  non_parametric_u3 = "non_parametric_u3",
                  parametric_tail_ratio = "parametric_tail_ratio",
                  parametric_tail_ratio_zoom = "parametric_tail_ratio_zoom",
                  non_parametric_tail_ratio = "non_parametric_tail_ratio",
                  non_parametric_tail_ratio_zoom = "non_parametric_tail_ratio_zoom",
                  non_parametric_ovl = "non_parametric_ovl",
                  non_parametric_u1 = "non_parametric_u1",
                  boxplot_pairwise_difference_scores = "boxplot_pairwise_difference_scores")

nonparametricOptions <- c(all_eff_sizes$non_parametric_ovl2,
                          all_eff_sizes$non_parametric_u1,
                          all_eff_sizes$non_parametric_u3,
                          all_eff_sizes$non_parametric_tail_ratio,
                          all_eff_sizes$non_parametric_tail_ratio_dependent,
                          all_plots$non_parametric_ovl,
                          all_plots$non_parametric_tail_ratio_zoom)

tailRatioOptions <- c(all_eff_sizes$parametric_tail_ratio,
               all_eff_sizes$non_parametric_tail_ratio,
               all_eff_sizes$parametric_tail_ratio_dependent,
               all_eff_sizes$non_parametric_tail_ratio_dependent,
               all_plots$parametric_tail_ratio_zoom,
               all_plots$non_parametric_tail_ratio_zoom
               )

## ES for raw data ----
generate_es_raw_data_dataframe <- function(es_list, INDEX = NULL, x, y, tail, ref, cutoff) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  es_boot_ci_lower <- vector(mode = "double", length = 0L)
  es_boot_ci_upper <- vector(mode = "double", length = 0L)

  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("this is no offered effect size!\n")
    res <- switch(i,
                  # Effect sizes for independent groups:
                  "cohen_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "cohen_d")),
                  "hedges_g" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "hedges_g")),
                  "glass_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "glass_d")),
                  "glass_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "glass_d_corr")),
                  "bonett_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "bonett_d")),
                  "bonett_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "bonett_d_corr")),
                  "AKP_eqvar" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "AKP_eqvar")),
                  "AKP_uneqvar" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, x = x, INDEX = INDEX), x = x, INDEX = INDEX), smd_boot(x, INDEX, "AKP_uneqvar")),
                  "standardized_median_difference_mad" = c(standardized_median_difference_mad(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, standardized_median_difference_mad)),
                  "standardized_median_difference_riq" = c(standardized_median_difference_riq(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, standardized_median_difference_riq)),
                  "standardized_median_difference_biweight" = c(standardized_median_difference_biweight(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, standardized_median_difference_biweight)),
                  "mann_whitney_based_ps" = c(mann_whitney_based_ps(x = x, INDEX = INDEX), mann_whitney_based_ps_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, mann_whitney_based_ps)),
                  "parametric_ovl" = c(parametric_ovl(x = x, INDEX = INDEX), parametric_ovl_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, parametric_ovl)),
                  "non_parametric_ovl" = c(non_parametric_ovl(x, INDEX), parametric_ovl_ci(x, INDEX), boot_general(x, INDEX, non_parametric_ovl)), # parametric ci
                  "ps_dependent" = c(ps_dependent_groups(x, y), ps_dependent_groups_ci(x, y), NA_real_, NA_real_),
                  "generalized_odds_ratio" = c(generalized_odds_ratio(x = x, INDEX = INDEX), generalized_odds_ratio_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, generalized_odds_ratio)),
                  "generalized_odds_ratio_dependent" = c(generalized_odds_ratio(x = x, INDEX = INDEX, y = y), generalized_odds_ratio_ci(x = x, y = y), NA_real_, NA_real_),
                  "common_language" = c(common_language_es(x = x, INDEX = INDEX), common_language_es_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, common_language_es)),
                  "parametric_ovl_two" = c(parametric_ovl_two(x = x, INDEX = INDEX), parametric_ovl_two_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, parametric_ovl_two)),
                  "non_parametric_ovl_two" = c(non_parametric_ovl_two(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_ovl_two)),
                  "parametric_cohens_u1" = c(parametric_cohens_u1(x = x, INDEX = INDEX), parametric_cohens_u1_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, parametric_cohens_u1)),
                  "parametric_cohens_u2" = c(parametric_cohens_u2(x = x, INDEX = INDEX), parametric_cohens_u2_ci(x = x, INDEX = INDEX), boot_general(x, INDEX, parametric_cohens_u2_ci)),
                  "non_parametric_u3" = c(non_parametric_u3(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_u3)),
                  "parametric_cohens_u3" = c(parametric_cohens_u3(x = x, INDEX = INDEX), parametric_cohens_u3_ci(x, INDEX), boot_general(x, INDEX, parametric_cohens_u3)),
                  "variance_ratio" = c(variance_ratio(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, variance_ratio)),
                  "parametric_tail_ratio" = c(parametric_tail_ratio(x = x, INDEX = INDEX, reference_group = ref, tail = tail, cutoff = cutoff), NA, NA, boot_general(x, INDEX, parametric_tail_ratio, reference_group = ref, tail = tail, cutoff = cutoff)),
                  "non_parametric_tail_ratio" = c(non_parametric_tail_ratio(x = x, INDEX = INDEX, reference_group = ref, tail = tail, cutoff = cutoff), NA, NA, boot_general(x, INDEX, non_parametric_tail_ratio, reference_group = ref, tail = tail, cutoff = cutoff)),
                  "cohens_u1" = c(parametric_cohens_u1(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, parametric_cohens_u1)),
                  #Effect sizes for dependent gorups:
                  "cohens_d_dependent" = c(cohens_d_dependent(x = x, y = y), cohens_d_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "hedges_g_dependent" = c(hedges_g_dependent(x = x, y = y), hedges_g_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "cohens_drm" = c(cohens_drm(x = x, y = y), cohens_drm_ci(x = x, y = y), NA_real_, NA_real_),
                  "hedges_grm" = c(hedges_grm(x = x, y = y), hedges_grm_ci(x = x, y = y), NA_real_, NA_real_),
                  "bonett_d_dependent" = c(bonett_d_dependent(x = x, y = y), bonett_d_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "cohens_dz" = c(cohens_dz(x = x, y = y), cohens_dz_ci(x = x, y = y), NA_real_, NA_real_),
                  "hedges_gz" = c(hedges_gz(x = x, y = y), hedges_gz_ci(x = x, y = y), NA_real_, NA_real_),
                  "glass_d_dependent" = c(glass_d(x = x, y = y), glass_d_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "glass_d_corr_dependent" = c(glass_d_corr(x = x, y = y), glass_d_corr_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "standardized_median_difference_mad_dependent" = c(standardized_median_difference_mad(x = x, y = y), NA_real_, NA_real_, NA_real_, NA_real_),
                  "standardized_median_difference_riq_dependent" = c(standardized_median_difference_riq(x = x, y = y), NA_real_, NA_real_, NA_real_, NA_real_),
                  "standardized_median_difference_biweight_dependent" = c(standardized_median_difference_biweight(x = x, y = y), NA_real_, NA_real_, NA_real_, NA_real_),
                  "common_language_es_dependent" = c(common_language_es_dependent(x = x, y = y), common_language_es_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "parametric_ovl_dependent" = c(parametric_ovl_dependent(x = x, y = y), parametric_ovl_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "parametric_ovl_two_dependent" = c(parametric_ovl_two_dependent(x = x, y = y), parametric_ovl_two_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "parametric_cohens_u1_dependent" = c(parametric_cohens_u1_dependent(x = x, y = y), parametric_cohens_u1_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "parametric_cohens_u2_dependent" = c(parametric_cohens_u2_dependent(x = x, y = y), parametric_cohens_u2_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "parametric_cohens_u3_dependent" = c(parametric_cohens_u3_dependent(x = x, y = y), parametric_cohens_u3_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "variance_ratio_dependent" = c(variance_ratio(x = x, y = y), variance_ratio_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "parametric_tail_ratio_dependent" = c(parametric_tail_ratio(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff), parametric_tail_ratio_dependent_ci(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff), NA_real_, NA_real_),
                  "robust_cohens_dz" = c(robust_cohens_dz(x = x, y = y), NA_real_, NA_real_, NA_real_, NA_real_),
                  "robust_cohens_d_dependent" = c(robust_cohens_d(x = x, y = y), robust_cohens_d_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "robust_glass_d_dependent" = c(robust_glass_d(x = x, y = y), robust_glass_d_dependent_ci(x = x, y = y), NA_real_, NA_real_),
                  "non_parametric_tail_ratio_dependent" = c(non_parametric_tail_ratio_dependent(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff), non_parametric_tail_ratio_dependent_ci(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff), NA_real_, NA_real_)
    )
    es_result <- c(es_result, res[[1]])
    es_ci_lower <- c(es_ci_lower, res[[2]])
    es_ci_upper <- c(es_ci_upper, res[[3]])
    es_boot_ci_lower <- c(es_boot_ci_lower, res[[4]])
    es_boot_ci_upper <- c(es_boot_ci_upper, res[[5]])
  }
  es_dataframe <- data.frame(
    es_list,
    es_result,
    es_ci_lower,
    es_ci_upper,
    es_boot_ci_lower,
    es_boot_ci_upper
  )
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci lower limit", "Ci upper limit", "Bootstrap ci lower limit", "Bootstrap ci upper limit")
  return(es_dataframe)
}

## ES for educational mode ----
generate_es_educational_dataframe <- function(es_list, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2, tail, ref, cutoff) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("this is no offered effect size!\n")
    res <- switch(i,
                  # Effect sizes for independent groups:
                  "cohen_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "hedges_g" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "glass_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "glass_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "bonett_d" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "bonett_d_corr" = c(smd_ci(effsize = i, val = smd_uni(effsize = i, m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), n1 = sampleSize1, n2 = sampleSize2, var1 = standardDeviation1^2, var2 = standardDeviation2^2)),
                  "common_language" = c(common_language_es(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), common_language_es_ci(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2)),
                  "parametric_ovl" = c(parametric_ovl(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), parametric_ovl_ci(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2)),
                  "parametric_cohens_u1" = c(parametric_cohens_u1(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), parametric_cohens_u1_ci(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2)),
                  "parametric_cohens_u2" = c(parametric_cohens_u2(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), parametric_cohens_u2_ci(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2)),
                  "parametric_cohens_u3" = c(parametric_cohens_u3(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2), parametric_cohens_u3_ci(m1 = mean1, m2 = mean2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = sampleSize1, n2 = sampleSize2)),
                  "variance_ratio" = c(variance_ratio(s1 = standardDeviation1, s2 = standardDeviation2), NA_real_, NA_real_),
                  "parametric_tail_ratio" = c(parametric_tail_ratio(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2,tail = tail, reference_group = ref, cutoff = cutoff), NA_real_, NA_real_),
                  #Effect sizes for dependent groups:
                  "cohens_d_dependent" = c(cohens_d_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), cohens_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "hedges_g_dependent" = c(hedges_g_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), hedges_g_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "cohens_drm" = c(cohens_drm(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, r = correlation1), cohens_drm_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "hedges_grm" = c(hedges_grm(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1), hedges_grm_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "bonett_d_dependent" = c(bonett_d_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), bonett_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "cohens_dz" = c(cohens_dz(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, r = correlation1), cohens_dz_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "hedges_gz" = c(hedges_gz(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1), hedges_gz_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "glass_d_dependent" = c(glass_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1), glass_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "glass_d_corr_dependent" = c(glass_d_corr(m1 = mean1, m2 = mean2, s1 = standardDeviation1, df = sampleSize1 - 1), glass_d_corr_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "common_language_es_dependent" = c(common_language_es_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, r = correlation1), common_language_es_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1)),
                  "parametric_ovl_dependent" = c(parametric_ovl_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), parametric_ovl_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "parametric_ovl_two_dependent" = c(parametric_ovl_two_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), parametric_ovl_two_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "parametric_cohens_u1_dependent" = c(parametric_cohens_u1_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), parametric_cohens_u1_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "parametric_cohens_u2_dependent" = c(parametric_cohens_u2_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), parametric_cohens_u2_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "parametric_cohens_u3_dependent" = c(parametric_cohens_u3_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), parametric_cohens_u3_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, var_equal = TRUE)),
                  "variance_ratio_dependent" = c(variance_ratio(s1 = standardDeviation1, s2 = standardDeviation2), variance_ratio_dependent_ci(s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1)),
                  "parametric_tail_ratio_dependent" = c(parametric_tail_ratio(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2,tail = tail, reference_group = ref, cutoff = cutoff), parametric_tail_ratio_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, r = correlation1, n = sampleSize1, tail = tail, reference_group = ref, cutoff = cutoff))
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
generate_ts_dataframe <- function(ts_list, INDEX = NULL, x = NULL, y = NULL, m1, m2, standardDeviation1, standardDeviation2, n1, n2, sdiff) {
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
                    "dependent_yuen_t_test" = t_test(type = i, x = x, y = y),
                    "dependent_student_t_test" = t_test(type = i, x = x, y = y),
                    "tukey_mclaughlin_t_test" = t_test(type = i, x = x, y = y)
      ) }
    else {
      res <- switch(i,
                    "student_t_test" = t_test(type = i, m1 = m1, m2 = m2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = n1, n2 = n2),
                    "welch_t_test" = t_test(type = i, m1 = m1, m2 = m2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, n1 = n1, n2 = n2),
                    "dependent_student_t_test" = t_test(type = i, m1 = m1, m2 = m2, sdiff = sdiff, n = n1)
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
  ts_value <- vector(mode = "double", length = 0L)
  ts_p_value <- vector(mode = "double", length = 0L)
  ts_z_value <- vector(mode = "double", length = 0L)
  for (i in ts_list) {
    res <- switch(i,
                  "mann_whitney" = ts_for_mann_whitney_based_ps(x = x, INDEX = INDEX),
                  "mann_whitney_dependent" = ts_for_mann_whitney_based_ps(x = x, y = y),
                  "wilcoxon_signed_rank_test" = wilcoxon_signed_rank_test(x = x, y = y)
    )
    ts_value <- c(ts_value, res[[1]])
    ts_z_value <- c(ts_z_value, res[[2]])
    ts_p_value <- c(ts_p_value, res[[3]])
  }
  ts_dataframe <- data.frame(
    ts_list,
    ts_value,
    ts_z_value,
    ts_p_value
  )
  colnames(ts_dataframe) <- c("Name", "Test statistic", "z", "p")
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
  n <- length(y)
  i_lower <- floor(trim * n) + 1
  i_upper <- (n + 1) - i_lower

  val_lower <- y[i_lower]
  val_upper <- y[i_upper]

  x <- ifelse(x <= val_lower, val_lower,
              ifelse(x >= val_upper, val_upper, x))


  nmbr_nas <- sum(is.na(x))
  if (nmbr_nas != 0) {
    warning("\nNAs present in x - these will be ignored for winsorization\nNAs will be added to the end of the winsorized vector\nSet na.rm = TRUE if you want NAs removed")
    nas <- rep(NA, times = nmbr_nas)
    return(c(x, nas))
  }

  return(x)

}

## Determine sample size after trimming ----

n_trim <- function(x = NULL, n, trim = 0.2) {
  if (!is.null(x)) n <- length(x)
  ntr <- n - (2 * floor(trim * n))
  return(ntr)
}

## Determine degrees of freedom -----
degrees_freedom <- function(effsize, n1, n2, ntr1, ntr2, standardised_by_group_1 = TRUE) {

  df <- switch(effsize,
               "cohen_d" = n1 + n2 - 2,
               "hedges_g" = n1 + n2 - 2,
               "glass_d" = ifelse(standardised_by_group_1, n1, n2) - 1,
               "glass_d_corr" = ifelse(standardised_by_group_1, n1, n2) - 1,
               "bonett_d" = n1 + n2 - 2,
               "bonett_d_corr" = n1 + n2 - 2,
               "AKP_eqvar" = ntr1 + ntr2 - 2,
               "AKP_uneqvar" = ifelse(standardised_by_group_1, ntr1, ntr2) - 1)

  return(df)
}

## Various correction factors ----
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}

AKP_correction <- function(trim) {
  res <- sqrt(integrate(f = function(x) { x^2 * dnorm(x) }, lower = qnorm(trim), upper = qnorm(1 - trim))$value + 2 * qnorm(trim)^2 * trim)
  return(res)
}

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

## Handling of missing values (NAs - not availables) and NA notification message ----
missing_values_handler <- function(x, INDEX = NULL, y = NULL) {
  if (is.data.frame(x)) {
    i_NA <- complete.cases(x, INDEX)
    x <- x[i_NA,]
    INDEX <- INDEX[i_NA]
    return(list(x = x, INDEX = INDEX))
  } else if (is.null(y)) {
    i_NA <- complete.cases(x, INDEX)
    x <- x[i_NA]
    INDEX <- INDEX[i_NA]
    return(list(x = x, INDEX = INDEX))
  } else if (is.null(INDEX)) {
    i_NA <- complete.cases(x, y)
    x <- x[i_NA]
    y <- y[i_NA]
    return(list(x = x, y = y))
  }
}

## Summary statistics functions ----

stats_per_group <- function(x, trim = trim, winvar = winvar) {
  m <- mean(x)
  n <- length(x)
  v <- var(x)
  s <- sd(x)
  trm <- mean(x, trim = trim)
  ntr <- n_trim(n = n, trim = trim)
  if (winvar) {
    winvar <- var(winsor(x, trim = trim))
  } else {
    winvar <- NULL
  }
  return(list(m = m, n = n, var = v, s = s, trm = trm, ntr = ntr, winvar = winvar))
}

dependent_groups_stats <- function(x, y, trim, winvar = winvar) {
  n <- length(x)
  r <- cor(x, y)
  vdiff <- var(x - y)
  sdiff <- sqrt(vdiff)
  trmdiff <- mean(y - x, trim = trim)
  ntr <- n_trim(n = n, trim = trim)
  if (winvar) {
    winvardiff <- var(winsor(y - x, trim = trim))
    wincov <- cov(winsor(x, trim = trim), winsor(y, trim = trim))
  } else {
    winvardiff <- NULL
    wincov <- NULL
  }
  return(list(n = n, r = r, vdiff = vdiff, sdiff = sdiff, trmdiff = trmdiff, ntr = ntr, winvardiff = winvardiff, wincov = wincov))
}


summary_stats <- function(x, INDEX = NULL, y = NULL, trim = 0, winvar = FALSE) {
  if (is.data.frame(x)) {
  } else if (is.null(y)) {
    stats <- tapply(X = x, INDEX = INDEX, FUN = stats_per_group, trim = trim, winvar = winvar, simplify = FALSE)
    stats_names <- names(stats[[1]])
    stats_names <- paste0(stats_names, rep(1:2, each = length(stats_names)))
    stats <- unlist(stats, recursive = FALSE)
    names(stats) <- stats_names
  } else if (is.null(INDEX)) {
    stats_x <- stats_per_group(x = x, trim = trim, winvar = winvar)
    names(stats_x) <- paste0(names(stats_x), "1")
    stats_y <- stats_per_group(x = y, trim = trim, winvar = winvar)
    names(stats_y) <- paste0(names(stats_y), "2")
    stats_xy <- dependent_groups_stats(x = x, y = y, trim = trim, winvar = winvar)
    stats <- c(stats_x, stats_y, stats_xy)
  }
  return(stats)
}


## Various standard deviations: ----
sd_combined <- function(x = NULL, INDEX = NULL, var1, var2, n1, n2, winvar1,
                        winvar2, ntr1, ntr2, winsor = FALSE, trim = 0.2, na.rm = TRUE,
                        type = c("pooled", "mean", "grp_1", "grp_2", "se_pooled", "se_welch", "se_yuen")) {


  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = winsor)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (winsor) {
    var1 <- winvar1
    var2 <- winvar2
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
    if ("AKP_eqvar" %in% effsize || "AKP_uneqvar" %in% effsize) {
      winvar <- TRUE
    } else {
      winvar <- FALSE
    }
    stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }

  res <- switch(effsize,
                "cohen_d" = (m2 - m1) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "pooled"),
                "hedges_g" = hedges_bias_correction(df = degrees_freedom(effsize, n1, n2)) * (m2 - m1) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "pooled"),
                "glass_d" = (m2 - m1) / sd_combined(var1 = var1, type = "grp_1"),
                "glass_d_corr" = hedges_bias_correction(df = degrees_freedom(effsize, n1, standardised_by_group_1)) * (m2 - m1) / sd_combined(var1 = var1, type = "grp_1"),
                "bonett_d" = (m2 - m1) / sd_combined(var1 = var1, var2 = var2, type = "mean"),
                "bonett_d_corr" = hedges_bias_correction(df = degrees_freedom(effsize, n1, n2)) * (m2 - m1) / sd_combined(var1 = var1, var2 = var2, type = "mean"),
                "AKP_eqvar" = AKP_correction(trim = trim) * (trm2 - trm1) / sd_combined(winvar1 = winvar1, winvar2 = winvar2, n1 = n1, n2 = n2, type = "pooled", winsor = TRUE, trim = trim),
                "AKP_uneqvar" = AKP_correction(trim = trim) * (trm2 - trm1) / sd_combined(winvar1 = winvar1, winvar2 = winvar2, type = "grp_1", winsor = TRUE, trim = trim))

  names(res) <- effsize
  return(res)

}

# CIs for univariate SMDs  ----
## confidence intervals for noncentrality parameters ----
non_centrality_parameter_ci <- function(non_centrality_parameter, df, alpha) {
  cibound_candidates <- c(min(-5, -abs(non_centrality_parameter) * 7), max(5, abs(non_centrality_parameter) * 7))

  non_centrality_parameter_ci_lower <- suppressWarnings(
    uniroot(f = function(x) {
      pt(q = non_centrality_parameter, df = df, ncp = x) - (1 - (alpha / 2))
    },
            interval = cibound_candidates)
  )$root


  non_centrality_parameter_ci_upper <- suppressWarnings(
    uniroot(f = function(x) {
      pt(q = non_centrality_parameter, df = df, ncp = x) - alpha / 2
    },
            interval = cibound_candidates)
  )$root

  ncp_ci <- c(non_centrality_parameter_ci_lower, non_centrality_parameter_ci_upper)
  return(ncp_ci)
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
    stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }

  df <- degrees_freedom(effsize, n1, n2, ntr1, ntr2, standardised_by_group_1 = TRUE)

  if (effsize %in% c("bonett_d", "bonett_d_corr")) {
    sdm <- sd_combined(var1 = var1, var2 = var2, type = "mean")

    ls_var <- switch(effsize,
                     "bonett_d" = val^2 * (var1^2 / (n1 - 1) + var2^2 / (n2 - 1)) / (8 * sdm^4) +
                       (var1 / (sdm^2 * (n1 - 1))) +
                       var2 / (sdm^2 * (n2 - 1)),
                     "bonett_d_corr" = (val^2 * (var1^2 / (n1 - 1) + var2^2 / (n2 - 1)) / (8 * sdm^4) +
                       (var1 / (sdm^2 * (n1 - 1))) +
                       var2 / (sdm^2 * (n2 - 1))) * (hedges_bias_correction(df = n1 + n2 - 2)^2)
    )
  } else {

    non_centrality_parameter <- switch(effsize,
                                       "cohen_d" = val / sqrt((1 / n1) + (1 / n2)),
                                       "hedges_g" = val / sqrt((1 / n1) + (1 / n2)),
                                       "glass_d" = val / sqrt((1 / n1) + (var2 / (n2 * var1))),
                                       "glass_d_corr" = val / sqrt((1 / n1) + (var2 / (n2 * var1))),
                                       "AKP_eqvar" = sqrt((ntr1 * ntr2) / (ntr1 + ntr2)) * ((trm2 - trm1) / sqrt(((n1 + n2 - 2) * (sd_combined(winvar1 = winvar1, winvar2 = winvar2, n1 = n1, n2 = n2, type = "pooled", winsor = TRUE, trim = trim)^2)) / (ntr1 + ntr2 - 2))),
                                       "AKP_uneqvar" = val / (AKP_correction(trim = trim) * sqrt(((n1 - 1) / (ntr1 * (ntr1 - 1))) + (((n2 - 1) * winvar2) / ((ntr2 * (ntr2 - 1)) * winvar1))))
    )

    if (effsize %in% "hedges_g") {
      non_centrality_parameter_ci_lower <- qt(alpha / 2, df = df, ncp = non_centrality_parameter)
      non_centrality_parameter_ci_upper <- qt(1 - (alpha / 2), df = df, ncp = non_centrality_parameter)
      ncp_ci <- c(non_centrality_parameter_ci_lower, non_centrality_parameter_ci_upper)
    } else {
      ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
    }

  }

  smd_ci <- switch(effsize,
                   "cohen_d" = ncp_ci * sqrt((1 / n1) + (1 / n2)),
                   "hedges_g" = ncp_ci * sqrt((1 / n1) + (1 / n2)),
                   "glass_d" = ncp_ci * sqrt((1 / n1) + (var2 / (n2 * var1))),
                   "glass_d_corr" = ncp_ci * sqrt((1 / n1) + (var2 / (n2 * var1))),
                   "bonett_d" = val + (c(qnorm(alpha / 2), qnorm(1 - (alpha / 2))) * sqrt(ls_var)),
                   "bonett_d_corr" = val + (c(qnorm(alpha / 2), qnorm(1 - (alpha / 2))) * sqrt(ls_var)),
                   "AKP_eqvar" = ncp_ci * (AKP_correction(trim = trim) * sqrt(((ntr1 + ntr2) * (n1 + n2 - 2)) / (ntr1 * ntr2 * (ntr1 + ntr2 - 2)))),
                   "AKP_uneqvar" = ncp_ci * (AKP_correction(trim = trim) * sqrt(((n1 - 1) / (ntr1 * (ntr1 - 1))) + (((n2 - 1) * winvar2) / ((ntr2 * (ntr2 - 1)) * winvar1))))
  )

  res <- list(effsize = unname(val),
              lower_bound = smd_ci[[1]],
              upper_bound = smd_ci[[2]])
  return(res)
}

glass_d_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  df <- degrees_freedom("glass_d", n1, n2, standardised_by_group_1 = standardised_by_group_1)
  glass_d <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1)
  non_centrality_parameter_transformation_factor <- ifelse(standardised_by_group_1,
                                                           sqrt((1 / n1) + (s2^2 / (n2 * s1^2))),
                                                           sqrt((1 / n2) + (s1^2 / (n2 * s2^2))))
  non_centrality_parameter <- glass_d / non_centrality_parameter_transformation_factor
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  glass_d_ci <- ncp_ci * non_centrality_parameter_transformation_factor
  return(list(lower_bound = glass_d_ci[[1]],
              upper_bound = glass_d_ci[[2]]))
}

# Percentile Bootstrap CI function ----

boot_general <- function(x, INDEX, FUN, ...) {
  alpha <- 0.05
  nboot <- 200
  original <- split(x = x, f = INDEX)
  INDEX <- sort(as.factor(INDEX))
  boot_dat <- rep(list(numeric(length = length(x))), times = nboot)
  for (i in 1:nboot) {
    boot_dat[[i]] <- c(sample(original[[1]], replace = TRUE),
                       sample(original[[2]], replace = TRUE))
  }
  boot_val <- sort(
    unlist(
      lapply(boot_dat, FUN = FUN, INDEX, ...),
      use.names = FALSE)
  )
  lower <- nboot * (alpha / 2)
  upper <- nboot - lower
  cl_lower <- boot_val[lower + 1]
  cl_upper <- boot_val[upper]
  return(list(lower_bound = cl_lower, upper_bound = cl_upper))

}

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
  return(list(lower_bound = cl_lower, upper_bound = cl_upper))

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
  return(list(lower_bound = cl_lower, upper_bound = cl_upper))
}


# t-test functions(student, welch, yuen, ...) ----
## independent groups student's t-test: ----
student_t <- function(m1, m2, var1, var2, n1, n2) {
  t_val <- (m2 - m1) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_pooled")
  df <- n1 + n2 - 2
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## dependent groups student's t-test: ----
student_t_dependent <- function(m1, m2, sdiff, n) {
  t_val <- (m2 - m1) / (sdiff / sqrt(n))
  df <- n - 1
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## independent groups welch's t-test: ----
welch_t <- function(m1, m2, var1, var2, n1, n2) {
  se_welch <- sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_welch")
  t_val <- (m2 - m1) / se_welch
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
  t_val <- (trm2 - trm1) / sqrt(d1 + d2)
  df_num <- (d1 + d2)^2
  df_denom <- d1^2 / (ntr1 - 1) + d2^2 / (ntr2 - 1)
  df <- df_num / df_denom
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## dependent groups yuen's t-test: ----
dependent_yuen_t <- function(trm1, trm2, winvar1, winvar2, wincov, n, ntr) {
  d1 <- (n - 1) * winvar1 / (ntr * (ntr - 1))
  d2 <- (n - 1) * winvar2 / (ntr * (ntr - 1))
  d12 <- (n - 1) * wincov / (ntr * (ntr - 1))
  t_val <- (trm2 - trm1) / sqrt(d1 + d2 - 2 * d12)
  df <- ntr - 1
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

## tukey mcLaughlin t test for a single group ----
tukey_mclaughlin_t_test <- function(trm, winvar, n, ntr, trim) {

  se <- sqrt(winvar) / ((1 - 2 * trim) * sqrt(n))
  df <- ntr - 1
  t_val <- trm / se
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}


## grand t-test function: ----
t_test <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, var1, var2, n1, n2, n, sdiff, alpha = 0.05,
                   na.rm = TRUE, trim = 0.2,
                   type = c("student_t_test",
                            "dependent_student_t_test",
                            "welch_t_test",
                            "yuen_t_test",
                            "dependent_yuen_t_test",
                            "tukey_mclaughlin_t_test")) {
  if (!is.null(x)) {
    if (any(c("yuen_t_test", "tukey_mclaughlin_t_test", "dependent_yuen_t_test") %in% type)) {
      winvar <- TRUE
    } else {
      winvar <- FALSE
    }
    if (!is.null(INDEX)) {
      error_detector(x, INDEX, trim, na.rm)
      stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = winvar)
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y, trim = trim, winvar = winvar)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }

  res <- switch(type,
                student_t_test = student_t(m1, m2, var1, var2, n1, n2),
                dependent_student_t_test = student_t_dependent(m1, m2, sdiff, n),
                welch_t_test = welch_t(m1, m2, var1, var2, n1, n2),
                yuen_t_test = yuen_t(trm1, trm2, winvar1, winvar2, n1, n2, ntr1, ntr2),
                dependent_yuen_t_test = dependent_yuen_t(trm1, trm2, winvar1, winvar2, wincov, n, ntr),
                tukey_mclaughlin_t_test = tukey_mclaughlin_t_test(trm = trmdiff, winvar = winvardiff, n, ntr, trim = trim)
  )


  return(res)

}

# non-parametric hypothesis tests: ----
## Wilcoxon signed rank test

wilcoxon_signed_rank_test <- function(x, y) {

  i <- complete.cases(x, y)
  x <- y[i] - x[i]
  zeroes_present <- any(x == 0)
  if (zeroes_present) x <- x[x != 0]
  n <- length(x)
  r <- rank(abs(x), ties.method = "average")
  s <- sign(x)
  T_plus <- sum(r[s == 1])
  exact_test <- n < 50
  ties_present <- length(r) != length(unique(r))
  if (!zeroes_present && exact_test && !ties_present) {
    z_val <- NA_real_
    p_val <- min(
      2 * ifelse(T_plus > (n * (n + 1) / 4), 1 - psignrank(T_plus - 1, n), psignrank(T_plus, n)),
      1
    )
  } else {
    number_of_ties <- table(r)
    numerator <- T_plus - (n * (n + 1) / 4)
    se_T_plus <- sqrt(n * (n + 1) * (2 * n + 1) / 24 - sum(number_of_ties^3 - number_of_ties) / 48)
    continuity_correction <- sign(numerator) * 0.5
    z_val <- (numerator - continuity_correction) / se_T_plus
    p_val <- 2 * min(pnorm(z_val), pnorm(z_val, lower.tail = FALSE))
  }

  return(list(T_plus = T_plus,
              z_val = z_val,
              p_val = p_val))

}

# standardized median differences
standardized_median_difference_mad <- function(x, INDEX, y) {
  if (missing(y)) {
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
  if (missing(y)) {
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
  if (missing(y)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  return((median(dataset1) - median(dataset2)) / sbwab(dataset1))
}

sbwab <- function(x) {
  dataset_x <- x
  sqrt_n <- sqrt(length(dataset_x))
  mad <- median(unlist(lapply(dataset_x, function(x) { abs(x - median(dataset_x)) })))
  median_x <- median(dataset_x)
  yis <- unlist(lapply(dataset_x, function(x) {
    (x - median_x) / (9 * mad)
  }))
  ais <- ifelse(abs(yis) < 1, 1, 0)
  index <- 1:length(x)
  sum <- sum(unlist(lapply(index, function(x) {
    ais[x] *
      (dataset_x[x] - median_x)^2 *
      (1 - yis[x])^4
  })))
  numerator <- sqrt_n * sqrt(sum)
  denominator <- abs(sum(unlist(lapply(index, function(x) {
    ais[x] * (1 - yis[x]^2) * (1 - 5 * yis[x]^2)
  }))))
  return(numerator / denominator)
}

# Effect Sizes that go beyond comparison of the mean  -------------------------------------------

## Variance ratio ----
variance_ratio <- function(x = NULL, INDEX = NULL, y = NULL, s1, s2, group_1_reference = TRUE, log = FALSE) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      sds <- tapply(x, INDEX, sd)
      s1 <- sds[[1]]
      s2 <- sds[[2]]
    } else if (!is.null(y)) {
      s1 <- sd(x)
      s2 <- sd(y)
    }
  }

  num <- ifelse(group_1_reference, s2^2, s1^2)
  denom <- ifelse(group_1_reference, s1^2, s2^2)
  variance_ratio <- ifelse(log, log(num / denom), num / denom)
  return(variance_ratio)
}

## Tail ratios ----
### parametric tail ratio ----
parametric_tail_ratio <- function(x = NULL, INDEX = NULL, y = NULL,
                          m1, m2, s1, s2,
                          reference_group = c("group1", "group2"),
                          tail = c("lower", "upper"),
                          cutoff) {

  if (!is.null(x)) {
    if (!is.null(INDEX)) {

      stats <- summary_stats(x = x, INDEX = INDEX)
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }

  cdf_group1 <- pnorm(cutoff, m1, s1)
  cdf_group2 <- pnorm(cutoff, m2, s2)

  tail_ratio <- switch(reference_group,
                       "group1" = ifelse(tail %in% "lower", cdf_group2 / cdf_group1, (1 - cdf_group2) / (1 - cdf_group1)),
                       "group2" = ifelse(tail %in% "lower", cdf_group1 / cdf_group2, (1 - cdf_group1) / (1 - cdf_group2)),
                       NULL)
  return(tail_ratio)
}

### Non-parametric tail ratios: ----

# give exact tail ratios (equivalent to risk ratios) when enough observations are
# present below the cutoff in each group - otherwise call non_parametric_approx
# to yield approximate tail ratios.
non_parametric_tail_ratio <- function(x, INDEX, reference_group = c("group1", "group2"), tail = c("lower", "upper"), cutoff) {
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[1]]
  dataset2 <- dataset[[2]]
  n1 <- length(dataset1)
  n2 <- length(dataset2)

  n1_below <- sum(dataset1 <= cutoff)
  n1_above <- sum(dataset1 >= cutoff)

  n2_below <- sum(dataset2 <= cutoff)
  n2_above <- sum(dataset2 >= cutoff)

  any_counts_zero <- ifelse(tail %in% "lower", any(c(n1_below, n2_below) == 0), any(c(n1_above, n2_above) == 0))
  if (any_counts_zero) {
    return(NA_real_)
  } else {
    group1_below <- n1_below / n1
    group1_above <- n1_above / n1
    group2_below <- n2_below / n2
    group2_above <- n2_above / n2

    tail_ratio <- switch(reference_group,
                 "group1" = ifelse(tail %in% "lower", group1_below / group2_below, group1_above / group2_above),
                 "group2" = ifelse(tail %in% "lower", group2_below / group1_below, group2_above / group1_above)
    )

    return(tail_ratio)
  }

}

# Apprxomiate tail ratios based on a kernel density estimator of choice:
non_parametric_tail_ratio_approx <- function(x, INDEX, ref = c("group1", "group2"), tail = c("lower", "upper"),
                                     cutoff, bw = "nrd0", kernel = c("gaussian",
                                                                     "epanechnikov",
                                                                     "rectangular",
                                                                     "triangular",
                                                                     "biweight",
                                                                     "cosine",
                                                                     "optcosine")) {
  dataset <- split(x, INDEX)
  num_intervals <- abs(diff(range(unlist(dat)))) * 10
  d1 <- density(dataset1, bw = bw, kernel = kernel)
  d2 <- density(dataset2, bw = bw, kernel = kernel)
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  min <- ifelse(tail %in% "lower", max(min(d1$x), min(d2$x)), cutoff)
  max <- ifelse(tail %in% "lower", cutoff, min(max(d1$x), max(d2$x)))
  interval <- seq(min, max, length.out = num_intervals)
  group1_tail <- integrate(f1, min, max)$value
  group2_tail <- integrate(f2, min, max)$value
  tr <- ifelse(ref %in% "group1", group1_tail / group2_tail, group2_tail / group1_tail)
  return(tr)

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
      if (i > j) { u <- u + 1 }
      else if (i == j) { u <- u + 0.5 }
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
  u_val <- calculate_u_with_ties(x, y)
  z_value <- calculate_z_for_u_statistic(x, y)
  p_value <- calculate_p_value_from_z(z_value)
  return(list(u_val = u_val,
              z = z_value,
              p = p_value))
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
  dataset <- split(x, INDEX)
  m <- length(dataset[[1]])
  n <- length(dataset[[2]])
  delta <- mann_whitney_based_ps(x, INDEX)
  variance <- delta *
    (1 - delta) *
    (1 +
      (n - 1) * (1 - delta) / (2 - delta) +
      (m - 1) * delta / (1 + delta)) / (m * n)
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
  c <- -3 *
    z *
    sqrt(9 * (w + 1) * (n - w) * (9 * n + 5 - z^2) + n + 1)
  d <- 81 * (w + 1)^2 - 9 * (w + 1) * (2 + z^2) + 1
  e <- 1 + a * ((b + c) / d)^3
  upper_bound <- 1 / e
  # lower boundary of ci
  a <- (w / n - w - 1)^2
  b <- 81 * w * (n - w - 1) - 9 * n - 8
  c <- 3 *
    z *
    sqrt(9 * (n - w - 1) * (9 * n + 5 - z^2) + n + 1)
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
  if (!is.null(y)) {
    dataset <- split(x, INDEX)
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

common_language_es <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  # common language effect size based on del guidice-----
  if (!is.null(x)) {
    dataset <- split(x, INDEX)
    if (length(dataset[[1]]) != length(dataset[[2]])) return(NA_real_)
    d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  } else {
    if (n1 != n2) return(NA_real_)
    d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
  }
  return(pnorm(abs(d) / sqrt(2)))
}

common_language_es_ci <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x)) {
    dataset <- split(x, INDEX)
    if (length(dataset[[1]]) != length(dataset[[2]])) return(list(lower_bound = NA_real_, upper_bound = NA_real_))
    cohen_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)
    cis <- smd_ci(effsize = "cohen_d", val = cohen_d, x = x, INDEX = INDEX)[2:3]
  } else {
    if (n1 != n2) return(list(lower_bound = NA_real_, upper_bound = NA_real_))
    cohen_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
    cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = n1, n2 = n2, var1 = var1, var2 = var2)[2:3]
  }
  lower_bound <- pnorm(cis[[1]] / sqrt(2))
  upper_bound <- pnorm(cis[[2]] / sqrt(2))
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

#todo
probability_of_correct_classification_es <- function(x, INDEX) {
  # probability of correct classification----
  # when assumptions of normality and equality of variances/coveriances are not satisfied this gives inadequate results
  dataset <- split(x, INDEX)
  if (length(dataset[[1]]) != length(dataset[[2]])) return(NA_real_)
  d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  return(pnorm(abs(d) / 2))
}

probability_of_correct_classification_ci <- function(x, INDEX) {
  dataset1 <- split(x, INDEX)[[1]]
  dataset2 <- split(x, INDEX)[[2]]
  if (length(dataset1) != length(dataset2)) return(list(lower_bound = NA_real_, upper_bound = NA_real_))
  cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]])
  cis <- smd_ci(effsize = "cohen_d", val = cohen_d, n1 = length(dataset1), n2 = length(dataset2), var1 = var(dataset1), var2 = var(dataset2))[2:3]
  lower_bound <- pnorm(cis[[1]] / 2)
  upper_bound <- pnorm(cis[[2]] / 2)
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}


# overlap measures ----
non_parametric_ovl <-
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

parametric_ovl <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x)) cohens_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)[[1]]
  else cohens_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
  2 * pnorm(-abs(cohens_d) / 2)
}

parametric_ovl_ci <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
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


non_parametric_ovl_two <- function(x, INDEX) {
  ovl <- non_parametric_ovl(x, INDEX)
  return(ovl / (2 - ovl))
}

parametric_ovl_two <- function(x, INDEX) {
  ovl <- parametric_ovl(x, INDEX)
  return(ovl / (2 - ovl))
}

parametric_ovl_two_ci <- function(x = NULL, INDEX = NULL, m1 = NULL, m2 = NULL, var1 = NULL, var2 = NULL, n1 = NULL, n2 = NULL) {
  ovl_cis <- parametric_ovl_ci(x, INDEX, m1, m2, var1, var2, n1, n2)
  lower_bound <- ovl_cis[[1]] / (2 - ovl_cis[[1]])
  upper_bound <- ovl_cis[[2]] / (2 - ovl_cis[[2]])
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}


non_parametric_cohens_u1 <- function(x, INDEX) {
  ovl <- non_parametric_ovl(x, INDEX)
  return(1 - ovl / (2 - ovl))
}

parametric_cohens_u1 <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  ovl <- parametric_ovl(x, INDEX, m1, m2, var1, var2, n1, n2)
  return(1 - ovl / (2 - ovl))
}

parametric_cohens_u1_ci <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  ovl_cis <- parametric_ovl_ci(x, INDEX, m1 = NULL, m2 = NULL, var1 = NULL, var2 = NULL, n1 = NULL, n2 = NULL)
  lower_bound <- 1 - ovl_cis[[2]] / (2 - ovl_cis[[2]])
  upper_bound <- ovl_cis[[1]] / (2 - ovl_cis[[1]])
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

parametric_cohens_u2 <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x) && !is.null(INDEX)) {
    cohens_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)
  } else {
    cohens_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
  }
  return(pnorm(abs(cohens_d / 2)))

}

parametric_cohens_u2_ci <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2) {
  if (!is.null(x) && !is.null(INDEX)) {
    cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX))
    cohen_d_ci <- smd_ci(effsize = "cohen_d", x = x, INDEX = INDEX, val = cohen_d)[2:3]
  } else {
    cohen_d <- abs(smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2))
    cohen_d_ci <- smd_ci(effsize = "cohen_d", val = cohen_d, var1 = var1, var2 = var2, n1 = n1, n2 = n2)[2:3]
  }
  lower_bound <- pnorm(abs(cohen_d_ci$lower_bound) / 2)
  upper_bound <- pnorm(abs(cohen_d_ci$upper_bound) / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

## Cohen's U3 coefficient (non-parametric) ----
non_parametric_u3 <- function(x, INDEX) {
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
  result <- 1 / length(dataset2) * sum(unlist(lapply(dataset2, function(x) { if (x < median) 1 else 0 })))
  return(result)
}

## Cohen's U3 coefficient (parametric) ----
parametric_cohens_u3 <- function(x = NULL, INDEX = NULL, m1, m2, var1, var2, n1, n2, var_equal = TRUE) {
  if (var_equal) {
    if (!is.null(x) && !is.null(INDEX)) cohens_d <- smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX)
    else cohens_d <- smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2)
    return(pnorm(abs(cohens_d)))
  } else if (!var_equal) {
    if (!is.null(x) && !is.null(INDEX)) {
      original_dataset <- split(x, INDEX)
      dataset1 <- original_dataset[[1]]
      dataset2 <- original_dataset[[2]]
      standardised_by_group_1 <- ifelse(mean(dataset1) > mean(dataset2), TRUE, FALSE)
      glass_d <- glass_d(x, INDEX, standardised_by_group_1 = standardised_by_group_1)
    }else {
      standardised_by_group_1 <- ifelse(m1 > m2, TRUE, FALSE)
      glass_d <- glass_d(m1 = m1, m2 = m2, s1 = sqrt(var1), s2 = sqrt(var2), standardised_by_group_1 = standardised_by_group_1)
    }
    return(pnorm(abs(glass_d)))
  }
}

parametric_cohens_u3_ci <- function(x, INDEX, m1, m2, var1, var2, n1, n2, var_equal = TRUE, alpha = 0.05) {
  if (var_equal) {
    if (!missing(x) && !missing(INDEX)) {
      cohen_d <- abs(smd_uni(effsize = "cohen_d", x = x, INDEX = INDEX))
      cohen_d_ci <- smd_ci(effsize = "cohen_d", x = x, INDEX = INDEX, val = cohen_d)[2:3]
    } else {
      cohen_d <- abs(smd_uni(effsize = "cohen_d", m1 = m1, m2 = m2, var1 = var1, var2 = var2, n1 = n1, n2 = n2))
      cohen_d_ci <- smd_ci(effsize = "cohen_d", val = cohen_d, var1 = var1, var2 = var2, n1 = n1, n2 = n2)[2:3]
    }
    lower_bound <- pnorm(cohen_d_ci[[1]])
    upper_bound <- pnorm(cohen_d_ci[[2]])

  } else if (!var_equal) {
    if (!missing(x) && !missing(INDEX)) {
      original_dataset <- split(x, INDEX)
      dataset1 <- original_dataset[[1]]
      dataset2 <- original_dataset[[2]]
      standardised_by_group_1 <- ifelse(mean(dataset1) > mean(dataset2), TRUE, FALSE)
      glass_d_ci <- glass_d_ci(x, INDEX, standardised_by_group_1 = standardised_by_group_1, alpha = alpha)
    } else {
      standardised_by_group_1 <- ifelse(m1 > m2, TRUE, FALSE)
      glass_d_ci <- glass_d_ci(m1 = m1, m2 = m2, s1 = sqrt(var1), s2 = sqrt(var2), n1 = n1, n2 = n2, standardised_by_group_1 = standardised_by_group_1, alpha = alpha)
    }
    lower_bound <- pnorm(glass_d_ci[[1]])
    upper_bound <- pnorm(glass_d_ci[[2]])

  }

  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

# homogenity measures of variances ----

are_variances_homogenous <- function(x, INDEX) {
  p_value <- levenes_test(x, INDEX)
  if (p_value < 0.05) return(FALSE)
  return(TRUE)
}

# equivalent to leven test from 'car' package
levenes_test <- function(x, INDEX) {
  original_dataset <- split(x, INDEX)
  n <- length(x)
  k <- length(original_dataset)
  sum_z_dot_dot <- 0
  list_list_zijs <- vector("list", length(original_dataset))
  list_zi_dot <- lapply((seq_along(original_dataset)), function(i) {
    ni <- length(original_dataset[[i]])
    yi <- median(original_dataset[[i]])
    sum_zij <- 0
    list_zij <- lapply(original_dataset[[i]], function(j) {
      zij <- abs(j - yi)
      sum_zij <<- sum_zij + zij
      sum_z_dot_dot <<- sum_z_dot_dot + zij
      return(zij)
    })
    list_list_zijs[[i]] <<- list_zij
    return(sum_zij / ni)
  })
  z_dot_dot <- sum_z_dot_dot / n
  numerator <- sum(unlist((lapply(seq(length(original_dataset)), function(group_number) {
    length(original_dataset[[group_number]]) * ((list_zi_dot[[group_number]] - z_dot_dot)^2) }))))
  denumerator <- sum(unlist(lapply(seq(length(original_dataset)), function(group_number) {
    zi_dot <- list_zi_dot[[group_number]]
    sum(unlist(lapply(list_list_zijs[[group_number]], function(j) {
      ((j - zi_dot)^2)
    }
    )))
  })))
  w <- ((n - k) / (k - 1)) * (numerator / denumerator)
  pf(w, k - 1, n - k, lower.tail = FALSE)
}


# dependent groups parametric ----
sd_pooled <- function(s1, s2, n1, n2) {
  res <- sqrt((((n1 - 1) * s1^2) + ((n2 - 1) * s2^2)) / (n1 + n2 - 2))
  return(res)
}

sd_diff <- function(s1, s2, r) {
  res <- sqrt(s1^2 + s2^2 - 2 * r * s1 * s2)
  return(res)
}

cohens_d_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  sdp <- sd_pooled(s1, s2, n1 = n, n2 = n)
  res <- (m2 - m1) / sdp
  return(res)
}

cohens_d_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  sdp <- sd_pooled(s1, s2, n1 = n, n2 = n)
  W <- (s1 * s2) / (sdp^2)
  rW <- r * W
  non_centrality_parameter <- cohens_d_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n) * sqrt(n / (2 * (1 - rW)))
  df <- 2 * (n - 1) / (1 + r^2)
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  cohens_d_dependent_ci <- ncp_ci * sqrt(2 * (1 - rW) / n)
  return(list(lower_bound = cohens_d_dependent_ci[[1]],
              upper_bound = cohens_d_dependent_ci[[2]]))
}

hedges_g_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  cohens_d_dependent <- cohens_d_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
  res <- cohens_d_dependent * hedges_bias_correction(df = n - 1)
  return(res)
}

hedges_g_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  sdp <- sd_pooled(s1, s2, n1 = n, n2 = n)
  W <- (s1 * s2) / (sdp^2)
  rW <- r * W
  non_centrality_parameter <- hedges_g_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n) * sqrt(n / (2 * (1 - rW)))
  df <- 2 * (n - 1) / (1 + r^2)
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  hedges_g_dependent_ci <- ncp_ci * sqrt(2 * (1 - rW) / n)
  return(list(lower_bound = hedges_g_dependent_ci[[1]],
              upper_bound = hedges_g_dependent_ci[[2]]))
}


bonett_d_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  sdp <- sd_pooled(s1, s2, n1 = n, n2 = n)
  res <- sqrt((n - 2) / (n - 1)) * ((m2 - m1) / sdp)
  return(res)
}

bonett_d_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  sdp <- sd_pooled(s1, s2, n1 = n, n2 = n)
  bonett_d_dependent <- bonett_d_dependent(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n) * sqrt((n - 1) / (n - 2))
  v <- (bonett_d_dependent^2 * (s1^4 + s2^4 + 2 * r^2 * s1^2 * s2^2)) / (8 * (n - 1) * sdp^4) + sdiff^2 / ((n - 1) * sdp^2)
  bonett_d_dependent_ci <- bonett_d_dependent + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = bonett_d_dependent_ci[[1]],
              upper_bound = bonett_d_dependent_ci[[2]]))
}

cohens_dz <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  res <- (m2 - m1) / sdiff
  return(res)
}

cohens_dz_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  non_centrality_parameter <- cohens_dz * sqrt(n)
  df <- n - 1
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  cohens_dz_ci <- ncp_ci / sqrt(n)
  return(list(lower_bound = cohens_dz_ci[[1]],
              upper_bound = cohens_dz_ci[[2]]))
}

hedges_gz <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  res <- cohens_dz * hedges_bias_correction(df = n - 1)
  return(res)
}

hedges_gz_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  hedges_gz <- hedges_gz(m1 = m1, m2 = m2, sdiff = sdiff, n = n)
  non_centrality_parameter <- hedges_gz * sqrt(n)
  df <- n - 1
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  hedges_gz_ci <- ncp_ci / sqrt(n)
  return(list(lower_bound = hedges_gz_ci[[1]],
              upper_bound = hedges_gz_ci[[2]]))
}

cohens_drm <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  res <- ((m2 - m1) / sdiff) * sqrt(2 * (1 - r))
  return(res)
}


cohens_drm_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_drm <- cohens_drm(m1 = m1, m2 = m2, sdiff = sdiff, r = r)
  v <- 2 * (1 - r) * ((cohens_drm^2 / (2 * n)) + (1 / n))
  cohens_drm_ci <- cohens_drm + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = cohens_drm_ci[[1]],
              upper_bound = cohens_drm_ci[[2]]))
}

hedges_grm <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_drm <- cohens_drm(m1 = m1, m2 = m2, sdiff = sdiff, r = r)
  res <- cohens_drm * hedges_bias_correction(n - 1)
  return(res)
}

hedges_grm_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_drm <- cohens_drm(m1 = m1, m2 = m2, sdiff = sdiff, r = r)
  hedges_grm <- hedges_grm(m1 = m1, m2 = m2, sdiff = sdiff, r = r, n = n)
  v <- 2 *
    (1 - r) *
    ((cohens_drm^2 / (2 * n)) + (1 / n)) *
    hedges_bias_correction(n - 1)
  hedges_grm_ci <- hedges_grm + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = hedges_grm_ci[[1]],
              upper_bound = hedges_grm_ci[[2]]))
}

glass_d <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, s1, s2, standardised_by_group_1 = TRUE) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX)
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  standardiser <- ifelse(standardised_by_group_1, s1, s2)
  res <- (m2 - m1) / standardiser
  return(res)
}

glass_d_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  glass_d_dependent <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1)
  standardiser <- ifelse(standardised_by_group_1, s1, s2)
  v <- (glass_d_dependent^2 / (2 * (n - 1))) + (sdiff^2 / (standardiser^2 * (n - 1)))
  glass_d_dependent_ci <- glass_d_dependent + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = glass_d_dependent_ci[[1]],
              upper_bound = glass_d_dependent_ci[[2]]))
}

glass_d_corr <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, s1, df) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX)
      df <- stats$n1 - 1
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y)
      df <- stats$n - 1
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  glass_d <- glass_d(m1 = m1, m2 = m2, s1 = s1)
  res <- glass_d * hedges_bias_correction(df = df)
  return(res)
}

glass_d_corr_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  glass_d_corr_dependent <- glass_d_corr(m1 = m1, m2 = m2, s1 = s1, df = n - 1)
  glass_d_dependent <- glass_d(m1 = m1, m2 = m2, s1 = s1)
  v <- ((glass_d_dependent^2 / (2 * (n - 1))) + (sdiff^2 / (s1^2 * (n - 1)))) * hedges_bias_correction(n - 1)
  glass_d_corr_dependent_ci <- glass_d_corr_dependent + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = glass_d_corr_dependent_ci[[1]],
              upper_bound = glass_d_corr_dependent_ci[[2]]))
}

common_language_es_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, r) {
  if (!is.null(x) && !is.null(y)) {
    if (length(x) != length(y)) return(NA_real_)
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  common_language_es_dependent <- pnorm(cohens_dz)
  return(common_language_es_dependent)
}

common_language_es_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    if (length(x) != length(y)) return(NA_real_)
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.null(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz_ci <- cohens_dz_ci(m1 = m1, m2 = m2, sdiff = sdiff, n = n, alpha = alpha)
  lower_bound <- pnorm(cohens_dz_ci$lower_bound)
  upper_bound <- pnorm(cohens_dz_ci$upper_bound)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

parametric_ovl_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  cohens_d_dependent <- cohens_d_dependent(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
  ovl_parametric_dependent <- 2 * pnorm(-abs(cohens_d_dependent) / 2)
  return(ovl_parametric_dependent)
}

parametric_ovl_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  cohens_d_dependent_ci <- cohens_d_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
  lower_bound <- 2 * pnorm(-abs(cohens_d_dependent_ci$lower_bound) / 2)
  upper_bound <- 2 * pnorm(-abs(cohens_d_dependent_ci$upper_bound) / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}


parametric_ovl_two_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  ovl <- parametric_ovl_dependent(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
  ovl_two_parametric_dependent <- ovl / (2 - ovl)
  return(ovl_two_parametric_dependent)
}

parametric_ovl_two_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  ovl_parametric_dependent_ci <- parametric_ovl_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
  lower_bound <- ovl_parametric_dependent_ci$lower_bound / (2 - ovl_parametric_dependent_ci$lower_bound)
  upper_bound <- ovl_parametric_dependent_ci$upper_bound / (2 - ovl_parametric_dependent_ci$upper_bound)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}


parametric_cohens_u1_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  ovl <- parametric_ovl_dependent(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
  cohens_coefficient_of_nonoverlap_u1_parametric_dependent <- 1 - (ovl / (2 - ovl))
  return(cohens_coefficient_of_nonoverlap_u1_parametric_dependent)
}

parametric_cohens_u1_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  ovl_parametric_dependent_ci <- parametric_ovl_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
  lower_bound <- 1 - (ovl_parametric_dependent_ci$lower_bound / (2 - ovl_parametric_dependent_ci$lower_bound))
  upper_bound <- 1 - (ovl_parametric_dependent_ci$upper_bound / (2 - ovl_parametric_dependent_ci$upper_bound))
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

parametric_cohens_u2_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  cohens_d_dependent <- cohens_d_dependent(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
  cohens_coefficient_of_nonoverlap_u2_parametric_dependent <- pnorm(abs(cohens_d_dependent) / 2)
  return(cohens_coefficient_of_nonoverlap_u2_parametric_dependent)
}

parametric_cohens_u2_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  cohens_d_dependent_ci <- cohens_d_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
  lower_bound <- pnorm(abs(cohens_d_dependent_ci$lower_bound) / 2)
  upper_bound <- pnorm(abs(cohens_d_dependent_ci$upper_bound) / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

parametric_cohens_u3_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, var_equal = TRUE) {
  if (var_equal) {
    cohens_d_dependent <- cohens_d_dependent(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n)
    cohens_coefficient_of_nonoverlap_u3_parametric_dependent <- pnorm(abs(cohens_d_dependent))
  } else {
    if (!is.null(x) && !is.null(y)) {
      stats <- summary_stats(x = x, y = y)
      for (i in names(stats)) {
        assign(i, stats[[i]])
      }
    }
    standardised_by_group_1 <- ifelse(m1 > m2, TRUE, FALSE)
    glass_d_dependent <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = FALSE)
    cohens_coefficient_of_nonoverlap_u3_parametric_dependent <- pnorm(abs(glass_d_dependent))
  }
  return(cohens_coefficient_of_nonoverlap_u3_parametric_dependent)
}

parametric_cohens_u3_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NULL, n, r, var_equal = TRUE, alpha = 0.05) {
  if (var_equal) {
    cohens_d_dependent_ci <- cohens_d_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
    lower_bound <- pnorm(abs(cohens_d_dependent_ci$lower_bound))
    upper_bound <- pnorm(abs(cohens_d_dependent_ci$upper_bound))
  } else {
    if (!is.null(x) && !is.null(y)) {
      stats <- summary_stats(x = x, y = y)
      for (i in names(stats)) {
        assign(i, stats[[i]])
      }
    }
    standardised_by_group_1 <- ifelse(m1 > m2, TRUE, FALSE)
    glass_d_dependent_ci <- glass_d_dependent_ci(m1 = m1, m2 = m2, s1 = s1, s2 = s2, sdiff = sdiff, n = n, r = r, standardised_by_group_1 = standardised_by_group_1, alpha = alpha)
    lower_bound <- pnorm(abs(glass_d_dependent_ci$lower_bound))
    upper_bound <- pnorm(abs(glass_d_dependent_ci$upper_bound))
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

variance_ratio_dependent_ci <- function(x = NULL, y = NULL, s1, s2, n, r, group_1_reference = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y,)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
    trim <- 1 / (2 * sqrt((n - 4)))
    trimmed_mean1 <- mean(x, trim = trim)
    trimmed_mean2 <- mean(y, trim = trim)
    gamma1 <- (n * sum((x - trimmed_mean1)^4)) / (sum((x - m1)^2)^2)
    gamma2 <- (n * sum((y - trimmed_mean2)^4)) / (sum((y - m2)^2)^2)
    nu1 <- (gamma1 - (n - 3) / n) / (n - 4)
    nu2 <- (gamma2 - (n - 3) / n) / (n - 4)
    d1 <- (x - m1)^2
    d2 <- (y - m2)^2
    r_d <- cor(d1, d2)
    a <- r_d * sqrt(nu1 * nu2)
    z_crit <- qnorm(alpha / 2)
    variance_ratio <- variance_ratio(s1 = s1, s2 = s2, group_1_reference = group_1_reference, log = TRUE)
    variance_ratio_dependent_ci <- exp(variance_ratio + c(z_crit, abs(z_crit)) * sqrt(nu1 + nu2 - 2 * a))
    lower_bound <- variance_ratio_dependent_ci[[1]]
    upper_bound <- variance_ratio_dependent_ci[[2]]
  } else {
    variance_ratio <- variance_ratio(s1 = s1, s2 = s2, group_1_reference = group_1_reference, log = FALSE)
    t_crit <- qt(alpha / 2, df = n - 2)
    k <- 1 + (2 * (1 - r^2) * t_crit^2) / (n - 2)
    lower_bound <- variance_ratio * (k - sqrt(k^2 - 1))
    upper_bound <- variance_ratio * (k + sqrt(k^2 - 1))
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}


find_nam_blackwelder_asymptotic_cml <- function(n1., n.1, n11, n12, n21, n22, interval, z_val) {
  res <- suppressWarnings(
    uniroot(f = function(x) {
      p12 <- (-n1. +
        (x^2 * (n.1 + 2 * n12)) +
        sqrt((n1. - ((x^2) * 2.1))^2 + 4 * x^2 * n12 * n21)) / (2 * n * x * (x + 1))
      p21 <- (x * p12) - ((x - 1) * (1 - (n22 / n)))
      ((sqrt(n) * (n1. - x * n.1)) / (n * sqrt(x * (p12 + p21)))) - z_val
    },
            interval = interval)
  )$root
  return(res)
}

nam_blackwelder_asymptotic_cml <- function(n1., n.1, n11, n12, n21, n22, interval, alpha = 0.05) {
  lower_bound <- find_nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, z_val = -qnorm(alpha / 2))
  upper_bound <- find_nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, z_val = qnorm(alpha / 2))
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

bonett_price_hybrid_wilson_score <- function(n1., n.1, n11, n12, n21, alpha = 0.05) {
  A <- sqrt((n12 + n21 + 2) / ((n1. + 1) * (n.1 + 1)))
  B <- sqrt((1 - ((n1. + 1) / (n11 + n12 + n21 + 2))) / (n1. + 1))
  C <- sqrt((1 - ((n.1 + 1) / (n11 + n12 + n21 + 2))) / (n.1 + 1))
  z <- (A / (B + C)) * qnorm(alpha / 2)
  l1_u1 <- (2 * n1. +
    z^2 +
    c(z, -z) * sqrt(z^2 + 4 * n1. * (1 - (n1. / (n11 + n12 + n21))))) / (2 * (n11 + n12 + n21 + z^2))
  l2_u2 <- (2 * n.1 +
    z^2 +
    c(z, -z) * sqrt(z^2 + 4 * n.1 * (1 - (n.1 / (n11 + n12 + n21))))) / (2 * (n11 + n12 + n21 + z^2))
  lower_bound <- l1_u1[[1]] / l2_u2[[2]]
  upper_bound <- l1_u1[[2]] / l2_u2[[1]]
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

parametric_tr_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, r, n,
                                       reference_group = c("group1", "group2"),
                                       cutoff, tail = c("lower", "upper"), alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y,)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  means <- c(m1, m2)
  sigmas <- matrix(c(s1^2, s1 * s2 * r, s1 * s2 * r, s2^2), byrow = TRUE, ncol = 2)
  pretest_success <- ifelse(tail == "lower", pnorm(cutoff, m1, s1), 1 - pnorm(cutoff, m1, s1))
  posttest_success <- ifelse(tail == "lower", pnorm(cutoff, m2, s2), 1 - pnorm(cutoff, m2, s2))
  pretest_success_posttest_failure <- mvtnorm::pmvnorm(lower = c(ifelse(tail == "lower", -Inf, cutoff),
                                                                 ifelse(tail == "lower", cutoff, -Inf)),
                                                       upper = c(ifelse(tail == "lower", cutoff, Inf),
                                                                 ifelse(tail == "lower", Inf, cutoff)),
                                                       mean = means,
                                                       sigma = sigmas)
  pretest_failure_posttest_success <- mvtnorm::pmvnorm(lower = c(ifelse(tail == "lower", cutoff, -Inf),
                                                                 ifelse(tail == "lower", -Inf, cutoff)),
                                                       upper = c(ifelse(tail == "lower", Inf, cutoff),
                                                                 ifelse(tail == "lower", cutoff, Inf)),
                                                       mean = means,
                                                       sigma = sigmas)
  pretest_success_posttest_success <- mvtnorm::pmvnorm(lower = c(ifelse(tail == "lower", -Inf, cutoff),
                                                                 ifelse(tail == "lower", -Inf, cutoff)),
                                                       upper = c(ifelse(tail == "lower", cutoff, Inf),
                                                                 ifelse(tail == "lower", cutoff, Inf)),
                                                       mean = means,
                                                       sigma = sigmas)
  pretest_failure_posttest_failure <- mvtnorm::pmvnorm(lower = c(ifelse(tail == "lower", cutoff, -Inf),
                                                                 ifelse(tail == "lower", cutoff, -Inf)),
                                                       upper = c(ifelse(tail == "lower", Inf, cutoff),
                                                                 ifelse(tail == "lower", Inf, cutoff)),
                                                       mean = means,
                                                       sigma = sigmas)
  n1. <- ifelse(reference_group == "group1", posttest_success, pretest_success) * n
  n.1 <- ifelse(reference_group == "group1", pretest_success, posttest_success) * n
  n11 <- pretest_success_posttest_success * n
  n22 <- pretest_failure_posttest_failure * n
  n12 <- ifelse(reference_group == "group1", pretest_failure_posttest_success, pretest_success_posttest_failure) * n
  n21 <- ifelse(reference_group == "group1", pretest_success_posttest_failure, pretest_failure_posttest_success) * n
  parametric_tail_ratio_dependent <- n1. / n.1
  wald_se <- sqrt((n12 + n21) / (n1. * n.1))
  interval <- exp(log(parametric_tail_ratio_dependent) + c(-3, 3) * wald_se)
  any_marginal_counts_zero <- any(c(n1., n.1) == 0)
  if (any_marginal_counts_zero) {
    lower_bound <- NA_real_
    upper_bound <- NA_real_
  } else {
    parametric_tail_ratio_dependent_ci <- try(nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, alpha = alpha), silent = TRUE)
    if ("try-error" %in% class(parametric_tail_ratio_dependent_ci)) {
      parametric_tail_ratio_dependent_ci <- bonett_price_hybrid_wilson_score(n1., n.1, n11, n12, n21, alpha = alpha)
    }
    lower_bound <- parametric_tail_ratio_dependent_ci[[1]]
    upper_bound <- parametric_tail_ratio_dependent_ci[[2]]
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}


robust_cohens_dz <- function(x, y, trim = 0.2) {

  stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  c <- ifelse(trim > 0, AKP_correction(trim), 1)
  robust_cohens_dz <- c * (trmdiff / sqrt(winvardiff))
  return(robust_cohens_dz)
}

robust_cohens_d <- function(x = NULL, INDEX = NULL, y = NULL, trim = 0.2) {

  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = TRUE)
    } else {
      stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- AKP_correction(trim)
  robust_cohens_d_dependent <- c * ((trm2 - trm1) / sd_pooled(s1 = sqrt(winvar1), s2 = sqrt(winvar2), n1 = n, n2 = n))
  return(robust_cohens_d_dependent)
}


robust_cohens_d_dependent_ci <- function(x, y, trim = 0.2, alpha = 0.05) {

  stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  d1 <- (n - 1) * winvar1 / (ntr * (ntr - 1))
  d2 <- (n - 1) * winvar2 / (ntr * (ntr - 1))
  d12 <- (n - 1) * wincov / (ntr * (ntr - 1))
  non_centrality_parameter <- (trm2 - trm1) / sqrt(d1 + d2 - 2 * d12)
  df <- ntr - 1
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  c <- AKP_correction(trim)
  robust_cohens_d_dependent_ci <- c *
    ncp_ci *
    sqrt((2 * (d1 + d2 - 2 * d12)) / (winvar1 + winvar2))
  return(list(lower_bound = robust_cohens_d_dependent_ci[[1]],
              upper_bound = robust_cohens_d_dependent_ci[[2]]))

}

robust_glass_d <- function(x = NULL, INDEX = NULL, y = NULL, trim = 0.2, standardised_by_group_1 = TRUE) {

  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = TRUE)
    } else {
      stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- AKP_correction(trim)
  standardiser <- ifelse(standardised_by_group_1, sqrt(winvar1), sqrt(winvar2))
  robust_glass_d <- c * ((trm2 - trm1) / standardiser)
  return(robust_glass_d)
}

robust_glass_d_dependent_ci <- function(x, y, trim = 0.2, standardised_by_group_1 = TRUE, alpha = 0.05) {

  stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  d1 <- (n - 1) * winvar1 / (ntr * (ntr - 1))
  d2 <- (n - 1) * winvar2 / (ntr * (ntr - 1))
  d12 <- (n - 1) * wincov / (ntr * (ntr - 1))
  non_centrality_parameter <- (trm2 - trm1) / sqrt(d1 + d2 - 2 * d12)
  df <- ntr - 1
  ncp_ci <- non_centrality_parameter_ci(non_centrality_parameter, df, alpha)
  c <- AKP_correction(trim)
  non_centrality_parameter_transformation_factor <- c * ifelse(standardised_by_group_1,
                                                               sqrt((d1 + d2 - 2 * d12) / (winvar1)),
                                                               sqrt((d1 + d2 - 2 * d12) / (winvar2)))
  robust_glass_d_dependent_ci <- ncp_ci * non_centrality_parameter_transformation_factor
  return(list(lower_bound = robust_glass_d_dependent_ci[[1]],
              upper_bound = robust_glass_d_dependent_ci[[2]]))
}



non_parametric_tail_ratio_dependent <- function(x = NULL, y = NULL, reference_group = c("group1", "group2"), tail = c("lower", "upper"), cutoff){


  pretest_success <- ifelse(tail == "lower", sum(x <= cutoff), sum(x >= cutoff))
  posttest_success <- ifelse(tail == "lower", sum(y <= cutoff), sum(y >= cutoff))
  any_marginal_counts_zero <- any(c(pretest_success, posttest_success) == 0)
  if(any_marginal_counts_zero){
    non_parametric_tail_ratio_dependent <- NA_real_
  } else {
    non_parametric_tail_ratio_dependent <- ifelse(reference_group == "group1", posttest_success/pretest_success, pretest_success/posttest_success)
  }
  return(non_parametric_tail_ratio_dependent)
}


non_parametric_tail_ratio_dependent_ci <- function(x, y, reference_group = c("group1", "group2"), cutoff, tail = c("lower", "upper"), alpha = 0.05){

  n <- length(x)
  pretest_success <- ifelse(tail == "lower", sum(x <= cutoff), sum(x >= cutoff))
  pretest_failure <- ifelse(tail == "lower", sum(x > cutoff), sum(x < cutoff))
  posttest_success <- ifelse(tail == "lower", sum(y <= cutoff), sum(y >= cutoff))
  posttest_failure <- ifelse(tail == "lower", sum(y > cutoff), sum(y < cutoff))
  pretest_success_posttest_failure <- ifelse(tail == "lower", sum(x <= cutoff & y > cutoff), sum(x >= cutoff & y < cutoff))
  pretest_failure_posttest_success <- ifelse(tail == "lower", sum(x > cutoff & y <= cutoff), sum(x < cutoff & y >= cutoff))
  pretest_failure_posttest_failure <- ifelse(tail == "lower", sum(x > cutoff & y > cutoff), sum(x < cutoff & y < cutoff))
  pretest_success_posttest_success <- ifelse(tail == "lower", sum(x <= cutoff & y <= cutoff), sum(x >= cutoff & y >= cutoff))
  n1. <- ifelse(reference_group == "group1", posttest_success, pretest_success)
  n.1 <- ifelse(reference_group == "group1", pretest_success, posttest_success)
  n11 <- pretest_success_posttest_success
  n22 <- pretest_failure_posttest_failure
  n12 <- ifelse(reference_group == "group1", pretest_failure_posttest_success, pretest_success_posttest_failure)
  n21 <- ifelse(reference_group == "group1", pretest_success_posttest_failure, pretest_failure_posttest_success)
  non_parametric_tail_ratio_dependent <- n1. / n.1
  wald_se <- sqrt((n12 + n21) / (n1. * n.1))
  interval <- exp(log(non_parametric_tail_ratio_dependent) + c(-3, 3) * wald_se)
  any_marginal_counts_zero <- any(c(pretest_success, posttest_success) == 0)
  if (any_marginal_counts_zero) {
    lower_bound <- NA_real_
    upper_bound <- NA_real_
  } else {
    non_parametric_tail_ratio_dependent_ci <- try(nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, alpha = alpha), silent = TRUE)
    if ("try-error" %in% class(non_parametric_tail_ratio_dependent_ci)) {
      non_parametric_tail_ratio_dependent_ci <- bonett_price_hybrid_wilson_score(n1., n.1, n11, n12, n21, alpha = alpha)
    }
    lower_bound <- non_parametric_tail_ratio_dependent_ci[[1]]
    upper_bound <- non_parametric_tail_ratio_dependent_ci[[2]]
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}
