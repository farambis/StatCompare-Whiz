trCutoffRange <- function(x = NULL, INDEX = NULL, y = NULL, 
                          m1, m2, s1, s2) {
  
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
    } else if(!is.null(y)){
      stats <- summary_stats(x = x, y = y)
    }
    for (i in names(stats)) {
      assign(i, stats[[i]])
    }
  }

  cutoffMin <- min(m1, m2) - (3.5 * max(s1, s2))
  cutoffMax <- max(m1, m2) + 3.5 * max(s1, s2)
  
  return(list(
    cutoffMin = round(cutoffMin, 2),
    cutoffMax = round(cutoffMax, 2)
  ))
}

trCutoffError <- function(value, min, max){
  
  test <- min > value || value > max
  if(isTRUE(test)){
    paste0("The cutoff is out of bounds for this plot! Please select a value between ",
           round(min),
           " and ", 
           round(max))
  }
}

trPlotOptions <- c("parametric_tr", "parametric_tr_zoom", "non_parametric_tr", "non_parametric_tr_zoom")

trControls <- function(ns) {

  tagList(
    numericInput(do.call(ns, list("cutoff")),
                 label = "Specify a cutoff value:",
                 value = NULL),
    selectizeInput(
      do.call(ns, list("referenceGroup")),
      label = "Select a reference group:",
      choices = list("", "group 1" = "grp1", "group 2" = "grp2")
    ),
    selectizeInput(
      do.call(ns, list("tail")),
      label = "Select the tail of interest:",
      choices = list("", "lower" = "lower", "upper" = "upper")
    )
  )
  
}

nonparametricPlotOptions <- c("non_parametric_ovl", "non_parametric_u1", "non_parametric_u3",
                              "non_parametric_tr", "non_parametric_tr_zoom")

nonparametricControls <- function(ns){

    tagList(selectizeInput(
    do.call(ns, list("kernel")),
    label = "Select a smoothing kernel",
    choices = list(
      "",
      "gaussian",
      "epanechnikov",
      "rectangular",
      "triangular",
      "biweight",
      "cosine",
      "optcosine"
    )
  ))
}

plotUi <- function(id, plotChoices) {
  ns <- NS(id)
  fluidPage(
    fluidRow(
      column(width = 4,
             selectizeInput(
               ns("plotChoice"), "Select plot:", c(list(""), plotChoices)
             )),
      column(
        width = 4,
        tabsetPanel(
          id = ns("parametricBool"),
          type = "hidden",
          tabPanelBody("parametricTRUE"),
          tabPanelBody("parametricFALSE",
                       nonparametricControls(ns = ns))
        )
      ),
      column(
        width = 4,
        tabsetPanel(
          id = ns("trBool"),
          type = "hidden",
          tabPanelBody("trFALSE"),
          tabPanelBody("trTRUE",
                       trControls(ns = ns))
        )
      )
    ),
    fluidRow(plotOutput(ns("plot"))),
    fluidRow(column(width = 6,
                    uiOutput(ns(
                      "downloadWidget"
                    )),
                    offset = 6))
             
  )
}


plotServer <- function(id, x, INDEX, y, m1, m2, s1, s2, n1, n2, mode = c("rawData", "educational")) {
  moduleServer(id,
               function(input, output, session) {
                 
                 # create parent input validator for the entire module
                 plotModule_iv <- InputValidator$new()
                 plotModule_iv$add_rule("plotChoice", sv_required())
                 plotModule_iv$enable()


                 observeEvent(input$plotChoice,
                              {
                                if (input$plotChoice %in% nonparametricPlotOptions) {
                                  updateTabsetPanel(session,
                                                    inputId = "parametricBool",
                                                    selected = "parametricFALSE")
                                } else {
                                  updateTabsetPanel(session,
                                                    inputId = "parametricBool",
                                                    selected = "parametricTRUE")
                                }
                                
                                if (input$plotChoice %in% trPlotOptions) {
                                  updateTabsetPanel(session,
                                                    inputId = "trBool",
                                                    selected = "trTRUE")
                                } else{
                                  updateTabsetPanel(session,
                                                    inputId = "trBool",
                                                    selected = "trFALSE")
                                }
                              })
                 
                 trCutoffAllowedRange <- reactive({
                   switch(mode,
                          rawData = trCutoffRange(x = x(), INDEX = INDEX(), y = y()),
                          educational = trCutoffRange(m1 = m1(), m2 = m2(), s1 = s1(), s2 = s2()))
                 })
                 
                 
                 # Input validation via shinyvalidate
                 # validate non parametric input controls
                 nonparametric_iv <- InputValidator$new()
                 nonparametric_iv$add_rule("kernel", sv_required())
                 nonparametric_iv$condition(~ input$plotChoice %in% nonparametricPlotOptions)

                 # validate tail ratio input controls
                 tr_iv <- InputValidator$new()
                 tr_iv$add_rule("tail", sv_required())
                 tr_iv$add_rule("referenceGroup", sv_required())
                 tr_iv$add_rule("cutoff", sv_required())
                 tr_iv$add_rule("cutoff", function(value){
                   trCutoffError(value, 
                                 min = trCutoffAllowedRange()[["cutoffMin"]], 
                                 max = trCutoffAllowedRange()[["cutoffMax"]])})
                 tr_iv$condition(~ input$plotChoice %in% trPlotOptions)
                 
                 # Add all child validators to plotModule_iv
                 plotModule_iv$add_validator(nonparametric_iv)
                 plotModule_iv$add_validator(tr_iv)
                 
                 output$plot <- renderPlot({
                    req(input$plotChoice,
                       plotModule_iv$is_valid()
                       )
                   switch(mode,
                          rawData = generate_data_plot(es = input$plotChoice, x = x(), INDEX = INDEX(), y = y(), kernel = input$kernel,ref = input$referenceGroup, tail = input$tail, cutoff = input$cutoff),
                          educational = generate_data_plot(es = input$plotChoice, m1 = m1(), m2 = m2(), s1 = s1(), s2 = s2(), n1 = n1(), n2 = n2(), kernel = input$kernel,ref = input$referenceGroup, tail = input$tail, cutoff = input$cutoff)
                          )
                 })
                 
                 output$downloadWidget <- renderUI({
                   ns <- session$ns
                   req(input$plotChoice)
                   downloadButton(ns("download"), class = "btn-primary")
                 })
                 
                 output$download <- downloadHandler(
                   filename = function() {
                     paste0(input$plotChoice, ".pdf")
                   },
                   content = function(file) {
                     pdf(file = file)
                     switch(mode,
                            rawData = generate_data_plot(es = input$plotChoice, x = x(), INDEX = INDEX(), y = y(), kernel = input$kernel,ref = input$referenceGroup, tail = input$tail, cutoff = input$cutoff),
                            educational = generate_data_plot(es = input$plotChoice, m1 = m1(), m2 = m2(), s1 = s1(), s2 = s2(), n1 = n1(), n2 = n2(), kernel = input$kernel,ref = input$referenceGroup, tail = input$tail, cutoff = input$cutoff)
                     )
                     dev.off()
                   }
                 )
               })
}

