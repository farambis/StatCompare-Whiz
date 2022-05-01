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
          ifelse(design == "indGrps", "data vector:", "pretest measure:")
        ),
        choices = NULL
      )


    if (design %in% c("depGrps", "mixed")) {
      dataManagerIO[["selectInputPostdata"]] <-
        selectInput(
          inputId = ns("inputDataY"),
          label = "Select posttest measure:",
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
          read.table(input$file$datapath,
                     sep = ",",
                     header = TRUE)
        })

        dataManagerIv <- InputValidator$new()
        dataManagerIv$enable()
        dataManagerIv$add_rule("file", sv_required())
        dataManagerIv$add_rule("inputDataX", sv_required())

        dependentIv <- InputValidator$new()
        dependentIv$add_rule("inputDataY", sv_required())
        dependentIv$condition(~ design %in% c("depGrps", "mixed"))
        dataManagerIv$add_validator(dependentIv)

        independentIv <- InputValidator$new()
        independentIv$add_rule("inputDataIndex", sv_required())
        independentIv$add_rule("inputDataIndex", function(value){
              if (length(unique(data()[value[[1]]][[1]]))!=2) {
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
                           selected = character()
                         )
                       }

                       updateSelectInput(
                         session,
                         "inputDataX",
                         choices = var_options(data(),
                                               type = is.numeric),
                         selected = character()
                       )

                       if (design %in% c("depGrps", "mixed")) {
                         updateSelectInput(
                           session,
                           "inputDataY",
                           choices = var_options(data(),
                                                 type = is.numeric),
                           selected = character()
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
