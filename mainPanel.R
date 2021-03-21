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


esMainPanelServer <- function(id, dat, index, x) {
  stopifnot(is.reactive(dat))
  stopifnot(is.reactive(x))
  stopifnot(is.reactive(index))
  moduleServer(id,
               function(input, output, session) {
                 output$dataTable <- renderTable({
                   req(dat())
                   dat()[1:10, ]
                 })
                 esAndTsServer("esAndTs", dat, index, x)
               })
}