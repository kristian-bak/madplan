#' Initialize food plan
#' @param token token, output from drop_auth_refreshable
init_food_plan <- function(token) {
  
  file_name_txt <- "data.txt"
  
  file_txt <- paste0("data/", file_name_txt)
  
  if (file.exists(file_txt)) {
    return()
  }
  
  df_init <- dplyr::tibble(
    Date = as.Date(character(0)),
    Breakfast = character(),
    Lunch = character(),
    Dinner = character()
  )
  
  write.table(
    x = df_init, 
    file = file_txt,  
    quote = FALSE, 
    row.names = FALSE, 
    col.names = TRUE, 
    sep = ";"
  )
  
  if (!rdrop2::drop_exists(path = "/data.txt")) {
    rdrop2::drop_upload(file = file_txt, dtoken = token)
  }
  
}