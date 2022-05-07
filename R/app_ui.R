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
        shinyMobile::f7DatePicker(inputId = "date", label = "Dato", value = Sys.Date()),
        shinyMobile::f7TextArea(inputId = "breakfast", label = "Morgenmad"),
        shinyMobile::f7TextArea(inputId = "breakfast", label = "Middagsmad"),
        shinyMobile::f7TextArea(inputId = "breakfast", label = "Aftensmad"),
        shinyMobile::f7Button(inputId = "go_save", label = "Gem")
      ),
      
      shinyMobile::f7Tab(
        tabName = "Historik", 
        icon = shinyMobile::f7Icon("chart_bar_circle_fill")
      )
      
    )
  )
)
