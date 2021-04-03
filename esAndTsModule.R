source('checkboxGroupModule.R')
esAndTsUi <- function(id, esChoices, tsChoices) {
  ns <- NS(id)
  tagList(column(width = 6, checkboxGroupUi(ns("esCheckboxGroup"), esChoices, "Effect Sizes"),
          tableOutput(ns("esTable"))), 
          column(width = 6, checkboxGroupUi(ns("tsCheckboxGroup"), tsChoices, "Test Statistic"),
          tableOutput(ns("tsTable")))
          )
}

esAndTsRawDataServer <- function(id, prerequisite, dat, index, x, y) {
  moduleServer(id,
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 output$esTable <- renderTable({
                   generate_es_raw_data_dataframe(es_list = selectedEs(), INDEX =  index(), x =  x(), y =  y())
                 })
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")
                 output$tsTable <- renderTable({
                   if (prerequisite == "nonparametric") generate_non_parametric_ts_dataframe(ts_list = selectedTs(),INDEX =  index(),x =  x(), y()) 
                   else generate_ts_dataframe(ts_list = selectedTs(), INDEX = index(), x = x())
                 })
               })
}

esAndTsEducationalServer <- function(id,  mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id, 
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 output$esTable <- renderTable({
                   generate_es_educational_dataframe(selectedEs(),  mean1(), standardDeviation1(), sampleSize1(), correlation1(), standardDeviationDiff1(), mean2(), standardDeviation2(), sampleSize2(), mean3(), standardDeviation3(), mean4(), standardDeviation4(), correlation2(), standardDeviationDiff2())
                 })
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")
                 output$tsTable <- renderTable({
                   generate_ts_dataframe(ts_list = selectedTs(), m1 = mean1(), m2 = mean2(), standardDeviation1 = standardDeviation1(), standardDeviation2 = standardDeviation2(), n1 = sampleSize1(), n2 = sampleSize2())
                 
                   })
               })
}