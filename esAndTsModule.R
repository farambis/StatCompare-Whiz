source('checkboxGroupModule.R')
esAndTsUi <- function(id, esChoices, tsChoices) {
  ns <- NS(id)
  tagList(column(width = 6, checkboxGroupUi(ns("esCheckboxGroup"), esChoices, "Effect Sizes"),
          tableOutput(ns("esTable"))), 
          column(width = 6, checkboxGroupUi(ns("tsCheckboxGroup"), tsChoices, "Test Statistic"),
          tableOutput(ns("tsTable")))
          )
}

esAndTsServer <- function(id, dat, index, x) {
  moduleServer(id,
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 output$esTable <- renderTable({
                   generate_es_dataframe(selectedEs(), index(), x())
                 })
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")
                 output$tsTable <- renderTable({
                   generate_ts_dataframe(selectedTs(), index(), x())
                 })
               })
}