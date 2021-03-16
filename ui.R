library(shiny)
library(shinydashboard)
source('uiNavigationSidebar.R')
source('uiBody.R')
ui <- dashboardPage(
  dashboardHeader(),
  sidebar = navigationSidebar,
  body = body
)

server <- function(input, output) { }

shinyApp(ui, server)
