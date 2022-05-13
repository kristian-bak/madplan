#' Load food plan
#' @return tibble with existing food plan (empty food plan if non-existing)
#' 
load_food_plan <- function() {
  
  file_name <- get_file_name()
  
  if (!file.exists(file_name)) {
    return(empty_food_plan())
  }
  
  read.table(file = file_name, header = TRUE, sep = ";", 
             colClasses = c("Date", "character", "character", "character")) %>% 
    dplyr::as_tibble() %>% 
    dplyr::mutate(
      Breakfast = replace_eol(x = Breakfast, old = "--break--", new = "\\\n"),
      Lunch     = replace_eol(x = Lunch, old = "--break--", new = "\\\n"), 
      Dinner    = replace_eol(x = Dinner, old = "--break--", new = "\\\n")
    )
  
}

#' Empty food plan
#' @return tibble
#' 
empty_food_plan <- function() {
  
  #dplyr::tibble()
  
  return(NULL)
  
}