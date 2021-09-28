source('esAndTsModule.R')
source('plotModule.R')

esMainPanel <- function(id, esChoices, tsChoices, plotChoices, description) {
  ns <- NS(id)
  mainPanel(tabsetPanel(
    id = ns("mainPanel"),
    tabPanel(title = "Data", dataTableOutput(ns("dataTable"))),
    tabPanel(title = "Es & Teststatistic", esAndTsUi(ns("esAndTs"), esChoices, tsChoices)),
    tabPanel(title = "Plot", plotUi(ns("plotting"), plotChoices = plotChoices)),
    tabPanel(title = icon("info-circle"), withMathJax(includeMarkdown(description)))
  ))
}


esMainPanelRawDataServer <- function(id, assumption, dat, index, x, y) {
  moduleServer(id,
               function(input, output, session) {
                 output$dataTable <- renderDataTable({
                   req(dat()) },
                   options = list(
                     columnDefs = list(list(className = 'dt-center'),
                                       list(visible = TRUE, targets = 0:4),
                                       list(visible = FALSE, targets = '_all')
                     ),
                     searching = FALSE,
                     pageLength = 10,
                     lengthMenu = c(5, 10, 25, 50, 100)
                   ))
                 esAndTsRawDataServer("esAndTs", assumption, dat, index, x, y)
                 plotServer("plotting", mode = "rawData", x = x, INDEX = index, y = y)
               })
}

esMainPanelEducationalServer <- function(id, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id,
               function(input, output, session) {
                 output$dataTable <- renderDataTable({
                   # Ticket 46 - TODO add summaryStatisticList element which shows simulated dataset
                 })
                 esAndTsEducationalServer("esAndTs", mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2)
                 plotServer("plotting", mode = "educational", m1 = mean1, m2 = mean2, s1 = standardDeviation1, s2 = standardDeviation2, n1 = sampleSize1, n2 = sampleSize2)
               })
}

