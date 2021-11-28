source('uiTabItemGeneratingFunction.R')

# all_eff_sizes and all_test_statistics are defined in function_ready.R 

descriptions <- list(independent_parametric_univariate = "markdown/independent_parametric_univariate.md", independent_parametric_univariate = "markdown/independent_parametric_multivariate.md",
                     independent_nonparametric = "markdown/independent_nonparametric.md", dependent_parametric = "markdown/dependent_parametric.md",
                     dependent_nonparametric = "markdown/dependent_nonparametric.md", mixed_design_parametric = "markdown/mixed_design_parametric.md",
                     mixed_design_nonparametric = "markdown/mixed_design_nonparametric.md")

# independentGroups -------------------------------------------------------
independentGroupsParametricUnivariateRawData <-
  tabItem(
    tabName = 'independentGroupsParametricUnivariateRawData',
    generalUI(
      "independentGroupsParametricUnivariateRawData",
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
           all_eff_sizes$ovl_parametric,  
           all_eff_sizes$ovl2,
           all_eff_sizes$common_language, 
           all_eff_sizes$cohens_u1, 
           all_eff_sizes$cohens_u3,
           all_eff_sizes$variance_ratio,
           all_eff_sizes$parametric_tr),
      list(all_test_statistics$student_t_test, all_test_statistics$welch_t_test,
           all_test_statistics$yuen_t_test),
      list(all_plots$parametric_ovl,
           all_plots$cohens_u1,
           all_plots$cohens_u3, 
           all_plots$parametric_tr,
           all_plots$parametric_tr_zoom),
      descriptions$independent_parametric_univariate
    )
  )


independentGroupsParametricUnivariateEducational <-
  tabItem(tabName = 'independentGroupsParametricUnivariateEducational',
          generalUI(
            "independentGroupsParametricUnivariateEducational", 
            ".csv", 
            "indGrps", 
            "educational",
            list(all_eff_sizes$cohen_d, 
                 all_eff_sizes$hedges_g, 
                 all_eff_sizes$glass_d,
                 all_eff_sizes$glass_d_corr, 
                 all_eff_sizes$bonett_d, 
                 all_eff_sizes$bonett_d_corr, 
                 all_eff_sizes$ovl_parametric,
                 all_eff_sizes$variance_ratio,
                 all_eff_sizes$parametric_tr), 
            list(all_test_statistics$student_t_test, all_test_statistics$welch_t_test),
            list(all_plots$parametric_ovl,
                 all_plots$cohens_u1,
                 all_plots$cohens_u3, 
                 all_plots$parametric_tr,
                 all_plots$parametric_tr_zoom),
            descriptions$independent_parametric_univariate
          ))

independentGroupsParametricMultivariateRawData <-
  tabItem(tabName = 'independentGroupsParametricMultivariateRawData',
          'Hello independentGroupsParametricMultivariateRawData')

independentGroupsParametricMultivariateEducational <-
  tabItem(tabName = 'independentGroupsParametricMultivariateEducational',
          'Hello independentGroupsParametricMultivariateEducational')

independentGroupsNonparametric <-
  tabItem(tabName = 'independentGroupsNonparametric',
          generalUI(
            "independentGroupsNonparametric", 
            ".csv", 
            "indGrps", 
            "rawData",
            list(all_eff_sizes$mann_whitney_based_ps, 
                 all_eff_sizes$ovl_nonparametric, 
                 all_eff_sizes$generalized_odds_ratio, 
                 all_eff_sizes$non_parametric_ovl2,
                 all_eff_sizes$non_parametric_tr, 
                 all_eff_sizes$non_parametric_u3),
            list(all_test_statistics$mann_whitney),
            list(all_plots$non_parametric_ovl, 
                 all_plots$non_parametric_u1, 
                 all_plots$non_parametric_u3, 
                 all_plots$non_parametric_tr, 
                 all_plots$non_parametric_tr_zoom),
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
                 all_eff_sizes$cohens_dz,
                 all_eff_sizes$hedges_gz,
                 all_eff_sizes$glass_d_dependent,
                 all_eff_sizes$glass_d_corr_dependent,
                 all_eff_sizes$common_language_es_dependent,
                 all_eff_sizes$ovl_parametric_dependent,
                 all_eff_sizes$ovl_two_parametric_dependent,
                 all_eff_sizes$cohens_coefficient_of_nonoverlap_u1_parametric_dependent,
                 all_eff_sizes$cohens_coefficient_of_nonoverlap_u2_parametric_dependent,
                 all_eff_sizes$cohens_coefficient_of_nonoverlap_u3_parametric_dependent,
                 all_eff_sizes$variance_ratio_dependent,
                 all_eff_sizes$parametric_tail_ratio_dependent,
                 all_eff_sizes$robust_cohens_dz,
                 all_eff_sizes$robust_cohens_d_dependent,
                 all_eff_sizes$robust_glass_d_dependent,
                 all_eff_sizes$ps_dependent, 
                 all_eff_sizes$generalized_odds_ratio_dependent),
            list(all_test_statistics$dependent_student_t_test,
                 all_test_statistics$tukey_mclaughlin_t_test,
                 all_test_statistics$dependent_yuen_t_test),
            list(all_plots$parametric_ovl,
                 all_plots$cohens_u1,
                 all_plots$cohens_u3, 
                 all_plots$parametric_tr,
                 all_plots$parametric_tr_zoom),
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
               all_eff_sizes$ovl_parametric_dependent,
               all_eff_sizes$ovl_two_parametric_dependent,
               all_eff_sizes$cohens_coefficient_of_nonoverlap_u1_parametric_dependent,
               all_eff_sizes$cohens_coefficient_of_nonoverlap_u2_parametric_dependent,
               all_eff_sizes$cohens_coefficient_of_nonoverlap_u3_parametric_dependent,
               all_eff_sizes$variance_ratio_dependent,
               all_eff_sizes$parametric_tail_ratio_dependent), 
          list(all_test_statistics$dependent_student_t_test),
          list(all_plots$parametric_ovl,
               all_plots$cohens_u1,
               all_plots$cohens_u3, 
               all_plots$parametric_tr,
               all_plots$parametric_tr_zoom),
          descriptions$dependent_parametric
          ))

dependentGroupsNonparametric <-
  tabItem(tabName = 'dependentGroupsNonparametric', 
          generalUI(
            "dependentGroupsNonparametric",
            ".csv", 
            "depGrps", 
            "rawData",
            list(all_eff_sizes$ps_dependent, all_eff_sizes$generalized_odds_ratio_dependent), 
            list(all_test_statistics$mann_whitney_dependent,
                 all_test_statistics$wilcoxon_signed_rank_test),
            list(all_plots$non_parametric_ovl, all_plots$non_parametric_u1, all_plots$cohens_u3, all_plots$non_parametric_tr, all_plots$non_parametric_tr_zoom),
            descriptions$dependent_nonparametric
          ))



# mixed Design ------------------------------------------------------------

mixedDesignParametricRawData <-
  tabItem(tabName = 'mixedDesignParametricRawData', 'Hello mixedDesignParametricRawData')

mixedDesignParametricEducational <-
  tabItem(tabName = 'mixedDesignParametricEducational', 'Hello mixedDesignParametricEducational')

mixedDesignNonParametric <-
  tabItem(tabName = 'mixedDesignNonParametric', 'Hello mixedDesignNonParametric')
