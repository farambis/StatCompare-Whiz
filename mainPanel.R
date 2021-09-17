source('esAndTsModule.R')
source('plotModule.R')

esMainPanel <- function(id, esChoices, tsChoices, plotChoices, description) {
  ns <- NS(id)
  mainPanel(tabsetPanel(
    id = ns("mainPanel"),
    tabPanel(title = "Data", tableOutput(ns("dataTable"))),
    tabPanel(title = "Es & Teststatistic", esAndTsUi(ns("esAndTs"), esChoices, tsChoices)),
    tabPanel(title = "Plot", plotUi(ns("plotting"), plotChoices = plotChoices)),
    tabPanel(title = icon("info-circle"), includeMarkdown(description))
 
  ))
}


esMainPanelRawDataServer <- function(id, assumption, dat, index, x, y) {
  moduleServer(id,
               function(input, output, session) {
                 output$dataTable <- renderTable({
                   req(dat())
                   dat()[1:10, ]
                 })
                 esAndTsRawDataServer("esAndTs", assumption, dat, index, x, y)
                 plotServer("plotting", mode = "rawData", x = x, INDEX = index, y = y)
               })
}

esMainPanelEducationalServer <- function(id, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id, 
               function(input, output, session) {
                 output$dataTable <- renderTable({
                   # Ticket 46 - TODO add summaryStatisticList element which shows simulated dataset
                 })
                 esAndTsEducationalServer("esAndTs",  mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2)
                 plotServer("plotting", mode = "educational", m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2)
               })
}

