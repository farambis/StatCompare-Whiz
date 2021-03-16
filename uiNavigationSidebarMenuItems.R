source('uiNavigationSidebarSubitems.R')

independentGroups <- menuItem(text = 'Independent Groups', tabName = 'independentGroups',
                               parametricSidebarItem(tabName = 'independentGroupsParametric', advanced = TRUE),
                               nonparametricSidebarItem('independentGroupsNonparametric'))

dependentGroups <- menuItem(text = 'Dependent Groups', tabName = 'dependentGroups',
                             parametricSidebarItem('dependentGroupsParametric'),
                             nonparametricSidebarItem('dependentGroupsNonparametric'))

mixedDesign <- menuItem(text = 'Mixed Design', tabName = 'mixedDesign',
                         parametricSidebarItem('mixedDesignParametric'),
                         nonparametricSidebarItem('mixedDesignNonParametric'))
