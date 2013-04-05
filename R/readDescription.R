readDescription <- function(basedir){
    dfile <- file.path(basedir, "DESCRIPTION")
    if(!file.exists(dfile)){
        return(NULL)
    }
    
    #
    des <- read.dcf(dfile, all = TRUE)
    
    name <- des[["Package"]]
    author <- des[["Author"]]
    license <- des[["License"]]
    version <- versionScheme(des[["Version"]])
    
    # Extract the number of dependencies
    n.depends <- descValue("Depends", des)
    n.imports <- descValue("Imports", des)
    n.suggests <- descValue("Suggests", des)
    


    
    ans <- c(name = name, 
             author = author,
             license = license,
             version = version,
             n.depends = n.depends, 
             n.imports = n.imports, 
             n.suggests = n.suggests)
    
    ans
}

versionScheme <- function(version){
    patterns <- list('x.x' = "^\\d+\\.\\d+$",
                     'x.x.x' = "^\\d+\\.\\d+\\.\\d+$",
                     'x.x.x.x' = "^\\d+\\.\\d+\\.\\d+\\.\\d+$",
                     'x.x-x' = "^\\d+\\.\\d+\\-\\d+$",
                     'x.x.x-x' = "^\\d+\\.\\d+\\.\\d+-\\d+$")
    
    out <- names(which(sapply(patterns, grepl, version)))
    if(length(out) > 1 | length(out) == 0){
        out <- "other"
    }
    
    out
    
}

descValue <- function(value, des){
    if(! value %in% names(des)){
        return(0)
    }
    
    val <- des[[value]]
    val <- gsub("\n", " ", val)
    val <- strsplit(val, ",")[[1]]
    return(length(val))
}