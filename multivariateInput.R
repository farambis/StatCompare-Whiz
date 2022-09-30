multivariateInputUI <- function(id, mode, acceptedFormats) {
  ns <- NS(namespace = id)
  userInput <- tagList()
  if (mode == "rawData") {
    userInput[["data"]] <- fileInput(inputId = ns("fileDat"),
                                     label = "Upload your datafile",
                                     accept = acceptedFormats)
    userInput[["inputDataIndex"]] <-
      selectInput(
        inputId = ns("inputDataIndex"),
        label = "Select group variable:",
        choices = NULL
      )

    userInput[["inputDataX"]] <-
      selectInput(
        inputId = ns("inputDataX"),
        label = paste0(
          "Select outcome/dependent variables:"),
        choices = NULL,
        multiple = TRUE
      )

  } else {
    userInput[["means"]] <- fileInput(inputId = ns("fileMeans"),
                                      label = "Upload a file containing the means of the outcome/dependent variables",
                                      accept = acceptedFormats)
    userInput[["covarianceMatrix"]] <- fileInput(inputId = ns("fileCovarianceMatrix"),
                                                 label = "Upload a file containing the pooled covariance matrix",
                                                 accept = acceptedFormats)
    userInput[["n1"]] <- numericInput(inputId = ns("n1"), label = "n1", value = 100)
    userInput[["n2"]] <- numericInput(inputId = ns("n2"), label = "n2", value = 100)
  }

  return(userInput)
}

multivariateInputServer <- function(id, mode) {
  moduleServer(
    id = id,
    module = function(input, output, session) {

      data <- reactive({
        req(input$fileDat)
        uploadedData <- read.table(input$fileDat$datapath,
                   sep = ",",
                   header = TRUE)
        filterDataAndNotify(uploadedData, input)
      })

      dataMeans <- reactive({
        req(input$fileMeans)
        read.table(input$fileMeans$datapath,
                   sep = ",",
                   header = FALSE)
      })

      dataCovarianceMatrix <- reactive({
        req(input$fileCovarianceMatrix)
        read.table(input$fileCovarianceMatrix$datapath,
                   sep = ",",
                   header = FALSE)
      })

      inputData <- list()

      inputData[["data"]] <- reactive({
        req(data())
        data()
      })

      inputData[["inputDataIndex"]] <- reactive({
        req(multivariateIv$is_valid())
        data()[[input$inputDataIndex]]

      })

      inputData[["inputDataX"]] <- reactive({
        req(multivariateIv$is_valid())
        input$inputDataX
      })

      inputData[["means"]] <- reactive({
        req(dataMeans())
        req(multivariateIv$is_valid())
        dataMeans()
      })
      inputData[["covarianceMatrix"]] <- reactive({
        req(dataCovarianceMatrix())
        req(multivariateIv$is_valid())
        dataCovarianceMatrix()
      })

      inputData[["n1"]] <- reactive({
        req(input$n1)
        req(multivariateIv$is_valid)
        input$n1
      })
      inputData[["n2"]] <- reactive({
        req(input$n2)
        req(multivariateIv$is_valid)
        input$n2
      })

      observeEvent(eventExpr = data(),
                   handlerExpr = {
                     updateSelectInput(
                       session,
                       "inputDataIndex",
                       choices = var_options(data()),
                       selected = input$inputDataIndex
                     )
                     updateSelectInput(
                       session,
                       "inputDataX",
                       choices = var_options(data(),
                                             type = is.numeric),
                       selected = input$inputDataX
                     ) })


      multivariateIv <- InputValidator$new()
      multivariateIv$enable()
      if (mode == "rawData") {
        multivariateIv$add_rule("fileDat", sv_required())
        multivariateIv$add_rule("inputDataIndex", sv_required())
        multivariateIv$add_rule("inputDataX", sv_required())
        multivariateIv$add_rule("inputDataIndex", function(value) {
          if (!value %in% colnames(data())) {
            paste0("Please update the input")
          } else if (length(unique(na.omit(data()[[value]]))) != 2) {
              paste0("The group variable has to contain exactly two different values")
            }
        })
        multivariateIv$add_rule("inputDataX", function(value) {
          if (!all(value %in% colnames(data()))) {
            paste0("Please update the input")
          } else if (contains(list1 = value, list2 = input$inputDataIndex)) {
            paste0("You can't select the group variable as an outcome variable")
          }
        })
      } else if (mode == "educational") {
        multivariateIv$add_rule("fileMeans", sv_required())
        multivariateIv$add_rule("fileMeans", function(value) {
          if (ncol(dataMeans()) != 2)
            paste0("This file should contain two columns.")
        })
        multivariateIv$add_rule("fileCovarianceMatrix", sv_required())
        multivariateIv$add_rule("fileCovarianceMatrix", function(value) {
          if (nrow(dataCovarianceMatrix()) != ncol(dataCovarianceMatrix())) {
            paste0("Number of rows and columns have to be the same.")
          }
        })
        multivariateIv$add_rule("fileCovarianceMatrix", function(value) {
          if (nrow(dataCovarianceMatrix()) != nrow(dataMeans())) {
            paste0("Number of rows (and columns) should equal the number of rows of the first file.")
          }
        })
        multivariateIv$add_rule("n1", sv_required())
        multivariateIv$add_rule("n1", function(value) validateNonNegative(value))
        multivariateIv$add_rule("n2", sv_required())
        multivariateIv$add_rule("n2", function(value) validateNonNegative(value))
      }
      return(inputData)
    }
  )
}

