countRFiles <- function(base){
    rdir <- dir(file.path(base, "R"))
    pattern <- ".*\\.[Rr]"
    length(grep(pattern, rdir))
}
