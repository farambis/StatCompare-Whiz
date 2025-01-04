source('uiNavigationSidebarMenuItems.R')

navigationSidebar <-
  dashboardSidebar(
    sidebarMenu(
      id = "dashboardSidebar",
      homePage,
      independentGroups,
      dependentGroups,
      mixedDesign,
      multivariateMeasures,
      changelog
    )
  )
