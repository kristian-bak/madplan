#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  ## Make sure dev/token.RDS indeed points to the latest
  ## call for rdrop2::drop_auth (see token.R)
  
  ## Ran this once:
  #token <- drop_auth_refreshable()
  #
  #saveRDS(object = token, file = "dev/token.RDS")
  
  token <- readRDS("dev/token.RDS")
  
  out <- catch_error(
    rdrop2::drop_dir(dtoken = token, limit = 1)
  )
  
  if (!is.null(out$error)) {
    token$refresh()
  }
  
  init_food_plan()
  
  react_var <- reactiveValues(data = load_food_plan(token = token))
  
  observeEvent(input$go_save, {
    
    df_saved <- save_food_plan(
      date = as.POSIXct(input$pick_date, tz = "Europe/Copenhagen"),
      breakfast = input$type_breakfast, 
      lunch = input$type_lunch, 
      dinner = input$type_dinner, 
      token = token
    )
    
    react_var$data <- dplyr::bind_rows(react_var$data, df_saved$df_input)
    
    #shiny::showNotification(
    #  ui = "Madplanen er gemt", 
    #  duration = 2.5, 
    #  type = "message", 
    #  session = session, 
    #  closeButton = TRUE
    #)
    
    shinyMobile::f7Notif(
      icon = shinyMobile::f7Icon("checkmark"),
      title = "Gemt",
      text = "",
      titleRightText = ""
    )
    
  })
  
  date_selected <- reactive({
    
    format(lubridate::as_date(input$pick_date), "%Y-%m-%d")
    
  })
  
  observe({
    print(date_selected())
  })
  
  breakfast <- reactive({
    
    pull_subset(data = react_var$data, var = "Breakfast", as.character(Date) == date_selected())
    
  })
  
  lunch <- reactive({
    
    pull_subset(data = react_var$data, var = "Lunch", as.character(Date) == date_selected())
    
  })
  
  dinner <- reactive({
    
    pull_subset(data = react_var$data, var = "Dinner", as.character(Date) == date_selected())
    
  })
  
  observe({
    shinyMobile::updateF7TextArea(inputId = "type_breakfast", value = breakfast())
    shinyMobile::updateF7TextArea(inputId = "type_lunch", value = lunch())
    shinyMobile::updateF7TextArea(inputId = "type_dinner", value = dinner())
  })
  
  output$download_data <- downloadHandler(
    filename = function() {
      "data.txt"
    },
    content = function(file) {
      download_food_plan(data = react_var$data, file = file, token = token)
    }
  )
  
  observe({
    
    req(input$deviceInfo$os)
    
    if (input$deviceInfo$os == "windows") {
      shinyjs::show(id = "download_data")
    }
    
  })

}