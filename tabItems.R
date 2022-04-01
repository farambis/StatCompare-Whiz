source('uiTabItemGeneratingFunction.R')

# all_eff_sizes and all_test_statistics are defined in function_ready.R 

descriptions <- list(independent_parametric = "markdown/independent_parametric.md", independent_parametric = "markdown/multivariate.md",
                     independent_nonparametric = "markdown/independent_nonparametric.md", dependent_parametric = "markdown/dependent_parametric.md",
                     dependent_nonparametric = "markdown/dependent_nonparametric.md", mixed_design_parametric = "markdown/mixed_design_parametric.md",
                     mixed_design_nonparametric = "markdown/mixed_design_nonparametric.md", multivariate_measures = "markdown/multivariate.md")

# independentGroups -------------------------------------------------------
independentGroupsParametricRawData <-
  tabItem(
    tabName = 'independentGroupsParametricRawData',
    generalUI(
      "independentGroupsParametricRawData",
      ".csv",
      "indGrps",
      "rawData",
      list(all_eff_sizes$cohen_d,
           all_eff_sizes$hedges_g,
           all_eff_sizes$glass_d,
           all_eff_sizes$glass_d_corr,
           all_eff_sizes$bonett_d,
           all_eff_sizes$bonett_d_corr,
           all_eff_sizes$AKP_eqvar,
           all_eff_sizes$AKP_uneqvar,
           all_eff_sizes$parametric_ovl,
           all_eff_sizes$parametric_ovl_two,
           all_eff_sizes$common_language,
           all_eff_sizes$parametric_cohens_u1,
           all_eff_sizes$parametric_cohens_u2,
           all_eff_sizes$parametric_cohens_u3,
           all_eff_sizes$variance_ratio,
           all_eff_sizes$tail_ratio),
      list(all_test_statistics$student_t_test,
           all_test_statistics$welch_t_test,
           all_test_statistics$yuen_t_test),
      list(all_plots$parametric_ovl,
           all_plots$parametric_cohens_u1,
           all_plots$parametric_cohens_u3,
           all_plots$tail_ratio,
           all_plots$tail_ratio_zoom),
      descriptions$independent_parametric
    )
  )


independentGroupsParametricEducational <-
  tabItem(tabName = 'independentGroupsParametricEducational',
          generalUI(
            "independentGroupsParametricEducational",
            ".csv",
            "indGrps",
            "educational",
            list(all_eff_sizes$cohen_d,
                 all_eff_sizes$hedges_g,
                 all_eff_sizes$glass_d,
                 all_eff_sizes$glass_d_corr,
                 all_eff_sizes$bonett_d,
                 all_eff_sizes$bonett_d_corr,
                 all_eff_sizes$parametric_ovl,
                 all_eff_sizes$parametric_ovl_two,
                 all_eff_sizes$parametric_cohens_u1,
                 all_eff_sizes$parametric_cohens_u2,
                 all_eff_sizes$parametric_cohens_u3,
                 all_eff_sizes$variance_ratio,
                 all_eff_sizes$tail_ratio,
                 all_eff_sizes$common_language),
            list(all_test_statistics$student_t_test,
                 all_test_statistics$welch_t_test),
            list(all_plots$parametric_ovl,
                 all_plots$parametric_cohens_u1,
                 all_plots$parametric_cohens_u3,
                 all_plots$tail_ratio,
                 all_plots$tail_ratio_zoom),
            descriptions$independent_parametric
          ))

independentGroupsNonparametric <-
  tabItem(tabName = 'independentGroupsNonparametric',
          generalUI(
            "independentGroupsNonparametric",
            ".csv",
            "indGrps",
            "rawData",
            list(all_eff_sizes$mann_whitney_based_ps,
                 all_eff_sizes$mann_whitney_based_ps_ignore_ties,
                 all_eff_sizes$non_parametric_ovl,
                 all_eff_sizes$generalized_odds_ratio,
                 all_eff_sizes$non_parametric_ovl_two,
                 all_eff_sizes$non_parametric_variance_ratio,
                 all_eff_sizes$non_parametric_tail_ratio,
                 all_eff_sizes$non_parametric_cohens_u1,
                 all_eff_sizes$non_parametric_cohens_u3,
                 all_eff_sizes$standardized_median_difference_mad,
                 all_eff_sizes$standardized_median_difference_riq,
                 all_eff_sizes$standardized_median_difference_biweight,
                 all_eff_sizes$non_parametric_glass_d,
                 all_eff_sizes$dominance_measure

            ),
            list(all_test_statistics$mann_whitney),
            list(all_plots$non_parametric_ovl,
                 all_plots$non_parametric_cohens_u1,
                 all_plots$non_parametric_cohens_u3,
                 all_plots$non_parametric_tail_ratio,
                 all_plots$non_parametric_tail_ratio_zoom),
            descriptions$independent_nonparametric
          ))


# dependent Groups --------------------------------------------------------


dependentGroupsParametricRawData <-
  tabItem(tabName = 'dependentGroupsParametricRawData',
          generalUI(
            "dependentGroupsParametricRawData",
            ".csv",
            "depGrps",
            "rawData",
            list(all_eff_sizes$cohens_d_dependent,
                 all_eff_sizes$hedges_g_dependent,
                 all_eff_sizes$cohens_drm,
                 all_eff_sizes$hedges_grm,
                 all_eff_sizes$bonett_d_dependent,
                 all_eff_sizes$standardized_median_difference_mad_dependent,
                 all_eff_sizes$standardized_median_difference_riq_dependent,
                 all_eff_sizes$standardized_median_difference_biweight_dependent,
                 all_eff_sizes$cohens_dz,
                 all_eff_sizes$hedges_gz,
                 all_eff_sizes$glass_d_dependent,
                 all_eff_sizes$glass_d_corr_dependent,
                 all_eff_sizes$common_language_es_dependent,
                 all_eff_sizes$parametric_ovl_dependent,
                 all_eff_sizes$parametric_ovl_two_dependent,
                 all_eff_sizes$parametric_cohens_u1_dependent,
                 all_eff_sizes$parametric_cohens_u2_dependent,
                 all_eff_sizes$parametric_cohens_u3_dependent,
                 all_eff_sizes$variance_ratio_dependent,
                 all_eff_sizes$tail_ratio_dependent,
                 all_eff_sizes$robust_cohens_dz,
                 all_eff_sizes$robust_cohens_d_dependent,
                 all_eff_sizes$robust_glass_d_dependent,
                 all_eff_sizes$ps_dependent,
                 all_eff_sizes$ps_dependent_ignore_ties
            ),
            list(all_test_statistics$dependent_student_t_test,
                 all_test_statistics$tukey_mclaughlin_t_test,
                 all_test_statistics$dependent_yuen_t_test),
            list(all_plots$parametric_ovl,
                 all_plots$parametric_cohens_u1,
                 all_plots$parametric_cohens_u3,
                 all_plots$tail_ratio,
                 all_plots$tail_ratio_zoom),
            descriptions$dependent_parametric
          ))

dependentGroupsParametricEducational <-
  tabItem(tabName = 'dependentGroupsParametricEducational',
          generalUI("dependentGroupsParametricEducational",
                    ".csv",
                    "depGrps",
                    "educational",
                    list(all_eff_sizes$cohens_d_dependent,
                         all_eff_sizes$hedges_g_dependent,
                         all_eff_sizes$cohens_drm,
                         all_eff_sizes$hedges_grm,
                         all_eff_sizes$bonett_d_dependent,
                         all_eff_sizes$cohens_dz,
                         all_eff_sizes$hedges_gz,
                         all_eff_sizes$glass_d_dependent,
                         all_eff_sizes$glass_d_corr_dependent,
                         all_eff_sizes$common_language_es_dependent,
                         all_eff_sizes$parametric_ovl_dependent,
                         all_eff_sizes$parametric_ovl_two_dependent,
                         all_eff_sizes$parametric_cohens_u1_dependent,
                         all_eff_sizes$parametric_cohens_u2_dependent,
                         all_eff_sizes$parametric_cohens_u3_dependent,
                         all_eff_sizes$variance_ratio_dependent,
                         all_eff_sizes$tail_ratio_dependent),
                    list(all_test_statistics$dependent_student_t_test),
                    list(all_plots$parametric_ovl,
                         all_plots$parametric_cohens_u1,
                         all_plots$parametric_cohens_u3,
                         all_plots$tail_ratio,
                         all_plots$tail_ratio_zoom),
                    descriptions$dependent_parametric
          ))

dependentGroupsNonparametric <-
  tabItem(tabName = 'dependentGroupsNonparametric',
          generalUI(
            "dependentGroupsNonparametric",
            ".csv",
            "depGrps",
            "rawData",
            list(all_eff_sizes$ps_dependent,
                 all_eff_sizes$ps_dependent_ignore_ties,
                 all_eff_sizes$standardized_median_difference_mad_dependent,
                 all_eff_sizes$standardized_median_difference_riq_dependent,
                 all_eff_sizes$standardized_median_difference_biweight_dependent,
                 all_eff_sizes$non_parametric_ovl_dependent,
                 all_eff_sizes$generalized_odds_ratio_dependent,
                 all_eff_sizes$non_parametric_cohens_u1_dependent,
                 all_eff_sizes$non_parametric_cohens_u3_dependent,
                 all_eff_sizes$non_parametric_variance_ratio_dependent,
                 all_eff_sizes$non_parametric_tail_ratio_dependent,
                 all_eff_sizes$non_parametric_glass_d_dependent,
                 all_eff_sizes$dominance_measure_dependent,
                 all_eff_sizes$non_parametric_cohens_dz_dependent,
                 all_eff_sizes$non_parametric_ovl_two_dependent
            ),
            list(all_test_statistics$mann_whitney_dependent,
                 all_test_statistics$wilcoxon_signed_rank_test),
            list(all_plots$non_parametric_ovl,
                 all_plots$non_parametric_cohens_u1,
                 all_plots$non_parametric_cohens_u3,
                 all_plots$non_parametric_tail_ratio,
                 all_plots$non_parametric_tail_ratio_zoom),
            descriptions$dependent_nonparametric
          ))


# mixed Design ------------------------------------------------------------

mixedDesignParametricRawData <-
  tabItem(tabName = 'mixedDesignParametricRawData',
          generalUI(
            id = 'mixedDesignParametricRawData',
            acceptedFormat = ".csv",
            design = "mixed",
            mode = "rawData",
            esChoices =
              list(all_eff_sizes$d_PPC_change,
                   all_eff_sizes$g_PPC_change,
                   all_eff_sizes$g_PPC_pre,
                   all_eff_sizes$g_PPC_pre,
                   all_eff_sizes$d_PPC_pooled_pre,
                   all_eff_sizes$g_PPC_pooled_pre,
                   all_eff_sizes$d_PPC_pooled_pre_post,
                   all_eff_sizes$g_PPC_pooled_pre_post),
            tsChoices =
              list(),
            plotChoices =
              list(all_plots$parametric_PPC_change,
                   all_plots$parametric_PPC_difference,
                   all_plots$parametric_PPC_interaction),
            description = descriptions$mixed_design_parametric
          ))

mixedDesignParametricEducational <-
  tabItem(tabName = 'mixedDesignParametricEducational',
          generalUI(
            id = 'mixedDesignParametricEducational',
            design = "mixed",
            mode = "educational",
            esChoices =
              list(all_eff_sizes$d_PPC_change,
                   all_eff_sizes$g_PPC_change,
                   all_eff_sizes$d_PPC_pre,
                   all_eff_sizes$g_PPC_pre,
                   all_eff_sizes$d_PPC_pooled_pre,
                   all_eff_sizes$g_PPC_pooled_pre,
                   all_eff_sizes$d_PPC_pooled_pre_post,
                   all_eff_sizes$g_PPC_pooled_pre_post),
            tsChoices =
              list(),
            plotChoices =
              list(all_plots$parametric_PPC_change,
                   all_plots$parametric_PPC_difference,
                   all_plots$parametric_PPC_interaction),
            description = descriptions$mixed_design_parametric
          ))

mixedDesignNonParametric <-
  tabItem(tabName = 'mixedDesignNonParametric',
          generalUI(
            id = 'mixedDesignNonParametric',
            acceptedFormat = ".csv",
            design = "mixed",
            mode = "rawData",
            esChoices =
              list(),
            tsChoices =
              list(),
            plotChoices =
              list(),
            description = descriptions$mixed_design_nonparametric
          ))

multivariateRawData <-
  tabItem(tabName = 'multivariateRawData',
          generalUI(
            id = 'multivariateRawData',
            acceptedFormat = ".csv",
            design = "multivariate",
            mode = "rawData",
            esChoices = list(),
            tsChoices = list(),
            plotChoices = list(),
            description = descriptions$multivariate_measures
          )
  )

multivariateEducational <- tabItem(tabName = 'multivariateEducational',
                                   generalUI(
                                     id = 'multivariateEducational',
                                     acceptedFormat = ".csv",
                                     design = "multivariate",
                                     mode = "rawData",
                                     esChoices = list(),
                                     tsChoices = list(),
                                     plotChoices = list(),
                                     description = descriptions$multivariate_measures
                                   )
)

