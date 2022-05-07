#' Initialize food plan
#' 
init_food_plan <- function() {
  
  file_name_txt <- "data.txt"
  
  file_txt <- paste0("data/", file_name_txt)
  
  if (file.exists(file_txt)) {
    return()
  }
  
  df_init <- data.frame(
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
  
}