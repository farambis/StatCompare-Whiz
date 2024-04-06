library(shiny)

var_options <- function(data, type = NULL) {
  stopifnot(is.data.frame(data))
  if (!is.null(type)) {
    stopifnot(is.function(type))
    bool <- vapply(data, type, logical(1))
    res <- names(data)[bool]
    return(res)
  }
  names(data)
}

missingDataNotification <- function(n) {
  showNotification(
    ui = paste0("Warning: ", n, " rows have been removed because of missing values"),
    duration = 5,
    type = "warning"
  )
}

appendFilterIfPresent <- function(filterProperties, input, value) {
  if (value %in% names(input)) {
    filterProperties <- c(filterProperties, value)
  }
  return(filterProperties)
}

filterDataAndNotify <- function(data, input) {
  selectedProperties <- list()
  selectedProperties <- appendFilterIfPresent(selectedProperties, input, "inputDataIndex")
  selectedProperties <- appendFilterIfPresent(selectedProperties, input, "inputDataX")
  selectedProperties <- appendFilterIfPresent(selectedProperties, input, "inputDataY")
  filterProperties <- list()
  for(value in selectedProperties) {
    filterProperty <- input[[value]]
    if (is.null(filterProperty) || filterProperty == ''  || !filterProperty %in% colnames(data)){
      return(data)
    }
    filterProperties <- c(filterProperties, filterProperty)
  }
  initial_rows <- nrow(data)
  filtered_data <- data[rownames(na.omit(data[unlist(filterProperties)])), ]
  n_removed <- initial_rows - nrow(filtered_data)
  if (n_removed > 0) {
    missingDataNotification(n_removed)
  }
  return (filtered_data)
}


dataManagerUI <-
  function(id,
           acceptedFormats,
           design = c("indGrps", "depGrps", "mixed")) {
    ns <- NS(namespace = id)

    dataManagerIO <- tagList()


    dataManagerIO[["fileInput"]] <- fileInput(inputId = ns("file"),
                                              label = "Upload your datafile",
                                              accept = acceptedFormats)

    if (design %in% c("indGrps", "mixed")) {
      dataManagerIO[["selectInputGroup"]] <-
        selectInput(
          inputId = ns("inputDataIndex"),
          label = "Select group variable:",
          choices = NULL
        )
    }

    dataManagerIO[["selectInputData"]] <-
      selectInput(
        inputId = ns("inputDataX"),
        label = paste0(
          "Select ",
          ifelse(design == "indGrps", "outcome/dependent variable:", "measurement 1:")
        ),
        choices = NULL
      )


    if (design %in% c("depGrps", "mixed")) {
      dataManagerIO[["selectInputPostdata"]] <-
        selectInput(
          inputId = ns("inputDataY"),
          label = "Select measurement 2:",
          choices = NULL
        )

    }

    return(dataManagerIO)
  }


dataManagerServer <-
  function(id,
           design = c("indGrps", "depGrps", "mixed")) {
    stopifnot(!is.reactive(design))
    moduleServer(
      id = id,
      module = function(input, output, session) {

        data <- reactive({
          req(input$file)
          uploadedData <- read.table(input$file$datapath,
                     sep = ",",
                     header = TRUE)

          filterDataAndNotify(uploadedData, input)
        })

        dataManagerIv <- InputValidator$new()
        dataManagerIv$enable()
        dataManagerIv$add_rule("file", sv_required())
        dataManagerIv$add_rule("inputDataX", sv_required())
        dataManagerIv$add_rule("inputDataX", function(value){
          if (!value %in% colnames(data())) {
            paste0("Please update the input")
          }
        })

        dependentIv <- InputValidator$new()
        dependentIv$add_rule("inputDataY", sv_required())
        dependentIv$add_rule("inputDataY", function(value){
          if (!value %in% colnames(data())) {
            paste0("Please update the input")
          }
        })
        dependentIv$condition(~ design %in% c("depGrps", "mixed"))
        dataManagerIv$add_validator(dependentIv)

        independentIv <- InputValidator$new()
        independentIv$add_rule("inputDataIndex", sv_required())
        independentIv$add_rule("inputDataIndex", function(value){
          if (!value %in% colnames(data())) {
            paste0("Please update the input")
          } else if (length(unique(na.omit(data()[[value]]))) != 2) {
                paste0("The group variable has to contain exactly two different values")
          }
          })
        independentIv$condition(~ design %in% c("indGrps", "mixed"))
        dataManagerIv$add_validator(independentIv)


        observeEvent(eventExpr = data(),
                     handlerExpr = {
                       if (design %in% c("indGrps", "mixed")) {
                         updateSelectInput(
                           session,
                           "inputDataIndex",
                           choices = var_options(data()),
                           selected = input$inputDataIndex
                         )
                       }

                       updateSelectInput(
                         session,
                         "inputDataX",
                         choices = var_options(data(),
                                               type = is.numeric),
                         selected = input$inputDataX
                       )

                       if (design %in% c("depGrps", "mixed")) {
                         updateSelectInput(
                           session,
                           "inputDataY",
                           choices = var_options(data(),
                                                 type = is.numeric),
                           selected = input$inputDataY
                         )
                       }
                     })

        inputDataVariables <- list()

        inputDataVariables[["data"]] <- reactive({
          req(data())
          data()
        })

        if (design %in% c("indGrps", "mixed")) {
          inputDataVariables[["inputDataIndex"]] <- reactive({
            req(dataManagerIv$is_valid())
            data()[[input$inputDataIndex]]
          })
        } else {
          inputDataVariables[["inputDataIndex"]] <- reactiveVal(NULL)
        }

        inputDataVariables[["inputDataX"]] <- reactive({
          req(dataManagerIv$is_valid())
          data()[[input$inputDataX]]
        })

        if (design %in% c("depGrps", "mixed")) {
          inputDataVariables[["inputDataY"]] <- reactive({
            req(dataManagerIv$is_valid())
            data()[[input$inputDataY]]
          })
        } else {
          inputDataVariables[["inputDataY"]] <- reactiveVal(NULL)
        }

        return(inputDataVariables)
      }

    )
  }
