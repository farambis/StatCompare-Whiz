source('checkboxGroupModule.R')

csvDownloadHandler <- function(filename, FUN) {
  downloadHandler(
    filename = filename,
    content = function(file) {
      write.csv(FUN(), file, row.names = FALSE, quote = FALSE, fileEncoding = "UTF-8")
    }
  )
}

createDownloadWidget <- function(namespace, FUN, name) {
  renderUI({
    ns <- namespace
    req(FUN())
    downloadButton(ns(name), class = "btn-primary")
  })
}

esAndTsUi <- function(id, esChoices, tsChoices) {
  ns <- NS(id)
  tagList(column(width = 6, checkboxGroupUi(ns("esCheckboxGroup"), esChoices, "Effect Sizes"),
                 tableOutput(ns("esTable")), fluidRow(column(width = 6, uiOutput(ns("downloadEsWidget"))))),
          column(width = 6, checkboxGroupUi(ns("tsCheckboxGroup"), tsChoices, "Test Statistic"),
                 tableOutput(ns("tsTable")), fluidRow(column(width = 6, uiOutput(ns("downloadTsWidget")))))
  )
}

bootstrapNotification <- function(selectedEs) observeEvent(
  selectedEs(), {
  showNotification(
    ui = "Bootstrap Konfidenzintervalle wurden neu berechnet!",
    duration = 3,
    type = "warning"
  )
})

esAndTsRawDataServer <- function(id, assumption, dat, index, x, y) {
  moduleServer(id,
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")

                 getEsDataframe <- reactive({
                   generate_es_raw_data_dataframe(es_list = selectedEs(), INDEX = index(), x = x(), y = y())
                 })

                 getTsDataframe <- reactive({
                   if (assumption == "nonparametric") generate_non_parametric_ts_dataframe(ts_list = selectedTs(), INDEX = index(), x = x(), y())
                   else generate_ts_dataframe(ts_list = selectedTs(), INDEX = index(), x = x())
                 })

                 output$esTable <- renderTable({
                   getEsDataframe()
                 })
                 output$tsTable <- renderTable({
                   getTsDataframe()
                 })

                 output$downloadEsWidget <- createDownloadWidget(session$ns, selectedEs, "downloadEs")
                 output$downloadEs <- csvDownloadHandler("effect_size.csv", getEsDataframe)
                 output$downloadTsWidget <- createDownloadWidget(session$ns, selectedTs, "downloadTs")
                 output$downloadTs <- csvDownloadHandler("test_statistic.csv", getTsDataframe)

                 bootstrapNotification(selectedEs)

               })
}

esAndTsEducationalServer <- function(id, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id,
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")

                 getEsDataframe <- reactive({
                   generate_es_educational_dataframe(selectedEs(), mean1(), standardDeviation1(), sampleSize1(), correlation1(), standardDeviationDiff1(), mean2(), standardDeviation2(), sampleSize2(), mean3(), standardDeviation3(), mean4(), standardDeviation4(), correlation2(), standardDeviationDiff2())
                 })

                 getTsDataframe <- reactive({
                   generate_ts_dataframe(ts_list = selectedTs(), m1 = mean1(), m2 = mean2(), standardDeviation1 = standardDeviation1(), standardDeviation2 = standardDeviation2(), n1 = sampleSize1(), n2 = sampleSize2())
                 })

                 output$esTable <- renderTable({
                   getEsDataframe()
                 })

                 output$tsTable <- renderTable({
                   getTsDataframe()
                 })

                 output$downloadEsWidget <- renderUI({
                   ns <- session$ns
                   req(selectedEs())
                   downloadButton(ns("downloadEs"), class = "btn-primary")
                 })

                 output$downloadEs <- csvDownloadHandler("effect_size.csv", getEsDataframe)
                 output$downloadTsWidget <- createDownloadWidget(session$ns, selectedTs, "downloadTs")
                 output$downloadTs <- csvDownloadHandler("test_statistic.csv", getTsDataframe)

                 bootstrapNotification(selectedEs)

               })
}
