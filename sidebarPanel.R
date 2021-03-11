library(shiny)

esSidebarPanel <- function(id) {
  ns <- NS(id)
  sidebarPanel(
  fileInput(inputId = ns("file"),
            label = "Upload your datafile",
            accept = ".csv"),
  
  selectInput(inputId = ns("group_var"),
              label = "Select the group variable:",
              choices = NULL),
  
  selectInput(inputId = ns("data_vec"),
              label = "Select data vector:",
              choices = NULL)
)
}
