#  
#
#
#   Johns Hopkins / Coursera Data Science Capstone Project
#   By Mike Keyes
#   November 2017
#
#
###############################################################################

suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo)))




shinyUI(navbarPage("Johns Hopkins Data Science Capstone Project: Predicting the next word", 
                   
                   theme = shinytheme("flatly"),
  
  tabPanel("Next Word Prediction App",
    sidebarLayout(
      sidebarPanel(
         helpText("Type something in the box. The application will output the top 3 predicted next words"),
         hr(),
         textInput("input", "Type your text here"),
         br(),
         helpText("Note: The first prediction may take a few seconds while the app loads. Later predictions will be faster.")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         h3('Most likely next word: '), textOutput('outputText'), br(),
         hr(),
         h4('Top 3 suggested next words:') , br(), 
         tableOutput('outputTable')
         
      )
    )
  ),
  ## Tab 2 - About 
  
  tabPanel("About This Application",
           fluidRow(
             column(2,
                    p("")),
             column(8,
                    includeMarkdown("data/about.md")),
             column(2,
                    p(""))
           )
  ),
  
  
  ## Footer
  
  hr(), 
  br(),br(),
  span(
      ("Built in"), a( href="http://rstudio.com", target="_blank", "R Studio"),
      (" and "), a(href="http://shiny.rstudio.com", target="_blank", "Shiny"),
      align="center"),
  br()
)
)
  
  
  
