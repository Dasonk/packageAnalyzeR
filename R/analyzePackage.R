#' Analyze a package
#' 
#' Analyze a packageo on CRAN
#' 
#' @param package Character. Name of the package to analyze
#' @export
analyzePackage <- function(package){
    
    packdir <- downloadAndExtract(package)
    
    packinfo <- list()
    
    packinfo[["description"]] <- readDescription(packdir)
    
    out <- c(unname(packinfo), recursive = TRUE)
    return(out)
}