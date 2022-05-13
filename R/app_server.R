#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  init_food_plan()
  
  react_var <- reactiveValues(data = load_food_plan())
  
  observeEvent(input$go_save, {
    
    df_saved <- save_food_plan(
      date = input$pick_date, 
      breakfast = input$type_breakfast, 
      lunch = input$type_lunch, 
      dinner = input$type_dinner
    )
    
    react_var$data <- dplyr::bind_rows(react_var$data, df_saved$df_input)
    
    shiny::showNotification(
      ui = "Madplanen er gemt", 
      duration = 2.5, 
      type = "message", 
      session = session, 
      closeButton = TRUE
    )
    
  })
  
  date_selected <- reactive({
    
    as.Date(input$pick_date)
    
  })
  
  breakfast <- reactive({
    
    pull_subset(data = react_var$data, var = "Breakfast", Date == date_selected())
    
  })
  
  lunch <- reactive({
    
    pull_subset(data = react_var$data, var = "Lunch", Date == date_selected())
    
  })
  
  dinner <- reactive({
    
    pull_subset(data = react_var$data, var = "Dinner", Date == date_selected())
    
  })
  
  observe({
    shinyMobile::updateF7TextArea(inputId = "type_breakfast", value = breakfast())
    shinyMobile::updateF7TextArea(inputId = "type_lunch", value = lunch())
    shinyMobile::updateF7TextArea(inputId = "type_dinner", value = dinner())
  })

  
}