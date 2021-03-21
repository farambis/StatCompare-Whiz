library(shiny)
library(shinydashboard)
source('function_ready.R')
source('uiNavigationSidebar.R')
source('uiBody.R')
source('esServer.R')
rm(list = ls())
ui <- dashboardPage(dashboardHeader(),
                    sidebar = navigationSidebar,
                    body = body)

shinyApp(ui, esServer)
