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
    alternatesLowerToUpper <- grepl(pattern, funs)
    patternLower <- "^[a-z]"
    startsLower <- grepl(patternLower, funs)
    alternatesLowerToUpper & startsLower
}
