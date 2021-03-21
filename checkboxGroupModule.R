checkboxGroupUi <- function(id, choises, label) {
  ns <- NS(id)
  checkboxGroupInput(
    inputId = ns("checkboxes"),
    label = label,
    choices = choises
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