#' Download food plan
#' @param data tibble with food plan
#' @param file character string
#' @param token token, output from drop_auth_refreshable
download_food_plan <- function(data, file, token) {
  
  data_to_save <- data %>% 
    dplyr::mutate(Breakfast = replace_eol(Breakfast), 
                  Lunch = replace_eol(Lunch), 
                  Dinner = replace_eol(Dinner))
  
  rdrop2::drop_download(path = "data.txt", local_path = file, dtoken = token)
  
}