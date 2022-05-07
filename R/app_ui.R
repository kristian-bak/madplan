#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- shinyMobile::f7Page(
  
  options = list(theme = "ios", dark = TRUE),
  
  title = "Madplan",
  
  shinyMobile::f7TabLayout(
    
    navbar = shinyMobile::f7Navbar(
      title = "Madplan",
      hairline = FALSE,
      shadow = TRUE
    ),
    
    shinyMobile::f7Tabs(
      
      animated = FALSE,
      swipeable = TRUE,
      
      shinyMobile::f7Tab(
        tabName = "Madplan",
        active = TRUE,
        icon = shinyMobile::f7Icon("calendar_circle"),
        shinyMobile::f7DatePicker(inputId = "pick_date", label = "Dato", value = Sys.Date()),
        shinyMobile::f7TextArea(inputId = "type_breakfast", label = "Morgenmad"),
        shinyMobile::f7TextArea(inputId = "type_lunch", label = "Middagsmad"),
        shinyMobile::f7TextArea(inputId = "type_dinner", label = "Aftensmad"),
        shinyMobile::f7Button(inputId = "go_save", label = "Gem")
      ),
      
      shinyMobile::f7Tab(
        tabName = "Historik", 
        icon = shinyMobile::f7Icon("chart_bar_circle_fill")
      )
      
    )
  )
)
