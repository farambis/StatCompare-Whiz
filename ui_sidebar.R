source('ui_sidebar_items.R')
sidebar <- dashboardSidebar(sidebarMenu(id = "dashboard_sidebar", 
                                        independent_groups, 
                                        dependent_groups, 
                                        mixed_design))
