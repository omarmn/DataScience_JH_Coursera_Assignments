#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  withProgress(message = "Loading data and packages, please wait before you start typing",{
    uni_words<-readRDS("data/1.rds")
    incProgress(amount = 0.25)
    bi_words<-readRDS("data/2.rds")
    incProgress(amount = 0.25)
    tri_words<-readRDS("data/3.rds")
    incProgress(amount = 0.25)
    require(quanteda)
    incProgress(amount = 0.25)
    
  })
  
  uniWords <- function(n = 5) {
    return(sample(uni_words[, word_1], size = n))
  }
  
  biWords <- function(w1, n = 5) {
    pwords <- bi_words[w1][order(-Prob)]
    if (any(is.na(pwords)))
      return(uniWords(n))
    if (nrow(pwords) > n)
      return(pwords[1:n, word_2])
    count <- nrow(pwords)
    unWords <- uniWords(n)[1:(n - count)]
    return(c(pwords[, word_2], unWords))
  }
  
  triWords <- function(w1, w2, n = 5) {
    pwords <- tri_words[.(w1, w2)][order(-Prob)]
    if (any(is.na(pwords)))
      return(biWords(w2, n))
    if (nrow(pwords) > n)
      return(pwords[1:n, word_3])
    count <- nrow(pwords)
    bwords <- biWords(w2, n)[1:(n - count)]
    return(c(pwords[, word_3], bwords))
  }
  
  getWords <- function(str){
    
    tokens <- tokens(x = char_tolower(str))
    tokens <- char_wordstem(rev(rev(tokens[[1]])[1:2]), language = "english")
    
    words <- triWords(tokens[1], tokens[2], 5)
    chain_1 <- paste(tokens[1], tokens[2], words[1], sep = " ")
    
    print(words[1])
  }
  
  output$selected_var <- renderText({ 
    getWords(input$string)
  })
})
