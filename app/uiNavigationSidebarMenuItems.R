source('uiNavigationSidebarSubitems.R')

homePage <- menuItem(
  text = 'Home Page',
  tabName = 'homePage',
  icon = icon('home', lib = 'glyphicon')
)

independentGroups <-
  menuItem(
    text = 'Independent Groups',
    tabName = 'independentGroups',
    parametricSidebarItem(tabName = 'independentGroupsParametric'),
    nonparametricSidebarItem('independentGroupsNonparametric')
  )

dependentGroups <-
  menuItem(
    text = 'Dependent Groups',
    tabName = 'dependentGroups',
    parametricSidebarItem('dependentGroupsParametric'),
    nonparametricSidebarItem('dependentGroupsNonparametric')
  )

mixedDesign <-
  menuItem(
    text = 'Mixed Design',
    tabName = 'mixedDesign',
    parametricSidebarItem('mixedDesignParametric'),
    nonparametricSidebarItem('mixedDesignNonParametric')
  )

multivariateMeasures <-
  menuItem(
    text = 'Multivariate Measures',
    tabName = 'multivariate',
    menuItem(
      text = 'Raw Data',
      tabName = paste0('multivariate', 'RawData')
    ),
    menuItem(
      text = 'Aggregate Data',
      tabName = paste0('multivariate', 'Educational')
    )
  )