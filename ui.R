library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Stopping Distance Predictions"),
  
    sidebarPanel(
         strong("Enter vehicle speed between 5 and 25 miles per hour"),
      numericInput('speed', 'speed (mph)', 15, min = 5, max = 25, step = 1)
    ),
    mainPanel(
        h3('Model Prediction'),
        h4('Selected speed:'),
        verbatimTextOutput("speed"),
        h4('Predicted stopping distance:'),
        verbatimTextOutput("prediction"),
        p('Points below represent individual cars. The red marker represents the estimated stopping distance for the imputted speed.'),
        plotOutput('plt'),
        p('Note that this analysis is based on data recorded in the 1920s.')
    )
  )
)

