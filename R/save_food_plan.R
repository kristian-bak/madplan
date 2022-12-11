#' Save food plan
#' @param date date in the format yyyy-mm-dd
#' @param breakfast character string with information on breaskfast
#' @param lunch character string with information on lunch 
#' @param dinner character string with information on dinner 
#' @param token token, output from drop_auth_refreshable
#' @return named list with:
#' * df_input: tibble with all inputs
#' * df_saved: tibble with inputs modified according to `replace_eol`
#' 
save_food_plan <- function(date, breakfast, lunch, dinner, token) {
  
  df_input <- dplyr::tibble(
    Date = date %>% as.Date(), 
    Breakfast = breakfast,
    Lunch = lunch,
    Dinner = dinner
  )
  
  df_saved <- df_input %>% 
    dplyr::mutate(    
      Breakfast = Breakfast %>% replace_eol(old = "\\\n", new = "--break--"), 
      Lunch = Lunch %>% replace_eol(old = "\\\n", new = "--break--"), 
      Dinner = Dinner %>% replace_eol(old = "\\\n", new = "--break--")
    )
  
  file_name_txt <- "data.txt"
  
  file_txt <- paste0("data/", file_name_txt)
  
  write.table(x = df_saved, file = "data/data.txt",  
              append = TRUE, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ";")
  
  rdrop2::drop_upload(file = "data/data.txt", dtoken = token)
  
  out <- list("df_input" = df_input, 
              "df_saved" = df_saved)
  
  return(out)
  
}