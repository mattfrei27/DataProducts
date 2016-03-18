library(shiny)
library(datasets)

cars <- cars
mod <- lm(dist~speed,data=cars)

get.prediction <- function(speed) {
     raw.pred <- predict(mod,newdata = as.data.frame(speed,column.names=c('speed')))
     as.integer(round(raw.pred,2))
}


shinyServer(
  function(input, output) {
    output$speed <- renderPrint({input$speed})
    output$prediction <- renderPrint({get.prediction(input$speed)})
    output$plt <- renderPlot({
         plot(cars$speed,cars$dist,xlab = 'Speed (MPH)',ylab = 'Stopping Distance (Feet)')
         title('Speed and Stopping Distances')
         abline(mod)
         points(x=input$speed,y=get.prediction(input$speed),pch=13,col = 'red',cex=3)}
    )
  }
)
