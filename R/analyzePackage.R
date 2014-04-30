#' Analyze a package
#' 
#' Analyze a package on CRAN
#' 
#' @param package Character. Name of the package to analyze
#' @param temp logical. If the package isn't currently installed
#' do you want it to be installed temporarily or permanently? TRUE gives
#' a temporary install - FALSE installs the package permanently.
#' @export
analyzePackage <- function(package, temp = TRUE){
    
    loaded <- do.call(p_loaded, list(package))
    
    # install and load package
    #p_load_single(package, temp = temp)
    #p_load(package, temp = temp, character.only = TRUE)
    if(!require(package, character.only = TRUE)){
        if(temp){
            temppath <- tempdir()
            currentLibPaths <- .libPaths()
            # Add the temp path to libPaths so that it can be loaded...
            if(!temppath %in% currentLibPaths){
                .libPaths(c(currentLibPaths, temppath))
            }
            # Install into the temppath
            install.packages(package, lib = temppath)
        }else{
            install.packages(package)
        }
        require(package, character.only = TRUE)
    }
    # Get package source code
    packdir <- downloadAndExtract(package)
    
    # Create list to collect information
    packinfo <- list()
    packinfo[["description"]] <- readDescription(packdir)
    packinfo[["rfolder"]] <- analyzeRFolder(packdir)
    packinfo[["rfunctions"]] <- analyzeObjects(package)
    
    out <- c(unname(packinfo), recursive = TRUE)
    
    # Don't pollute the namespace too much... unload the package
    # if it wasn't already loaded.
    #p_unload(package, character.only = TRUE)
    if(!loaded){
        tmp <- paste0("package:", package)
        suppressWarnings(detach(tmp, character.only = TRUE,force = TRUE, unload = TRUE))
    }
    # Don't delete the package though... if it was a temp
    # install it will get deleted eventually anyways
    
    return(out)
}