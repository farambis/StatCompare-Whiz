source("tabItems.R")

body <- dashboardBody(
  tabItems(
    homePageBody,
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
