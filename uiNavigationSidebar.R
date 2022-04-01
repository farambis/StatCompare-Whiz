source('uiNavigationSidebarMenuItems.R')
navigationSidebar <- dashboardSidebar(sidebarMenu(id = "dashboardSidebar", 
                                        independentGroups, 
                                        dependentGroups, 
                                        mixedDesign,
                                        multivariateMeasures))
