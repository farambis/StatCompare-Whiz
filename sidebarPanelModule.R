source(file = "dataManagerModule.R", local = TRUE)
source(file = "summaryStatisticsInputModule.R", local = TRUE)
source(file = "multivariateInput.R", local = TRUE)
library(shiny)

sidebarPanelUI <-
  function(id,
           acceptedFormats,
           design = c("indGrps", "depGrps", "mixed", "multivariate"),
           mode = c("educational", "rawData")) {

    ns <- NS(namespace = id)

    inputList <- tagList()

    if (design == "multivariate") {
      inputList <- sidebarPanel(multivariateInputUI(id = ns("multivariateInput"),
                                                    mode,
                                                    acceptedFormats = acceptedFormats))
    }
    else if (mode == "rawData") {
      inputList <-
        sidebarPanel(dataManagerUI(id = ns("uploadedData"),
                                   acceptedFormats = acceptedFormats,
                                   design = design))
    } else if (mode == "educational") {
      inputList <-
        sidebarPanel(summaryStatisticsInput(id = ns("summaryStatisticsInput"),
                                            design = design))
    }

    return(inputList)
  }


sidebarPanelServer <-
  function(id,
           design = c("indGrps", "depGrps", "mixed", "multivariate"),
           mode = c("educational", "rawData")) {
    stopifnot(!is.reactive(design))
    stopifnot(!is.reactive(mode))
    moduleServer(
      id = id,
      module = function(input, output, session) {
        if (design == "multivariate") {
          inputValues <- multivariateInputServer("multivariateInput", mode)
          return(inputValues)
        } else if (mode == "rawData") {
          inputDataVariables <- dataManagerServer("uploadedData", design)
          return(inputDataVariables)
        } else if (mode == "educational") {
          inputSummaryStatistics <- summaryStatisticsServer("summaryStatisticsInput")
          return(inputSummaryStatistics)
        }
      }
    )
  }
