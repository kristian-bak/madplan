
## Document and reload
golem::document_and_reload()

## Load all functions
devtools::load_all()

## Run app
run_app()

## Bump version
usethis::use_version()

## Run tests
devtools::test()

## Add test
usethis::use_test("load_food_plan")

## Add dependency
usethis::use_package("shiny")
usethis::use_package("shinyMobile")
usethis::use_package("shinyWidgets")
usethis::use_package("shinyjs")
usethis::use_package("dplyr")
usethis::use_package("rdrop2")
usethis::use_package("lubridate")

## Renv
renv::init()
renv::status()

## Deploy
rsconnect::deployApp()

## Adding NEWS file
usethis::use_news_md()

## Pipe operator
usethis::use_pipe()
