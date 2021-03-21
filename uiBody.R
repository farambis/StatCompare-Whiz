source("tabItems.R")

body <- dashboardBody(
  tabItems(
    independentGroupsParametricUnivariateRawData,
    independentGroupsParametricUnivariateEducational,
    independentGroupsParametricMultivariateRawData,
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