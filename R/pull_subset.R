#' Pull subset
#' @param data tibble (see `load_food_plan`)
#' @param var character string with variable name
#' @param ... additional filtering
#' 
pull_subset <- function(data, var, ...) {
  
  if (is.null(data)) {
    return(NULL)
  }
  
  data %>% 
    dplyr::filter(...) %>% 
    dplyr::slice(dplyr::n()) %>% 
    dplyr::pull(var)
  
}