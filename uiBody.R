source("tabItems.R")

body <- dashboardBody(
  tabItems(
    independentGroupsParametricRawData,
    independentGroupsParametricEducational,
    independentGroupsNonparametric, 
    dependentGroupsParametricRawData, 
    dependentGroupsParametricEducational, 
    dependentGroupsNonparametric, 
    mixedDesignParametricRawData,
    mixedDesignParametricEducational,
    mixedDesignNonParametric,
    multivariateRawData,
    multivariateEducational
  )
)
