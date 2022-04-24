numericInputGroup <-
  function(ns,
           statistic = c("mean",
                         "standardDeviation",
                         "sampleSize",
                         "correlation",
                         "standardDeviationDiff"),
           design = c("indGrps", "depGrps", "mixed")) {
    lab <- switch(
      statistic,
      mean = "Mean",
      standardDeviation = "SD",
      sampleSize = "n",
      correlation = "r",
      standardDeviationDiff = "SD of difference scores"
    )

    value <- switch(
      statistic,
      mean = 100,
      standardDeviation = 10,
      sampleSize = 20,
      correlation = 0.7,
      standardDeviationDiff = NULL
    )

    min <- ifelse(statistic == "correlation", -1, NA)
    max <- ifelse(statistic == "correlation", 1, NA)

    nloop <- switch(
      statistic,
      mean = ifelse(design == "mixed", 4, 2),
      standardDeviation = ifelse(design == "mixed", 4, 2),
      sampleSize = ifelse(design == "depGrps", 1, 2),
      correlation = ifelse(design == "mixed", 2, 1),
      standardDeviationDiff = ifelse(design == "mixed", 2, 1)
    )

    IDs <- vapply(paste0(statistic, 1:nloop), ns, character(1))

    numericInputs <-
      lapply(
        IDs,
        numericInput,
        label = lab,
        value = value,
        min = min,
        max = max
      )
    names(numericInputs) <- paste0(statistic, 1:nloop)

    return(numericInputs)
  }

header <- function(design = c("indGrps", "depGrps", "mixed"),
                   measurement = c("Pretest", "Posttest"),
                   group = c("a", "b"),
                   info = c("acrossGrps", "perGrp")) {
  ifelse(
    info == "acrossGrps",
    paste0(
      ifelse(design == "depGrps",
             "Across measurements:",
             paste0("Group ", group))
    ),
    ifelse(
      design == "indGrps",
      paste0("Group ", group),
      ifelse(
        design == "depGrps",
        measurement,
        paste0("Group ",
               group,
               " ",
               measurement
        )
      )
    )
  )
}

uiColumn <-
  function(design,
           measurement = NULL,
           group,
           info,
           firstInput,
           secondInput,
           thirdInput) {
    column <- tagList()
    column$header <- tagList(h4(
      header(
        design = design,
        measurement = measurement,
        group = group,
        info = info
      )
    ))
    column$firstInput <- firstInput
    column$secondInput <- secondInput
    if ((design == "indGrps") || is.null(measurement)) {
      column$thirdInput <- thirdInput
    }
    return(column)
  }

summaryStatisticsInput <- function(id,
                                   design = c("indGrps", "depGrps", "mixed", "multivariate")) {
  ns <- NS(namespace = id)

  statistic <- c("mean", "standardDeviation", "sampleSize")

  if (design != "indGrps") {
    statistic <- c(statistic, "correlation", "standardDeviationDiff")
  }

  numericInputs <-
    lapply(statistic,
           numericInputGroup,
           ns = ns,
           design = design)

  names(numericInputs) <- paste0(statistic, "s")

  generatedUi <- tagList()

  generatedUi$firstRow <- fluidRow(column(
    width = 6,
    uiColumn(
      design = design,
      measurement = "Pretest",
      group = "a",
      info = "perGrp",
      firstInput = numericInputs$means$mean1,
      secondInput = numericInputs$
        standardDeviations$
        standardDeviation1,
      thirdInput = numericInputs$sampleSizes$sampleSize1
    )
  ),
                                   column(
                                     width = 6,
                                     uiColumn(
                                       design = design,
                                       measurement = "Posttest",
                                       group = ifelse(design == "indGrps", "b", "a"),
                                       info = "perGrp",
                                       firstInput = numericInputs$means$mean2,
                                       secondInput = numericInputs$
                                         standardDeviations$
                                         standardDeviation2,
                                       thirdInput = numericInputs$sampleSizes$sampleSize2
                                     )
                                   ))
  if (design != "indGrps") {
    generatedUi$secondRow <- fluidRow(column(
      width = 6,
      offset = 3,
      uiColumn(
        design = design,
        measurement = NULL,
        group = "a",
        info = "acrossGrps",
        firstInput = numericInputs$sampleSizes$sampleSize1,
        secondInput = numericInputs$correlations$correlation1,
        thirdInput = numericInputs$
          standardDeviationDiffs$
          standardDeviationDiff1
      )
    ),
                                      tags$hr())
  }
  if (design == "mixed") {
    generatedUi$thirdRow <- fluidRow(column(
      width = 6,
      uiColumn(
        design = design,
        measurement = "Pretest",
        group = "b",
        info = "perGrp",
        firstInput = numericInputs$means$mean3,
        secondInput = numericInputs$
          standardDeviations$
          standardDeviation3
      )
    ),
                                     column(
                                       width = 6,
                                       uiColumn(
                                         design = design,
                                         measurement = "Posttest",
                                         group = "b",
                                         info = "perGrp",
                                         firstInput = numericInputs$means$mean4,
                                         secondInput = numericInputs$
                                           standardDeviations$
                                           standardDeviation4
                                       )
                                     ))
    generatedUi$fourthRow <- fluidRow(column(
      width = 6,
      offset = 3,
      uiColumn(
        design = design,
        measurement = NULL,
        group = "b",
        info = "acrossGrps",
        firstInput = numericInputs$sampleSizes$sampleSize2,
        secondInput = numericInputs$correlations$correlation2,
        numericInputs$
          standardDeviationDiffs$
          standardDeviationDiff2
      )
    ))
  }
  return(generatedUi)
}

validateNonNegative <- function(value) {
  if (value < 0) {
    paste0("Standard Deviation must not be negative")
  }
}

validateNotGreaterThen <- function(value, boundary) {
  if (value > boundary) {
    paste0("Value must not be higher than ", boundary, " or lower than ", -boundary)
  }
}

summaryStatisticsServer <- function(id) {
  moduleServer(id,
               function(input, output, session) {


                 summaryStatisticIv <- InputValidator$new()
                 summaryStatisticIv$enable()
                 summaryStatisticIv$add_rule("mean1", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation1", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation1", function(value) validateNonNegative(value))
                 summaryStatisticIv$add_rule("sampleSize1", sv_required())
                 summaryStatisticIv$add_rule("sampleSize1", function(value) validateNonNegative(value))
                 summaryStatisticIv$add_rule("correlation1", sv_required())
                 summaryStatisticIv$add_rule("correlation1", function(value) validateNotGreaterThen(abs(value), 1))
                 summaryStatisticIv$add_rule("standardDeviationDiff1", function(value) {
                   if (!is.null(value) && !is.na(value)) {
                     validateNonNegative(value)
                   }
                 })
                 summaryStatisticIv$add_rule("mean2", sv_required())
                 summaryStatisticIv$add_rule("mean1", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation2", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation2", function(value) validateNonNegative(value))
                 summaryStatisticIv$add_rule("sampleSize2", sv_required())
                 summaryStatisticIv$add_rule("sampleSize2", function(value) validateNonNegative(value))
                 summaryStatisticIv$add_rule("mean3", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation3", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation3", function(value) validateNonNegative(value))
                 summaryStatisticIv$add_rule("mean4", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation4", sv_required())
                 summaryStatisticIv$add_rule("standardDeviation4", function(value) validateNonNegative(value))
                 summaryStatisticIv$add_rule("correlation2", sv_required())
                 summaryStatisticIv$add_rule("correlation2", function(value) validateNotGreaterThen(abs(value), 1))
                 summaryStatisticIv$add_rule("standardDeviationDiff2", function(value) {
                   if (!is.null(value) && !is.na(value)) {
                     validateNonNegative(value)
                   }
                 })

                 summaryStatisticInputs <- list(
                   mean1 = reactive(input$mean1),
                   standardDeviation1 = reactive(input$standardDeviation1),
                   sampleSize1 = reactive(input$sampleSize1),
                   correlation1 = reactive(input$correlation1),
                   standardDeviationDiff1 = reactive(input$standardDeviationDiff1),
                   mean2 = reactive(input$mean2),
                   standardDeviation2 = reactive(input$standardDeviation2),
                   sampleSize2 = reactive(input$sampleSize2),
                   mean3 = reactive(input$mean3),
                   standardDeviation3 = reactive(input$standardDeviation3),
                   mean4 = reactive(input$mean4),
                   standardDeviation4 = reactive(input$standardDeviation4),
                   correlation2 = reactive(input$correlation2),
                   standardDeviationDiff2 = reactive(input$standardDeviationDiff2)
                 )
                 return(summaryStatisticInputs)
               })
}
