source_body <- list.files(pattern = '^ti_')
lapply(source_body, source)

body <- dashboardBody(
  tabItems(
    independentGroupsParametricUnivariate,
    independentGroupsParametricMultivariate,
    independentGroupsNonparametric, 
    dependentGroupsParametric, 
    dependentGroupsNonparametric, 
    mixedDesignParametric, 
    mixedDesignNonParametric
  )
)