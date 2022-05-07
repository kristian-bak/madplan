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
        tabName = "Tab 1",
        icon = shinyMobile::f7Icon("envelope"),
        active = TRUE,
        shinyMobile::f7Shadow(
          intensity = 10,
          hover = TRUE,
          shinyMobile::f7Card(
            title = "Card header",
            shinyMobile::f7Stepper(
              "obs1",
              "Number of observations",
              min = 0,
              max = 1000,
              value = 500,
              step = 100
            ),
            plotOutput("distPlot1"),
            footer = tagList(
              shinyMobile::f7Button(inputId = "tapHold", label = "My button"),
              shinyMobile::f7Badge("Badge", color = "green")
            )
          )
        )
      ),
      shinyMobile::f7Tab(
        tabName = "Tab 2",
        icon = shinyMobile::f7Icon("today"),
        active = FALSE,
        shinyMobile::f7Shadow(
          intensity = 10,
          hover = TRUE,
          shinyMobile::f7Card(
            title = "Card header",
            shinyMobile::f7Select(
              inputId = "obs2",
              label = "Distribution type:",
              choices = c(
                "Normal" = "norm",
                "Uniform" = "unif",
                "Log-normal" = "lnorm",
                "Exponential" = "exp"
              )
            ),
            plotOutput("distPlot2"),
            footer = tagList(
              shinyMobile::f7Button(label = "My button", href = "https://www.google.com"),
              shinyMobile::f7Badge("Badge", color = "orange")
            )
          )
        )
      ),
      shinyMobile::f7Tab(
        tabName = "Tab 3",
        icon = shinyMobile::f7Icon("cloud_upload"),
        active = FALSE,
        shinyMobile::f7Shadow(
          intensity = 10,
          hover = TRUE,
          shinyMobile::f7Card(
            title = "Card header",
            shinyMobile::f7SmartSelect(
              inputId = "variable",
              label = "Variables to show:",
              c("Cylinders" = "cyl",
                "Transmission" = "am",
                "Gears" = "gear"),
              multiple = TRUE,
              selected = "cyl"
            ),
            tableOutput("data"),
            footer = tagList(
              shinyMobile::f7Button(label = "My button", href = "https://www.google.com"),
              shinyMobile::f7Badge("Badge", color = "green")
            )
          )
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

