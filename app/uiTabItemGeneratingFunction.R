source('sidebarPanelModule.R')
source('mainPanel.R')

generalUI <- function(id, acceptedFormat, design, mode, esChoices, tsChoices, plotChoices, description) {
  ns <- NS(id)
  pageWithSidebar(
    headerPanel = "",
    sidebarPanel = sidebarPanelUI(ns("sidebarPanel"), acceptedFormat, design, mode),
    mainPanel = esMainPanel(ns("esMainPanel"), esChoices, tsChoices, plotChoices, description, mode, design)
  )
}


generalServer <- function(id, design, mode, assumption = "parametric") {
  moduleServer(id = id,
               function(input, output, session) {
                 sidebarPanelResult <-
                   sidebarPanelServer("sidebarPanel", design, mode)
                 if (design == "multivariate") {
                   if (mode == "rawData") {
                     esMainPanelMultivariateRawDataServer("esMainPanel", sidebarPanelResult$data, sidebarPanelResult$inputDataIndex, sidebarPanelResult$inputDataX)
                   } else {
                     esMainPanelMultivariateEducationalServer("esMainPanel", sidebarPanelResult$means, sidebarPanelResult$covarianceMatrix, sidebarPanelResult$n1, sidebarPanelResult$n2)
                   }
                 }else if (mode == "rawData") {
                   esMainPanelRawDataServer(
                     "esMainPanel",
                     assumption,
                     sidebarPanelResult$data,
                     sidebarPanelResult$inputDataIndex,
                     sidebarPanelResult$inputDataX,
                     sidebarPanelResult$inputDataY,
                     design
                   ) }
                 else {
                   esMainPanelEducationalServer(
                     "esMainPanel",
                     sidebarPanelResult$mean1,
                     sidebarPanelResult$standardDeviation1,
                     sidebarPanelResult$sampleSize1,
                     sidebarPanelResult$correlation1,
                     sidebarPanelResult$standardDeviationDiff1,
                     sidebarPanelResult$mean2,
                     sidebarPanelResult$standardDeviation2,
                     sidebarPanelResult$sampleSize2,
                     sidebarPanelResult$mean3,
                     sidebarPanelResult$standardDeviation3,
                     sidebarPanelResult$mean4,
                     sidebarPanelResult$standardDeviation4,
                     sidebarPanelResult$correlation2,
                     sidebarPanelResult$standardDeviationDiff2
                   ) }
               })
}
