rm(list = ls())
library(shiny)
library(shinydashboard)
library(shinyvalidate)
library(gt)
source('plot_function_ready.R')
source('uiNavigationSidebar.R')
source('uiBody.R')
source('esServer.R')
ui <- dashboardPage(dashboardHeader(),
                    sidebar = navigationSidebar,
                    body = body)
shinyApp(ui, esServer)
