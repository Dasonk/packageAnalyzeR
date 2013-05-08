#' Download source for package
#' 
#' Download the source code for an R package on CRAN
#' and extract it.  This uses a temporary directory and
#' returns the location of the extracted code.
#' 
#' @param package Character. Name of the package to download
#' @param tdir Directory to where to store the source code.
#' Defaults to a temporary directory
#' 
#' @export
#' @examples
#' \dontrun{
#' downloadAndExtract("reshape2")
#' }
downloadAndExtract <- function(package, tdir = tempdir()){
    # Check if there is a
    downloadeddir <- file.path(tdir, "downloaded_packages")
    file <- grep(paste0("^", package), dir(downloadeddir), value = T)
    if(length(file) == 1){
        targz <- file.path(downloadeddir, file)
    }else{
        down <- download.packages(package, destdir = tdir, type = "source")
        targz <- down[,2]
    }

    
    untar(targz, exdir = tdir)
    file.path(tdir, package)
}
