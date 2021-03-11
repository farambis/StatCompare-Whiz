source('sidebarPanel.R')
source('mainPanel.R')

generalUI <- function (id) {
  ns <- NS(id)
  
  pageWithSidebar(
    headerPanel = "",
    sidebarPanel = esSidebarPanel(ns("esSidebarPanel")), 
    mainPanel = esMainPanel(ns("esMainPanel"))
  )
}