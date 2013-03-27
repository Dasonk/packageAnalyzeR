#' Is the input camelCase
#' 
#' Checks if the input is in camelCase
#' 
#' @param funs Character vector
#' 
#' @export
#' @examples
#' funs <- c("ggplot_aes", "camelCase", "AndStuff")
#' isCamelCase(funs)
isCamelCase <- function(funs){
    pattern <- "[a-z][A-Z]"
    alt <- grepl(pattern, funs)
    patternlower <- "^[a-z]"
    startslower <- grepl(patternlower, funs)
    alt & startslower
}
