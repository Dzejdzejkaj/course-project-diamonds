#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

shinyServer(function(input, output) {
    
    dataset <- reactive({
        diamonds[sample(nrow(diamonds), 1000),]
    })
    
    output$plot <- renderPlotly({
        if (length(input$name) == 0) {
            print("Please select at least one cut")
        } else {
            diamond_cut <- dataset()[dataset()$cut == input$name, ]
            ggplot(diamond_cut) + geom_point(aes(x = carat, y = price, color = cut)) +
                labs(x = "Carat", y = "Price")
        }
    })
})
