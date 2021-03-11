esMainPanel <- function(id) {
  ns <- NS(id)
  mainPanel(tabsetPanel(
    id = ns("mainPanel"), 
    tabPanel(title = 'Data', 'Hello Data'),
    tabPanel(title = 'Es & Teststatistic', 'Hello Teststatistic'),
    tabPanel(title = 'Plot', 'Hello Plot')
  ))
}
