checkboxGroupUi <- function(id, choices, label) {
  ns <- NS(id)
  checkboxGroupInput(
    inputId = ns("checkboxes"),
    label = label,
    choices = choices
  )
}

checkboxGroupServer <- function(id) {
  moduleServer(id,
               function(input, output, session) {
                 selectedBoxes <- reactive({
                   req(input$checkboxes)
                 })
                 return (selectedBoxes)
               })
}
