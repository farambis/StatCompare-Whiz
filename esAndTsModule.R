source('checkboxGroupModule.R')

csvDownloadHandler <- function(filename, FUN) {
  downloadHandler(
    filename = filename,
    content = function(file) {
      write.csv(FUN(), file, row.names = FALSE, quote = FALSE, fileEncoding = "UTF-8")
    }
  )
}

nonparametricOptionsObserver <- function(selectedEs, session) observeEvent(selectedEs(), {
  if (contains(selectedEs(), nonparametricOptions[!grepl("tail_ratio", nonparametricOptions)])) {
    updateTabsetPanel(session,
                      inputId = "parametricBool",
                      selected = "parametricFALSE")
  } else {
    updateTabsetPanel(session,
                      inputId = "parametricBool",
                      selected = "parametricTRUE")
  }
})

tailRatioOptionsObserver <- function(selectedEs, session) observeEvent(selectedEs(), {
  if (contains(selectedEs(), tailRatioOptions)) {
    updateTabsetPanel(session,
                      inputId = "tailRatioBool",
                      selected = "tailRatioTRUE")
  } else {
    updateTabsetPanel(session,
                      inputId = "tailRatioBool",
                      selected = "tailRatioFALSE")
  }
})

tailRatioMultivariateObserver <- function(selectedEs, session) observeEvent(selectedEs(), {
  if (contains(selectedEs(), "tail_ratio_multivariate")) {
    updateTabsetPanel(session,
                      inputId = "tailRatioMultivariateBool",
                      selected = "tailRatioMultivariateTRUE")
  } else {
    updateTabsetPanel(session,
                      inputId = "tailRatioMultivariateBool",
                      selected = "tailRatioMultivariateFALSE")
  }
})

initializeInputValidators <- function(selectedEs, nonParametricTailRatioCutoffAllowedRange) {
  esTsModuleIv <- InputValidator$new()
  esTsModuleIv$enable()
  alpha_level_iv <- InputValidator$new()
  alpha_level_iv$add_rule("alpha", sv_required())
  alpha_level_iv$add_rule("alpha", function(x) { if (x < 0.00001 || x > 0.99999) paste0("Set \U03B1 to a value between 0.00001 and 0.99999") })
  
  nonparametric_iv <- InputValidator$new()
  nonparametric_iv$add_rule("kernel", sv_required())
  nonparametric_iv$condition(~contains(selectedEs(), nonparametricOptions[!grepl("tail_ratio", nonparametricOptions)]))
  
  tail_ratio_iv <- InputValidator$new()
  tail_ratio_iv$add_rule("tail", sv_required())
  tail_ratio_iv$add_rule("referenceGroup", sv_required())
  tail_ratio_iv$add_rule("cutoff", sv_required())
  if (!missing(nonParametricTailRatioCutoffAllowedRange)) {
    non_parametric_tail_ratio_iv <- InputValidator$new()
    non_parametric_tail_ratio_iv$add_rule("cutoff", function(value) {
      non_parametric_tail_ratio_cutoff_error(value,
                                             min = nonParametricTailRatioCutoffAllowedRange()[["cutoffMin"]],
                                             max = nonParametricTailRatioCutoffAllowedRange()[["cutoffMax"]])
    })
    non_parametric_tail_ratio_iv$condition(~(contains(selectedEs(), tailRatioOptions) && contains(selectedEs(), nonparametricOptions)))
    tail_ratio_iv$add_validator(non_parametric_tail_ratio_iv)
  }
  tail_ratio_iv$condition(~contains(selectedEs(), tailRatioOptions))
  
  tail_ratio_multivariate_iv <- InputValidator$new()
  tail_ratio_multivariate_iv$add_rule("z", sv_required())
  tail_ratio_multivariate_iv$condition(~contains(selectedEs(), "tail_ratio_multivariate"))
  
  # Add all child validators to plotModule_iv
  esTsModuleIv$add_validator(alpha_level_iv)
  esTsModuleIv$add_validator(nonparametric_iv)
  esTsModuleIv$add_validator(tail_ratio_iv)
  esTsModuleIv$add_validator(tail_ratio_multivariate_iv)
  return(esTsModuleIv)
}

non_parametric_tail_ratio_cutoff_range <- function(x = NULL, INDEX = NULL, y = NULL) {
  if (!is.null(INDEX)) {
    dataset <- split(x, INDEX)
    dataset1 <- dataset[[1]]
    dataset2 <- dataset[[2]]
  } else {
    dataset1 <- x
    dataset2 <- y
  }
  min_group1 <- min(dataset1)
  min_group2 <- min(dataset2)
  max_group1 <- max(dataset1)
  max_group2 <- max(dataset2)
  cutoffMin <- max(min_group1, min_group2)
  cutoffMax <- min(max_group1, max_group2)
  return(list(
    cutoffMin = round(cutoffMin, 2),
    cutoffMax = round(cutoffMax, 2)
  ))
}


non_parametric_tail_ratio_cutoff_error <- function(value, min, max) {
  
  test <- min > value || value > max
  if (isTRUE(test)) {
    paste0("The cutoff is out of bounds! One group lacks observations in the selected range. Please select a value between ",
           ceiling(min),
           " and ",
           floor(max))
  }
}

createDownloadWidgetRaw <- function(namespace, design, selectedEs, inputValidator, name, INDEX, x, y) {
  renderUI({
    ns <- namespace
    req(isTruthy(x()) && isTruthy(y()) || isTruthy(x()) && isTruthy(INDEX()), selectedEs(), inputValidator$is_valid())
    if (design == "mixed") req(isTruthy(x()) &&
                                 isTruthy(y()) &&
                                 isTruthy(INDEX()))
    downloadButton(ns(name), class = "btn-primary")
  })
}

createDownloadWidgetEducational <- function(namespace, selectedEs, inputValidator, name) {
  renderUI({
    ns <- namespace
    req(selectedEs(), inputValidator$is_valid())
    downloadButton(ns(name), class = "btn-primary")
  })
}

esAndTsUi <- function(id, esChoices, tsChoices) {
  ns <- NS(id)
  tagList(
    column(width = 8,
           fluidRow(
             column(
               width = 6,
               checkboxGroupUi(ns("esCheckboxGroup"), esChoices, "Effect Sizes"),
             ),
             column(
               width = 6,
               numericInput(inputId = ns("alpha"),
                            label = "Choose \U03B1 level of CI",
                            value = 0.05,
                            min = 0.00001,
                            max = 0.99999),
               tabsetPanel(
                 id = ns("tailRatioBool"),
                 type = "hidden",
                 tabPanelBody("tailRatioFALSE"),
                 tabPanelBody("tailRatioTRUE",
                              tailRatioControls(ns = ns))
               ),
               tabsetPanel(
                 id = ns("tailRatioMultivariateBool"),
                 type = "hidden",
                 tabPanelBody("tailRatioMultivariateFALSE"),
                 tabPanelBody("tailRatioMultivariateTRUE",
                              numericInput(do.call(ns, list("z")),
                                           label = "Specify z value:",
                                           value = NULL)
                 )
               ),
               tabsetPanel(
                 id = ns("parametricBool"),
                 type = "hidden",
                 tabPanelBody("parametricTRUE"),
                 tabPanelBody("parametricFALSE",
                              nonparametricControls(ns = ns))
               )
             )),
           fluidRow(gt_output(ns("esTable")),
                    column(width = 6,
                           uiOutput(ns("downloadEsWidget"))
                    )
           )
    ),
    if (length(tsChoices) > 0) {
      column(width = 4,
             checkboxGroupUi(ns("tsCheckboxGroup"), tsChoices, "Test Statistic"),
             fluidRow(gt_output(ns("tsTable")),
                      fluidRow(column(width = 6,
                                      uiOutput(ns("downloadTsWidget"))))
             )
      )
    }
  )
}

sdiffNotification <- function(sdiff1, sdiff2){
  
  observeEvent(
    req(!is.na(sdiff1()) || !is.na(sdiff2())),
    {
      showNotification(
        ui = "Note: When the standard deviation of difference scores (sdiff) is provided, this specified value will be used for computations instead of the automatically calculated value of sdiff.",
        duration = 8,
        type = "message"
      )
    })
}


bootstrapNotification <- function(selectedEs) observeEvent(
  selectedEs(), {
    showNotification(
      ui = "Notice: New set of bootstrap samples drawn and bootstrap confidence intervals are recalculated",
      duration = 3,
      type = "message"
    )
  })


inhomogenousVariancesNotification <- function(selectedEs, x, INDEX) observeEvent(
  selectedEs(), {
    if ("parametric_ovl" %in% selectedEs() && are_variances_homogenous(x, INDEX)) {
      showNotification(
        ui = "Warning: Assumption of homoscedasticity violated according to a Levene test. Consider computing a non-parametric measure of overlap",
        duration = 8,
        type = "warning"
      )
    }
  }
)


nonParametricVarianceRatioCiErrorNotification <- function(x, INDEX, selectedEs) {
  
  bangaFoxBonettCiError <- reactive({
    req(x(), INDEX(), selectedEs())
    if ("non_parametric_variance_ratio" %in% selectedEs()) {
      banga_fox_bonett_ci_error(x(), INDEX(), alpha = 0.05)
    } else {
      FALSE
    }
  })
  
  observeEvent(
    req(bangaFoxBonettCiError()),
    {
      if (bangaFoxBonettCiError()) {
        showNotification("Note: Banga-Fox-Bonett confidence interval implementation for the variance ratio failed - Bonett confidence interval computed",
                         duration = 8, closeButton = TRUE, type = "message")
      }
    }
  )
}

dependentTailRatioCiRawDataErrorNotification <- function(selectedEs, assumption, x, y, reference_group, tail, cutoff, alpha = 0.05) {
  
  namBlackwelderCiError <- reactive({
    req(x(), y(), selectedEs(), reference_group(), cutoff(), tail())
    if (any(c(all_eff_sizes$tail_ratio_dependent, all_eff_sizes$non_parametric_tail_ratio_dependent) %in% selectedEs())) {
      nam_blackwelder_ci_error(x = x(), y = y(), mode = "rawData", assumption = assumption, reference_group = reference_group(), cutoff = cutoff(), tail = tail(), alpha = alpha)
    } else {
      FALSE
    }
  })
  
  observeEvent(
    req(namBlackwelderCiError()),
    {
      if (namBlackwelderCiError()) {
        showNotification("Note: Nam-Blackwelder confidence interval implementation for the tail ratio failed - Bonett-Price confidence interval computed!",
                         duration = 8, closeButton = TRUE, type = "message")
      }
    }
  )
}

dependentTailRatioCiEducationalModeErrorNotification <- function(selectedEs, m1, m2, s1, s2, n, r, reference_group, tail, cutoff, alpha = 0.05) {
  
  namBlackwelderCiError <- reactive({
    req(m1(), m2(), s1(), s2(), n(), r(), selectedEs(), reference_group(), cutoff(), tail())
    if (all_eff_sizes$tail_ratio_dependent %in% selectedEs()) {
      nam_blackwelder_ci_error(m1 = m1(), m2 = m2(), s1 = s1(), s2 = s2(), r = r(), n = n(), mode = "educational", assumption = NULL, reference_group = reference_group(), tail = tail(), cutoff = cutoff(), alpha = alpha)
    } else {
      FALSE
    }
  })
  observeEvent(
    req(namBlackwelderCiError()),
    {
      if (namBlackwelderCiError()) {
        showNotification("Note: Nam-Blackwelder confidence interval implementation for the tail ratio failed - Bonett-Price confidence interval computed!",
                         duration = 8, closeButton = TRUE, type = "message")
      }
    }
  )
}

contains <- function(list1, list2) {
  for (val in list1) {
    if (val %in% list2)
      return(TRUE)
  }
  return(FALSE)
}

esAndTsRawDataServer <- function(id, design, assumption, INDEX, x, y) {
  moduleServer(id,
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")
                 
                 nonParametricTailRatioCutoffAllowedRange <- reactive({
                   non_parametric_tail_ratio_cutoff_range(x = x(), INDEX = INDEX(), y = y())
                 })
                 
                 esTsModuleIv <- initializeInputValidators(selectedEs, nonParametricTailRatioCutoffAllowedRange)
                 
                 nonparametricOptionsObserver(selectedEs, session)
                 tailRatioOptionsObserver(selectedEs, session)
                 
                 getEsDataframe <- reactive({
                   generate_es_raw_data_dataframe(es_list = selectedEs(), INDEX = INDEX(), x = x(), y = y(), tail = input$tail, ref = input$referenceGroup, cutoff = input$cutoff, alpha = input$alpha)
                 })
                 
                 getTsDataframe <- reactive({
                   if (assumption == "nonparametric") generate_non_parametric_ts_dataframe(ts_list = selectedTs(), INDEX = INDEX(), x = x(), y())
                   else generate_ts_dataframe(ts_list = selectedTs(), INDEX = INDEX(), x = x(), y = y())
                 })
                 
                 output$esTable <- render_gt({
                   req(esTsModuleIv$is_valid())
                   (getEsDataframe() %>%
                       gt() %>%
                       fmt_number(-1, decimals = 2)) %>%
                     tab_footnote(footnote = "Confidence interval lower limit", locations = cells_column_labels("Ci Ll")) %>%
                     tab_footnote(footnote = "Confidence interval upper limit", locations = cells_column_labels("Ci Ul")) %>%
                     tab_footnote(footnote = "Bootstrap confidence interval lower limit", locations = cells_column_labels("Boot Ci Ll")) %>%
                     tab_footnote(footnote = "Bootstrap confidence interval upper limit", locations = cells_column_labels("Boot Ci Ul")) %>%
                     tab_style(style = cell_text(size = "small"), locations = cells_footnotes())
                 })
                 output$tsTable <- render_gt({
                   (getTsDataframe() %>%
                      gt() %>%
                      fmt_number(-1, decimals = 2))
                 })
                 
                 output$downloadEsWidget <- createDownloadWidgetRaw(session$ns, design, selectedEs, esTsModuleIv, "downloadEs", INDEX, x, y)
                 output$downloadEs <- csvDownloadHandler("effect_size.csv", getEsDataframe)
                 output$downloadTsWidget <- createDownloadWidgetRaw(session$ns, design, selectedTs, esTsModuleIv, "downloadTs", INDEX, x, y)
                 output$downloadTs <- csvDownloadHandler("test_statistic.csv", getTsDataframe)
                 
                 bootstrapNotification(selectedEs)
                 inhomogenousVariancesNotification(selectedEs, x(), INDEX())
                 nonParametricVarianceRatioCiErrorNotification(x, INDEX, selectedEs)
                 referenceGroup <- reactive(input$referenceGroup)
                 tail <- reactive(input$tail)
                 cutoff <- reactive(input$cutoff)
                 dependentTailRatioCiRawDataErrorNotification(selectedEs, assumption, x, y, referenceGroup, tail, cutoff)
               })
}

esAndTsEducationalServer <- function(id, mean1, standardDeviation1, sampleSize1, correlation1, standardDeviationDiff1, mean2, standardDeviation2, sampleSize2, mean3, standardDeviation3, mean4, standardDeviation4, correlation2, standardDeviationDiff2) {
  moduleServer(id,
               function(input, output, session) {
                 selectedEs <- checkboxGroupServer("esCheckboxGroup")
                 selectedTs <- checkboxGroupServer("tsCheckboxGroup")
                 
                 esTsModuleIv <- initializeInputValidators(selectedEs)
                 
                 nonparametricOptionsObserver(selectedEs, session)
                 tailRatioOptionsObserver(selectedEs, session)
                 
                 getEsDataframe <- reactive({
                   generate_es_educational_dataframe(selectedEs(), mean1(), standardDeviation1(), sampleSize1(), correlation1(), standardDeviationDiff1(), mean2(), standardDeviation2(), sampleSize2(), mean3(), standardDeviation3(), mean4(), standardDeviation4(), correlation2(), standardDeviationDiff2(), input$tail, input$referenceGroup, input$cutoff, alpha = input$alpha)
                 })
                 
                 getTsDataframe <- reactive({
                   generate_ts_dataframe(ts_list = selectedTs(), m1 = mean1(), m2 = mean2(), standardDeviation1 = standardDeviation1(), standardDeviation2 = standardDeviation2(), r = correlation1(), n1 = sampleSize1(), n2 = sampleSize2(), sdiff = standardDeviationDiff1())
                 })
                 
                 output$esTable <- render_gt({
                   req(esTsModuleIv$is_valid())
                   (getEsDataframe() %>%
                       gt() %>%
                       fmt_number(-1, decimals = 2)) %>%
                     tab_footnote(footnote = "Confidence interval lower limit", locations = cells_column_labels("Ci Ll")) %>%
                     tab_footnote(footnote = "Confidence interval upper limit", locations = cells_column_labels("Ci Ul")) %>%
                     tab_style(style = cell_text(size = "small"), locations = cells_footnotes())
                 })
                 output$tsTable <- render_gt({
                   (getTsDataframe() %>%
                      gt() %>%
                      fmt_number(-1, decimals = 2))
                 })
                 
                 output$downloadEsWidget <- renderUI({
                   ns <- session$ns
                   req(selectedEs())
                   downloadButton(ns("downloadEs"), class = "btn-primary")
                 })
                 
                 output$downloadEsWidget <- createDownloadWidgetEducational(session$ns, selectedEs, esTsModuleIv, "downloadEs")
                 output$downloadEs <- csvDownloadHandler("effect_size.csv", getEsDataframe)
                 output$downloadTsWidget <- createDownloadWidgetEducational(session$ns, selectedTs, esTsModuleIv, "downloadTs")
                 output$downloadTs <- csvDownloadHandler("test_statistic.csv", getTsDataframe)
                 referenceGroup <- reactive(input$referenceGroup)
                 tail <- reactive(input$tail)
                 cutoff <- reactive(input$cutoff)
                 dependentTailRatioCiEducationalModeErrorNotification(selectedEs, mean1, mean2, standardDeviation1, standardDeviation2, sampleSize1, correlation1, referenceGroup, tail, cutoff)
                 sdiffNotification(standardDeviationDiff1, standardDeviationDiff2)
               })
}

esAndTsMultivariateRawDataServer <- function(id, data, INDEX, dataInputX) {
  moduleServer(id, function(input, output, session) {
    selectedEs <- checkboxGroupServer("esCheckboxGroup")
    esTsModuleIv <- initializeInputValidators(selectedEs)
    tailRatioMultivariateObserver(selectedEs, session)
    getEsDataframe <- reactive({
      generate_multivariate_raw_data_dataframe(selectedEs(), data()[dataInputX()], INDEX(), input$alpha, input$z)
    })
    output$esTable <- render_gt({
      req(esTsModuleIv$is_valid())
      (getEsDataframe() %>%
          gt() %>%
          fmt_number(-1, decimals = 2))
    })
    
    output$downloadEsWidget <- renderUI({
      ns <- session$ns
      req(selectedEs())
      downloadButton(ns("downloadEs"), class = "btn-primary")
    })
    
    output$downloadEsWidget <- createDownloadWidgetEducational(session$ns, selectedEs, esTsModuleIv, "downloadEs")
    output$downloadEs <- csvDownloadHandler("effect_size.csv", getEsDataframe)
  })
}

esAndTsMultivariateEducationalServer <- function(id, means, covarianceMatrix, n1, n2) {
  moduleServer(id, function(input, output, session) {
    selectedEs <- checkboxGroupServer("esCheckboxGroup")
    esTsModuleIv <- initializeInputValidators(selectedEs)
    tailRatioMultivariateObserver(selectedEs, session)
    getEsDataframe <- reactive({
      generate_multivariate_educational_dataframe(selectedEs(), means(), covarianceMatrix(), n1(), n2(), z = input$z, alpha = input$alpha)
    })
    output$esTable <- render_gt({
      req(esTsModuleIv$is_valid())
      (getEsDataframe() %>%
          gt() %>%
          fmt_number(-1, decimals = 2))
    })
    output$downloadEsWidget <- renderUI({
      ns <- session$ns
      req(selectedEs())
      downloadButton(ns("downloadEs"), class = "btn-primary")
    })
    
    output$downloadEsWidget <- createDownloadWidgetEducational(session$ns, selectedEs, esTsModuleIv, "downloadEs")
    output$downloadEs <- csvDownloadHandler("effect_size.csv", getEsDataframe)
  })
  
}