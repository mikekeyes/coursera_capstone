#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringi)
library(data.table)
library(dplyr)

# load data files


load(file="data/two.RData")
load(file="data/three.RData")
load(file="data/four.RData")
load(file="data/five.RData")
two <- tbl_df(two)
three <- tbl_df(three)
four <- tbl_df(four)
five <- tbl_df(five)

predict <-function(input) {
  
  
  input <- Clean_String(input)
  words <- stri_extract_all_words(input)[[1]]
  preds <- data.frame()
  
  if (length(words) >= 4){
    input <- paste(collapse=' ',tail(words,4))
    preds <- five[which(five$phrase==input),]
    preds <- preds[with(preds,order(-tot)),'pred']
    
  }
  if (!is.null(preds)&nrow(preds)>0){
    #found a match in five. return it
    return(Reduce(rbind,preds[c(1,2,3),]))
  }
  if (length(words) >= 3){
    input <- paste(collapse=' ',tail(words,3))
    preds <- four[which(four$phrase==input),]
    preds <- preds[with(preds,order(-tot)),'pred']
    
  }
  if (!is.null(preds)&nrow(preds)>0){
    #found a match in four. return it
    return(Reduce(rbind,preds[c(1,2,3),]))
  }
  if (length(words) >= 2){
    input <- paste(collapse=' ',tail(words,2))
    preds <- three[which(three$phrase==input),]
    preds <- preds[with(preds,order(-tot)),'pred']
    
  }
  if (!is.null(preds)&nrow(preds)>0){
    #found a match in three. return it
    return(Reduce(rbind,preds[c(1,2,3),]))
  }
  if (length(words) >= 1){
    input <- paste(collapse=' ',tail(words,1))
    preds <- two[which(two$phrase==input),]
    preds <- preds[with(preds,order(-tot)),'pred']
    
  }
  if (!is.null(preds)&nrow(preds)>0){
    #found a match in two. return it
    return(Reduce(rbind,preds[c(1,2,3),]))
  }
  
  # word is not in vocab (two$phrase) chop off last word and 
  #recursively call predict function
  if (length(words) > 1){
    return(predict(paste(collapse=' ',words[-length(words)])))
  }
  
  
  return ("NA")
}


Clean_String <- function(string){
  
  #' Remove everything that is not a number or letter  
  temp <- stringr::str_replace_all(string,"[^a-zA-Z\\s]", "")
  # Lowercase
  temp <- tolower(temp)
  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  
  return(temp)
}

# Define server logic 
shinyServer(function(input, output) {
  out <- reactive({predict(input$input)})

  output$outputText <- renderText({
    
    out()[1]
  })
  
  output$outputTable <- renderTable(rownames=TRUE, colnames=FALSE, {
   
    out()
  })

  
})
