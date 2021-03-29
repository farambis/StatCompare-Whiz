source('esAndTsModule.R')

esMainPanel <- function(id, esChoices, tsChoices) {
  ns <- NS(id)
  mainPanel(tabsetPanel(
    id = ns("mainPanel"),
    tabPanel(title = "Data", tableOutput(ns("dataTable"))),
    tabPanel(title = "Es & Teststatistic", esAndTsUi(ns("esAndTs"), esChoices, tsChoices)),
    tabPanel(title = "Plot", "Hello Plot")
  ))
}


esMainPanelRawDataServer <- function(id, dat, index, x, y, design) {
  moduleServer(id,
               function(input, output, session) {
                 output$dataTable <- renderTable({
                   req(dat())
                   dat()[1:10, ]
                 })
                 esAndTsRawDataServer("esAndTs", dat, index, x, y, design)
               })
}

esMainPanelEducationalServer <- function(id, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id, 
               function(input, output, session) {
                 output$dataTable <- renderTable({
                   # TODO add summaryStatisticList element which shows simulated dataset
                 })
                 esAndTsEducationalServer("esAndTs",  mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2)
               })
}

