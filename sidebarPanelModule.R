source(file = "dataManagerModule.R", local = TRUE)
source(file = "summaryStatisticsInputModule.R", local = TRUE)
library(shiny)

sidebarPanelUI <-
  function(id,
           acceptedFormats,
           design = c("indGrps", "depGrps", "mixed"),
           mode = c("educational", "rawData")) {
    
    ns <- NS(namespace = id)
    
    inputList <- tagList()
    
    if (mode == "rawData") {
      inputList <-
        sidebarPanel(dataManagerUI(id = ns("uploadedData"),
                                   acceptedFormats = acceptedFormats,
                                   design = design))
    } else if (mode == "educational") {
      inputList <-
        summaryStatisticsInput(id = ns("summaryStatisticsInput"),
                               design = design)
    }
    return(inputList)
  }


sidebarPanelServer <-
  function(id,
           design = c("indGrps", "depGrps", "mixed"),
           mode = c("educational", "rawData")) {
    stopifnot(!is.reactive(design))
    stopifnot(!is.reactive(mode))
    moduleServer(
      id = id,
      module = function(input, output, session) {
        if (mode == "rawData") {
          inputDataVariables <- dataManagerServer("uploadedData", design)
          return(inputDataVariables)
        } else if(mode == "educational"){
          inputSummaryStatistics <- summaryStatisticsServer("summaryStatisticsInput")
          return(inputSummaryStatistics)
        }
      }
    )
  }