#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Gradient Explained"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("grad",
                   "Select a gradient:",
                   min = 0,
                   max = 10,
                   value = 5)
    ),
    
    mainPanel(
      p("This app is intended to demo how the gradient affects the shape of a linear plot by moving the slider."),
      p("The gradient of a linear plot is defined as the change Y-values against an increase in 1 unit of X."),
      p("Move the slider and observe how the slope of line changes."),
      plotOutput("LinearPlot"),
      p("Observe how as you increase the gradient the line becomes steeper and as you decrease the gradient the line becomes shallower. When the gradient is Zero the line is completely flat.")
    )
  )
))
