source('uiTabItemGeneratingFunction.R')

# independentGroups -------------------------------------------------------

# all_eff_sizes and all_test_statistics is defined in function_ready.R 
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
           all_eff_sizes$AKP_eqvar, all_eff_sizes$AKP_uneqvar,all_eff_sizes$ovl_parametric), 
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
  tabItem(tabName = 'independentGroupsNonparametric', 'Hello independentGroupsNonparametric')


# dependent Groups --------------------------------------------------------


dependentGroupsParametricRawData <-
  tabItem(tabName = 'dependentGroupsParametricRawData', 'Hello dependentGroupsParametricRawData')

dependentGroupsParametricEducational <-
  tabItem(tabName = 'dependentGroupsParametricEducational', 'Hello dependentGroupsParametricEducational')

dependentGroupsNonparametric <-
  tabItem(tabName = 'dependentGroupsNonparametric', 
          generalUI(
            "dependentGroupsNonparametric",
            ".csv", 
            "depGrps", 
            "rawData",
            list(all_eff_sizes$ps_dependent), 
            list()
          ))



# mixed Design ------------------------------------------------------------

mixedDesignParametricRawData <-
  tabItem(tabName = 'mixedDesignParametricRawData', 'Hello mixedDesignParametricRawData')

mixedDesignParametricEducational <-
  tabItem(tabName = 'mixedDesignParametricEducational', 'Hello mixedDesignParametricEducational')

mixedDesignNonParametric <-
  tabItem(tabName = 'mixedDesignNonParametric', 'Hello mixedDesignNonParametric')
