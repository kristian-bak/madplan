#' Download food plan
#' 
download_food_plan <- function(data, file) {
  
  data_to_save <- data %>% 
    dplyr::mutate(Breakfast = replace_eol(Breakfast), 
                  Lunch = replace_eol(Lunch), 
                  Dinner = replace_eol(Dinner))
  
  write.table(x = data_to_save, file = file,  
              quote = FALSE, row.names = FALSE, sep = ";")
  
}