#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
   
  output$LinearPlot <- renderPlot({
  
    #Create linear data based on gradient provided by slider
    x    <- -5:5 
    y    <- x*input$grad
    
    #Plot line
    plot(x,y,col='red', type="l", ylim=c(-25,25), lwd=3, xaxt="n", yaxt="n")
    axis(1, pos=0)
    axis(2, pos=0)
    abline(v=0, h=0)
    
  })
  
})
