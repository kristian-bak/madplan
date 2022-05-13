#' Replace end of line
#' @param x character vector
#' @param old old eol (end of line) character (defalt is \n)
#' @param new new eol (end of line) character (default is --break--)
#' @details 
#' `replace_eol` allows line breaking characters in .txt files without having issues when loading/saving tables
#'  
replace_eol <- function(x, old = "\\n", new = "--break--") {
  
  gsub(pattern = old, replacement = new, x = x)
  
}