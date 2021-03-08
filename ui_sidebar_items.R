source('ui_sidebar_subitems.R')

independent_groups <- menuItem(text = 'Independent Groups', tabName = 'independentGroups',
                               parametric_sidebar_item(tabName = 'independentGroupsParametric', advanced = TRUE),
                               nonparametric_sidebar_item('independentGroupsNonparametric'))

dependent_groups <- menuItem(text = 'Dependent Groups', tabName = 'dependentGroups',
                             parametric_sidebar_item('dependentGroupsParametric'),
                             nonparametric_sidebar_item('dependentGroupsNonparametric'))

mixed_design <- menuItem(text = 'Mixed Design', tabName = 'mixedDesign',
                         parametric_sidebar_item('mixedDesignParametric'),
                         nonparametric_sidebar_item('mixedDesignNonParametric'))
