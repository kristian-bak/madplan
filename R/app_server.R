#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  observeEvent(input$go_save, {
    
    shiny::showNotification(
      ui = "Madplanen er gemt", 
      duration = 2.5, 
      type = "message", 
      session = session, 
      closeButton = TRUE
    )
    
  })
  
}