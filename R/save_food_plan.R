#' Save food plan
#' @param date date in the format yyyy-mm-dd
#' @param breakfast character string with information on breaskfast
#' @param lunch character string with information on lunch 
#' @param dinner character string with information on dinner 
#' @return invisible TRUE
#' 
save_food_plan <- function(date, breakfast, lunch, dinner) {
  
  df_new <- dplyr::tibble(
    Date = date %>% as.Date(), 
    Breakfast = breakfast, 
    Lunch = lunch, 
    Dinner = dinner
  )
  
  file_name_txt <- "data.txt"
  
  file_txt <- paste0("data/", file_name_txt)
  
  write.table(x = df_new, file = file_txt,  
              append = TRUE, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ";")
  
  return(invisible(TRUE))
  
}