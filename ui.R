#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

dataset <- diamonds

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Comparing diamond price and carat with its cut"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput("name",
                           label = "Diamond Cut",
                           choices = unique(dataset$cut),
                           selected = "Premium")
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("plot")
        )
    )
))

