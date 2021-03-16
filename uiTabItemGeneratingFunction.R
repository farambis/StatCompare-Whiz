source('sidebarPanelModule.R')
source('mainPanel.R')

generalUI <- function (id, acceptedFormat, design, mode) {
  ns <- NS(id)
  
  pageWithSidebar(
    headerPanel = "",
    sidebarPanel = sidebarPanelUI(ns("sidebarPanel"), acceptedFormat, design, mode), 
    mainPanel = esMainPanel(ns("esMainPanel"))
  )
}