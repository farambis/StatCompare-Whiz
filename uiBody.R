source("tabItems.R")

body <- dashboardBody(
  includeCSS('www/custom.css'),
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
    multivariateEducational,
    changelogBody
  ),
  tags$div(id = "back-to-top", class = "back-to-top", icon("arrow-up")),
  includeScript('www/custom.js')
)
