source('sidebarPanelModule.R')
source('mainPanel.R')

generalUI <- function (id, acceptedFormat, design, mode, esChoices, tsChoices) {
  ns <- NS(id)
  pageWithSidebar(
    headerPanel = "",
    sidebarPanel = sidebarPanelUI(ns("sidebarPanel"), acceptedFormat, design, mode),
    mainPanel = esMainPanel(ns("esMainPanel"), esChoices, tsChoices)
  )
}


generalServer <- function(id, design, mode) {
  moduleServer(id = id,
               function(input, output, session) {
                 sidebarPanelResult <-
                   sidebarPanelServer("sidebarPanel", design, mode)
                 MainPanelServer <-
                   esMainPanelServer(
                     "esMainPanel",
                     sidebarPanelResult$data,
                     sidebarPanelResult$inputDataIndex,
                     sidebarPanelResult$inputDataX
                   )
               })
}
