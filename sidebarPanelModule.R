source(file = "dataManagerModule.R", local = TRUE)
source(file = "inputNumericGroupModule.R", local = TRUE)
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
        dataManagerUI(id = ns("data"),
                      acceptedFormats = acceptedFormats,
                      design = design)
      
      
    } else if (mode == "educational") {
      # inputList <- c(inputList, numericInputGroup(ns = ns, group = "mean", design = design, value = 100))
      #
      # inputList <- c(inputList, numericInputGroup(ns = ns, group = "standard deviation", design = design, value = 10))
      #
      # inputList <- c(inputList, numericInputGroup(ns = ns, group = "sample size", design = design, value = 20))
      
    }
    
    return(inputList)
  }


sidebarPanelServer <-
  function(id,
           design = c("indGrps", "depGrps", "mixed"),
           mode = c("educational", "rawData")) {
    moduleServer(
      id = id,
      module = function(input, output, session) {
        if (mode == "rawData") {
          inputDataVariables <- dataManagerServer("data", design)
          
          return(inputDataVariables)
          
        }
        
      }
      
      
    )
  }