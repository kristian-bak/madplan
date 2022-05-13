#' Delete food plan
#' 
delete_food_plan <- function() {
  
  file_name_txt <- "data.txt"
  
  file_txt <- paste0("data/", file_name_txt)
  
  if (!file.exists(file_txt)) {
    return()
  }
  
  file.remove(file_txt)
  
}