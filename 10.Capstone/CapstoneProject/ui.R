library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Text Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("string", "Please type below and the predicted text will appear below"),
      textOutput("selected_var")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
    )
  )
))
