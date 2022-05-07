#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- shinyMobile::f7Page(
  title = "Single layout",
  shinyMobile::f7SingleLayout(
    navbar = shinyMobile::f7Navbar(
      title = "Single Layout",
      hairline = FALSE,
      shadow = TRUE
    ),
    toolbar = shinyMobile::f7Toolbar(
      position = "bottom",
      shinyMobile::f7Link(label = "Link 1", href = "https://www.google.com"),
      shinyMobile::f7Link(label = "Link 2", href = "https://www.google.com")
    ),
    # main content
    shinyMobile::f7Shadow(
      intensity = 10,
      hover = TRUE,
      shinyMobile::f7Card(
        title = "Card header",
        shinyMobile::f7Slider("obs", "Number of observations", 0, 1000, 500),
        plotOutput("distPlot"),
        footer = tagList(
          shinyMobile::f7Button(color = "blue", label = "My button", href = "https://www.google.com"),
          shinyMobile::f7Badge("Badge", color = "green")
        )
      )
    )
  )
)

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'madplan'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

