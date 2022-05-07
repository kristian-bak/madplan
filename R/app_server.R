#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  output$distPlot1 <- renderPlot({
    dist <- rnorm(input$obs1)
    hist(dist)
  })
  
  output$distPlot2 <- renderPlot({
    dist <- switch(
      input$obs2,
      norm = rnorm,
      unif = runif,
      lnorm = rlnorm,
      exp = rexp,
      rnorm
    )
    
    hist(dist(500))
  })
  
  output$data <- renderTable({
    mtcars[, c("mpg", input$variable), drop = FALSE]
  }, rownames = TRUE)
}