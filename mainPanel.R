source('esAndTsModule.R')
source('plotModule.R')
source('summaryStatisticsTableModule.R')


esMainPanel <- function(id, esChoices, tsChoices, plotChoices, description, mode, design) {
  ns <- NS(id)
  mainPanel(tabsetPanel(
    id = ns("mainPanel"),
    if (mode == "rawData")tabPanel(title = "Data", DT::DTOutput(ns("dataTable")), hr(), summaryStatisticsTableUI(ns("summaryStatisticsTable"), design = design)),
    tabPanel(title = "Effect Sizes & Test Statistics", esAndTsUi(ns("esAndTs"), esChoices, tsChoices)),
    tabPanel(title = "Plots", plotUi(ns("plotting"), plotChoices = plotChoices)),
    tabPanel(title = icon("info-circle"), withMathJax(includeMarkdown(description)))
  ))
}


esMainPanelRawDataServer <- function(id, assumption, dat, index, x, y, design) {
  moduleServer(id,
               function(input, output, session) {

                 dataTableColOrder <- reactive({
                   
                 })
                 output$dataTable <- DT::renderDT({
                   req(dat())
                   d <- dat()
                   double_vars <- sapply(d, is.double)
                   d[double_vars] <- round(d[double_vars], 2)
                   d
                   },
                   options = list(
                     searching = FALSE,
                     pageLength = 10,
                     scrollX = TRUE,
                     lengthMenu = c(5, 10, 25, 50, 100)))

                 summaryStatisticsTableServer("summaryStatisticsTable", design, x, index, y)

                 esAndTsRawDataServer("esAndTs", design, assumption, index, x, y)
                 plotServer("plotting", mode = "rawData", x = x, INDEX = index, y = y)
               })
}

esMainPanelEducationalServer <- function(id, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id,
               function(input, output, session) {
                 esAndTsEducationalServer("esAndTs", mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2)
                 plotServer("plotting", mode = "educational", m1 = mean1, m2 = mean2, m3 = mean3, m4 = mean4, s1 = standardDeviation1, s2 = standardDeviation2, s3 = standardDeviation3, s4 = standardDeviation4, sdiff1 = standardDeviationDiff1, sdiff2 = standardDeviationDiff2, n1 = sampleSize1, n2 = sampleSize2, r1 = correlation1, r2 = correlation2, n = sampleSize1)
               })
}

