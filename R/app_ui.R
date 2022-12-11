#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(req) {
  
  shinyMobile::f7Page(
  
    options = list(theme = "ios", dark = TRUE, pullToRefresh = TRUE),
    
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
          shinyMobile::f7DatePicker(inputId = "pick_date", label = "Dato", value = lubridate::today(tzone = "Europe/Copenhagen"), dateFormat = "dd.mm.yyyy"),
          shinyMobile::f7TextArea(inputId = "type_breakfast", label = "Morgenmad"),
          shinyMobile::f7TextArea(inputId = "type_lunch", label = "Middagsmad"),
          shinyMobile::f7TextArea(inputId = "type_dinner", label = "Aftensmad"),
          shinyMobile::f7Button(inputId = "go_save", label = "Gem"),
          shinyjs::useShinyjs(),
          shinyjs::hidden(
            shinyMobile::f7DownloadButton(outputId = "download_data", label = "Download", 
                                          style = "background: red")
          ),
          shinyMobile::f7Col(
            shinyMobile::f7Chip(label = show_version_number(), status = "black")
          )
        ),
        
        shinyMobile::f7Tab(
          tabName = "Historik", 
          icon = shinyMobile::f7Icon("chart_bar_circle_fill")
        ),
        
        shinyMobile::f7Tab(
          tabName = "Favoritter", 
          icon = shinyMobile::f7Icon("heart_fill")
        ),
        
        shinyMobile::f7Tab(
          tabName = "Ideer", 
          icon = shinyMobile::f7Icon("lightbulb")
        )
        
      )
    )
  )
}
