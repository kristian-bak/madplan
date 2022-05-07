#' Load food plan
#' @return tibble with existing food plan (empty food plan if non-existing)
#' 
load_food_plan <- function() {
  
  file_name <- get_file_name()
  
  if (!file.exists(file_name)) {
    return(empty_food_plan())
  }
  
  read.table(file = file_name, header = TRUE, sep = ";")
  
}

#' Empty food plan
#' @return tibble
#' 
empty_food_plan <- function() {
  
  #dplyr::tibble()
  
  return(NULL)
  
}