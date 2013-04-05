gather_R_di <- function(file, basedir){
    filename <- file.path(basedir, "R", file)
    
    env <- new.env()
    source(filename, keep.source = TRUE, local = env)
    text <- readLines(filename, warn = FALSE)
    vals <- ls(env, all = TRUE)
    grep(paste0("^\ *", vals[1]), text)
    fundef <- capture.output(print(get(vals[1], envir = ne)))
    
}