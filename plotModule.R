tail_ratio_cutoff_range_plot <- function(x = NULL, INDEX = NULL, y = NULL, 
                          m1, m2, s1, s2) {
  
  if(!is.null(x)){
    if(!is.null(INDEX)){
      stats <- summary_stats(x = x, INDEX = INDEX)
    } else {
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

tail_ratio_cutoff_error_plot <- function(value, min, max){
  
  test <- min > value || value > max
  if(isTRUE(test)){
    paste0("The cutoff is out of bounds for this plot! Please select a value between ",
           round(min),
           " and ", 
           round(max))
  }
}

tailRatioControls <- function(ns) {

  tagList(
    numericInput(do.call(ns, list("cutoff")),
                 label = "Specify cutoff value:",
                 value = NULL),
    selectizeInput(
      do.call(ns, list("referenceGroup")),
      label = "Select reference group:",
      choices = list("", "group 1" = "group1", "group 2" = "group2")
    ),
    selectizeInput(
      do.call(ns, list("tail")),
      label = "Select tail of interest:",
      choices = list("", "lower" = "lower", "upper" = "upper")
    )
  )
  
}


nonparametricControls <- function(ns){

    tagList(selectizeInput(
    do.call(ns, list("kernel")),
    label = "Select a smoothing kernel",
    choices = list(
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
          id = ns("tailRatioBool"),
          type = "hidden",
          tabPanelBody("tailRatioFALSE"),
          tabPanelBody("tailRatioTRUE",
                       tailRatioControls(ns = ns))
        )
      )
    ),
    fluidRow(plotOutput(outputId = ns("plot"),
                        width = "800px",
                        height = "600px")),
    fluidRow(column(width = 6,
                    uiOutput(ns(
                      "downloadWidget"
                    )),
                    offset = 6))
             
  )
}


plotServer <- function(id, x, INDEX, y, m1, m2, m3, m4, s1, s2, s3, s4, n1, n2, sdiff1, sdiff2, r1, r2, n, mode = c("rawData", "educational")) {
  moduleServer(id,
               function(input, output, session) {
                 
                 # create parent input validator for the entire module
                 plotModule_iv <- InputValidator$new()
                 plotModule_iv$add_rule("plotChoice", sv_required())
                 plotModule_iv$enable()

                 observeEvent(input$plotChoice,
                              {
                                if (input$plotChoice %in% nonparametricOptions) {
                                  updateTabsetPanel(session,
                                                    inputId = "parametricBool",
                                                    selected = "parametricFALSE")
                                } else {
                                  updateTabsetPanel(session,
                                                    inputId = "parametricBool",
                                                    selected = "parametricTRUE")
                                }
                                
                                if (input$plotChoice %in% tailRatioOptions) {
                                  updateTabsetPanel(session,
                                                    inputId = "tailRatioBool",
                                                    selected = "tailRatioTRUE")
                                } else {
                                  updateTabsetPanel(session,
                                                    inputId = "tailRatioBool",
                                                    selected = "tailRatioFALSE")
                                }
                              })
                 
                 tailRatioCutoffAllowedRange <- reactive({
                   switch(mode,
                          rawData = tail_ratio_cutoff_range_plot(x = x(), INDEX = INDEX(), y = y()),
                          educational = tail_ratio_cutoff_range_plot(m1 = m1(), m2 = m2(), s1 = s1(), s2 = s2()))
                 })
                 
                 
                 # Input validation via shinyvalidate
                 # validate non parametric input controls
                 nonparametric_iv <- InputValidator$new()
                 nonparametric_iv$add_rule("kernel", sv_required())
                 nonparametric_iv$condition(~ input$plotChoice %in% nonparametricOptions)

                 boxplot_iv <- InputValidator$new()
                 boxplot_iv$add_rule("plotChoice", function(choice) {
                   if (!is.null(choice) && choice == all_plots$boxplot_pairwise_difference_scores) {
                     if (length(x()) > 200) {
                       paste0("This option is only available for n < 200")
                     }
                   }
                 } )

                 # validate tail ratio input controls
                 tail_ratio_iv <- InputValidator$new()
                 tail_ratio_iv$add_rule("tail", sv_required())
                 tail_ratio_iv$add_rule("referenceGroup", sv_required())
                 tail_ratio_iv$add_rule("cutoff", sv_required())
                 tail_ratio_iv$add_rule("cutoff", function(value){
                   tail_ratio_cutoff_error_plot(value, 
                                 min = tailRatioCutoffAllowedRange()[["cutoffMin"]], 
                                 max = tailRatioCutoffAllowedRange()[["cutoffMax"]])})
                 tail_ratio_iv$condition(~ input$plotChoice %in% tailRatioOptions)
                 
                 # Add all child validators to plotModule_iv
                 plotModule_iv$add_validator(nonparametric_iv)
                 plotModule_iv$add_validator(tail_ratio_iv)
                 plotModule_iv$add_validator(boxplot_iv)
                 
                 output$plot <- renderPlot({
                    req(input$plotChoice,
                       plotModule_iv$is_valid()
                       )
                   switch(mode,
                          rawData = generate_data_plot(es = input$plotChoice, x = x(), INDEX = INDEX(), y = y(), kernel = input$kernel,reference_group = input$referenceGroup, tail = input$tail, cutoff = input$cutoff),
                          educational = generate_data_plot(es = input$plotChoice, m1 = m1(), m2 = m2(), m3 = m3(), m4 = m4(), s1 = s1(), s2 = s2(), s3 = s3(), s4 = s4(), sdiff1 = sdiff1(), sdiff2 = sdiff2(), n1 = n1(), n2 = n2(), r1 = r1(), r2 = r2(), n = n(), kernel = input$kernel,reference_group = input$referenceGroup, tail = input$tail, cutoff = input$cutoff)
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
                     pdf(file = file,
                         width = 10)
                     switch(mode,
                            rawData = generate_data_plot(es = input$plotChoice, x = x(), INDEX = INDEX(), y = y(), kernel = input$kernel,reference_group = input$referenceGroup, tail = input$tail, cutoff = input$cutoff),
                            educational = generate_data_plot(es = input$plotChoice, m1 = m1(), m2 = m2(), m3 = m3(), m4 = m4(), s1 = s1(), s2 = s2(), s3 = s3(), s4 = s4(), sdiff1 = sdiff1(), sdiff2 = sdiff2(), n1 = n1(), n2 = n2(), r1 = r1(), r2 = r2(), n = n(), kernel = input$kernel,reference_group = input$referenceGroup, tail = input$tail, cutoff = input$cutoff)
                     )
                     dev.off()
                   }
                 )
               })
}

