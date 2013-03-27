#' Contains underscores
#' 
#' Does the input contain an underscore
#' 
#' @param funs Character vector
#' @export
contains_underscores <- function(funs){
    grepl("_", funs)
}