
## Document and reload
golem::document_and_reload()

## Run app
run_app()

## Add dependency
usethis::use_package("shiny")
usethis::use_package("shinyMobile")
usethis::use_package("shinyWidgets")

## Renv
renv::init()
renv::status()

## Deploy
rsconnect::deployApp()
