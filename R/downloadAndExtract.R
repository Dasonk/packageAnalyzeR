#' Download source for package
#' 
#' Download the source code for an R package on CRAN
#' and extract it.  This uses a temporary directory and
#' returns the location of the extracted code.
#' 
#' @param package Character. Name of the package to download
#' 
#' @export
#' @examples
#' downloadAndExtract("reshape2")
downloadAndExtract <- function(package){
    tdir <- tempdir()
    down <- download.packages(package, destdir = tdir)
    targz <- down[,2]
    untar(targz)
    file.path(tdir, package)
}
