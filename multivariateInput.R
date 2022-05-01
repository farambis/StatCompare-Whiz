multivariateInputUI <- function(id, acceptedFormats) {
  ns <- NS(namespace = id)
  fileInputList <- tagList()
  fileInputList[["means"]] <- fileInput(inputId = ns("fileMeans"),
                                        label = "Upload a file containing the means of the values",
                                        accept = acceptedFormats)
  fileInputList[["covarianceMatrix"]] <- fileInput(inputId = ns("fileCovarianceMatrix"),
                                                   label = "Upload a file containing the covariance matrix",
                                                   accept = acceptedFormats)
  fileInputList[["n1"]] <- numericInput(inputId = ns("n1"), label = "n1", value = 100)
  fileInputList[["n2"]] <- numericInput(inputId = ns("n2"), label = "n2", value = 100)
  return(fileInputList)
}

multivariateInputServer <- function(id) {
  moduleServer(
    id = id,
    module = function(input, output, session) {
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

      multivariateIv <- InputValidator$new()
      multivariateIv$enable()
      multivariateIv$add_rule("fileMeans", sv_required())
      multivariateIv$add_rule("fileCovarianceMatrix", sv_required())
      multivariateIv$add_rule("fileCovarianceMatrix", function(value) {
        if (nrow(dataCovarianceMatrix()) != ncol(dataCovarianceMatrix())) {
          paste0("Number of rows and columns have to be the same")
        }
      })
      multivariateIv$add_rule("n1", function(value) validateNonNegative(value))
      multivariateIv$add_rule("n2", function(value) validateNonNegative(value))
      return(inputData)
    }
  )
}

