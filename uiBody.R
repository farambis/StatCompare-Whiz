source_body <- list.files(pattern = '^ti')
lapply(source_body, source)

body <- dashboardBody(
  tabItems(
    independentGroupsParametricUnivariateRawData,
    independentGroupsParametricMultivariateEducational,
    independentGroupsParametricUnivariateRawData,
    independentGroupsParametricMultivariateEducational,
    independentGroupsNonparametric, 
    dependentGroupsParametricRawData, 
    dependentGroupsParametricEducational, 
    dependentGroupsNonparametric, 
    mixedDesignParametricRawData,
    mixedDesignParametricEducational,
    mixedDesignNonParametric
  )
)