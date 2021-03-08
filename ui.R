library(shiny)
library(shinydashboard)
source('ui_sidebar.R')
source('ui_body.R')
ui <- dashboardPage(
  dashboardHeader(),
  sidebar = sidebar,
  body = body
)

server <- function(input, output) { }

shinyApp(ui, server)
