all_eff_sizes_displayed <- list(
  # Effect sizes for independent groups:
  cohen_d = html("Cohen's <em>d</em>"),
  hedges_g = html("Hedges' <em>g</em>"),
  glass_d = html("Glass' <em>d<sub>G</sub></em>"),
  glass_d_corr = html("Hedges' <em>g<sub>G</sub></em>"),
  bonett_d = html("Cohen's <em>d'</em>"),
  bonett_d_corr = html("Hedges' <em>d'</em>"),
  AKP_eqvar = html("robust Cohen's <em>d</em>"),
  AKP_uneqvar = html("robust Glass' <em>d<sub>G</sub></em>"),
  mann_whitney_based_ps = html("Probability of Superiority (<em>PS</em>)"),
  mann_whitney_based_ps_ignore_ties = html("Probability of Superiority (<em>PS</em>) (ties ignored)"),
  parametric_ovl = html("<em>OVL</em>"),
  ps_dependent = html("Probability of Superioirty (<em>PS</em>)"),
  ps_dependent_ignore_ties = html("Probability of Superiority (<em>PS</em>) (ties ignored)"),
  non_parametric_ovl = html("non-parametric <em>OVL</em>"),
  generalized_odds_ratio = html("Generalized <em>OR</em>"),
  generalized_odds_ratio_dependent = html("Generalized <em>OR</em>"),
  common_language = html("Common Language (<em>CL</em>)"),
  non_parametric_ovl_two = html("non-parametric <em>OVL<sub>2</sub></em>"),
  parametric_ovl_two = html("<em>OVL<sub>2</sub></em>"),
  standardized_median_difference_mad = html("difference in medians standardised by <em>MAD</em>"),
  standardized_median_difference_riq = html("difference in medians standardised by <em>RIQ</em>"),
  standardized_median_difference_biweight = html("difference in medians standardised by biweight <em>SD</em>"),
  parametric_cohens_u1 = html("Cohen's <em>U1</em>"),
  parametric_cohens_u2 = html("Cohen's <em>U2</em>"),
  parametric_cohens_u3 = html("Cohen's <em>U3</em>"),
  non_parametric_cohens_u1 = html("non-parametric Cohen's <em>U1</em>"),
  variance_ratio = html("Variance Ratio (<em>VR</em>)"),
  non_parametric_variance_ratio = html("non-parametric Variance Ratio"),
  tail_ratio = html("Tail Ratio (<em>TR</em>)"),
  non_parametric_tail_ratio = html("non-parametric Tail Ratio"),
  non_parametric_cohens_u3 = html("non-parametric Cohen's <em>U3</em>"),
  non_parametric_glass_d = html("non-parametric Glass' <em>d</em>"),
  dominance_measure = html("Dominance Measure (<em>DM</em>)"),
  #Effect sizes for dependent groups:
  cohens_d_dependent = html("Cohen's <em>d</em>"),
  hedges_g_dependent = html("Hedges' <em>g</em>"),
  cohens_drm = html("Cohen's <em>d<sub>RM</sub></em>"),
  hedges_grm = html("Hedges' <em>g<sub>RM</sub></em>"),
  bonett_d_dependent = html("Cohen's <em>d'</em>"),
  cohens_dz = html("Cohen's <em>d<sub>z</sub></em>"),
  hedges_gz = html("Hedges' <em>g<sub>z</sub></em>"),
  glass_d_dependent = html("Glass' <em>d<sub>G</sub></em>"),
  glass_d_corr_dependent = html("Heges' <em>g<sub>G</sub></em>"),
  common_language_es_dependent = html("Common Language (<em>CL</em>)"),
  parametric_ovl_dependent = html("<em>OVL</em>"),
  parametric_ovl_two_dependent = html("<em>OVL<sub>2</sub></em>"),
  parametric_cohens_u1_dependent = html("Cohen's <em>U1</em>"),
  parametric_cohens_u2_dependent = html("Cohen's <em>U2</em>"),
  parametric_cohens_u3_dependent = html("Cohen's <em>U3</em>"),
  variance_ratio_dependent = html("Variance Ratio (<em>VR</em>)"),
  non_parametric_variance_ratio_dependent = html("non-parametric Variance Ratio"),
  tail_ratio_dependent = html("Tail Ratio (<em>TR</em>)"),
  robust_cohens_dz = html("robust Cohen's <em>d<sub>z</sub></em>"),
  robust_cohens_d_dependent = html("robust Cohen's <em>d</em>"),
  robust_glass_d_dependent = html("robust Glass' <em>d<sub>G</sub></em>"),
  non_parametric_tail_ratio_dependent = html("non-parametric Tail Ratio"),
  standardized_median_difference_biweight_dependent = html("difference in medians standardised by biweight <em>SD</em>"),
  standardized_median_difference_mad_dependent = html("difference in medians standardised by <em>MAD</em>"),
  standardized_median_difference_riq_dependent = html("difference in medians standardised by <em>RIQ</em>"),
  non_parametric_ovl_dependent = html("non-parametric <em>OVL</em>"),
  non_parametric_cohens_u1_dependent = html("non-parametric Cohen's <em>U1</em>"),
  non_parametric_cohens_u3_dependent = html("non-parametric Cohen's <em>U3</em>"),
  non_parametric_ovl_two = html("non-parametric <em>OVL<sub>2</sub></em>"),
  non_parametric_glass_d_dependent = html("non-parametric Glass' <em>d<sub>G</sub></em>"),
  dominance_measure_dependent = html("Dominance Measure (<em>DM</em>)"),
  non_parametric_cohens_dz_dependent = html("non-parametric Cohen's <em>d<sub>z</sub></em>"),
  non_parametric_ovl_two_dependent = html("non-parametric <em>OVL<sub>2</sub></em>"),
  # Effect sizes for the pretest-posttest-control design
  d_PPC_change = html("<em>d<sub>PPC-Change</sub></em>"),
  g_PPC_change = html("<em>g<sub>PPC-Change</sub></em>"),
  d_PPC_pre = html("<em>d<sub>PPC, pre</sub></em>"),
  g_PPC_pre = html("<em>g<sub>PPC, pre</sub></em>"),
  d_PPC_pooled_pre = html("<em>d<sub>PPC, pooled-pre</sub></em>"),
  g_PPC_pooled_pre = html("<em>g<sub>PPC, pooled-pre</sub></em>"),
  d_PPC_pooled_pre_post = html("<em>d<sub>PPC, pooled-pre-post</sub></em>"),
  g_PPC_pooled_pre_post = html("<em>g<sub>PPC, pooled-pre-post</sub></em>"),
  non_parametric_d_PPC_pre = html("non-parametric <em>d<sub>PPC, pre</sub></em>"),
  non_parametric_d_PPC_pre_alternative = html("non-parametric <em>d<sub>PPC, pre, alternative</sub></em>"),
  non_parametric_d_PPC_change = html("non-parametric <em>d<sub>PPC-Change</sub></em>"),
  non_parametric_dominance_measure_mixed = html("non-parametric Dominance Measure"),
  # Effect sizes for multivariate design
  mahalanobis_d = html("Mahalanobis <em>d</em>"),
  bias_corrected_d_multivariate = html("bias-corrected Mahalanobis <em>d</em>"),
  ovl_multivariate = html("<em>OVL</em>"),
  pcc_multivariate = html("Probability of Correct Classification <em>PCC</em>"),
  ovl_two_multivariate = html("<em>OVL<sub>2</sub></em>"),
  u1_multivariate = html("Cohen's <em>U1</em>"),
  u3_multivariate = html("Cohen's <em>U3</em>"),
  common_language_multivariate = html("Common Language (<em>CL</em>)"),
  tail_ratio_multivariate = html("Tail Ratio (<em>TR</em>)"),
  student_t_test = html("Student <em>t</em>-test"),
  dependent_student_t_test = html("dependent Student <em>t</em>-test"),
  welch_t_test = html("Welch <em>t</em>-test"),
  yuen_t_test = html("Yuen <em>t</em>-test"),
  dependent_yuen_t_test = html("dependent Yuen <em>t</em>-test"),
  tukey_mclaughlin_t_test = html("Tukey Mclaughlin <em>t</em>-test"),
  mann_whitney = html("Mann Whitney <em>U</em>-Test"),
  mann_whitney_dependent = html("Mann Whitney dependent"),
  wilcoxon_signed_rank_test = html("Wilcoxon signed-rank-test")
)

map_choice_names <- function(choices) {
  mySpecialList <- lapply(choices, FUN = function(choice) {
    all_eff_sizes_displayed[[choice]]
  })
  return (mySpecialList)
}

map_from_displayed_to_written_names <- function(choices) {
  written_names <- gsub(pattern = "(</?em>)|(</sub>)", replacement = "", x = unname(unlist(map_choice_names(choices))))
  written_names <- gsub(pattern = ", ", replacement = "-", x = written_names)
  written_names <- gsub(pattern = "<sub>", replacement = "_", x = written_names)
  return(written_names)
}

checkboxGroupUi <- function(id, choices, label) {
  ns <- NS(id)
  choiceNames <- map_choice_names(choices)
  checkboxGroupInput(
    inputId = ns("checkboxes"),
    label = label,
    choiceValues = choices,
    choiceNames = choiceNames
  )
}

checkboxGroupServer <- function(id) {
  moduleServer(id,
               function(input, output, session) {
                 selectedBoxes <- reactive({
                   req(input$checkboxes)
                 })
                 return (selectedBoxes)
               })
}
