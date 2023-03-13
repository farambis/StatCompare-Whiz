#TODO User sollen angeben wie die Faktoren zu rangreihen sind, damit in der server
# funktion die Gruppierungsvariable richtig faktorisiert werden kann


# Lists of ES, TS, & plots ----
## ES list ----
all_eff_sizes <- list(
  # Effect sizes for independent groups:
  cohen_d = "cohen_d",
  hedges_g = "hedges_g",
  glass_d = "glass_d",
  glass_d_corr = "glass_d_corr",
  bonett_d = "bonett_d",
  bonett_d_corr = "bonett_d_corr",
  kulinskaya_staudte = "kulinskaya_staudte",
  robust_cohens_d = "robust_cohens_d",
  robust_glass_d = "robust_glass_d",
  robust_bonett_d = "robust_bonett_d",
  mann_whitney_based_ps = "mann_whitney_based_ps",
  mann_whitney_based_ps_ignore_ties = "mann_whitney_based_ps_ignore_ties",
  parametric_ovl = "parametric_ovl",
  ps_dependent = "ps_dependent",
  ps_dependent_ignore_ties = "ps_dependent_ignore_ties",
  non_parametric_ovl = "non_parametric_ovl",
  generalized_odds_ratio = "generalized_odds_ratio",
  generalized_odds_ratio_dependent = "generalized_odds_ratio_dependent",
  common_language = "common_language",
  non_parametric_ovl_two = "non_parametric_ovl_two",
  parametric_ovl_two = "parametric_ovl_two",
  standardised_median_difference_mad = "standardised_median_difference_mad",
  standardised_median_difference_riq = "standardised_median_difference_riq",
  standardised_median_difference_biweight = "standardised_median_difference_biweight",
  parametric_cohens_u1 = "parametric_cohens_u1",
  parametric_cohens_u2 = "parametric_cohens_u2",
  parametric_cohens_u3 = "parametric_cohens_u3",
  non_parametric_cohens_u1 = "non_parametric_cohens_u1",
  non_parametric_cohens_u2 = "non_parametric_cohens_u2",
  non_parametric_cohens_u3 = "non_parametric_cohens_u3",
  variance_ratio = "variance_ratio",
  non_parametric_variance_ratio = "non_parametric_variance_ratio",
  tail_ratio = "tail_ratio",
  non_parametric_tail_ratio = "non_parametric_tail_ratio",
  non_parametric_ovl_two = "non_parametric_ovl_two",
  non_parametric_glass_d = "non_parametric_glass_d",
  dominance_measure = "dominance_measure",
  probability_of_correct_classification = "probability_of_correct_classification",
  #Effect sizes for dependent groups:
  cohens_d_dependent = "cohens_d_dependent",
  hedges_g_dependent = "hedges_g_dependent",
  cohens_drm = "cohens_drm",
  hedges_grm = "hedges_grm",
  bonett_d_dependent = "bonett_d_dependent",
  bonett_d_corr_dependent = "bonett_d_corr_dependent",
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
  non_parametric_variance_ratio_dependent = "non_parametric_variance_ratio_dependent",
  tail_ratio_dependent = "tail_ratio_dependent",
  robust_cohens_dz = "robust_cohens_dz",
  robust_cohens_d_dependent = "robust_cohens_d_dependent",
  robust_glass_d_dependent = "robust_glass_d_dependent",
  robust_bonett_d_dependent = "robust_bonett_d_dependent",
  non_parametric_tail_ratio_dependent = "non_parametric_tail_ratio_dependent",
  standardised_median_difference_biweight_dependent = "standardised_median_difference_biweight_dependent",
  standardised_median_difference_mad_dependent = "standardised_median_difference_mad_dependent",
  standardised_median_difference_riq_dependent = "standardised_median_difference_riq_dependent",
  non_parametric_ovl_dependent = "non_parametric_ovl_dependent",
  non_parametric_cohens_u1_dependent = "non_parametric_cohens_u1_dependent",
  non_parametric_cohens_u2_dependent = "non_parametric_cohens_u2_dependent",
  non_parametric_cohens_u3_dependent = "non_parametric_cohens_u3_dependent",
  non_parametric_ovl_two = "non_parametric_ovl_two",
  non_parametric_glass_d_dependent = "non_parametric_glass_d_dependent",
  dominance_measure_dependent = "dominance_measure_dependent",
  non_parametric_cohens_dz_dependent = "non_parametric_cohens_dz_dependent",
  non_parametric_ovl_two_dependent = "non_parametric_ovl_two_dependent",
  # Effect sizes for the pretest-posttest-control design
  d_PPC_change = "d_PPC_change",
  g_PPC_change = "g_PPC_change",
  d_PPC_pre = "d_PPC_pre",
  g_PPC_pre = "g_PPC_pre",
  d_PPC_pooled_pre = "d_PPC_pooled_pre",
  g_PPC_pooled_pre = "g_PPC_pooled_pre",
  d_PPC_pooled_pre_post = "d_PPC_pooled_pre_post",
  g_PPC_pooled_pre_post = "g_PPC_pooled_pre_post",
  non_parametric_d_PPC_pre = "non_parametric_d_PPC_pre",
  non_parametric_d_PPC_pre_alternative = "non_parametric_d_PPC_pre_alternative",
  non_parametric_d_PPC_change = "non_parametric_d_PPC_change",
  non_parametric_dominance_measure_mixed = "non_parametric_dominance_measure_mixed",
  # Effect sizes for multivariate analysis
  mahalanobis_d = "mahalanobis_d",
  bias_corrected_d_multivariate = "bias_corrected_d_multivariate",
  ovl_multivariate = "ovl_multivariate",
  pcc_multivariate = "pcc_multivariate",
  ovl_two_multivariate = "ovl_two_multivariate",
  u1_multivariate = "u1_multivariate",
  u3_multivariate = "u3_multivariate",
  common_language_multivariate = "common_language_multivariate",
  tail_ratio_multivariate = "tail_ratio_multivariate",
  variance_ratio_multivariate = "variance_ratio_multivariate"
)

## TS list ----
all_test_statistics <- list(student_t_test = "student_t_test",
                            dependent_student_t_test = "dependent_student_t_test",
                            welch_t_test = "welch_t_test",
                            yuen_t_test = "yuen_t_test",
                            dependent_yuen_t_test = "dependent_yuen_t_test",
                            tukey_mclaughlin_t_test = "tukey_mclaughlin_t_test",
                            mann_whitney = "mann_whitney",
                            mann_whitney_dependent = "mann_whitney_dependent",
                            wilcoxon_signed_rank_test = "wilcoxon_signed_rank_test")

## plot list ----
all_plots <- list(parametric_ovl = "parametric_ovl",
                  parametric_cohens_u1 = "parametric_cohens_u1",
                  parametric_cohens_u3 = "parametric_cohens_u3",
                  non_parametric_cohens_u3 = "non_parametric_cohens_u3",
                  tail_ratio = "tail_ratio",
                  tail_ratio_zoom = "tail_ratio_zoom",
                  parametric_PPC_change = "parametric_PPC_change",
                  parametric_PPC_difference = "parametric_PPC_difference",
                  parametric_PPC_interaction = "parametric_PPC_interaction",
                  non_parametric_tail_ratio = "non_parametric_tail_ratio",
                  non_parametric_tail_ratio_zoom = "non_parametric_tail_ratio_zoom",
                  non_parametric_ovl = "non_parametric_ovl",
                  non_parametric_cohens_u1 = "non_parametric_cohens_u1",
                  boxplot_pairwise_difference_scores = "boxplot_pairwise_difference_scores")

# list of ES that use a kernel density estimator
nonparametricOptions <- c(all_eff_sizes$non_parametric_ovl_two,
                          all_eff_sizes$non_parametric_cohens_u1,
                          all_eff_sizes$non_parametric_cohens_u3,
                          all_eff_sizes$non_parametric_tail_ratio,
                          all_eff_sizes$non_parametric_tail_ratio_dependent,
                          all_eff_sizes$non_parametric_ovl_dependent,
                          all_eff_sizes$non_parametric_ovl_two_dependent,
                          all_eff_sizes$non_parametric_cohens_u3,
                          all_plots$non_parametric_ovl,
                          all_plots$non_parametric_tail_ratio_zoom
)

# list of tail ratio ES and plots
tailRatioOptions <- c(all_eff_sizes$tail_ratio,
                      all_eff_sizes$non_parametric_tail_ratio,
                      all_eff_sizes$tail_ratio_dependent,
                      all_eff_sizes$non_parametric_tail_ratio_dependent,
                      all_plots$tail_ratio_zoom,
                      all_plots$non_parametric_tail_ratio_zoom
)

# list of ES for which two separate estimates are computed
es_names_to_be_mapped <- list("^glass_d$", "^glass_d_corr$", "^robust_glass_d$",
                              "^non_parametric_glass_d$", "^glass_d_dependent$",
                              "^glass_d_corr_dependent$", "^robust_glass_d_dependent$",
                              "^non_parametric_glass_d_dependent$",
                              "^standardised_median_difference_mad$",
                              "^standardised_median_difference_mad_dependent$",
                              "^standardised_median_difference_riq$",
                              "^standardised_median_difference_riq_dependent$",
                              "^standardised_median_difference_biweight$",
                              "^standardised_median_difference_biweight_dependent$",
                              "^mann_whitney_based_ps$",
                              "^ps_dependent$"
)

# list of estimate names for ES for which two separate estimates are computes
es_names_to_map <- list(c("glass_d1", "glass_d2"),
                        c("glass_d_corr1", "glass_d_corr2"),
                        c("robust_glass_d1", "robust_glass_d2"),
                        c("non_parametric_glass_d1", "non_parametric_glass_d2"),
                        c("glass_d_dependent1", "glass_d_dependent2"),
                        c("glass_d_corr_dependent1", "glass_d_corr_dependent2"),
                        c("robust_glass_d_dependent1", "robust_glass_d_dependent2"),
                        c("non_parametric_glass_d_dependent1", "non_parametric_glass_d_dependent2"),
                        c("standardised_median_difference_mad1", "standardised_median_difference_mad2"),
                        c("standardised_median_difference_mad_dependent1", "standardised_median_difference_mad_dependent2"),
                        c("standardised_median_difference_riq1", "standardised_median_difference_riq2"),
                        c("standardised_median_difference_riq_dependent1", "standardised_median_difference_riq_dependent2"),
                        c("standardised_median_difference_biweight1", "standardised_median_difference_biweight2"),
                        c("standardised_median_difference_biweight_dependent1", "standardised_median_difference_biweight_dependent2"),
                        c("mann_whitney_based_ps1", "mann_whitney_based_ps2"),
                        c("ps_dependent1", "ps_dependent2"))

# function mapping the two lists above 
map_es_names_selected_to_presented <- function(selected, es_names_to_be_mapped, es_names_to_map) {
  if (!is.list(selected)) selected <- as.list(selected)
  for (i in seq_len(length(es_names_to_be_mapped))) {
    j <- grep(pattern = es_names_to_be_mapped[[i]], x = selected)
    if (length(j) != 0) selected[[j]] <- es_names_to_map[[i]]
  }
  return(unlist(selected))
}

# Grand ES & TS functions ----
## univariate ES for raw data ----
generate_es_raw_data_dataframe <- function(es_list, INDEX = NULL, x, y, tail, ref, cutoff, alpha = 0.05) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  es_boot_ci_lower <- vector(mode = "double", length = 0L)
  es_boot_ci_upper <- vector(mode = "double", length = 0L)
  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("This is not an offered effect size!\n")
    res <- switch(i,
                  # Effect sizes for independent groups:
                  "cohen_d" = c(cohens_d(x = x, INDEX = INDEX), cohens_d_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, cohens_d, alpha = alpha)),
                  "hedges_g" = c(hedges_g(x = x, INDEX = INDEX), hedges_g_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, hedges_g, alpha = alpha)),
                  "glass_d" = data.frame(rbind(c(glass_d(x, INDEX, standardised_by_group_1 = TRUE), unlist(glass_d_ci(x, INDEX, standardised_by_group_1 = TRUE, alpha = alpha)), unlist(boot_general(x, INDEX, glass_d, alpha, standardised_by_group_1 = TRUE))), c(glass_d(x, INDEX, standardised_by_group_1 = FALSE), unlist(glass_d_ci(x, INDEX, standardised_by_group_1 = FALSE)), unlist(boot_general(x, INDEX, glass_d, alpha, standardised_by_group_1 = FALSE))))),
                  "glass_d_corr" = data.frame(rbind(c(glass_d_corr(x, INDEX, standardised_by_group_1 = TRUE), unlist(glass_d_corr_ci(x, INDEX, standardised_by_group_1 = TRUE)), unlist(boot_general(x, INDEX, glass_d_corr, alpha, standardised_by_group_1 = TRUE))), c(glass_d_corr(x, INDEX, standardised_by_group_1 = FALSE), unlist(glass_d_corr_ci(x, INDEX, standardised_by_group_1 = FALSE)), unlist(boot_general(x, INDEX, glass_d_corr, alpha, standardised_by_group_1 = FALSE))))),
                  "bonett_d" = c(bonett_d(x = x, INDEX = INDEX), bonett_d_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, bonett_d, alpha = alpha)),
                  "bonett_d_corr" = c(bonett_d_corr(x = x, INDEX = INDEX), bonett_d_corr_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, bonett_d_corr, alpha = alpha)),
                  "kulinskaya_staudte" = c(kulinskaya_staudte(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, alpha = alpha, kulinskaya_staudte)),
                  "robust_cohens_d" = c(robust_cohens_d(x = x, INDEX = INDEX, trim = 0.2), robust_cohens_d_ci(x = x, INDEX = INDEX, trim = 0.2, alpha = alpha), boot_general(x, INDEX, robust_cohens_d, alpha)),
                  "robust_glass_d" = data.frame(rbind(c(robust_glass_d(x, INDEX, standardised_by_group_1 = TRUE), unlist(robust_glass_d_ci(x, INDEX, standardised_by_group_1 = TRUE)), unlist(boot_general(x, INDEX, robust_glass_d, alpha, standardised_by_group_1 = TRUE))), c(robust_glass_d(x, INDEX, standardised_by_group_1 = FALSE), unlist(robust_glass_d_ci(x, INDEX, standardised_by_group_1 = FALSE)), unlist(boot_general(x, INDEX, robust_glass_d, standardised_by_group_1 = FALSE))))),
                  "robust_bonett_d" = c(robust_bonett_d(x = x, INDEX = INDEX, trim = 0.2), NA_real_, NA_real_, boot_general(x, INDEX, robust_bonett_d, alpha = alpha, trim = 0.2)),
                  "standardised_median_difference_mad" = data.frame(rbind(c(standardised_median_difference_mad(x = x, INDEX = INDEX, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, standardised_median_difference_mad, alpha, standardised_by_group_1 = TRUE))), c(standardised_median_difference_mad(x, INDEX, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, standardised_median_difference_mad, alpha, standardised_by_group_1 = FALSE))))),
                  "standardised_median_difference_riq" = data.frame(rbind(c(standardised_median_difference_riq(x = x, INDEX = INDEX, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, standardised_median_difference_riq, alpha, standardised_by_group_1 = TRUE))), c(standardised_median_difference_riq(x = x, INDEX = INDEX, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, standardised_median_difference_riq, alpha, standardised_by_group_1 = FALSE))))),
                  "standardised_median_difference_biweight" = data.frame(rbind(c(standardised_median_difference_biweight(x = x, INDEX = INDEX, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, standardised_median_difference_biweight, alpha, standardised_by_group_1 = TRUE))), c(standardised_median_difference_biweight(x = x, INDEX = INDEX, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, standardised_median_difference_biweight, alpha, standardised_by_group_1 = FALSE))))),
                  "mann_whitney_based_ps" = data.frame(rbind(c(mann_whitney_based_ps(x = x, INDEX = INDEX, pab = TRUE, ignore_ties = FALSE), unlist(mann_whitney_based_ps_ci(x = x, INDEX = INDEX, ignore_ties = FALSE, pab = TRUE, alpha = alpha)), unlist(boot_general(x, INDEX, mann_whitney_based_ps, pab = TRUE, ignore_ties = FALSE, alpha))), c(mann_whitney_based_ps(x = x, INDEX = INDEX, pab = FALSE, ignore_ties = FALSE), unlist(mann_whitney_based_ps_ci(x = x, INDEX = INDEX, ignore_ties = FALSE, pab = FALSE, alpha = alpha)), unlist(boot_general(x, INDEX, mann_whitney_based_ps, pab = FALSE, ignore_ties = FALSE, alpha))))),
                  "mann_whitney_based_ps_ignore_ties" = c(mann_whitney_based_ps(x = x, INDEX = INDEX, ignore_ties = TRUE), mann_whitney_based_ps_ci(x = x, INDEX = INDEX, ignore_ties = TRUE, alpha = alpha), boot_general(x, INDEX, mann_whitney_based_ps, alpha, ignore_ties = TRUE)),
                  "parametric_ovl" = c(parametric_ovl(x = x, INDEX = INDEX), parametric_ovl_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, parametric_ovl, alpha)),
                  "non_parametric_ovl" = c(non_parametric_ovl(x, INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_ovl, alpha)),
                  "generalized_odds_ratio" = c(generalized_odds_ratio(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, generalized_odds_ratio, alpha)),
                  "common_language" = c(common_language_es(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, common_language_es, alpha)),
                  "parametric_ovl_two" = c(parametric_ovl_two(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, parametric_ovl_two, alpha)),
                  "non_parametric_ovl_two" = c(non_parametric_ovl_two(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_ovl_two, alpha)),
                  "parametric_cohens_u1" = c(parametric_cohens_u1(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, parametric_cohens_u1, alpha)),
                  "parametric_cohens_u2" = c(parametric_cohens_u2(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, parametric_cohens_u2, alpha)),
                  "non_parametric_cohens_u1" = c(non_parametric_cohens_u1(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_cohens_u1, alpha)),
                  "non_parametric_cohens_u2" = c(non_parametric_cohens_u2(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_cohens_u2, alpha)),
                  "non_parametric_cohens_u3" = c(non_parametric_cohens_u3(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, non_parametric_cohens_u3, alpha)),
                  "variance_ratio" = c(variance_ratio(x = x, INDEX = INDEX), variance_ratio_independent_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, variance_ratio, alpha)),
                  "non_parametric_variance_ratio" = c(variance_ratio(x = x, INDEX = INDEX), non_parametric_variance_ratio_independent_ci(x = x, INDEX = INDEX, alpha = alpha), boot_general(x, INDEX, variance_ratio, alpha)),
                  "tail_ratio" = c(tail_ratio(x = x, INDEX = INDEX, reference_group = ref, tail = tail, cutoff = cutoff), tail_ratio_independent_ci(x = x, INDEX = INDEX, reference_group = ref, tail = tail, cutoff = cutoff, alpha = alpha), boot_general(x, INDEX, tail_ratio, alpha, reference_group = ref, tail = tail, cutoff = cutoff)),
                  "non_parametric_tail_ratio" = c(non_parametric_tail_ratio(x = x, INDEX = INDEX, reference_group = ref, tail = tail, cutoff = cutoff), non_parametric_tail_ratio_independent_ci(x = x, INDEX = INDEX, reference_group = ref, tail = tail, cutoff = cutoff, alpha = alpha), boot_general(x, INDEX, non_parametric_tail_ratio, alpha, reference_group = ref, tail = tail, cutoff = cutoff)),
                  "parametric_cohens_u3" = c(parametric_cohens_u3(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, parametric_cohens_u3, alpha)),
                  "non_parametric_glass_d" = data.frame(rbind(c(non_parametric_glass_d(x = x, INDEX = INDEX, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, non_parametric_glass_d, alpha, standardised_by_group_1 = TRUE))), c(non_parametric_glass_d(x = x, INDEX = INDEX, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general(x, INDEX, non_parametric_glass_d, alpha, standardised_by_group_1 = FALSE))))),
                  "dominance_measure" = c(dominance_measure_based_es(x = x, INDEX = INDEX), dominance_measure_ci(x, INDEX, alpha = alpha), boot_general(x, INDEX, dominance_measure_based_es, alpha)),
                  "probability_of_correct_classification" = c(probability_of_correct_classification_es(x = x, INDEX = INDEX), NA_real_, NA_real_, boot_general(x, INDEX, probability_of_correct_classification_es, alpha)),
                  #Effect sizes for dependent gorups:
                  "cohens_d_dependent" = c(cohens_d(x = x, y = y), cohens_d_dependent_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, cohens_d, alpha)),
                  "hedges_g_dependent" = c(hedges_g(x = x, y = y), hedges_g_dependent_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, hedges_g, alpha)),
                  "cohens_drm" = c(cohens_drm(x = x, y = y), cohens_drm_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, cohens_drm, alpha)),
                  "hedges_grm" = c(hedges_grm(x = x, y = y), hedges_grm_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, hedges_grm, alpha)),
                  "bonett_d_dependent" = c(bonett_d(x = x, y = y), bonett_d_dependent_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, bonett_d, alpha)),
                  "bonett_d_corr_dependent" = c(bonett_d_corr_dependent(x = x, y = y), bonett_d_dependent_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, bonett_d_corr_dependent, alpha)),
                  "cohens_dz" = c(cohens_dz(x = x, y = y), cohens_dz_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, cohens_dz, alpha)),
                  "hedges_gz" = c(hedges_gz(x = x, y = y), hedges_gz_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, hedges_gz, alpha)),
                  "glass_d_dependent" = data.frame(rbind(c(glass_d(x = x, y = y, standardised_by_group_1 = TRUE), unlist(glass_d_dependent_ci(x = x, y = y, standardised_by_group_1 = TRUE, alpha = alpha)), unlist(boot_general_dependent_groups(x, y, glass_d, alpha, standardised_by_group_1 = TRUE))), c(glass_d(x = x, y = y, standardised_by_group_1 = FALSE), unlist(glass_d_dependent_ci(x = x, y = y, standardised_by_group_1 = FALSE, alpha = alpha)), unlist(boot_general_dependent_groups(x, y, glass_d, alpha, standardised_by_group_1 = FALSE))))),
                  "glass_d_corr_dependent" = data.frame(rbind(c(glass_d_corr(x = x, y = y, standardised_by_group_1 = TRUE), unlist(glass_d_corr_dependent_ci(x = x, y = y, standardised_by_group_1 = TRUE, alpha = alpha)), unlist(boot_general_dependent_groups(x, y, glass_d_corr, alpha, standardised_by_group_1 = FALSE))), c(glass_d_corr(x = x, y = y, standardised_by_group_1 = FALSE), unlist(glass_d_corr_dependent_ci(x = x, y = y, standardised_by_group_1 = FALSE, alpha = alpha)), unlist(boot_general_dependent_groups(x, y, glass_d_corr, alpha, standardised_by_group_1 = FALSE))))),
                  "standardised_median_difference_mad_dependent" = data.frame(rbind(c(standardised_median_difference_mad(x = x, y = y, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, standardised_median_difference_mad, alpha, standardised_by_group_1 = TRUE))), c(standardised_median_difference_mad(x = x, y = y, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, standardised_median_difference_mad, alpha, standardised_by_group_1 = FALSE))))),
                  "standardised_median_difference_riq_dependent" = data.frame(rbind(c(standardised_median_difference_riq(x = x, y = y, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, standardised_median_difference_riq, alpha, standardised_by_group_1 = TRUE))), c(standardised_median_difference_riq(x = x, y = y, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, standardised_median_difference_riq, alpha, standardised_by_group_1 = FALSE))))),
                  "standardised_median_difference_biweight_dependent" = data.frame(rbind(c(standardised_median_difference_biweight(x = x, y = y, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, standardised_median_difference_biweight, alpha, standardised_by_group_1 = TRUE))), c(standardised_median_difference_biweight(x = x, y = y, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, standardised_median_difference_biweight, alpha, standardised_by_group_1 = FALSE))))),
                  "common_language_es_dependent" = c(common_language_es_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, common_language_es_dependent, alpha)),
                  "parametric_ovl_dependent" = c(parametric_ovl_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, parametric_ovl_dependent, alpha)),
                  "parametric_ovl_two_dependent" = c(parametric_ovl_two_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, parametric_ovl_two_dependent, alpha)),
                  "parametric_cohens_u1_dependent" = c(parametric_cohens_u1_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, parametric_cohens_u1_dependent, alpha)),
                  "parametric_cohens_u2_dependent" = c(parametric_cohens_u2_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, parametric_cohens_u2_dependent, alpha)),
                  "parametric_cohens_u3_dependent" = c(parametric_cohens_u3_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, parametric_cohens_u3_dependent, alpha)),
                  "variance_ratio_dependent" = c(variance_ratio(x = x, y = y), variance_ratio_dependent_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, variance_ratio, alpha)),
                  "non_parametric_variance_ratio_dependent" = c(variance_ratio(x = x, y = y), non_parametric_variance_ratio_dependent_ci(x = x, y = y, alpha = alpha), boot_general_dependent_groups(x, y, variance_ratio, alpha)),
                  "tail_ratio_dependent" = c(tail_ratio(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff), tail_ratio_dependent_ci(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff, alpha = alpha), boot_general_dependent_groups(x, y, tail_ratio, alpha, tail = tail, reference_group = ref, cutoff = cutoff)),
                  "robust_cohens_dz" = c(robust_cohens_dz(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, robust_cohens_dz, alpha)),
                  "robust_cohens_d_dependent" = c(robust_cohens_d(x = x, y = y, trim = 0.2), NA_real_, NA_real_, boot_general_dependent_groups(x, y, robust_cohens_d, alpha)),
                  "robust_bonett_d_dependent" = c(robust_bonett_d(x = x, y = y, trim = 0.2), robust_bonett_d_dependent_ci(x = x, y = y, trim = 0.2, alpha = alpha), boot_general_dependent_groups(x, y, robust_bonett_d, alpha)),
                  "robust_glass_d_dependent" = data.frame(rbind(c(robust_glass_d(x = x, y = y, standardised_by_group_1 = TRUE), unlist(robust_glass_d_dependent_ci(x = x, y = y, alpha = alpha, standardised_by_group_1 = TRUE)), unlist(boot_general_dependent_groups(x, y, robust_glass_d, alpha, standardised_by_group_1 = TRUE))), c(robust_glass_d(x = x, y = y, standardised_by_group_1 = FALSE), unlist(robust_glass_d_dependent_ci(x = x, y = y, alpha = alpha, standardised_by_group_1 = FALSE)), unlist(boot_general_dependent_groups(x, y, robust_glass_d, alpha, standardised_by_group_1 = FALSE))))),
                  "non_parametric_ovl_dependent" = c(non_parametric_ovl(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, non_parametric_ovl, alpha)),
                  "generalized_odds_ratio_dependent" = c(generalized_odds_ratio(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, generalized_odds_ratio, alpha)),
                  "non_parametric_cohens_u1_dependent" = c(non_parametric_cohens_u1(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, non_parametric_cohens_u1, alpha)),
                  "non_parametric_cohens_u2_dependent" = c(non_parametric_cohens_u2(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, non_parametric_cohens_u2, alpha)),
                  "non_parametric_cohens_u3_dependent" = c(non_parametric_cohens_u3(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, non_parametric_cohens_u3, alpha)),
                  "non_parametric_tail_ratio_dependent" = c(non_parametric_tail_ratio_dependent(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff), non_parametric_tail_ratio_dependent_ci(x = x, y = y, tail = tail, reference_group = ref, cutoff = cutoff, alpha = alpha), boot_general_dependent_groups(x, y, non_parametric_tail_ratio_dependent, alpha, tail = tail, reference_group = ref, cutoff = cutoff)),
                  "non_parametric_glass_d_dependent" = data.frame(rbind(c(non_parametric_glass_d(x = x, y = y, standardised_by_group_1 = TRUE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, non_parametric_glass_d, alpha, standardised_by_group_1 = TRUE))), c(non_parametric_glass_d(x = x, y = y, standardised_by_group_1 = FALSE), NA_real_, NA_real_, unlist(boot_general_dependent_groups(x, y, non_parametric_glass_d, alpha, standardised_by_group_1 = FALSE))))),
                  "dominance_measure_dependent" = c(dominance_measure_dependent(x = x, y = y), dominance_measure_dependent_ci(x, y, alpha = alpha), boot_general_dependent_groups(x, y, dominance_measure_dependent, alpha)),
                  "non_parametric_cohens_dz_dependent" = c(non_parametric_cohens_dz_dependent(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, non_parametric_cohens_dz_dependent, alpha)),
                  "non_parametric_ovl_two_dependent" = c(non_parametric_ovl_two(x = x, y = y), NA_real_, NA_real_, boot_general_dependent_groups(x, y, non_parametric_ovl_two, alpha)),
                  "ps_dependent" = data.frame(rbind(c(ps_dependent_groups(x, y, pab = TRUE, ignore_ties = FALSE), unlist(ps_dependent_groups_ci(x, y, pab = TRUE, ignore_ties = FALSE, alpha = alpha)), unlist(boot_general_dependent_groups(x, y, ps_dependent_groups, alpha, pab = TRUE, ignore_ties = FALSE))), c(ps_dependent_groups(x, y, pab = FALSE, ignore_ties = FALSE), unlist(ps_dependent_groups_ci(x, y, pab = FALSE, ignore_ties = FALSE, alpha = alpha)), unlist(boot_general_dependent_groups(x, y, ps_dependent_groups, alpha, pab = FALSE, ignore_ties = FALSE))))),
                  "ps_dependent_ignore_ties" = c(ps_dependent_groups(x, y, ignore_ties = TRUE), ps_dependent_groups_ci(x, y, ignore_ties = TRUE, alpha = alpha), boot_general_dependent_groups(x, y, ps_dependent_groups, alpha, ignore_ties = TRUE)),
                  # Effect sizes for the pretest-posttest-control design:
                  "d_PPC_change" = c(d_PPC_change(x = x, y = y, INDEX = INDEX), d_PPC_change_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = d_PPC_change, alpha = alpha)),
                  "g_PPC_change" = c(g_PPC_change(x = x, y = y, INDEX = INDEX), d_PPC_change_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = g_PPC_change, alpha = alpha)),
                  "d_PPC_pre" = c(d_PPC_pre(x = x, y = y, INDEX = INDEX), d_PPC_pre_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = d_PPC_pre, alpha = alpha)),
                  "g_PPC_pre" = c(g_PPC_pre(x = x, y = y, INDEX = INDEX), g_PPC_pre_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = g_PPC_pre, alpha = alpha)),
                  "d_PPC_pooled_pre" = c(d_PPC_pooled_pre(x = x, y = y, INDEX = INDEX), d_PPC_pooled_pre_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = d_PPC_pooled_pre, alpha = alpha)),
                  "g_PPC_pooled_pre" = c(g_PPC_pooled_pre(x = x, y = y, INDEX = INDEX), g_PPC_pooled_pre_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = g_PPC_pooled_pre, alpha = alpha)),
                  "d_PPC_pooled_pre_post" = c(d_PPC_pooled_pre_post(x = x, y = y, INDEX = INDEX), d_PPC_pooled_pre_post_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = d_PPC_pooled_pre_post, alpha = alpha)),
                  "g_PPC_pooled_pre_post" = c(g_PPC_pooled_pre_post(x = x, y = y, INDEX = INDEX), g_PPC_pooled_pre_post_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = d_PPC_pooled_pre_post, alpha = alpha)),
                  "non_parametric_d_PPC_pre" = c(non_parametric_d_PPC_pre(x = x, y = y, INDEX = INDEX), NA_real_, NA_real_, boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = non_parametric_d_PPC_pre, alpha = alpha)),
                  "non_parametric_d_PPC_pre_alternative" = c(non_parametric_d_PPC_pre(x = x, y = y, INDEX = INDEX, alternative = TRUE), NA_real_, NA_real_, boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = non_parametric_d_PPC_pre, alpha = alpha, alternative = TRUE)),
                  "non_parametric_d_PPC_change" = c(non_parametric_d_PPC_change(x = x, y = y, INDEX = INDEX), NA_real_, NA_real_, boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = non_parametric_d_PPC_change, alpha = alpha)),
                  "non_parametric_dominance_measure_mixed" = c(non_parametric_dominance_measure_mixed(x = x, y = y, INDEX = INDEX), non_parametric_dominance_measure_mixed_ci(x = x, y = y, INDEX = INDEX, alpha = alpha), boot_general_mixed_design(x = x, y = y, INDEX = INDEX, FUN = non_parametric_dominance_measure_mixed, alpha = alpha))
    )
    es_result <- c(es_result, res[[1]])
    es_ci_lower <- c(es_ci_lower, res[[2]])
    es_ci_upper <- c(es_ci_upper, res[[3]])
    es_boot_ci_lower <- c(es_boot_ci_lower, res[[4]])
    es_boot_ci_upper <- c(es_boot_ci_upper, res[[5]])
  }
  es_list <- map_es_names_selected_to_presented(es_list, es_names_to_be_mapped, es_names_to_map)
  es_dataframe <- data.frame(
    es_list,
    es_result,
    es_ci_lower,
    es_ci_upper,
    es_boot_ci_lower,
    es_boot_ci_upper
  )
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci Ll", "Ci Ul", "Boot Ci Ll", "Boot Ci Ul")
  return(es_dataframe)
}

## univariate ES for aggregate data ----
generate_es_educational_dataframe <- function(es_list, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2, tail, ref, cutoff, alpha = 0.05) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("This is not an offered effect size!\n")
    res <- switch(i,
                  # Effect sizes for independent groups:
                  "cohen_d" = c(cohens_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), cohens_d_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "hedges_g" = c(hedges_g(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, df = sampleSize1 + sampleSize2 - 2, n1 = sampleSize1, n2 = sampleSize2), hedges_g_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "glass_d" = data.frame(rbind(c(glass_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, standardised_by_group_1 = TRUE), unlist(glass_d_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, standardised_by_group_1 = TRUE, alpha = alpha))), c(glass_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, standardised_by_group_1 = FALSE), unlist(glass_d_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, standardised_by_group_1 = FALSE, alpha = alpha))))),
                  "glass_d_corr" = data.frame(rbind(c(glass_d_corr(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, standardised_by_group_1 = TRUE, df = sampleSize1 - 1), unlist(glass_d_corr_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, standardised_by_group_1 = TRUE, alpha = alpha))), c(glass_d_corr(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, standardised_by_group_1 = FALSE, df = sampleSize1 - 1), unlist(glass_d_corr_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, standardised_by_group_1 = FALSE, alpha = alpha))))),
                  "bonett_d" = c(bonett_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2), bonett_d_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "bonett_d_corr" = c(bonett_d_corr(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), bonett_d_corr_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "kulinskaya_staudte" = c(kulinskaya_staudte(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), NA_real_, NA_real_),
                  "common_language" = c(common_language_es(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), NA_real_, NA_real_),
                  "parametric_ovl" = c(parametric_ovl(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), parametric_ovl_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "parametric_ovl_two" = c(parametric_ovl_two(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), NA_real_, NA_real_),
                  "parametric_cohens_u1" = c(parametric_cohens_u1(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), NA_real_, NA_real_),
                  "parametric_cohens_u2" = c(parametric_cohens_u2(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), NA_real_, NA_real_),
                  "parametric_cohens_u3" = c(parametric_cohens_u3(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2), NA_real_, NA_real_),
                  "variance_ratio" = c(variance_ratio(s1 = standardDeviation1, s2 = standardDeviation2), variance_ratio_independent_ci(s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "tail_ratio" = c(tail_ratio(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, reference_group = ref, tail = tail, cutoff = cutoff), tail_ratio_independent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2, reference_group = ref, tail = tail, cutoff = cutoff, alpha = alpha)),
                  "probability_of_correct_classification" = c(probability_of_correct_classification_es(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2),  NA_real_, NA_real_),
                  #Effect sizes for dependent groups:
                  "cohens_d_dependent" = c(cohens_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize1), cohens_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "hedges_g_dependent" = c(hedges_g(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, df = sampleSize1 - 1, n1 = sampleSize1, n2 = sampleSize1), hedges_g_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "cohens_drm" = c(cohens_drm(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, r = correlation1), cohens_drm_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "hedges_grm" = c(hedges_grm(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1), hedges_grm_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "bonett_d_dependent" = c(bonett_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2), bonett_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "bonett_d_corr_dependent" = c(bonett_d_corr_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), bonett_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "cohens_dz" = c(cohens_dz(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, r = correlation1), cohens_dz_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "hedges_gz" = c(hedges_gz(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1), hedges_gz_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "glass_d_dependent" = data.frame(rbind(c(glass_d(m1 = mean1, m2 = mean2, s1 = standardDeviation1, standardised_by_group_1 = TRUE), unlist(glass_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, standardised_by_group_1 = TRUE, alpha = alpha))), c(glass_d(m1 = mean1, m2 = mean2, s2 = standardDeviation2, standardised_by_group_1 = FALSE), unlist(glass_d_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, standardised_by_group_1 = FALSE, alpha = alpha))))),
                  "glass_d_corr_dependent" = data.frame(rbind(c(glass_d_corr(m1 = mean1, m2 = mean2, s1 = standardDeviation1, standardised_by_group_1 = TRUE, df = sampleSize1 - 1), unlist(glass_d_corr_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, standardised_by_group_1 = TRUE, alpha = alpha))), c(glass_d_corr(m1 = mean1, m2 = mean2, s2 = standardDeviation1, standardised_by_group_1 = FALSE, df = sampleSize1 - 1), unlist(glass_d_corr_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, n = sampleSize1, r = correlation1, standardised_by_group_1 = FALSE, alpha = alpha))))),
                  "common_language_es_dependent" = c(common_language_es_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, sdiff = standardDeviationDiff1, r = correlation1), NA_real_, NA_real_),
                  "parametric_ovl_dependent" = c(parametric_ovl_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), NA_real_, NA_real_),
                  "parametric_ovl_two_dependent" = c(parametric_ovl_two_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), NA_real_, NA_real_),
                  "parametric_cohens_u1_dependent" = c(parametric_cohens_u1_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), NA_real_, NA_real_),
                  "parametric_cohens_u2_dependent" = c(parametric_cohens_u2_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), NA_real_, NA_real_),
                  "parametric_cohens_u3_dependent" = c(parametric_cohens_u3_dependent(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1), NA_real_, NA_real_),
                  "variance_ratio_dependent" = c(variance_ratio(s1 = standardDeviation1, s2 = standardDeviation2), variance_ratio_dependent_ci(s1 = standardDeviation1, s2 = standardDeviation2, n = sampleSize1, r = correlation1, alpha = alpha)),
                  "tail_ratio_dependent" = c(tail_ratio(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, tail = tail, reference_group = ref, cutoff = cutoff), tail_ratio_dependent_ci(m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, r = correlation1, n = sampleSize1, tail = tail, reference_group = ref, cutoff = cutoff, alpha = alpha)),
                  # Effect sizes for the pretest-posttest-control design:
                  "d_PPC_change" = c(d_PPC_change(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, r1 = correlation1, r2 = correlation2, sdiff1 = standardDeviationDiff1, sdiff2 = standardDeviationDiff2), d_PPC_change_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, r1 = correlation1, r2 = correlation2, sdiff1 = standardDeviationDiff1, sdiff2 = standardDeviationDiff2, n1 = sampleSize1, n2 = sampleSize2, alpha = alpha)),
                  "g_PPC_change" = c(g_PPC_change(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, n1 = sampleSize1, r1 = correlation1, sdiff1 = standardDeviationDiff1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, n2 = sampleSize2, r2 = correlation2, sdiff2 = standardDeviationDiff2), g_PPC_change_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, n1 = sampleSize1, r1 = correlation1, sdiff1 = standardDeviationDiff1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, n2 = sampleSize2, r2 = correlation2, sdiff2 = standardDeviationDiff2, alpha = alpha)),
                  "d_PPC_pre" = c(d_PPC_pre(m1 = mean1, s1 = standardDeviation1, m2 = mean2, m3 = mean3, s3 = standardDeviation3, m4 = mean4), d_PPC_pre_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2, r2 = correlation2, alpha = alpha)),
                  "g_PPC_pre" = c(g_PPC_pre(m1 = mean1, s1 = standardDeviation1, m2 = mean2, m3 = mean3, n1 = sampleSize1, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2), g_PPC_pre_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2, r2 = correlation2, alpha = alpha)),
                  "d_PPC_pooled_pre" = c(d_PPC_pooled_pre(m1 = mean1, s1 = standardDeviation1, m2 = mean2, n1 = sampleSize1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2), d_PPC_pooled_pre_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2, r2 = correlation2, alpha = alpha)),
                  "g_PPC_pooled_pre" = c(g_PPC_pooled_pre(m1 = mean1, s1 = standardDeviation1, m2 = mean2, n1 = sampleSize1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2), g_PPC_pooled_pre_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, n2 = sampleSize2, r2 = correlation2, alpha = alpha)),
                  "d_PPC_pooled_pre_post" = c(d_PPC_pooled_pre_post(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, n1 = sampleSize1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, n2 = sampleSize2), d_PPC_pooled_pre_post_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, s4 = standardDeviation4, m4 = mean4, n2 = sampleSize2, r2 = correlation2, alpha = alpha)),
                  "g_PPC_pooled_pre_post" = c(g_PPC_pooled_pre_post(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, n2 = sampleSize2, r2 = correlation2), g_PPC_pooled_pre_post_ci(m1 = mean1, s1 = standardDeviation1, m2 = mean2, s2 = standardDeviation2, n1 = sampleSize1, r1 = correlation1, m3 = mean3, s3 = standardDeviation3, m4 = mean4, s4 = standardDeviation4, n2 = sampleSize2, r2 = correlation2, alpha = alpha))
    )
    es_result <- c(es_result, res[[1]])
    es_ci_lower <- c(es_ci_lower, res[[2]])
    es_ci_upper <- c(es_ci_upper, res[[3]])
  }
  es_list <- map_es_names_selected_to_presented(es_list, es_names_to_be_mapped, es_names_to_map)
  es_dataframe <- data.frame(
    es_list,
    es_result,
    es_ci_lower,
    es_ci_upper
  )
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci Ll", "Ci Ul")
  return(es_dataframe)
}

## multivariate ES for raw data ----
generate_multivariate_raw_data_dataframe <- function(es_list, dat, INDEX, alpha, z) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  es_boot_ci_lower <- vector(mode = "double", length = 0L)
  es_boot_ci_upper <- vector(mode = "double", length = 0L)
  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("This is not an offered effect size!\n")
    res <- switch(i,
                  "mahalanobis_d" = c(mahalanobis_d(dat, INDEX), mahalanobis_d_raw_data_ci(dat, INDEX, alpha), boot_multivariate(dat, INDEX, mahalanobis_d, alpha = alpha)),
                  "bias_corrected_d_multivariate" = c(bias_corrected_d_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, bias_corrected_d_multivariate, alpha = alpha)),
                  "ovl_multivariate" = c(ovl_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, ovl_multivariate, alpha = alpha)),
                  "ovl_two_multivariate" = c(ovl_two_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, ovl_two_multivariate, alpha = alpha)),
                  "pcc_multivariate" = c(pcc_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, pcc_multivariate, alpha = alpha)),
                  "u1_multivariate" = c(u1_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, u1_multivariate, alpha = alpha)),
                  "u3_multivariate" = c(u3_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, u3_multivariate, alpha = alpha)),
                  "common_language_multivariate" = c(common_language_multivariate(dat, INDEX), NA_real_, NA_real_, boot_multivariate(dat, INDEX, common_language_multivariate, alpha = alpha)),
                  "tail_ratio_multivariate" = c(tail_ratio_multivariate(dat, INDEX, z), NA_real_, NA_real_, boot_multivariate(dat, INDEX, tail_ratio_multivariate, alpha = alpha, z = z)),
                  "variance_ratio_multivariate" = c(variance_ratio_multivariate(dat, INDEX, standardised_by_group_1 = TRUE), NA_real_, NA_real_, boot_multivariate(dat, INDEX, variance_ratio_multivariate, alpha = alpha, standardised_by_group_1 = TRUE))
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
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci Ll", "Ci Ul", "Boot Ci Ll", "Boot Ci Ul")
  return(es_dataframe)
}

## multivariate ES for aggregate data ----
generate_multivariate_educational_dataframe <- function(es_list, means, covariance_matrix, n1, n2, alpha, z) {
  es_result <- vector(mode = "double", length = 0L)
  es_ci_lower <- vector(mode = "double", length = 0L)
  es_ci_upper <- vector(mode = "double", length = 0L)
  for (i in es_list) {
    if (!i %in% all_eff_sizes) stop("This is not an offered effect size!\n")
    res <- switch(i,
                  "mahalanobis_d" = c(mahalanobis_d_educational(means, covariance_matrix), mahalanobis_d_educational_ci(means, covariance_matrix, n1, n2, alpha)),
                  "bias_corrected_d_multivariate" = c(bias_corrected_d_multivariate_educational(means, covariance_matrix, n1, n2), NA_real_, NA_real_),
                  "ovl_multivariate" = c(ovl_multivariate_educational(means, covariance_matrix), NA_real_, NA_real_),
                  "ovl_two_multivariate" = c(ovl_two_multivariate_educational(means, covariance_matrix), NA_real_, NA_real_),
                  "pcc_multivariate" = c(pcc_multivariate_educational(means, covariance_matrix), NA_real_, NA_real_),
                  "u1_multivariate" = c(u1_multivariate_educational(means, covariance_matrix), NA_real_, NA_real_),
                  "u3_multivariate" = c(u3_multivariate_educational(means, covariance_matrix), NA_real_, NA_real_),
                  "common_language_multivariate" = c(common_language_multivariate_educational(means, covariance_matrix), NA_real_, NA_real_),
                  "tail_ratio_multivariate" = c(tail_ratio_multivariate_educational(means, covariance_matrix, z), NA_real_, NA_real_)
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
  colnames(es_dataframe) <- c("Name", "Effect Size", "Ci Ll", "Ci Ul")
  return(es_dataframe)
}

## parametric TS  ----
generate_ts_dataframe <- function(ts_list, INDEX = NULL, x = NULL, y = NULL, m1, m2, standardDeviation1, standardDeviation2, r, n1, n2, sdiff = NA) {
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
                    "dependent_student_t_test" = t_test(type = i, m1 = m1, m2 = m2, var1 = standardDeviation1^2, var2 = standardDeviation2^2, r = r, sdiff = sdiff, n1 = n1)
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

## nonparametric TS ----
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
# Error detector function
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

# Winsorized Variances

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

# Determine sample size after trimming 

n_trim <- function(x = NULL, n, trim = 0.2) {
  if (!is.null(x)) n <- length(x)
  ntr <- n - (2 * floor(trim * n))
  return(ntr)
}

# Determine degrees of freedom
degrees_freedom <- function(effsize, n1, n2, ntr1, ntr2, standardised_by_group_1 = TRUE) {

  df <- switch(effsize,
               "cohen_d" = n1 + n2 - 2,
               "hedges_g" = n1 + n2 - 2,
               "glass_d" = ifelse(standardised_by_group_1, n1, n2) - 1,
               "glass_d_corr" = ifelse(standardised_by_group_1, n1, n2) - 1,
               "bonett_d" = n1 + n2 - 2,
               "bonett_d_corr" = n1 + n2 - 2,
               "robust_cohens_d" = ntr1 + ntr2 - 2,
               "robust_glass_d" = ifelse(standardised_by_group_1, ntr1, ntr2) - 1)

  return(df)
}

# Various correction factors
hedges_bias_correction <- function(df) {
  res <- exp(lgamma(df / 2) -
               log(sqrt(df / 2)) -
               lgamma((df - 1) / 2))
  return(res)
}

AKP_correction <- function(trim) {
  if (trim == 0) return(1)
  res <- sqrt(integrate(f = function(x) { x^2 * dnorm(x) }, lower = qnorm(trim), upper = qnorm(1 - trim))$value + 2 * qnorm(trim)^2 * trim)
  return(res)
}

# Various standard deviations
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

# biweight standard deviation
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

# pooled unbiased standard deviation
sd_pooled <- function(s1, s2, n1, n2) {
  res <- sqrt((((n1 - 1) * s1^2) + ((n2 - 1) * s2^2)) / (n1 + n2 - 2))
  return(res)
}

# standard deviation of difference scores 
sd_diff <- function(s1, s2, r) {
  res <- sqrt(s1^2 + s2^2 - 2 * r * s1 * s2)
  return(res)
}

# confidence interval for the non-centrality parameter of a t distribution
get_noncentral_t_ci <- function(ncp, df, alpha) {
  
  cibound_candidates <- c(min(-5, -abs(ncp) * 7), max(5, abs(ncp) * 7))
  res <- numeric(2L)
  res[[1]] <- suppressWarnings(
    uniroot(f = function(x) {
      pt(q = ncp, df = df, ncp = x) - (1 - (alpha / 2))
    },
            interval = cibound_candidates)
  )$root

  res[[2]] <- suppressWarnings(
    uniroot(f = function(x) {
      pt(q = ncp, df = df, ncp = x) - alpha / 2
    },
            interval = cibound_candidates)
  )$root

  return(res)
}

## Summary statistics functions ----

# summary stats for independent groups
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
  return(list(n = n, ntr = ntr, m = m, trm = trm, var = v, winvar = winvar, s = s))
}

# summary stats for dependent groups
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
  return(list(n = n, ntr = ntr, trmdiff = trmdiff, vdiff = vdiff, winvardiff = winvardiff, sdiff = sdiff, r = r, wincov = wincov))

}

# summary stats for mixed design
mixed_design_stats <- function(x, y, INDEX) {

  datasets_pre <- split(x, INDEX)
  dataset1_pre <- datasets_pre[[1]]
  dataset2_pre <- datasets_pre[[2]]
  datasets_post <- split(y, INDEX)
  dataset1_post <- datasets_post[[1]]
  dataset2_post <- datasets_post[[2]]

  m1 <- mean(dataset1_pre)
  v1 <- var(dataset1_pre)
  s1 <- sd(dataset1_pre)
  n1 <- length(dataset1_pre)
  m2 <- mean(dataset1_post)
  v2 <- var(dataset1_post)
  s2 <- sd(dataset1_post)
  r1 <- cor(dataset1_pre, dataset1_post)
  sdiff1 <- sd(dataset1_pre - dataset1_post)
  m3 <- mean(dataset2_pre)
  v3 <- var(dataset2_pre)
  s3 <- sd(dataset2_pre)
  n2 <- length(dataset2_pre)
  m4 <- mean(dataset2_post)
  v4 <- var(dataset2_post)
  s4 <- sd(dataset2_post)
  r2 <- cor(dataset2_pre, dataset2_post)
  sdiff2 <- sd(dataset2_pre - dataset2_post)

  return(list(m1 = m1, var1 = v1, s1 = s1, n1 = n1, m2 = m2, var2 = v2, s2 = s2, r1 = r1, sdiff1 = sdiff1,
              m3 = m3, var3 = v3, s3 = s3, n2 = n2, m4 = m4, var4 = v4, s4 = s4, r2 = r2, sdiff2 = sdiff2))

}

### grand summary stats function ----
# function called within other functions to get summary stats needed for computing
# (mostly parametric) ES and TS
summary_stats <- function(x, INDEX = NULL, y = NULL, trim = 0, winvar = FALSE) {
  if (is.null(y)) {
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
  } else {
    stats <- mixed_design_stats(x = x, y = y, INDEX = INDEX)
  }
  return(stats)
}

## Summary statistics table functions ----
# functions for mapping internal variable names (like n, m, etc.) to the names
# presented in the summary stats table 
stats_names_key_value_ls <- list(n = "Sample size",
                                 ntr = "Trimmed sample size",
                                 m = "Mean",
                                 trm = "Trimmed mean",
                                 med = "Median",
                                 var = "Variance",
                                 winvar = "Winsorized variance",
                                 s = "Std. Deviation",
                                 iqr = "Iqr",
                                 mad = "MAD",
                                 trmdiff = "Difference of trimmed means",
                                 vdiff = "Cange score variance",
                                 winvardiff = "Change score winsorized variance",
                                 sdiff = "Change score std. deviation",
                                 r = "Correlation",
                                 wincov = "Winsorized covariance")

stats_names_key_value_matching <- function(keys, key_value_ls) {
  values <- unlist(key_value_ls[keys])
  return(values)
}

# summary stats table for the independent groups design
independent_groups_design_summary_dfs <- function(x, INDEX, trim = 0.2, winvar = TRUE) {

  group_names <- levels(factor(INDEX))
  summary_stats_df <- rep(list(list()), 1)
  stats <- summary_stats(x, INDEX, trim = trim, winvar = winvar)
  data <- split(x, INDEX)
  x <- data[[1]]
  y <- data[[2]]
  stats <- c(stats, list(med1 = median(x), med2 = median(y), iqr1 = IQR(x), iqr2 = IQR(y), mad1 = mad(x), mad2 = mad(y)))
  row_names_keys <- gsub(patter = "[0-9]", replacement = "", names(stats))[grepl(pattern = "1$", names(stats))]
  row_names <- stats_names_key_value_matching(row_names_keys, key_value_ls = stats_names_key_value_ls)
  col1 <- round(unlist(stats[grepl(pattern = "1$", names(stats))]), 2)
  col2 <- round(unlist(stats[grepl(pattern = "2$", names(stats))]), 2)
  summary_stats_df[[1]][[1]] <- data.frame(grp1 = col1,
                                           grp2 = col2,
                                           row.names = row_names,
                                           check.names = FALSE)
  names(summary_stats_df[[1]][[1]])[1:2] <- group_names
  summary_stats_df[[1]][[2]] <- paste0("Summary statistics per group")
  return(summary_stats_df)
}

# summary stats table for the dependent groups design
dependent_groups_design_summary_dfs <- function(x, y) {

  summary_stats_dfs <- rep(list(list()), 2)
  stats <- summary_stats(x, y = y, trim = 0.2, winvar = TRUE)
  stats <- c(stats, list(med1 = median(x), med2 = median(y), iqr1 = IQR(x), iqr2 = IQR(y), mad1 = mad(x), mad2 = mad(y)))
  df1_row_names_keys <- gsub(pattern = "[0-9]", replacement = "", names(stats))[grepl(pattern = "1$", names(stats))]
  df1_row_names_keys <- df1_row_names_keys[!(df1_row_names_keys %in% c("n", "ntr"))]
  df1_row_names <- stats_names_key_value_matching(df1_row_names_keys, key_value_ls = stats_names_key_value_ls)
  df1_col1 <- round(unlist(stats[paste0(df1_row_names_keys, 1)]), 2)
  df1_col2 <- round(unlist(stats[paste0(df1_row_names_keys, 2)]), 2)
  summary_stats_dfs[[1]] <- list(data.frame(`Measurement 1` = df1_col1,
                                            `Measurement 2` = df1_col2,
                                            row.names = df1_row_names,
                                            check.names = FALSE),
                                 paste0("Summary statistics per measurement"))

  df2_row_names_keys <- names(stats)[grepl(pattern = "[^0-9]$", x = names(stats))]
  df2_row_names <- stats_names_key_value_matching(df2_row_names_keys, key_value_ls = stats_names_key_value_ls)
  df2_col1 <- round(unlist(stats[df2_row_names_keys]), 2)
  summary_stats_dfs[[2]] <- list(data.frame(Value = df2_col1,
                                            row.names = df2_row_names),
                                 paste0("Summary statistics across measurements"))
  return(summary_stats_dfs)
}

# summary stats table for the mixed design
mixed_design_summary_dfs <- function(x, INDEX, y) {

  group_names <- levels(factor(INDEX))
  summary_stats_dfs <- rep(list(list()), 4)
  stats <- summary_stats(x, INDEX, y)
  data <- split(x, INDEX)
  data <- c(data, split(y, INDEX))
  x1 <- data[[1]]
  y1 <- data[[3]]
  x2 <- data[[2]]
  y2 <- data[[4]]
  stats <- c(stats, list(med1 = median(x1), med2 = median(y1), med3 = median(x2), med4 = median(y2),
                         iqr1 = IQR(x1), iqr2 = IQR(y1), iqr3 = IQR(x2), iqr4 = IQR(y2),
                         mad1 = mad(x1), mad2 = mad(y1), mad3 = mad(x2), mad4 = IQR(y2)))
  row_names_keys <- unique(gsub(patter = "[0-9]", replacement = "", names(stats)))
  per_measurement_df_row_names_keys <- row_names_keys[!(row_names_keys %in% c("n", "sdiff", "r"))]
  per_measurement_df_row_names <- stats_names_key_value_matching(per_measurement_df_row_names_keys, stats_names_key_value_ls)
  across_measurements_df_row_names_keys <- row_names_keys[row_names_keys %in% c("n", "sdiff", "r")]
  across_measurements_df_row_names <- stats_names_key_value_matching(across_measurements_df_row_names_keys, stats_names_key_value_ls)
  df1_col1 <- round(unlist(stats[paste0(per_measurement_df_row_names_keys, 1)]), 2)
  df1_col2 <- round(unlist(stats[paste0(per_measurement_df_row_names_keys, 2)]), 2)
  summary_stats_dfs[[1]] <- list(data.frame(`Measurement 1` = df1_col1,
                                            `Measurement 2` = df1_col2,
                                            row.names = per_measurement_df_row_names,
                                            check.names = FALSE),
                                 paste0("Summary statistics per measurement for group = ", group_names[[1]]))
  df2_col1 <- round(unlist(stats[paste0(across_measurements_df_row_names_keys, 1)]), 2)
  summary_stats_dfs[[2]] <- list(data.frame(Value = df2_col1,
                                            row.names = across_measurements_df_row_names),
                                 paste0("Summary statistics across measurements for group = ", group_names[[1]]))
  df3_col1 <- round(unlist(stats[paste0(per_measurement_df_row_names_keys, 3)]), 2)
  df3_col2 <- round(unlist(stats[paste0(per_measurement_df_row_names_keys, 4)]), 2)
  summary_stats_dfs[[3]] <- list(data.frame(`Measurement 1` = df3_col1,
                                            `Measurement 2` = df3_col2,
                                            row.names = per_measurement_df_row_names,
                                            check.names = FALSE),
                                 paste0("Summary statistics per measurement for group = ", group_names[[2]]))
  df4_col1 <- round(unlist(stats[paste0(across_measurements_df_row_names_keys, 2)]), 2)
  summary_stats_dfs[[4]] <- list(data.frame(Value = df4_col1,
                                            row.names = across_measurements_df_row_names),
                                 paste0("Summary statistics across measurements for group = ", group_names[[2]]))
  return(summary_stats_dfs)
}

# summary stats table for multivariate analysis
multivariate_summary_dfs <- function(x, INDEX) {
  summary_stats_dfs <- rep(list(list()), 2)
  var_names <- names(x)
  if (!is.list(x) | ncol(x) == 1) x <- as.data.frame(x)
  df1_col1 <- round(vapply(x, cohens_d, FUN.VALUE = numeric(1), INDEX = INDEX), 2)
  df1_row_names <- var_names
  summary_stats_dfs[[1]] <- list(data.frame(`Cohen's d` = df1_col1,
                                            row.names = df1_row_names,
                                            check.names = FALSE),
                                 paste0("Cohen's d of each analysed variable"))

  probs <- c(0, 0.5, 1)
  if (ncol(as.data.frame(x)) == 1) {
    df2_col1 <- rep(NA, length(probs))
    df2_col2 <- rep(NA, length(probs))
  } else {
    data <- split(x, INDEX)
    cor_mat1 <- cor(data[[1]])
    cor_mat2 <- cor(data[[2]])
    pooled_cor_mat <- pool_cor_mat(cor_mat1, cor_mat2, nrow(data[[1]]), nrow(data[[2]]))
    rownames(pooled_cor_mat) <- rownames(cor_mat1)
    colnames(pooled_cor_mat) <- colnames(cor_mat2)

    pooled_cor_quantiles <- quantile(abs(pooled_cor_mat[upper.tri(pooled_cor_mat)]), probs = probs, names = FALSE, type = 3)
    pooled_cor_mat_upper <- pooled_cor_mat
    pooled_cor_mat_upper[lower.tri(pooled_cor_mat_upper, diag = TRUE)] <- 2
    quantiles_indices <- matrix(0, ncol = 2, nrow = length(probs))
    for (i in seq_len(length(probs))) {
      quantiles_indices[i,] <- which(abs(pooled_cor_mat_upper) == pooled_cor_quantiles[[i]], arr.ind = TRUE)[1,]
    }
    df2_col1 <- paste0(rownames(pooled_cor_mat)[quantiles_indices[, 1]],
                       " & ",
                       colnames(pooled_cor_mat)[quantiles_indices[, 2]])
    df2_col2 <- round(pooled_cor_mat[quantiles_indices], 2)
  }
  df2_row_names <- c("Min.", "Median", "Max.")
  summary_stats_dfs[[2]] <- list(data.frame(Variables = df2_col1,
                                            r = df2_col2,
                                            row.names = df2_row_names),
                                 paste0("Minimum, median and maximum values of the pooled correlation matrix"))
  return(summary_stats_dfs)
}

#### grand summary stats table function ----
generate_summary_statistics_data_frame <- function(x, INDEX = NULL, y = NULL, design) {

  if (design == "multivariate") {
    res <- multivariate_summary_dfs(x, INDEX)
  } else if (design == "indGrps") {
    res <- independent_groups_design_summary_dfs(x, INDEX)
  } else if (design == "depGrps") {
    res <- dependent_groups_design_summary_dfs(x, y)
  } else {
    res <- mixed_design_summary_dfs(x, INDEX, y)
  }
  return(res)
}

# Hypothesis Tests ----

## parametric tests

### t-test functions(student, welch, yuen, ...) ----

#### independent groups Student's t-test ----

student_t <- function(m1, m2, var1, var2, n1, n2) {
  t_val <- (m2 - m1) / sd_combined(var1 = var1, var2 = var2, n1 = n1, n2 = n2, type = "se_pooled")
  df <- n1 + n2 - 2
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

#### dependent groups Student's t-test ----

student_t_dependent <- function(m1, m2, var1, var2, r, sdiff = NA, n) {
  if (is.na(sdiff)) sdiff <- sd_diff(sqrt(var1), sqrt(var2), r)
  t_val <- (m2 - m1) / (sdiff / sqrt(n))
  df <- n - 1
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}

#### independent groups Welch's t-test ----

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

#### independent groups Yuen's t-test ----

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

#### dependent groups Yuen's t-test ----

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

#### Tukey McLaughlin t-test for a single group ----

tukey_mclaughlin_t_test <- function(trm, winvar, n, ntr, trim) {

  se <- sqrt(winvar) / ((1 - 2 * trim) * sqrt(n))
  df <- ntr - 1
  t_val <- trm / se
  p_val <- 2 * (1 - pt(q = abs(t_val), df = df))
  return(list(t_val = t_val,
              df = df,
              p_val = p_val))
}


### grand t-test function: ----

t_test <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, var1, var2, r, n1,
                   n2, sdiff = NA, trim = 0.2,
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
                dependent_student_t_test = student_t_dependent(m1, m2, var1, var2, r, sdiff, n1),
                welch_t_test = welch_t(m1, m2, var1, var2, n1, n2),
                yuen_t_test = yuen_t(trm1, trm2, winvar1, winvar2, n1, n2, ntr1, ntr2),
                dependent_yuen_t_test = dependent_yuen_t(trm1, trm2, winvar1, winvar2, wincov, n1, ntr),
                tukey_mclaughlin_t_test = tukey_mclaughlin_t_test(trm = trmdiff, winvar = winvardiff, n1, ntr, trim = trim)
  )


  return(res)

}

### tests for homogenity of population variances ----
# these tests are used to notify the app user that the assumption of variance homogeneity
# might be violated when they select ES that rely on said assumption
are_variances_homogenous <- function(x, INDEX, s1, s2, n1, n2) {
  if (!missing(x) && !missing(INDEX)) p_value <- levenes_test(x, INDEX)
  else p_value <- var_test_aggregate(s1, s2, n1, n2)
  if (p_value < 0.05) return(FALSE)
  else return(TRUE)
}

are_dependent_variances_homogenous <- function(x, y, s1, s2, n, r) {
  if (!missing(x) && !missing(y)) ci <- variance_ratio_dependent_ci(x, y)
  else ci <- variance_ratio_dependent_ci(s1 = s1, s2 = s2, n = n, r = r)
  if (ci[["lower_bound"]] < 1 && ci[["upper_bound"]] > 1) return(TRUE)
  else return(FALSE)
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

# equivalent to var.test from stats package
var_test_aggregate <- function(s1, s2, n1, n2) {
  df1 <- n1 - 1
  df2 <- n2 - 1
  F_val <- s1^2 / s2^2
  p_val <- pf(F_val, df1, df2)
  p_val <- 2 * min(p_val, 1 - p_val)
  return(p_val)
}

## non-parametric hypothesis tests ----

### Wilcoxon signed rank test -----

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

# Percentile Bootstrap CI functions ----

## independent groups bootstrap ----

boot_general <- function(x, INDEX, FUN, alpha = 0.05, ...) {
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

## dependt groups bootstrap ----

boot_general_dependent_groups <- function(x, y, FUN, alpha = 0.05, ...) {
  nboot <- 200
  data_mat <- cbind(x, y)
  boot_dat <- rep(list(numeric(length = length(data_mat) * 2)), times = nboot)
  for (i in 1:nboot) {
    boot_dat[[i]] <- data_mat[sample(seq_len(nrow(data_mat)), replace = TRUE),]
  }
  boot_val <- sort(
    unlist(
      lapply(boot_dat, FUN = function(d) { do.call(FUN, args = list(x = d[, 1], y = d[, 2], ...)) }),
      use.names = FALSE
    )
  )
  lower <- nboot * (alpha / 2)
  upper <- nboot - lower
  cl_lower <- boot_val[lower + 1]
  cl_upper <- boot_val[upper]
  return(list(lower_bound = cl_lower, upper_bound = cl_upper))
}

## mixed design bootstrap ----

boot_general_mixed_design <- function(x, y, INDEX, FUN, alpha = 0.05, ...) {
  nboot <- 200
  INDEX_fct <- sort(as.factor(INDEX))
  data_mat <- cbind(x, y)
  original <- list()
  original[[1]] <- data_mat[INDEX == levels(INDEX_fct)[[1]],]
  original[[2]] <- data_mat[INDEX == levels(INDEX_fct)[[2]],]
  boot_dat <- rep(list(numeric(length = nrow(data_mat) * 2)), times = nboot)
  for (i in seq_len(nboot)) {
    x_boot <- original[[1]][sample(seq_len(nrow(original[[1]])), replace = TRUE),]
    y_boot <- original[[2]][sample(seq_len(nrow(original[[2]])), replace = TRUE),]
    boot_dat[[i]] <- rbind(x_boot, y_boot)
  }
  boot_val <- sort(
    unlist(
      lapply(boot_dat, FUN = function(d) { do.call(FUN, args = list(x = d[, 1], y = d[, 2], INDEX = INDEX_fct, ...)) }),
      use.names = FALSE
    )
  )
  lower <- nboot * (alpha / 2)
  upper <- nboot - lower
  cl_lower <- boot_val[lower + 1]
  cl_upper <- boot_val[upper]
  return(list(lower_bound = cl_lower, upper_bound = cl_upper))

}

## multivariate analysis bootstrap ----

boot_multivariate <- function(x, INDEX, FUN, alpha = 0.05, ...) {
  nboot <- 200
  data <- split(x, INDEX)
  group1 <- data[[1]]
  group2 <- data[[2]]
  INDEX <- sort(as.factor(INDEX))
  my_list <- list(as.data.frame(matrix(0, ncol = ncol(x), nrow = nrow(x))))
  boot_dat <- rep(my_list, times = nboot)
  for (i in seq_len(nboot)) {
    group1_boot <- group1[sample(seq_len(nrow(group1)), replace = TRUE),]
    group2_boot <- group2[sample(seq_len(nrow(group2)), replace = TRUE),]
    boot_dat[[i]] <- rbind(group1_boot, group2_boot)
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

# ES functions ----

## ES comparing measures of central tendency ----
### Standardised Mean differences ----
#### SMDs assuming normally distributed and homoscedastic populations ----

##### Cohen's d ----
cohens_d <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX)
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y)
      n1 <- n2 <- stats$n
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  standardiser <- sd_pooled(s1, s2, n1, n2)
  res <- (m2 - m1) / standardiser
  return(res)
}

cohens_d_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- sqrt((1 / n1) + (1 / n2))
  ncp <- cohens_d(m1 = m1, m2 = m2, s1 = s1, n1 = n1, s2 = s2, n2 = n2)/c
  df <- n1 + n2 - 2
  ncp_ci <- get_noncentral_t_ci(ncp = ncp, df = df, alpha = alpha)
  res <- ncp_ci * c
  return(list(lower_bound = res[[1]],
              upper_bound = res[[2]]))
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
  non_centrality_parameter <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 = n) * sqrt(n / (2 * (1 - rW)))
  df <- 2 * (n - 1) / (1 + r^2)
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  cohens_d_dependent_ci <- ncp_ci * sqrt(2 * (1 - rW) / n)
  return(list(lower_bound = cohens_d_dependent_ci[[1]],
              upper_bound = cohens_d_dependent_ci[[2]]))
}

##### Hedges' g ----
hedges_g <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, s1, s2, df, n1, n2) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX)
      df <- stats$n1 + stats$n2 - 2
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y)
      df <- stats$n - 1
      n1 <- n2 <- df$n
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- hedges_bias_correction(df)
  standardiser <- sd_pooled(s1, s2, n1, n2)
  res <- c * (m2 - m1) / standardiser
  return(res)
}

hedges_g_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  df <- n1 + n2 - 2
  c <- hedges_bias_correction(df)
  standardiser <- sd_pooled(s1, s2, n1, n2)
  g <- c * (m2 - m1) / standardiser
  ncp <- g / sqrt((1 / n1) + (1 / n2))
  ncp_ci <- c(qt(alpha / 2, df = df, ncp = ncp),
              qt(1 - (alpha / 2), df = df, ncp = ncp))
  res <- ncp_ci * sqrt((1 / n1) + (1 / n2))
  return(list(lower_bound = res[[1]],
              upper_bound = res[[2]]))
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
  non_centrality_parameter <- hedges_g(m1 = m1, m2 = m2, s1 = s1, s2 = s2, df = n - 1) * sqrt(n / (2 * (1 - rW)))
  df <- 2 * (n - 1) / (1 + r^2)
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  hedges_g_dependent_ci <- ncp_ci * sqrt(2 * (1 - rW) / n)
  return(list(lower_bound = hedges_g_dependent_ci[[1]],
              upper_bound = hedges_g_dependent_ci[[2]]))
}

#### SMDs assuming normally distributed populations ----

##### Glass' d ----
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

glass_d_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  df <- ifelse(standardised_by_group_1, n1 - 1, n2 - 1)
  d <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1)
  non_centrality_parameter_transformation_factor <- ifelse(standardised_by_group_1,
                                                           sqrt((1 / n1) + (s2^2 / (n2 * s1^2))),
                                                           sqrt((1 / n2) + (s1^2 / (n2 * s2^2))))
  non_centrality_parameter <- d / non_centrality_parameter_transformation_factor
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  ci <- ncp_ci * non_centrality_parameter_transformation_factor
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

glass_d_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  d <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1)
  standardiser <- ifelse(standardised_by_group_1, s1, s2)
  v <- (d^2 / (2 * (n - 1))) + (sdiff^2 / (standardiser^2 * (n - 1)))
  ci <- d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

##### Glass' d small sample bias corrected ----
glass_d_corr <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, s1, s2, df, standardised_by_group_1 = TRUE) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX)
      df <- ifelse(standardised_by_group_1, stats$n1 - 1, stats$n2 - 1)
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y)
      df <- stats$n - 1
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- hedges_bias_correction(df)
  standardiser <- ifelse(standardised_by_group_1, s1, s2)
  res <- c * (m2 - m1) / standardiser
  return(res)
}

glass_d_corr_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  df <- ifelse(standardised_by_group_1, n1 - 1, n2 - 1)
  g <- glass_d_corr(m1 = m1, m2 = m2, s1 = s1, s2 = s2, df = df, standardised_by_group_1 = standardised_by_group_1)
  non_centrality_parameter_transformation_factor <- ifelse(standardised_by_group_1,
                                                           sqrt((1 / n1) + (s2^2 / (n2 * s1^2))),
                                                           sqrt((1 / n2) + (s1^2 / (n2 * s2^2))))
  non_centrality_parameter <- g / non_centrality_parameter_transformation_factor
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  ci <- ncp_ci * non_centrality_parameter_transformation_factor
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}


glass_d_corr_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  g <- glass_d_corr(m1 = m1, m2 = m2, s1 = s1, s2 = s2, df = n - 1, standardised_by_group_1 = standardised_by_group_1)
  d <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1)
  v <- ((d^2 / (2 * (n - 1))) + (sdiff^2 / (ifelse(standardised_by_group_1, s1, s2)^2 * (n - 1)))) * hedges_bias_correction(n - 1)
  ci <- g + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

##### Cohen's d' ----
bonett_d <- function(x = NULL, INDEX = NULL, y = NULL, m1, m2, s1, s2) {
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
  standardiser <- sqrt((s1^2 + s2^2)/2)
  res <- (m2 - m1)/standardiser
  return(res)
}

bonett_d_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- bonett_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2)
  sdm <- sqrt((s1^2 + s2^2)/2)
  v <- d^2 * (s1^4 / (n1 - 1) + s2^4 / (n2 - 1)) / (8 * sdm^4) +
    (s1^2 / (sdm^2 * (n1 - 1))) +
    s2^2 / (sdm^2 * (n2 - 1))
  z_crit <- qnorm(alpha/2)
  res <- d + c(z_crit, abs(z_crit)) * sqrt(v)
  return(list(lower_bound = res[[1]],
              upper_bound = res[[2]]))
}

bonett_d_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  s <- sqrt((s1^2 + s2^2)/2)
  d <- bonett_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2)
  v <- (d^2 * (s1^4 + s2^4 + 2 * r^2 * s1^2 * s2^2)) / (8 * (n - 1) * s^4) + sdiff^2 / ((n - 1) * s^2)
  z_crit <- qnorm(1 - alpha / 2)
  ci <- d + c(-z_crit, z_crit) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

##### Hedges g' ----
bonett_d_corr <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- hedges_bias_correction(df = n1 + n2 - 2)
  standardiser <- sqrt((s1^2 + s2^2)/2)
  res <- c * (m2 - m1)/standardiser
  return(res)
}

bonett_d_corr_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- bonett_d_corr(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
  sdm <- sqrt((s1^2 + s2^2)/2)
  v <- hedges_bias_correction(df = n1 + n2 - 2)^2 * (d^2 * (s1^4 / (n1 - 1) + s2^4 / (n2 - 1)) / (8 * sdm^4) +
                                                       (s1^2 / (sdm^2 * (n1 - 1))) +
                                                       s2^2 / (sdm^2 * (n2 - 1)))
  z_crit <- qnorm(alpha/2)
  res <- d + c(z_crit, abs(z_crit)) * sqrt(v)
  return(list(lower_bound = res[[1]],
              upper_bound = res[[2]]))
}

##### Cohen's d'_corr ----
bonett_d_corr_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
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

##### Kulinskaya and Staudte (2006)  ----
kulinskaya_staudte <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  standardiser <- (n1 * s1^2 + n2 * s2^2)/(n1 + n2)
  res <- (m2 - m1)^2/standardiser
  return(res)
}

#### robust SMDs ----

##### robust Cohen's d ----
robust_cohens_d <- function(x = NULL, INDEX = NULL, y = NULL, trim = 0.2) {
  if (!is.null(x)) {
    if (!is.null(INDEX)) {
      stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = TRUE)
    } else if (!is.null(y)) {
      stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
      n1 <- n2 <- stats$n
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  c <- AKP_correction(trim = trim)
  standardiser <- sd_pooled(s1 = sqrt(winvar1), n1 = n1, s2 = sqrt(winvar2), n2 = n2)
  res <- c * (trm2 - trm1)/standardiser
  return(res)
}

robust_cohens_d_ci <- function(x = NULL, INDEX = NULL, trim = 0.2, alpha = 0.05) {
  
  stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  N <- n1 + n2
  sW <- sd_pooled(s1 = sqrt(winvar1), n1 = n1, s2 = sqrt(winvar2), n2 = n2)
  stilde <- sqrt(((N - 2) * sW^2)/(ntr1 + ntr2 - 2))
  ncp <- sqrt(ntr1 * ntr2/(ntr1 + ntr2)) * (trm2 - trm1)/stilde
  df <- ntr1 + ntr2 - 2
  ncp_ci <- get_noncentral_t_ci(ncp, df, alpha)
  c <- AKP_correction(trim = trim)
  d_R_ci <- ncp_ci * c * sqrt(((ntr1 + ntr2) * (N - 2)) / (ntr1 * ntr2 * (ntr1 + ntr2 - 2)))
  return(list(lower_bound = d_R_ci[[1]],
              upper_bound = d_R_ci[[2]]))
}

##### robust Glass' d ----
robust_glass_d <- function(x = NULL, INDEX = NULL, y = NULL, trim = 0.2, standardised_by_group_1 = TRUE, trm1, trm2, winvar1, winvar2) {
  
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
  res <- c * ((trm2 - trm1) / standardiser)
  return(res)
}

robust_glass_d_ci <- function(x, INDEX, trim = 0.2, standardised_by_group_1 = TRUE) {
  stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  var_tilde1 <- ((n1 - 1) * winvar1) / (ntr1 - 1)
  var_tilde2 <- ((n2 - 1) * winvar2) / (ntr2 - 1)
  c <- AKP_correction(trim)
  df <- ifelse(standardised_by_group_1, ntr1 - 1, ntr2 - 1)
  d <- robust_glass_d(trm1 = trm1, trm2 = trm2, winvar1 = winvar1, winvar2 = winvar2, standardised_by_group_1 = standardised_by_group_1)
  non_centrality_parameter_transformation_factor <- ifelse(standardised_by_group_1,
                                                           c * sqrt(((n1 - 1) / (ntr1 - 1)) * ((1 / ntr1) + (var_tilde2 / (ntr2 * var_tilde1)))),
                                                           c * sqrt(((n2 - 1) / (ntr2 - 1)) * ((var_tilde1 / (ntr1 * var_tilde2)) + (1 / ntr2)))
  )
  non_centrality_parameter <- d / non_centrality_parameter_transformation_factor
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  ci <- ncp_ci * non_centrality_parameter_transformation_factor
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
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
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  c <- AKP_correction(trim)
  non_centrality_parameter_transformation_factor <- c * ifelse(standardised_by_group_1,
                                                               sqrt((d1 + d2 - 2 * d12) / (winvar1)),
                                                               sqrt((d1 + d2 - 2 * d12) / (winvar2)))
  robust_glass_d_dependent_ci <- ncp_ci * non_centrality_parameter_transformation_factor
  return(list(lower_bound = robust_glass_d_dependent_ci[[1]],
              upper_bound = robust_glass_d_dependent_ci[[2]]))
}

##### robust Cohen's d' ----
 robust_bonett_d <- function(x = NULL, INDEX = NULL, y = NULL, trim = 0.2) {
   if (!is.null(x)) {
     if (!is.null(INDEX)) {
       stats <- summary_stats(x = x, INDEX = INDEX, trim = trim, winvar = TRUE)
     } else if (!is.null(y)) {
       stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
     }
     for (i in names(stats)) {
       assign(i, stats[[i]])
     }
   }
   c <- AKP_correction(trim)
   standardiser <- sqrt((winvar1 + winvar2)/2)
   res <- c * (trm2 - trm1)/standardiser
   return(res)
 }

robust_bonett_d_dependent_ci <- function(x, y, trim = 0.2, alpha = 0.05) {
  
  stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  d1 <- (n - 1) * winvar1 / (ntr * (ntr - 1))
  d2 <- (n - 1) * winvar2 / (ntr * (ntr - 1))
  d12 <- (n - 1) * wincov / (ntr * (ntr - 1))
  non_centrality_parameter <- (trm2 - trm1) / sqrt(d1 + d2 - 2 * d12)
  df <- ntr - 1
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  c <- AKP_correction(trim)
  robust_cohens_d_dependent_ci <- c * ncp_ci * sqrt((2 * (d1 + d2 - 2 * d12)) / (winvar1 + winvar2))
  return(list(lower_bound = robust_cohens_d_dependent_ci[[1]],
              upper_bound = robust_cohens_d_dependent_ci[[2]]))
}

##### robust Cohen's d_z ----
robust_cohens_dz <- function(x, y, trim = 0.2) {
  
  stats <- summary_stats(x = x, y = y, trim = trim, winvar = TRUE)
  for (i in names(stats)) {
    assign(i, stats[[i]])
  }
  c <- AKP_correction(trim)
  res <- c * (trmdiff / sqrt(winvardiff))
  return(res)
}

#### Nonparametric estimators ----
##### non-parametric Glass' d ----
correct_for_extreme_eff_sizes <- function(n, p_a) {
  if (p_a == 0) {
    p_a <- 1 / (n + 1)
  } else if (p_a == 1) {
    p_a <- n / (n + 1)
  }
  return(p_a)
}

non_parametric_glass_d <- function(x = NULL, INDEX = NULL, y = NULL, standardised_by_group_1 = TRUE) {
  if (!is.null(x) && !is.null(INDEX)) {
    dataset1 <- split(x, INDEX)[[1]]
    dataset2 <- split(x, INDEX)[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }

  if (standardised_by_group_1) {
    median_grp2 <- median(dataset2)
    n1 <- length(dataset1)
    p_a <- mean(dataset1 < median_grp2)
    p_a <- correct_for_extreme_eff_sizes(n1, p_a)
  } else {
    median_grp1 <- median(dataset1)
    n2 <- length(dataset2)
    p_a <- mean(dataset2 > median_grp1)
    p_a <- correct_for_extreme_eff_sizes(n2, p_a)
  }
  return(qnorm(p_a))
}

non_parametric_cohens_dz_dependent <- function(x, y) {
  p_gain <- p_gain(x, y)
  p_gain <- correct_for_extreme_eff_sizes(length(x), p_gain)
  return(qnorm(p_gain))
}

#### Standardised median differences ----

# median difference standardised by the median absolute deviation of one group
standardised_median_difference_mad <- function(x, INDEX, y, standardised_by_group_1 = TRUE) {
  if (missing(y)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  median_grp1 <- median(dataset1)
  median_grp2 <- median(dataset2)
  if (standardised_by_group_1) {
    mad <- median(abs(dataset1 - median_grp1))
  } else {
    mad <- median(abs(dataset2 - median_grp2))
  }
  return((median_grp2 - median_grp1) / mad)
}

# median difference standardised by the interquartile range of one group
standardised_median_difference_riq <- function(x, INDEX, y, standardised_by_group_1 = TRUE) {
  if (missing(y)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  if (standardised_by_group_1) {
    riq <- IQR(dataset1)
  } else {
    riq <- IQR(dataset2)
  }
  return((median(dataset2) - median(dataset1)) / (0.75 * riq))
}

# median difference standardised by the biweight standard deviation of one group
standardised_median_difference_biweight <- function(x, INDEX, y, standardised_by_group_1 = TRUE) {
  if (missing(y)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  if (standardised_by_group_1) {
    sbw <- sbwab(dataset1)
  } else {
    sbw <- sbwab(dataset2)
  }
  return((median(dataset2) - median(dataset1)) / sbw)
}

## ES that go beyond comparing measures of central tendency ----

### Variance ratio ----

# point estimator (no distnction between a parametric or a nonparametric estimator)
variance_ratio <- function(x = NULL, INDEX = NULL, y = NULL, s1, s2, standardised_by_group_1 = TRUE, log = FALSE) {
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

  num <- ifelse(standardised_by_group_1, s2^2, s1^2)
  denom <- ifelse(standardised_by_group_1, s1^2, s2^2)
  vr <- ifelse(log, log(num / denom), num / denom)
  return(vr)
}

# a parametric CI estimator
variance_ratio_independent_ci <- function(x = NULL, INDEX = NULL, s1, s2, n1, n2, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    sample_sizes <- tapply(x, INDEX, length)
    n1 <- sample_sizes[[1]]
    n2 <- sample_sizes[[2]]
    vr <- variance_ratio(x = x, INDEX = INDEX, standardised_by_group_1 = standardised_by_group_1)
  } else {
    vr <- variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1, log = FALSE)
  }
  lower_bound <- vr * ifelse(standardised_by_group_1, qf(alpha / 2, n1 - 1, n2 - 1), qf(alpha / 2, n2 - 1, n1 - 1))
  upper_bound <- vr * ifelse(standardised_by_group_1, qf(1 - alpha / 2, n1 - 1, n2 - 1), qf(1 - alpha / 2, n2 - 1, n1 - 1))

  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

# a nonparametric CI estimator
non_parametric_variance_ratio_independent_ci <- function(x = NULL, INDEX = NULL, standardised_by_group_1 = TRUE, alpha = 0.05) {
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[ifelse(standardised_by_group_1, 2, 1)]]
  dataset2 <- dataset[[ifelse(standardised_by_group_1, 1, 2)]]
  var1 <- var(dataset1)
  var2 <- var(dataset2)
  n1 <- length(dataset1)
  n2 <- length(dataset2)
  if ((n1 < 4) || (n2 < 4)) {
    return(list(lower_bound = NA_real_,
                upper_bound = NA_real_))
  }
  trim1 <- 1 / (2 * sqrt(n1 - 4))
  trim2 <- 1 / (2 * sqrt(n2 - 4))
  trimmed_mean1 <- mean(dataset1, trim = trim1)
  trimmed_mean2 <- mean(dataset2, trim = trim2)
  g1 <- (n1 - 3) / n1
  g2 <- (n2 - 3) / n2
  A <- ((n1 + n2) * (n1 + n2 - 2)) / ((n1 - 1) * (n2 - 1))
  B <- (g1 / (n1 - 1)) + (g2 / (n2 - 1))
  K <- (n1 - 1) / (n2 - 1)
  gamma1 <- n1 * sum((dataset1 - trimmed_mean1)^4) / (sum((dataset1 - mean(dataset1))^2)^2)
  gamma2 <- n2 * sum((dataset2 - trimmed_mean2)^4) / (sum((dataset2 - mean(dataset2))^2)^2)
  z_crit <- qnorm(alpha / 2)
  c <- (n1 / (n1 - z_crit)) * ((n2 - z_crit) / n2)
  vr <- var1 / var2
  xl_xu <- try(find_banga_fox_bonett_xl_xu(z_crit, c, A, B, K, gamma1, gamma2, n1, n2), silent = TRUE)
  if ("try-error" %in% class(xl_xu)) {
    bonett2006_variance_ratio_ci <- bonett2006_variance_ratio_ci(dataset1, dataset2, n1, n2, trimmed_mean1, trimmed_mean2, alpha, vr)
    lower_bound <- bonett2006_variance_ratio_ci[[1]]
    upper_bound <- bonett2006_variance_ratio_ci[[2]]
  } else {
    lower_bound <- c * vr * xl_xu[["xl"]]
    upper_bound <- c * vr * xl_xu[["xu"]]
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

# 
banga_fox_bonett_ci_error <- function(x, INDEX, standardised_by_group_1 = TRUE, alpha = 0.05) {
  dataset <- split(x, INDEX)
  dataset1 <- dataset[[ifelse(standardised_by_group_1, 2, 1)]]
  dataset2 <- dataset[[ifelse(standardised_by_group_1, 1, 2)]]
  n1 <- length(dataset1)
  n2 <- length(dataset2)
  if ((n1 < 4) || (n2 < 4)) {
    return(FALSE)
  }
  trim1 <- 1 / (2 * sqrt(n1 - 4))
  trim2 <- 1 / (2 * sqrt(n2 - 4))
  trimmed_mean1 <- mean(dataset1, trim = trim1)
  trimmed_mean2 <- mean(dataset2, trim = trim2)
  g1 <- (n1 - 3) / n1
  g2 <- (n2 - 3) / n2
  A <- ((n1 + n2) * (n1 + n2 - 2)) / ((n1 - 1) * (n2 - 1))
  B <- (g1 / (n1 - 1)) + (g2 / (n2 - 1))
  K <- (n1 - 1) / (n2 - 1)
  gamma1 <- n1 * sum((dataset1 - trimmed_mean1)^4) / (sum((dataset1 - mean(dataset1))^2)^2)
  gamma2 <- n2 * sum((dataset2 - trimmed_mean2)^4) / (sum((dataset2 - mean(dataset2))^2)^2)
  z_crit <- qnorm(alpha / 2)
  c <- (n1 / (n1 - z_crit)) * ((n2 - z_crit) / n2)
  xl_xu <- try(find_banga_fox_bonett_xl_xu(z_crit, c, A, B, K, gamma1, gamma2, n1, n2), silent = TRUE)
  return("try-error" %in% class(xl_xu))
}

banga_fox_bonett_se <- function(x, A, B, gamma1, gamma2, K, n1, n2) {
  A * ((gamma1 * (K^2 / n1) + gamma2 * (x^2 / n2)) / ((K + x)^2)) - B
}

banga_fox_bonett_H <- function(x, z_crit, c, A, B, gamma1, gamma2, K, n1, n2) {
  log(x)^2 - z_crit^2 * banga_fox_bonett_se(x = c * x, A = A, B = B, K = K, gamma1 = gamma1, gamma2 = gamma2, n1 = n1, n2 = n2)
}

find_banga_fox_bonett_xl_xu <- function(z_crit, c, A, B, K, gamma1, gamma2, n1, n2) {
  xl <- suppressWarnings(
    uniroot(f = banga_fox_bonett_H,
            interval = c(0, 1),
            z_crit = z_crit, c = c, A = A, B = B, gamma1 = gamma1, gamma2 = gamma2, K = K, n1 = n1, n2 = n2
    )$root
  )
  xu <- 1 / suppressWarnings(
    uniroot(f = banga_fox_bonett_H,
            interval = c(0, 1),
            z_crit = z_crit, c = 1 / c, A = A, B = B, gamma1 = gamma2, gamma2 = gamma1, K = 1 / K, n1 = n2, n2 = n1
    )$root
  )
  return(list(xl = xl,
              xu = xu))
}


bonett2006_variance_ratio_ci <- function(dataset1, dataset2, n1, n2, trimmed_mean1, trimmed_mean2, alpha, vr) {
  gamma_pooled <- (n1 + n2) * (sum((dataset1 - trimmed_mean1)^4, (dataset2 - trimmed_mean2)^4)) / (sum((dataset1 - mean(dataset1))^2, (dataset2 - mean(dataset2))^2)^2)
  k1 <- (n1 - 3) / n1
  k2 <- (n2 - 3) / n2
  z_crit <- qnorm(alpha / 2)
  c <- (n1 / (n1 - z_crit)) / (n2 / (n2 - z_crit))
  se <- sqrt((gamma_pooled - k1) / (n1 - 1) + (gamma_pooled - k2) / (n2 - 1))
  lower_bound <- exp(log(c * vr) + z_crit * se)
  upper_bound <- exp(log(c * vr) + abs(z_crit) * se)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

### Tail ratio ----

#### parametric estimator ----

tail_ratio <- function(x = NULL, INDEX = NULL, y = NULL,
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

tail_ratio_independent_ci <- function(x = NULL, INDEX = NULL,
                                      m1, m2, s1, s2, n1, n2,
                                      reference_group = c("group1", "group2"),
                                      tail = c("lower", "upper"),
                                      cutoff, alpha = 0.05) {
  if (!is.null(x)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (reference_group == "group1") {
    m1_temp <- m1
    s1_temp <- s1
    n1_temp <- n1
    m1 <- m2
    s1 <- s2
    n1 <- n2
    m2 <- m1_temp
    s2 <- s1_temp
    n2 <- n1_temp
  }
  n1. <- n1
  n2. <- n2
  n11 <- round(ifelse(tail == "lower", pnorm(cutoff, m1, s1), pnorm(cutoff, m1, s1, lower.tail = FALSE)) * n1)
  n21 <- round(ifelse(tail == "lower", pnorm(cutoff, m2, s2), pnorm(cutoff, m2, s2, lower.tail = FALSE)) * n2)
  confidence_bounds <- koopman_nam_risk_ratio_ci(n11, n21, n1., n2., alpha)
  return(list(lower_bound = confidence_bounds[["lower_bound"]],
              upper_bound = confidence_bounds[["upper_bound"]]))
}

#### Non-parametric estimator ----

# tail ratio is calcuated as a risk ratio
non_parametric_tail_ratio <- function(x, INDEX, reference_group = c("group1", "group2"), tail = c("lower", "upper"), cutoff) {

  dataset <- split(x, INDEX)
  dataset1 <- dataset[[ifelse(reference_group == "group1", 2, 1)]]
  dataset2 <- dataset[[ifelse(reference_group == "group1", 1, 2)]]
  n1. <- length(dataset1)
  n2. <- length(dataset2)
  n11 <- ifelse(tail == "lower", sum(dataset1 <= cutoff), sum(dataset1 >= cutoff))
  n21 <- ifelse(tail == "lower", sum(dataset2 <= cutoff), sum(dataset2 >= cutoff))
  p1 <- n11 / n1.
  p2 <- n21 / n2.
  if (p1 == 0) return(0)
  if (p2 == 0) return(Inf)
  tr <- p1 / p2
  return(tr)
}

non_parametric_tail_ratio_independent_ci <- function(x, INDEX, reference_group = c("group1", "group2"), tail = c("lower", "upper"), cutoff, alpha = 0.05) {

  dataset <- split(x, INDEX)
  dataset1 <- dataset[[ifelse(reference_group == "group1", 2, 1)]]
  dataset2 <- dataset[[ifelse(reference_group == "group1", 1, 2)]]
  n1. <- length(dataset1)
  n2. <- length(dataset2)
  n11 <- ifelse(tail == "lower", sum(dataset1 <= cutoff), sum(dataset1 >= cutoff))
  n21 <- ifelse(tail == "lower", sum(dataset2 <= cutoff), sum(dataset2 >= cutoff))
  confidence_bounds <- koopman_nam_risk_ratio_ci(n11, n21, n1., n2., alpha)
  return(list(lower_bound = confidence_bounds[["lower_bound"]],
              upper_bound = confidence_bounds[["upper_bound"]]))
}

koopman_nam_risk_ratio_ci <- function(n11, n21, n1., n2., alpha) {

  z_crit <- qnorm(alpha / 2)
  if ((n11 == 0) && (n21 == 0)) {
    lower_bound <- 0
    upper_bound <- Inf
  } else {
    a1 <- n2. * (n2. * (n1. + n2.) * n11 + n1. * (n2. + n11) * (z_crit^2))
    a2 <- -n2. * (n2. * n1. * (n11 + n21) +
      2 * (n1. + n2.) * n21 * n11 +
      n1. * (n2. + n21 + 2 * n11) * (z_crit^2))
    a3 <- 2 * n2. * n1. * n21 * (n11 + n21) +
      (n1. + n2.) * (n21^2) * n11 +
      n2. * n1. * (n11 + n21) * (z_crit^2)
    a4 <- -n1. * (n21^2) * (n11 + n21)
    b1 <- a2 / a1
    b2 <- a3 / a1
    b3 <- a4 / a1
    c1 <- b2 - b1^2 / 3
    c2 <- b3 - b1 * b2 / 3 + 2 * b1^3 / 27
    theta <- acos(sqrt(27) * c2 / (2 * c1 * sqrt(-c1)))
    t1 <- -2 * sqrt(-c1 / 3) * cos(pi / 3 - theta / 3)
    t2 <- -2 * sqrt(-c1 / 3) * cos(pi / 3 + theta / 3)
    t3 <- 2 * sqrt(-c1 / 3) * cos(theta / 3)
    p2_MLE1 <- t1 - b1 / 3
    p2_MLE2 <- t2 - b1 / 3
    p2_MLE3 <- t3 - b1 / 3
    p2_MLE_bounds_candidates <- sort(c(p2_MLE1, p2_MLE2, p2_MLE3))
    if (length(p2_MLE_bounds_candidates) == 0) {
      return(list(
        lower_bound = 0,
        upper_bound = Inf
      ))
    }
    p2_MLE_lower_bound <- p2_MLE_bounds_candidates[[2]]
    p2_MLE_upper_bound <- p2_MLE_bounds_candidates[[1]]
    if ((n21 == 0) && (n11 != 0)) {
      lower_bound <- nam_p2_MLE_to_phi(n11, n21, n1., n2., p2_MLE_lower_bound)
      upper_bound <- Inf
    }
    else if ((n21 != n2.) && (n11 == 0)) {
      lower_bound <- 0
      upper_bound <- nam_p2_MLE_to_phi(n11, n21, n1., n2., p2_MLE_upper_bound)
    }
    else if ((n21 == n2.) && (n11 == n1.)) {
      lower_bound <- n1. / (n1. + z_crit^2)
      upper_bound <- (n2. + z_crit^2) / n2.
    }
    else if ((n11 == n1.) || (n21 == n2.)) {
      if ((n21 == n2.) && (n11 == 0)) {
        lower_bound <- 0
      }
      if ((n21 == n2.) && (n11 != 0)) {
        phat1 <- n21 / n2.
        phat2 <- n11 / n1.
        phihat <- phat2 / phat1
        phi_lower <- 0.95 * phihat
        chi2 <- 0
        while (chi2 <= z_crit) {
          a <- (n2. + n1.) * phi_lower
          b <- -((n21 + n1.) * phi_lower + n11 + n2.)
          c <- n11 + n21
          p1hat <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * a)
          p2hat <- p1hat * phi_lower
          q2hat <- 1 - p2hat
          var <- (n2. * n1. * p2hat) / (n1. * (phi_lower - p2hat) + n2. * q2hat)
          chi2 <- ((x1 - n1 * p2hat) / q2hat) / sqrt(var)
          lower_bound <- phi_lower
          phi_lower <- lower_bound / 1.0001
        }
      }
      i <- n21
      j <- n11
      ni <- n2.
      nj <- n1.
      if (n11 == n1.) {
        i <- n11
        j <- n21
        ni <- n1.
        nj <- n2.
      }
      phat1 <- i / ni
      phat2 <- j / nj
      phihat <- phat2 / phat1
      phi_upper <- 1.1 * phihat
      if ((n21 == n2.) && (n11 == 0)) {
        if (n2 < 100) {
          phi_upper <- 0.01
        }
        else {
          phi_upper <- 0.001
        }
      }
      chi1 <- 0
      while (chi1 >= -z) {
        a <- (ni + nj) * phi_upper
        b <- -((i + nj) * phi_upper + j + ni)
        c <- i + j
        p1hat <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * a)
        p2hat <- p1hat * phi_upper
        q2hat <- 1 - p2hat
        var <- (ni * nj * p2hat) / (nj * (phi_upper - p2hat) + ni * q2hat)
        chi1 <- ((j - nj * p2hat) / q2hat) / sqrt(var)
        phiu1 <- phi_upper
        phiu <- 1.0001 * phiu1
      }
      if (n11 == n1.) {
        lower_bound <- 1 / phiu1
        upper_bound <- nam_p2_MLE_to_phi(n11, n21, n1., n2., p2_MLE_upper_bound)
      }
      else {
        upper_bound <- phiu1
      }
    } else {
      lower_bound <- nam_p2_MLE_to_phi(n11, n21, n1., n2., p2_MLE_lower_bound)
      upper_bound <- nam_p2_MLE_to_phi(n11, n21, n1., n2., p2_MLE_upper_bound)
    }
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

nam_p2_MLE_to_phi <- function(n11, n21, n1., n2., p2_MLE_bound) {
  res <- (1 - (n1. - n11) * (1 - p2_MLE_bound) / (n21 + n1. - (n2. + n1.) * p2_MLE_bound)) / p2_MLE_bound
}


newcombe_price_bonett_risk_ratio_ci <- function(n11, n21, n1., n2., alpha) {
  z_crit <- qnorm(alpha / 2)

  n11 <- ifelse(n11 == 0, z_crit^2, n11)
  n21 <- ifelse(n21 == 0, z_crit^2, n21)
  p1 <- n11 / n1.
  p2 <- n21 / n2.
  ci <- exp(log(p1 / p2) + c(-1, 1) *
    2 *
    asinh((z_crit / 2) * sqrt(1 / n11 + 1 / n21 - 1 / n1. - 1 / n2.)))
  lower_bound <- ci[[1]]
  upper_bound <- ci[[2]]
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

adjusted_katz_log_risk_ratio_ci <- function(n11, n21, n1., n2., alpha) {
  z_crit <- qnorm(alpha / 2)
  p1_adjusted <- (n11 + 0.5) / (n1. + 0.5)
  p2_adjusted <- (n21 + 0.5) / (n2. + 0.5)
  ci <- exp(log(p1_adjusted / p2_adjusted) + c(1, -1) *
    z_crit *
    sqrt(1 / (n11 + 0.5) + 1 / (n21 + 0.5) -
           1 / (n1. + 0.5) -
           1 / (n2. + 0.5)))
  lower_bound <- ci[[1]]
  upper_bound <- ci[[2]]
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}


### Probabilistic ES ----

#### Parametric estimators ----

# These estimators assume populations are normally distributed and are homoscedastic
# The common language effect size (CLES)
common_language_es <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x)) {
    stats <- summary_stats(x = x, INDEX = INDEX, trim = 0, winvar = FALSE)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  temp <- (m2 - m1) / sqrt(s1^2 + s2^2)
  res <- pnorm(temp)
  return(res)
}

common_language_es_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x)) {
    stats <- summary_stats(x = x, INDEX = INDEX, trim = 0, winvar = FALSE)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  cohen_d <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
  cis <- cohens_d_ci(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, alpha = alpha)
  lower_bound <- pnorm(abs(cis[[ifelse(cohen_d > 0, 1, 2)]]) / sqrt(2))
  upper_bound <- pnorm(abs(cis[[ifelse(cohen_d > 0, 2, 1)]]) / sqrt(2))
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

common_language_es_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, r) {
  if (!is.null(x) && !is.null(y)) {
    if (length(x) != length(y)) return(NA_real_)
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  common_language_es_dependent <- pnorm(cohens_dz)
  return(common_language_es_dependent)
}

common_language_es_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    if (length(x) != length(y)) return(NA_real_)
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz_ci <- cohens_dz_ci(m1 = m1, m2 = m2, sdiff = sdiff, n = n, alpha = alpha)
  lower_bound <- pnorm(cohens_dz_ci$lower_bound)
  upper_bound <- pnorm(cohens_dz_ci$upper_bound)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

# The probability of correct classification (PCC)
probability_of_correct_classification_es <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x)) {
    stats <- summary_stats(x = x, INDEX = INDEX, trim = 0, winvar = FALSE)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (n1 != n2) return(NA_real_)
  d <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
  return(pnorm(abs(d) / 2))
}

#### Non-parametric estimators ----

# These estimators make no assumptions about the shape of the population distributions
# The probability of superiority (PS)
mann_whitney_based_ps <- function(x, INDEX, ignore_ties = FALSE, pab = TRUE) {

  dataset <- split(x, INDEX)
  if (pab) {
    dataset1 <- dataset[[2]]
    dataset2 <- dataset[[1]]
  } else {
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  }

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

mann_whitney_based_ps_ci <- function(x, INDEX, ignore_ties = FALSE, pab = TRUE, alpha = 0.05) {
  #second method from Newcombe (2005)
  dataset <- split(x, INDEX)
  m <- ifelse(pab, length(dataset[[2]]), length(dataset[[1]]))
  n <- ifelse(pab, length(dataset[[1]]), length(dataset[[2]]))
  delta <- mann_whitney_based_ps(x, INDEX, ignore_ties = ignore_ties, pab = pab)
  variance <- delta *
    (1 - delta) *
    (1 +
      (n - 1) * (1 - delta) / (2 - delta) +
      (m - 1) * delta / (1 + delta)) / (m * n)
  z <- qnorm(1 - alpha / 2)
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
  function(x, y, ignore_ties = TRUE, pab = TRUE) {
    if (pab) {
      dataset1 <- y
      dataset2 <- x
    } else {
      dataset1 <- x
      dataset2 <- y
    }

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


ps_dependent_groups_ci <- function(x, y, ignore_ties = TRUE, pab = TRUE, alpha = 0.05) {
  #Pratt's confidence interval
  if (pab) {
    dataset1 <- y
    dataset2 <- x
  } else {
    dataset1 <- x
    dataset2 <- y
  }

  if (length(dataset1) != length(dataset2))
    stop("\n length of datasets for dependent groups has to be the same!")
  n <- length(dataset1)
  w <- 0
  for (i in seq_along(dataset1)) {
    if (dataset1[i] > dataset2[i]) w <- w + 1
    else if (dataset1[i] == dataset2[i]) {
      if (!ignore_ties)w <- w + 0.5
      else n <- n - 1
    }
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
  a <- (w / (n - w - 1))^2
  b <- 81 * w * (n - w - 1) - 9 * n - 8
  c <- 3 *
    z *
    sqrt(9 * (w) * (n - w - 1) * (9 * n + 5 - z^2) + n + 1)
  d <- 81 * w^2 - 9 * w * (2 + z^2) + 1
  e <- 1 + a * ((b + c) / d)^3
  lower_bound <- 1 / e
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

generalized_odds_ratio <- function(x, INDEX = NULL, y = NULL, ignore_ties = TRUE) {
  if (is.null(y)) {
    ps <- mann_whitney_based_ps(x, INDEX, pab = TRUE, ignore_ties = ignore_ties)
  } else {
    ps <- ps_dependent_groups(x, y, pab = TRUE, ignore_ties = ignore_ties)
  }
  return(ps / (1 - ps))
}

dominance_measure_based_es <- function(x = NULL, INDEX = NULL, y = NULL) {
  if (!is.null(x) && !is.null(INDEX)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[2]]
    dataset2 <- dataset[[1]]
  } else {
    dataset1 <- y
    dataset2 <- x
  }
  if (!is.null(x))return(ps_without_counting_ties(dataset1, dataset2) - ps_without_counting_ties(dataset2, dataset1))
  return(ps_dependent_groups(x, y) - ps_dependent_groups(y, x))
}

get_db <- function(x, y) {
  n <- length(x)
  counter <- 0
  for (xi in seq_along(x))
    for (yi in seq_along(y))
      if (xi != yi) {
        if (x[xi] > y[yi]) {
          counter <- counter - 1
        } else if (x[xi] < y[yi]) {
          counter <- counter + 1
        }
      }
  d_b <- counter / (n * (n - 1))
  return(d_b)
}

dominance_measure_dependent <- function(x, y) {
  if (length(x) != length(y)) {
    return()
  }
  d_w <- ps_dependent_groups(x, y, pab = TRUE, ignore_ties = FALSE) - ps_dependent_groups(x, y, pab = FALSE, ignore_ties = FALSE)
  d_b <- get_db(x, y)
  return(d_w + d_b)
}

get_di. <- function(x, yi) {
  counter <- 0
  for (xi in x) {
    if (xi > yi) {
      counter <- counter + 1
    }
  }
  return(counter / length(x))
}

get_sum_di_squared <- function(d_b, x, y) {
  sum_di_squared <- 0
  for (i in y) {
    di. <- get_di.(x, i)
    di._star <- di. - d_b
    sum_di_squared <- sum_di_squared + di._star^2
  }
  return(sum_di_squared)
}

get_sum_di._star <- function(d_b, x, y) {
  sum_di <- 0
  for (i in y) {
    di. <- get_di.(x, i)
    sum_di <- sum_di + di. - d_b
  }
  return(sum_di)
}

get_sum_sum_dij_star_square <- function(d_b, x, y) {
  counter <- 0
  for (xi in seq_along(x))
    counter_xi <- 0
  for (yi in seq_along(y)) {
    if (x[xi] != y[yi]) {
      dij <- ifelse(x[xi] > y[yi], 1, -1)
      dij_star <- dij - d_b
      counter_xi <- counter_xi + dij_star
    }
    counter <- counter + counter_xi^2
  }
  counter
}

get_sum_sum_dij_star_squared_inside <- function(d_b, x, y) {
  counter <- 0
  for (xi in seq_along(x))
    for (yi in seq_along(y)) {
      if (x[xi] != y[yi]) {
        dij <- ifelse(x[xi] > y[yi], 1, -1)
        dij_star <- dij - d_b
        counter <- counter + dij_star^2
      }
    }
  counter
}

get_dw_numerator <- function(dw, x, y) {
  counter <- 0
  for (xi in seq(x)) {
    dii <- 0
    if (x[xi] > y[xi]) {
      dii <- 1
    } else if (x[xi] > y[xi]) {
      dii <- -1
    }
    counter <- counter + (dii - dw)^2
  }
  return(counter)
}

get_cov_db_dw <- function(db, dw, x, y) {
  for (xi in seq_along(x)) {
    counter <- 0
    dij <- 0
    dji <- 0
    for (yi in seq_along(y)) {
      if (x[xi] > y[yi]) {
        dij <- dij + 1
      } else if (x[xi] > y[yi]) {
        dji <- dji + 1
      }
    }
    dii <- 0
    if (x[xi] > y[xi]) {
      dii <- 1
    } else if (x[xi] > y[xi]) {
      dii <- -1
    }
    counter <- counter + (dij + dji) * dii
  }
  n <- length(x)
  return((counter - 2 * n * (n - 1) * db * dw) / (n * (n - 1) * (n - 2)))
}

get_var_db_dw <- function(x, y) {
  n <- length(x)
  d_b <- get_db(x, y)
  d_w <- ps_dependent_groups(x, y, pab = TRUE, ignore_ties = FALSE) - ps_dependent_groups(x, y, pab = FALSE, ignore_ties = FALSE)
  sum_di. <- get_sum_di._star(d_b, x, y)
  sum_d.i <- get_sum_di._star(d_b, y, x)
  sum_di_squared_di. <- get_sum_di_squared(d_b, x, y)
  sum_sum_dij_start_square <- get_sum_sum_dij_star_square(d_b, x, y)
  sum_sum_dij_start_squared_inside <- get_sum_sum_dij_star_squared_inside(d_b, x, y)
  var_db <- ((n - 1)^2 * (sum_di.^2 + sum_d.i + 2 * sum_di_squared_di.) -
    sum_sum_dij_start_square -
    sum_sum_dij_start_squared_inside) / (n * (n - 1) * (n - 2) * (n - 3))
  var_dw <- (get_dw_numerator(d_w, x, y)) / (n - 1)
  cov_db_dw <- get_cov_db_dw(d_b, d_w, x, y)
  return(var_db + var_dw + 2 * cov_db_dw)
}

dominance_measure_dependent_ci <- function(x, y, alpha) {
  if (length(x) != length(y)) {
    return()
  }
  n <- length(x)
  d <- dominance_measure_dependent(x, y)
  var_db_dw <- get_var_db_dw(x, y)

  z <- qnorm(1 - alpha / 2)
  upper_bound <- d + z * (var_db_dw / sqrt(n))
  lower_bound <- d - z * (var_db_dw / sqrt(n))
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
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

dominance_measure_ci <- function(x, INDEX, dependent = FALSE, alpha = 0.05) {
  if (!dependent) cis <- mann_whitney_based_ps_ci(x, INDEX, pab = TRUE, alpha = alpha)
  else cis <- ps_dependent_groups_ci(x, INDEX, alpha = alpha)
  lower_bound <- 2 * cis[[1]] - 1
  upper_bound <- 2 * cis[[2]] - 1
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}


### Overlap measures ----

#### parametric estimators ----

##### OVL ----
parametric_ovl <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x)) d <- cohens_d(x = x, INDEX = INDEX)
  else d <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
  2 * pnorm(-abs(d) / 2)
}

get_noncentral_F_ci <- function(non_centrality_parameter, df2, alpha) {
  cibound_candidates <- c(0, max(non_centrality_parameter * 7, 10))

  if (pf(non_centrality_parameter, 1, df2) <= 1 - alpha / 2) {
    ll <- 0
  } else {
    ll <- suppressWarnings(
      uniroot(f = function(x) {
        pf(q = non_centrality_parameter, df1 = 1, df2 = df2, ncp = x) - (1 - alpha / 2)
      },
              interval = cibound_candidates)
    )$root
  }

  if (pf(non_centrality_parameter, 1, df2) <= (alpha / 2)) {
    ul <- 0
  } else {
    ul <- suppressWarnings(
      uniroot(f = function(x) {
        pf(q = non_centrality_parameter, df1 = 1, df2 = df2, ncp = x) - (alpha / 2)
      },
              interval = cibound_candidates)
    )$root
  }

  return(c(ll, ul))
}


parametric_ovl_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x)) {
    stats <- summary_stats(x = x, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  tmp <- student_t(m1 = m1, m2 = m2, var1 = s1^2, var2 = s2^2, n1 = n1, n2 = n2)
  t2 <- tmp$t_val^2
  df2 <- tmp$df
  ncp_ci <- get_noncentral_F_ci(t2, df2, alpha)
  nu <- sqrt((n1 + n2) / (n1 * n2))
  cohens_d_abs_val_ci <- sqrt(ncp_ci) * nu
  lower_bound <- 2 * pnorm(-cohens_d_abs_val_ci[[2]] / 2)
  upper_bound <- 2 * pnorm(-cohens_d_abs_val_ci[[1]] / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound)
  )
}

parametric_ovl_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  d <- cohens_d(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 = n)
  ovl_parametric_dependent <- 2 * pnorm(-abs(d) / 2)
  return(ovl_parametric_dependent)
}

parametric_ovl_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  cohens_d_dependent_ci <- cohens_d_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
  lower_bound <- 2 * pnorm(-abs(cohens_d_dependent_ci$lower_bound) / 2)
  upper_bound <- 2 * pnorm(-abs(cohens_d_dependent_ci$upper_bound) / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

##### OVL 2 ----

parametric_ovl_two <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  ovl <- parametric_ovl(x, INDEX, m1, m2, s1, s2, n1, n2)
  return(ovl / (2 - ovl))
}


parametric_ovl_two_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  ovl_cis <- parametric_ovl_ci(x, INDEX, m1, m2, s1, s2, n1, n2, alpha = alpha)
  lower_bound <- ovl_cis[[1]] / (2 - ovl_cis[[1]])
  upper_bound <- ovl_cis[[2]] / (2 - ovl_cis[[2]])
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
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

##### U1 ----

parametric_cohens_u1 <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  ovl <- parametric_ovl(x, INDEX, m1, m2, s1, s2, n1, n2)
  return(1 - ovl / (2 - ovl))
}

parametric_cohens_u1_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  ovl_cis <- parametric_ovl_ci(x, INDEX, m1, m2, s1, s2, n1, n2, alpha = alpha)
  lower_bound <- 1 - ovl_cis[[1]] / (2 - ovl_cis[[2]])
  upper_bound <- 1 - ovl_cis[[2]] / (2 - ovl_cis[[1]])
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
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

##### U2 ----

parametric_cohens_u2 <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2) {
  if (!is.null(x) && !is.null(INDEX)) {
    d <- cohens_d(x = x, INDEX = INDEX)
  } else {
    d <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
  }
  return(pnorm(d / 2))

}

parametric_cohens_u2_ci <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, alpha = 0.05) {
  if (!is.null(x) && !is.null(INDEX)) {
    d <- cohens_d(x, INDEX)
    ci <- cohens_d_ci(x, INDEX, alpha = alpha)
  } else {
    d <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
    ci <- cohens_d_ci(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, alpha = alpha)
  }
  lower_bound <- pnorm(ci[[ifelse(d > 0, 1, 2)]] / 2)
  upper_bound <- pnorm(ci[[ifelse(d > 0, 2, 1)]] / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

parametric_cohens_u2_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n) {
  d <- cohens_d(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 = n)
  cohens_coefficient_of_nonoverlap_u2_parametric_dependent <- pnorm(d / 2)
  return(cohens_coefficient_of_nonoverlap_u2_parametric_dependent)
}

parametric_cohens_u2_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, r, alpha = 0.05) {
  cohens_d_dependent_ci <- cohens_d_dependent_ci(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n = n, r = r, alpha = alpha)
  lower_bound <- pnorm(abs(cohens_d_dependent_ci$lower_bound) / 2)
  upper_bound <- pnorm(abs(cohens_d_dependent_ci$upper_bound) / 2)
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

##### U3 ----

parametric_cohens_u3 <- function(x = NULL, INDEX = NULL, m1, m2, s1, s2, n1, n2, var_equal = TRUE) {
  if (var_equal) {
    if (!is.null(x) && !is.null(INDEX)) d <- cohens_d(x = x, INDEX = INDEX)
    else d <- cohens_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2)
    return(pnorm(abs(d)))
  } else if (!var_equal) {
    if (!is.null(x) && !is.null(INDEX)) {
      original_dataset <- split(x, INDEX)
      dataset1 <- original_dataset[[1]]
      dataset2 <- original_dataset[[2]]
      standardised_by_group_1 <- ifelse(mean(dataset1) > mean(dataset2), TRUE, FALSE)
      glass_d <- glass_d(x, INDEX, standardised_by_group_1 = standardised_by_group_1)
    }else {
      standardised_by_group_1 <- ifelse(m1 > m2, TRUE, FALSE)
      glass_d <- glass_d(m1 = m1, m2 = m2, s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1)
    }
    return(pnorm(abs(glass_d)))
  }
}

parametric_cohens_u3_ci <- function(x, INDEX, m1, m2, s1, s2, n1, n2, var_equal = TRUE, alpha = 0.05) {
  if (var_equal) {
    if (!missing(x) && !missing(INDEX)) {
      ci <- cohens_d_ci(x, INDEX, alpha = alpha)
    } else {
      ci <- cohens_d_ci(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, alpha = alpha)
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
      glass_d_ci <- glass_d_ci(m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n1, n2 = n2, standardised_by_group_1 = standardised_by_group_1, alpha = alpha)
    }
    lower_bound <- pnorm(glass_d_ci[[1]])
    upper_bound <- pnorm(glass_d_ci[[2]])
  }
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))
}

parametric_cohens_u3_dependent <- function(x = NULL, y = NULL, m1, m2, s1, s2, n, var_equal = TRUE) {
  if (var_equal) {
    d <- cohens_d(x = x, y = y, m1 = m1, m2 = m2, s1 = s1, s2 = s2, n1 = n, n2 = n)
    cohens_coefficient_of_nonoverlap_u3_parametric_dependent <- pnorm(abs(d))
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

parametric_cohens_u3_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, var_equal = TRUE, alpha = 0.05) {
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

#### nonparametric estimators ----

##### OVL ----

non_parametric_ovl <-
  function(x = NULL,
           INDEX = NULL,
           y = NULL,
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
    if (!is.null(x) && !is.null(INDEX)) {
      dataset1 <- split(x, INDEX)[[1]]
      dataset2 <- split(x, INDEX)[[2]]
    } else {
      dataset1 <- x
      dataset2 <- y
    }
    num_intervals <- 10
    d1 <- density(dataset1, bw = bw, kernel = kernel)
    d2 <- density(dataset2, bw = bw, kernel = kernel)
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

##### OVL 2 ----

non_parametric_ovl_two <- function(x = NULL,
                                   INDEX = NULL,
                                   y = NULL,
                                   kernel = c(
                                     "gaussian",
                                     "epanechnikov",
                                     "rectangular",
                                     "triangular",
                                     "biweight",
                                     "cosine",
                                     "optcosine"
                                   )) {
  if (!is.null(x) && !is.null(INDEX)) {
    dataset1 <- split(x, INDEX)[[1]]
    dataset2 <- split(x, INDEX)[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  ovl <- non_parametric_ovl(x = x, INDEX = INDEX, y = y, kernel = kernel)
  d1 <- density(dataset1, bw = "nrd0", kernel = "gaussian")
  d2 <- density(dataset2, bw = "nrd0", kernel = "gaussian")
  f1 <- approxfun(d1$x, d1$y)
  f2 <- approxfun(d2$x, d2$y)
  min <-
    min(min(d1$x), min(d2$x))
  max <-
    max(max(d1$x), max(d2$x))
  num_intervals <- 10
  stepsize <- (max - min) / num_intervals
  interval <- seq(min, max, by = stepsize)
  sum <- 0
  #approximation based on Trapezoid rule
  for (x in seq(length(interval) - 1)) {
    f1_interval_x <- f1(interval[x])
    if (is.na(f1_interval_x)) {
      f1_interval_x <- 0
    }
    f2_interval_x <- f2(interval[x])
    if (is.na(f2_interval_x)) {
      f2_interval_x <- 0
    }
    f1_interval_x_1 <- f1(interval[x + 1])
    if (is.na(f1_interval_x_1)) {
      f1_interval_x_1 <- 0
    }
    f2_interval_x_1 <- f2(interval[x + 1])
    if (is.na(f2_interval_x_1)) {
      f2_interval_x_1 <- 0
    }

    sum <-
      sum + 1 / 2 * (max(f1_interval_x, f2_interval_x) + max(f1_interval_x_1, f2_interval_x_1))
  }

  area <- (max - min) / num_intervals * sum

  return(ovl / area)
}

##### U1 ----

non_parametric_cohens_u1 <- function(x = NULL, INDEX = NULL, y = NULL, kernel = c(
  "gaussian",
  "epanechnikov",
  "rectangular",
  "triangular",
  "biweight",
  "cosine",
  "optcosine"
)) {
  ovl_two <- non_parametric_ovl_two(x = x, INDEX = INDEX, y = y, kernel = kernel)
  return(1 - ovl_two)
}

##### U2 ----
Fhat <- function(x, dat) {
  mean(dat <= x)
}

non_parametric_cohens_u2_root_finding_version <- function(x, INDEX) {
  datasets <- split(x, INDEX)
  dataset1 <- sort(datasets[[1]])
  dataset2 <- sort(datasets[[2]])
  
  if (dataset2[[1]] >= dataset1[[length(dataset1)]]) return(1)
  if (dataset2[[length(dataset1)]] <= dataset1[[1]]) return(0)
  
  temp <- uniroot(f = function(x){(1 - Fhat(x = x, dat = dataset2)) - Fhat(x = x, dat = dataset1)},
                  interval = c(min(c(dataset1, dataset2)), max(c(dataset1, dataset2))))$root

  res <- Fhat(temp, dataset1)
  return(res)
}

non_parametric_cohens_u2 <- function(x = NULL, INDEX = NULL, y = NULL) {
  if (!is.null(x) && !is.null(INDEX)) {
    datasets <- split(x, INDEX)
    dataset1 <- sort(datasets[[1]])
    dataset2 <- sort(datasets[[2]], decreasing = TRUE)
  } else {
    dataset1 <- sort(x)
    dataset2 <- sort(y, decreasing = TRUE)
  }
  
  if (dataset2[[length(dataset2)]] >= dataset1[[length(dataset1)]]) return(1)
  if (dataset2[[1]] <= dataset1[[1]]) return(0)
  
  index <- 0
  for (i in dataset2) {
    index <- index + 1
    tmp1 <- mean(dataset1 <= i)
    tmp2 <- index / length(dataset2)
    if (tmp2 > tmp1) {
      result <- tmp1 # to be conservative the lower value is returned
      break
    }
  }
  return(result)
}

##### U3 ----

non_parametric_cohens_u3 <- function(x = NULL, INDEX = NULL, y = NULL) {
  if (!is.null(x) && !is.null(INDEX)) {
    dataset1 <- split(x, INDEX)[[1]]
    dataset2 <- split(x, INDEX)[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  mean_1 <- mean(dataset1)
  mean_2 <- mean(dataset2)
  if (mean_1 < mean_2) {
    dataset1 <- dataset2
    dataset2 <- dataset1
  }
  median <- median(dataset1)
  result <- 1 / length(dataset2) * sum(unlist(lapply(dataset2, function(x) { if (x < median) 1 else 0 })))
  return(result)
}

# dependent groups parametric ----




cohens_dz <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  res <- (m2 - m1) / sdiff
  return(res)
}

cohens_dz_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  non_centrality_parameter <- cohens_dz * sqrt(n)
  df <- n - 1
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  cohens_dz_ci <- ncp_ci / sqrt(n)
  return(list(lower_bound = cohens_dz_ci[[1]],
              upper_bound = cohens_dz_ci[[2]]))
}

hedges_gz <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  res <- cohens_dz * hedges_bias_correction(df = n - 1)
  return(res)
}

hedges_gz_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  hedges_gz <- hedges_gz(m1 = m1, m2 = m2, sdiff = sdiff, n = n)
  non_centrality_parameter <- hedges_gz * sqrt(n)
  df <- n - 1
  ncp_ci <- get_noncentral_t_ci(non_centrality_parameter, df, alpha)
  hedges_gz_ci <- ncp_ci / sqrt(n)
  return(list(lower_bound = hedges_gz_ci[[1]],
              upper_bound = hedges_gz_ci[[2]]))
}

cohens_drm <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  res <- ((m2 - m1) / sdiff) * sqrt(2 * (1 - r))
  return(res)
}


cohens_drm_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_drm <- cohens_drm(m1 = m1, m2 = m2, sdiff = sdiff, r = r)
  v <- 2 *
    (1 - r) *
    ((cohens_drm^2 / (2 * n)) + (1 / n))
  cohens_drm_ci <- cohens_drm + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = cohens_drm_ci[[1]],
              upper_bound = cohens_drm_ci[[2]]))
}

hedges_grm <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
  cohens_drm <- cohens_drm(m1 = m1, m2 = m2, sdiff = sdiff, r = r)
  res <- cohens_drm * hedges_bias_correction(n - 1)
  return(res)
}

hedges_grm_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, sdiff = NA, n, r, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    stats <- summary_stats(x = x, y = y)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff)) sdiff <- sd_diff(s1, s2, r)
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


variance_ratio_dependent_ci <- function(x = NULL, y = NULL, s1, s2, n, r, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (!is.null(x) && !is.null(y)) {
    n <- length(x)
    s1 <- sd(x)
    s2 <- sd(y)
    r <- cor(x, y)
  }
  vr <- variance_ratio(s1 = s1, s2 = s2, standardised_by_group_1 = standardised_by_group_1, log = FALSE)
  t_crit <- qt(alpha / 2, df = n - 2)
  k <- 1 + (2 * (1 - r^2) * t_crit^2) / (n - 2)
  lower_bound <- vr * (k - sqrt(k^2 - 1))
  upper_bound <- vr * (k + sqrt(k^2 - 1))
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

non_parametric_variance_ratio_dependent_ci <- function(x = NULL, y = NULL, standardised_by_group_1 = TRUE, alpha = 0.05) {
  if (standardised_by_group_1) {
    temp <- x
    x <- y
    y <- temp
  }
  m1 <- mean(x)
  m2 <- mean(y)
  n <- length(x)
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
  vr <- log(var(x) / var(y))
  variance_ratio_dependent_ci <- exp(vr + c(z_crit, abs(z_crit)) * sqrt(nu1 + nu2 - 2 * a))
  lower_bound <- variance_ratio_dependent_ci[[1]]
  upper_bound <- variance_ratio_dependent_ci[[2]]
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

nam_blackwelder_parametric_tr_ci_error <- function(x = NULL, y = NULL, m1, m2, s1, s2, r, n,
                                                   reference_group, cutoff, tail, alpha = 0.05) {
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
  n1. <- ifelse(reference_group == "group1", posttest_success, pretest_success) * n
  n.1 <- ifelse(reference_group == "group1", pretest_success, posttest_success) * n
  any_marginal_counts_zero <- any(c(n1., n.1) == 0)
  if (any_marginal_counts_zero) {
    return(FALSE)
  } else {
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
    n11 <- pretest_success_posttest_success * n
    n22 <- pretest_failure_posttest_failure * n
    n12 <- ifelse(reference_group == "group1", pretest_failure_posttest_success, pretest_success_posttest_failure) * n
    n21 <- ifelse(reference_group == "group1", pretest_success_posttest_failure, pretest_failure_posttest_success) * n
    tr <- n1. / n.1
    wald_se <- sqrt((n12 + n21) / (n1. * n.1))
    interval <- exp(log(tr) + c(-3, 3) * wald_se)
    parametric_tr_dependent_ci <- try(nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, alpha = alpha), silent = TRUE)
    return("try-error" %in% class(parametric_tr_dependent_ci))
  }
}

nam_blackwelder_non_parametric_tr_ci_error <- function(x, y, reference_group, tail, cutoff, alpha) {
  n <- length(x)
  pretest_success <- ifelse(tail == "lower", sum(x <= cutoff), sum(x >= cutoff))
  posttest_success <- ifelse(tail == "lower", sum(y <= cutoff), sum(y >= cutoff))
  n1. <- ifelse(reference_group == "group1", posttest_success, pretest_success)
  n.1 <- ifelse(reference_group == "group1", pretest_success, posttest_success)
  any_marginal_counts_zero <- any(c(pretest_success, posttest_success) == 0)
  if (any_marginal_counts_zero) {
    return(FALSE)
  } else {
    pretest_success_posttest_failure <- ifelse(tail == "lower", sum(x <= cutoff & y > cutoff), sum(x >= cutoff & y < cutoff))
    pretest_failure_posttest_success <- ifelse(tail == "lower", sum(x > cutoff & y <= cutoff), sum(x < cutoff & y >= cutoff))
    pretest_failure_posttest_failure <- ifelse(tail == "lower", sum(x > cutoff & y > cutoff), sum(x < cutoff & y < cutoff))
    pretest_success_posttest_success <- ifelse(tail == "lower", sum(x <= cutoff & y <= cutoff), sum(x >= cutoff & y >= cutoff))

    n11 <- pretest_success_posttest_success
    n22 <- pretest_failure_posttest_failure
    n12 <- ifelse(reference_group == "group1", pretest_failure_posttest_success, pretest_success_posttest_failure)
    n21 <- ifelse(reference_group == "group1", pretest_success_posttest_failure, pretest_failure_posttest_success)
    tr <- n1. / n.1
    wald_se <- sqrt((n12 + n21) / (n1. * n.1))
    interval <- exp(log(tr) + c(-3, 3) * wald_se)
    non_parametric_tr_dependent_ci <- try(nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, alpha = alpha), silent = TRUE)
    return("try-error" %in% class(non_parametric_tr_dependent_ci))
  }
}

nam_blackwelder_ci_error <- function(x, y, m1, m2, s1, s2, r, n, mode, assumption, reference_group, tail, cutoff, alpha = 0.05) {
  if (mode == "educational") {
    return(nam_blackwelder_parametric_tr_ci_error(m1 = m1, m2 = m2, s1 = s1, s2 = s2, r = r, n = n, reference_group = reference_group, tail = tail, cutoff = cutoff, alpha = alpha))
  } else {
    if (assumption == "nonparametric") {
      return(nam_blackwelder_non_parametric_tr_ci_error(x = x, y = y, reference_group = reference_group, tail = tail, cutoff = cutoff, alpha = alpha))
    } else {
      return(nam_blackwelder_parametric_tr_ci_error(x = x, y = y, reference_group = reference_group, tail = tail, cutoff = cutoff, alpha = alpha))
    }
  }
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


tail_ratio_dependent_ci <- function(x = NULL, y = NULL, m1, m2, s1, s2, r, n,
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
  tail_ratio_dependent <- n1. / n.1
  wald_se <- sqrt((n12 + n21) / (n1. * n.1))
  interval <- exp(log(tail_ratio_dependent) + c(-3, 3) * wald_se)
  any_marginal_counts_zero <- any(c(n1., n.1) == 0)
  if (any_marginal_counts_zero) {
    lower_bound <- NA_real_
    upper_bound <- NA_real_
  } else {
    tail_ratio_dependent_ci <- try(nam_blackwelder_asymptotic_cml(n1., n.1, n11, n12, n21, n22, interval, alpha = alpha), silent = TRUE)
    if ("try-error" %in% class(tail_ratio_dependent_ci)) {
      tail_ratio_dependent_ci <- bonett_price_hybrid_wilson_score(n1., n.1, n11, n12, n21, alpha = alpha)

    }
    lower_bound <- tail_ratio_dependent_ci[[1]]
    upper_bound <- tail_ratio_dependent_ci[[2]]
  }
  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))
}

non_parametric_tail_ratio_dependent <- function(x = NULL, y = NULL, reference_group = c("group1", "group2"), tail = c("lower", "upper"), cutoff) {


  pretest_success <- ifelse(tail == "lower", sum(x <= cutoff), sum(x >= cutoff))
  posttest_success <- ifelse(tail == "lower", sum(y <= cutoff), sum(y >= cutoff))
  any_marginal_counts_zero <- any(c(pretest_success, posttest_success) == 0)
  if (any_marginal_counts_zero) {
    non_parametric_tail_ratio_dependent <- NA_real_
  } else {
    non_parametric_tail_ratio_dependent <- ifelse(reference_group == "group1", posttest_success / pretest_success, pretest_success / posttest_success)
  }
  return(non_parametric_tail_ratio_dependent)
}


non_parametric_tail_ratio_dependent_ci <- function(x, y, reference_group = c("group1", "group2"), cutoff, tail = c("lower", "upper"), alpha = 0.05) {

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


# Mixed design ES ----

d_PPC_change <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, s2, r1, sdiff1 = NA, m3, s3, m4, s4, r2, sdiff2 = NA) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff1)) sdiff1 <- sd_diff(s1, s2, r1)
  if (is.na(sdiff2)) sdiff2 <- sd_diff(s3, s4, r2)
  cohens_dz_a <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff1)
  cohens_dz_b <- cohens_dz(m1 = m3, m2 = m4, sdiff = sdiff2)
  res <- cohens_dz_a - cohens_dz_b
  return(res)
}

var_dz_large_sample_approx <- function(m1, m2, sdiff, n) {
  dz <- cohens_dz(m1 = m1, m2 = m2, sdiff = sdiff)
  res <- 1 / n + dz^2 / (2 * (n - 1))
  return(res)
}

d_PPC_change_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, n1, m2, s2, r1, sdiff1 = NA, m3, s3, n2, m4, s4, r2, sdiff2 = NA, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff1)) sdiff1 <- sd_diff(s1, s2, r1)
  if (is.na(sdiff2)) sdiff2 <- sd_diff(s3, s4, r2)
  d <- d_PPC_change(m1 = m1, m2 = m2, sdiff1 = sdiff1, m3 = m3, m4 = m4, sdiff2 = sdiff2)
  v <- var_dz_large_sample_approx(m1, m2, sdiff1, n1) + var_dz_large_sample_approx(m3, m4, sdiff2, n2)
  ci <- d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

g_PPC_change <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, s2, n1, r1, sdiff1 = NA, m3, s3, m4, s4, n2, r2, sdiff2 = NA) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff1)) sdiff1 <- sd_diff(s1, s2, r1)
  if (is.na(sdiff2)) sdiff2 <- sd_diff(s3, s4, r2)
  hedges_gz_a <- hedges_gz(m1 = m1, m2 = m2, sdiff = sdiff1, n = n1)
  hedges_gz_b <- hedges_gz(m1 = m3, m2 = m4, sdiff = sdiff2, n = n2)
  res <- hedges_gz_a - hedges_gz_b
  return(res)
}

g_PPC_change_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, n1, m2, s2, r1, sdiff1 = NA, m3, s3, n2, m4, s4, r2, sdiff2 = NA, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  if (is.na(sdiff1)) sdiff1 <- sd_diff(s1, s2, r1)
  if (is.na(sdiff2)) sdiff2 <- sd_diff(s3, s4, r2)
  g <- g_PPC_change(m1 = m1, m2 = m2, n1 = n1, sdiff1 = sdiff1, m3 = m3, m4 = m4, n2 = n2, sdiff2 = sdiff2)
  v <- hedges_bias_correction(df = n1 - 1)^2 * var_dz_large_sample_approx(m1, m2, sdiff1, n1) + hedges_bias_correction(df = n2 - 1)^2 * var_dz_large_sample_approx(m3, m4, sdiff2, n2)
  ci <- g + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}


d_PPC_pre <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, m3, s3, m4) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  glass_d_a <- glass_d(m1 = m1, m2 = m2, s1 = s1, standardised_by_group_1 = TRUE)
  glass_d_b <- glass_d(m1 = m3, m2 = m4, s1 = s3, standardised_by_group_1 = TRUE)
  res <- glass_d_a - glass_d_b
  return(res)
}

var_glass_d_large_sample_approx <- function(m1, s1, m2, n, r) {
  d <- glass_d(m1 = m1, m2 = m2, s1 = s1, standardised_by_group_1 = TRUE)
  res <- 2 * (1 - r) / n + d^2 / (2 * n)
  return(res)
}


d_PPC_pre_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, r1, m3, s3, m4, n2, r2, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- d_PPC_pre(m1 = m1, s1 = s1, m2 = m2, m3 = m3, s3 = s3, m4 = m4)
  v <- var_glass_d_large_sample_approx(m1, s1, m2, n1, r1) + var_glass_d_large_sample_approx(m3, s3, m4, n2, r2)
  ci <- d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}


g_PPC_pre <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, m3, s3, m4, n2) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  glass_d_corr_a <- glass_d_corr(m1 = m1, m2 = m2, s1 = s1, df = n1 - 1)
  glass_d_corr_b <- glass_d_corr(m1 = m3, m2 = m4, s1 = s3, df = n2 - 1)
  res <- glass_d_corr_a - glass_d_corr_b
  return(res)
}

var_glass_d_corr_large_sample_approx <- function(m1, s1, m2, n, r) {
  g <- glass_d_corr(m1 = m1, m2 = m2, df = n - 1)
  res <- 2 * (1 - r) / n + g^2 / (2 * (n - 1))
  return(res)
}


g_PPC_pre_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, r1, m3, s3, m4, n2, r2, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  g <- g_PPC_pre(m1 = m1, s1 = s1, m2 = m2, n1 = n1, m3 = m3, s3 = s3, m4 = m4, n2 = n2)
  v <- var_glass_d_large_sample_approx(m1, s1, m2, n1, r1) + var_glass_d_large_sample_approx(m3, s3, m4, n2, r2)
  ci <- g + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

d_PPC_pooled_pre <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, m3, s3, m4, n2) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  s_pre_pooled <- sd_pooled(s1, s3, n1, n2)
  mean_change_diff <- (m2 - m1) - (m4 - m3)
  res <- mean_change_diff / s_pre_pooled
  return(res)
}

pool_cor <- function(n1, n2, r1, r2) {
  z1 <- 0.5 * log((1 + r1) / (1 - r1))
  se_z1 <- 1 / sqrt(n1 - 3)
  w_z1 <- 1 / se_z1^2
  z2 <- 0.5 * log((1 + r2) / (1 - r2))
  se_z2 <- 1 / sqrt(n2 - 3)
  w_z2 <- 1 / se_z2^2
  z <- (z1 * w_z1 + z2 * w_z2) / (w_z1 + w_z2)
  res <- (exp(2 * z) - 1) / (1 + exp(2 * z))
  return(res)
}

var_d_PPC_pooled_pre <- function(d, n1, n2, r1, r2) {
  r_p <- pool_cor(n1, n2, r1, r2)
  df <- n1 + n2 - 2
  res <- 2 * (1 - r_p) * ((n1 + n2) / (n1 * n2)) + (d^2) / (2 * df)
  return(res)
}

d_PPC_pooled_pre_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, r1, m3, s3, m4, n2, r2, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- d_PPC_pooled_pre(m1 = m1, s1 = s1, m2 = m2, n1 = n1, m3 = m3, s3 = s3, m4 = m4, n2 = n2)
  v <- var_d_PPC_pooled_pre(d, n1, n2, r1, r2)
  ci <- d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}


g_PPC_pooled_pre <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, m3, s3, m4, n2) {
  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  s_pre_pooled <- sd_pooled(s1, s3, n1, n2)
  mean_change_diff <- (m2 - m1) - (m4 - m3)
  c <- hedges_bias_correction(df = n1 + n2 - 2)
  res <- c * mean_change_diff / s_pre_pooled
  return(res)
}


g_PPC_pooled_pre_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, n1, r1, m3, s3, m4, n2, r2, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- d_PPC_pooled_pre(m1 = m1, s1 = s1, m2 = m2, n1 = n1, m3 = m3, s3 = s3, m4 = m4, n2 = n2)
  c <- hedges_bias_correction(df = n1 + n2 - 2)
  v <- var_d_PPC_pooled_pre(d, n1, n2, r1, r2)
  ci <- c * d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v * c^2)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}


d_PPC_pooled_pre_post <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, s2, n1, m3, s3, m4, s4, n2) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  s_pre_post_pooled <- ((n1 - 1) * (s1 + s2) + (n2 - 1) * (s3 + s4)) / (2 * (n1 + n2 - 2))
  mean_change_diff <- (m2 - m1) - (m4 - m3)
  res <- mean_change_diff / s_pre_post_pooled
  return(res)
}


var_d_PPC_pooled_pre_post <- function(d, n1, n2, r1, r2) {
  r_p <- pool_cor(n1, n2, r1, r2)
  df <- 2 * (n1 + n2 - 2) / (1 + r_p^2)
  res <- 2 * (1 - r_p) * ((n1 + n2) / (n1 * n2)) + (d^2) / (2 * df)
  return(res)
}

d_PPC_pooled_pre_post_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, s2, n1, r1, m3, s3, m4, s4, n2, r2, alpha = 0.05) {

  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- d_PPC_pooled_pre_post(m1 = m1, s1 = s1, m2 = m2, s2 = s2, n1 = n1, m3 = m3, s3 = s3, m4 = m4, s4 = s4, n2 = n2)
  v <- var_d_PPC_pooled_pre_post(d, n1, n2, r1, r2)
  ci <- d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

g_PPC_pooled_pre_post <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, s2, n1, r1, m3, s3, m4, s4, n2, r2) {
  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  s_pre_post_pooled <- ((n1 - 1) * (s1 + s2) + (n2 - 1) * (s3 + s4)) / (2 * (n1 + n2 - 2))
  mean_change_diff <- (m2 - m1) - (m4 - m3)
  r_p <- pool_cor(n1, n2, r1, r2)
  c <- hedges_bias_correction(df = 2 * (n1 + n2 - 2) / (1 + r_p^2))
  res <- c * mean_change_diff / s_pre_post_pooled
  return(res)
}

g_PPC_pooled_pre_post_ci <- function(x = NULL, y = NULL, INDEX = NULL, m1, s1, m2, s2, n1, r1, m3, s3, m4, s4, n2, r2, alpha = 0.05) {
  if (!is.null(x) && !is.null(y) && !is.null(INDEX)) {
    stats <- summary_stats(x = x, y = y, INDEX = INDEX)
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }
  d <- d_PPC_pooled_pre_post(m1 = m1, s1 = s1, m2 = m2, s2 = s2, n1 = n1, m3 = m3, s3 = s3, m4 = m4, s4 = s4, n2 = n2)
  r_p <- pool_cor(n1, n2, r1, r2)
  c <- hedges_bias_correction(df = 2 * (n1 + n2 - 2) / (1 + r_p^2))
  v <- var_d_PPC_pooled_pre_post(d, n1, n2, r1, r2)
  ci <- c * d + c(qnorm(alpha / 2), qnorm(1 - alpha / 2)) * sqrt(v * c^2)
  return(list(lower_bound = ci[[1]],
              upper_bound = ci[[2]]))
}

p_pre <- function(x, y) {
  median <- median(y)
  counter <- 0
  for (xi in x) {
    if (xi < median) {
      counter <- counter + 1
    }
  }
  return(counter / length(x))
}

p_post <- function(x, y) {
  median <- median(x)
  counter <- 0
  for (yi in y) {
    if (yi > median) {
      counter <- counter + 1
    }
  }
  return(counter / length(y))
}

non_parametric_d_PPC_pre <- function(x, y, INDEX, alternative = FALSE) {
  datasets_pre <- split(x, INDEX)
  dataset1_pre <- datasets_pre[[1]]
  dataset2_pre <- datasets_pre[[2]]
  datasets_post <- split(y, INDEX)
  dataset1_post <- datasets_post[[1]]
  dataset2_post <- datasets_post[[2]]

  if (!alternative) {
    p_a <- p_pre(dataset1_pre, dataset1_post)
    p_a <- correct_for_extreme_eff_sizes(length(dataset1_pre), p_a)
    p_b <- p_pre(dataset2_pre, dataset2_post)
    p_b <- correct_for_extreme_eff_sizes(length(dataset2_pre), p_b)
  } else {
    p_a <- p_post(dataset1_pre, dataset1_post)
    p_a <- correct_for_extreme_eff_sizes(length(dataset1_post), p_a)
    p_b <- p_post(dataset2_pre, dataset2_post)
    p_b <- correct_for_extreme_eff_sizes(length(dataset2_post), p_b)
  }
  return(qnorm(p_a) - qnorm(p_b))
}

p_gain <- function(x, y) {
  n_x <- length(x)
  n_y <- length(y)
  if (n_x != n_y) {
    stop("\nx and y must have the same length")
  }
  counter <- 0
  for (i in seq_len(n_x)) {
    if (y[i] > x[i]) {
      counter <- counter + 1
    } else if (y[i] == x[i]) {
      counter <- counter + 0.5
    }
  }
  return(counter / n_x)
}

non_parametric_d_PPC_change <- function(x, y, INDEX) {
  datasets_pre <- split(x, INDEX)
  dataset1_pre <- datasets_pre[[1]]
  dataset2_pre <- datasets_pre[[2]]
  datasets_post <- split(y, INDEX)
  dataset1_post <- datasets_post[[1]]
  dataset2_post <- datasets_post[[2]]

  p_gain_a <- p_gain(dataset1_pre, dataset1_post)
  p_gain_a <- correct_for_extreme_eff_sizes(length(dataset1_pre), p_gain_a)
  p_gain_b <- p_gain(dataset2_pre, dataset2_post)
  p_gain_b <- correct_for_extreme_eff_sizes(length(dataset2_pre), p_gain_b)
  return(qnorm(p_gain_a) - qnorm(p_gain_b))
}

non_parametric_dominance_measure_mixed <- function(x, y, INDEX) {
  datasets_pre <- split(x, INDEX)
  dataset1_pre <- datasets_pre[[1]]
  dataset2_pre <- datasets_pre[[2]]
  datasets_post <- split(y, INDEX)
  dataset1_post <- datasets_post[[1]]
  dataset2_post <- datasets_post[[2]]

  return(dominance_measure_dependent(dataset1_pre, dataset1_post) - dominance_measure_dependent(dataset2_pre, dataset2_post))
}

non_parametric_dominance_measure_mixed_ci <- function(x, y, INDEX, alpha) {
  datasets_pre <- split(x, INDEX)
  dataset1_pre <- datasets_pre[[1]]
  dataset2_pre <- datasets_pre[[2]]
  datasets_post <- split(y, INDEX)
  dataset1_post <- datasets_post[[1]]
  dataset2_post <- datasets_post[[2]]
  d <- non_parametric_dominance_measure_mixed(x, y, INDEX)
  var_1 <- get_var_db_dw(dataset1_pre, dataset1_post)
  var_2 <- get_var_db_dw(dataset2_pre, dataset2_post)

  z <- qnorm(1 - alpha / 2)
  upper_bound <- d + z * sqrt((var_1 + var_2))
  lower_bound <- d - z * sqrt((var_1 + var_2))
  return(list(lower_bound = lower_bound, upper_bound = upper_bound))

}


# Multivariate ES ----

## helper functions ----

### pooled correlation matrix ----

pool_cor_mat <- function(mat1, mat2, n1, n2) {
  res_mat <- matrix(numeric(length(mat1)), ncol = ncol(mat1))
  for (i in seq_len(length(mat1))) {
    res_mat[[i]] <- pool_cor(n1, n2, mat1[[i]], mat2[[i]])
  }
  diag(res_mat) <- rep(1, ncol(mat1))
  return(res_mat)
}

## Mahalnobis distance ----

mahalanobis_d <- function(x, INDEX) {
  cohens_ds <- vapply(x, cohens_d, FUN.VALUE = numeric(1),INDEX = INDEX)
  data <- split(x, INDEX)
  cor_mat1 <- cor(data[[1]])
  cor_mat2 <- cor(data[[2]])
  pooled_cor_mat <- pool_cor_mat(cor_mat1, cor_mat2, nrow(data[[1]]), nrow(data[[2]]))
  d <- sqrt(mahalanobis(cohens_ds, pooled_cor_mat, center = FALSE))
  return(drop(d))
}

mahalanobis_d_educational <- function(means, covariance_matrix) {
  dif <- means[[1]] - means[[2]]
  mahalanobis_d <- sqrt(t(dif) %*% solve(covariance_matrix) %*% dif)
  return(mahalanobis_d)
}

mahalanobis_d_raw_data_ci <- function(x, INDEX, alpha) {
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  data <- split(x, INDEX)
  n1 <- nrow(data[[1]])
  n2 <- nrow(data[[2]])
  return(mahalanobis_d_ci(mahalanobis_d, ncol(x), n1, n2, alpha))
}

mahalanobis_d_educational_ci <- function(means, covariance_matrix, n1, n2, alpha) {
  return(mahalanobis_d_ci(mahalanobis_d_educational(means, covariance_matrix), nrow(means), n1, n2, alpha))
}

mahalanobis_d_ci <- function(mahalanobis_d, p, n1, n2, alpha = 0.05) {
  conf.level <- 1 - alpha
  mahalanbis_d2 <- mahalanobis_d^2
  if (!is.null(n1)) {
    f_cal <- (mahalanbis_d2) * (n1 * n2 * (n1 + n2 - p - 1)) / (p * (n1 + n2) * (n1 + n2 - 2))
    lower_prob <- conf.level + (1 - conf.level) / 2
    upper_prob <- (1 - conf.level) / 2
    critical_F_upper <- qf(upper_prob, p, n1 + n2 - p - 1)
    critical_F_lower <- qf(lower_prob, p, n1 + n2 - p - 1)

    # lower
    if (mahalanbis_d2 > critical_F_lower) {
      ncp_est_max <- 10000 / (1 / n1 + 1 / n2)
      ncp_est_min <- 0
      ncp_est <- (ncp_est_max - ncp_est_min) / 2

      est_p <- pf(f_cal, p, (n1 + n2 - p - 1), lower.tail = TRUE, ncp = ncp_est)

      while (abs(est_p - lower_prob) > .00001) {
        if ((est_p - lower_prob) < 0) { ncp_est_max <- ncp_est
          ncp_est <- ncp_est_min + (ncp_est_max - ncp_est_min) / 2
        }
        else { ncp_est_min <- ncp_est
          ncp_est <- ncp_est_min + (ncp_est_max - ncp_est_min) / 2
        }
        est_p <- pf(f_cal, p, (n1 + n2 - p - 1), lower.tail = TRUE, ncp = ncp_est)
      }
      lower_bound <- sqrt(ncp_est * (1 / n1 + 1 / n2))
    }
    else {
      lower_bound <- NA
    }

    # upper
    if (mahalanbis_d2 > critical_F_upper) {
      ncp_est_max <- 10000 / (1 / n1 + 1 / n2)
      ncp_est_min <- 0
      ncp_est <- (ncp_est_max - ncp_est_min) / 2

      est_p <- pf(f_cal, p, (n1 + n2 - p - 1), lower.tail = TRUE, ncp = ncp_est)

      while (abs(est_p - upper_prob) > .00001) {
        if ((est_p - upper_prob) < 0) {
          ncp_est_max <- ncp_est
          ncp_est <- ncp_est_min + (ncp_est_max - ncp_est_min) / 2
        }
        else {
          ncp_est_min <- ncp_est
          ncp_est <- ncp_est_min + (ncp_est_max - ncp_est_min) / 2
        }
        est_p <- pf(f_cal, p, (n1 + n2 - p - 1), lower.tail = TRUE, ncp = ncp_est)
      }
      upper_bound <- sqrt(ncp_est * (1 / n1 + 1 / n2))
    }
    else upper_bound <- NA
  }

  return(list(lower_bound = lower_bound,
              upper_bound = upper_bound))

}

## small sample bias corrected Mahalanbois D ----

calc_bias_corrected_d_multivariate <- function(k, mahalanobis_d, n1, n2) {
  d <- (n1 + n2 - k - 3) / (n1 + n2 - 2) * mahalanobis_d^2 - k * (n1 + n2) / (n1 * n2)
  d <- ifelse(d > 0, d, 0)
  return(sqrt(d))
}

bias_corrected_d_multivariate <- function(x, INDEX) {
  k <- ncol(x)
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  data <- split(x, INDEX)
  n1 <- nrow(data[[1]])
  n2 <- nrow(data[[2]])
  return(calc_bias_corrected_d_multivariate(k, mahalanobis_d, n1, n2))
}

bias_corrected_d_multivariate_educational <- function(means, covariance_matrix, n1, n2) {
  k <- nrow(means)
  mahalanobis_d <- mahalanobis_d_educational(means, covariance_matrix)
  return(calc_bias_corrected_d_multivariate(k, mahalanobis_d, n1, n2))
}

## Multivariate OVL ----
calc_ovl_multivariate <- function(mahalanobis_d) {
  return(2 * pnorm(-mahalanobis_d / 2))
}

ovl_multivariate <- function(x, INDEX) {
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  calc_ovl_multivariate(mahalanobis_d)
}


ovl_multivariate_educational <- function(means, covariance_matrix) {
  mahalanobis_d <- mahalanobis_d_educational(means, covariance_matrix)
  return(calc_ovl_multivariate(mahalanobis_d))
}

## Multivariate OVL 2 ----

ovl_two_multivariate <- function(x, INDEX) {
  ovl <- ovl_multivariate(x, INDEX)
  return(ovl / (2 - ovl))
}

ovl_two_multivariate_educational <- function(means, covariance_matrix) {
  ovl <- ovl_multivariate_educational(means, covariance_matrix)
  return(ovl / (2 - ovl))
}

## Multivariate U1 ----

u1_multivariate <- function(x, INDEX) {
  ovl <- ovl_multivariate(x, INDEX)
  return(1 - ovl / (2 - ovl))
}

u1_multivariate_educational <- function(means, covariance_matrix) {
  ovl <- ovl_multivariate_educational(means, covariance_matrix)
  return(1 - ovl / (2 - ovl))
}

## Multivariate U3 ----

calc_u3_multivariate <- function(mahalanobis_d) {
  return(pnorm(mahalanobis_d))
}

u3_multivariate <- function(x, INDEX) {
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  return(calc_u3_multivariate(mahalanobis_d))
}

u3_multivariate_educational <- function(means, covariance_matrix) {
  mahalanobis_d <- mahalanobis_d_educational(means, covariance_matrix)
  return(calc_u3_multivariate(mahalanobis_d))
}

## Multivariate CLES ----

calc_common_lnaguage_multivariate <- function(mahalanobis_d) {
  return(pnorm(mahalanobis_d / sqrt(2)))
}

common_language_multivariate <- function(x, INDEX) {
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  return(calc_common_lnaguage_multivariate(mahalanobis_d))
}

common_language_multivariate_educational <- function(means, covariance_matrix) {
  mahalanobis_d <- mahalanobis_d_educational(means, covariance_matrix)
  return(calc_common_lnaguage_multivariate(mahalanobis_d))
}

## Multivariate PCC ----

calc_pcc_multivariate <- function(mahalanobis_d) {
  return(pnorm(mahalanobis_d / 2))
}

pcc_multivariate <- function(x, INDEX) {
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  return(calc_pcc_multivariate(mahalanobis_d))
}

pcc_multivariate_educational <- function(means, covariance_matrix) {
  mahalanobis_d <- mahalanobis_d_educational(means, covariance_matrix)
  return(calc_pcc_multivariate(mahalanobis_d))
}

## Multivariate VR ----

variance_ratio_multivariate <- function(x, INDEX, standardised_by_group_1 = TRUE) {
  data <- split(x, INDEX)
  cov_mat1 <- cov(data[[1]])
  cov_mat2 <- cov(data[[2]])
  num <- ifelse(standardised_by_group_1, det(cov_mat2), det(cov_mat1))
  denom <- ifelse(standardised_by_group_1, det(cov_mat1), det(cov_mat2))
  return(num/denom)
}

## Multivariate TR ----

calc_tail_ratio_multivariate <- function(mahalanobis_d, z) {
  return(pnorm(mahalanobis_d - z) / pnorm(-z))
}

tail_ratio_multivariate <- function(x, INDEX, z) {
  mahalanobis_d <- mahalanobis_d(x, INDEX)
  calc_tail_ratio_multivariate(mahalanobis_d, z)
}

tail_ratio_multivariate_educational <- function(means, covariance_matrix, z) {
  mahalanobis_d <- mahalanobis_d_educational(means, covariance_matrix)
  return(calc_tail_ratio_multivariate(mahalanobis_d, z))
}
