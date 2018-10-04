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
    titlePanel("Diamond price"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput("name",
                           label = "Choose at least one diamond cut",
                           choices = unique(dataset$cut),
                           selected = "Premium")
        ),
        # Show a plot of the generated distribution
        mainPanel(
            h6("The plot below show how diamond price varies across diamond weight ('carat') and cut."),
            plotlyOutput("plot")
        )
    )
))

