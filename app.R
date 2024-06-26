rm(list = ls())
library(shiny)
library(shinydashboard)
library(shinyvalidate)
library(DT)
library(gt)
library(mvtnorm)
source('function_ready.R')
source('plot_function_ready.R')
source('uiNavigationSidebar.R')
source('uiBody.R')
source('esServer.R')
options(htmlwidgets.TOJSON_ARGS = list(na = 'string'))
ui <- dashboardPage(dashboardHeader(title = 'StatCompare Whiz'),
                    sidebar = navigationSidebar,
                    body = body)
shinyApp(ui, esServer)
