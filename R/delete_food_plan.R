#' Delete food plan
#' @param token token, output from drop_auth_refreshable
delete_food_plan <- function() {
  
  file_name_txt <- "data.txt"
  
  file_txt <- paste0("data/", file_name_txt)
  
  if (file.exists(file_txt)) {
    file.remove(file_txt)
  }
  
  if (rdrop2::drop_exists(path = "/data.txt", dtoken = token)) {
    rdrop2::drop_delete(path = "/data.txt", dtoken = token)
  }
  
  return(invisible(TRUE))
  
}