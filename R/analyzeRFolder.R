analyzeRFolder <- function(base){
    path <- file.path(base, "R")
    filenames <- dir(path, pattern = ".*\\.[RrSsq]")
    files <- file.path(path, filenames)

    contents <- lapply(files, readLines, warn = FALSE)
    
    n.files <- length(files)
    if(n.files == 0){
        stop("... should program this in")
    }
    
    length.files <- sapply(contents, length)
    mean.length <- mean(length.files)
    median.length <- median(length.files)
    sd.length <- sd(length.files)
    min.length <- min(length.files)
    max.length <- max(length.files)
    sum.length <- sum(length.files)

    
    ans <- c(n.Rfiles = n.files,
             mean.length.Rfiles = mean.length,
             median.length.Rfiles = median.length,
             sd.length.Rfiles = sd.length,
             min.length.Rfiles = min.length,
             max.length.Rfiles = max.length,
             sum.length.Rfiles = sum.length)
    
    ans
    

}