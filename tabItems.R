source('uiTabItemGeneratingFunction.R')

# all_eff_sizes and all_test_statistics are defined in function_ready.R 

# independentGroups -------------------------------------------------------
independentGroupsParametricUnivariateRawData <-
  tabItem(
    tabName = 'independentGroupsParametricUnivariateRawData',
    generalUI(
      "independentGroupsParametricUnivariateRawData",
      ".csv",
      "indGrps",
      "rawData",
      list(all_eff_sizes$cohen_d, all_eff_sizes$hedges_g, all_eff_sizes$glass_d,
           all_eff_sizes$glass_d_corr, all_eff_sizes$bonett_d, all_eff_sizes$bonett_d_corr,
           all_eff_sizes$AKP_eqvar, all_eff_sizes$AKP_uneqvar,all_eff_sizes$ovl_parametric, all_eff_sizes$common_language), 
      list(all_test_statistics$student_t_test, all_test_statistics$welch_t_test,
           all_test_statistics$yuen_t_test)
    )
  )


independentGroupsParametricUnivariateEducational <-
  tabItem(tabName = 'independentGroupsParametricUnivariateEducational',
          generalUI(
            "independentGroupsParametricUnivariateEducational", 
            ".csv", 
            "indGrps", 
            "educational",
            list(all_eff_sizes$cohen_d, all_eff_sizes$hedges_g, all_eff_sizes$glass_d,
                 all_eff_sizes$glass_d_corr, all_eff_sizes$bonett_d, all_eff_sizes$bonett_d_corr, 
                 all_eff_sizes$ovl_parametric), 
            list(all_test_statistics$student_t_test, all_test_statistics$welch_t_test)
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
            list(all_eff_sizes$mann_whitney_based_ps, all_eff_sizes$ovl_nonparametric, all_eff_sizes$generalized_odds_ratio), 
            list(all_test_statistics$mann_whitney)
          ))


# dependent Groups --------------------------------------------------------


dependentGroupsParametricRawData <-
  tabItem(tabName = 'dependentGroupsParametricRawData',
          generalUI(
            "dependentGroupsParametricRawData", 
            ".csv", 
            "indGrps", 
            "rawData", 
            list(), 
            list()
          ))

dependentGroupsParametricEducational <-
  tabItem(tabName = 'dependentGroupsParametricEducational',
          generalUI("dependentGroupsParametricEducational", 
          ".csv", 
          "depGrps", 
          "educational", 
          list(), 
          list()
          ))

dependentGroupsNonparametric <-
  tabItem(tabName = 'dependentGroupsNonparametric', 
          generalUI(
            "dependentGroupsNonparametric",
            ".csv", 
            "depGrps", 
            "rawData",
            list(all_eff_sizes$ps_dependent, all_eff_sizes$generalized_odds_ratio_dependent), 
            list(all_test_statistics$mann_whitney_dependent)
          ))



# mixed Design ------------------------------------------------------------

mixedDesignParametricRawData <-
  tabItem(tabName = 'mixedDesignParametricRawData', 'Hello mixedDesignParametricRawData')

mixedDesignParametricEducational <-
  tabItem(tabName = 'mixedDesignParametricEducational', 'Hello mixedDesignParametricEducational')

mixedDesignNonParametric <-
  tabItem(tabName = 'mixedDesignNonParametric', 'Hello mixedDesignNonParametric')
