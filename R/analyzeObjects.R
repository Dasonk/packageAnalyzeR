#' @import pacman
analyzeObjects <- function(package){
    funs.exp <- p_funs(package, character.only = TRUE)
    funs.all <- p_funs(package, character.only = TRUE, all = TRUE)
    
    safeget <- function(fun, envir){
        tryCatch(get(fun, envir = envir, mode = "function"), 
                 error = function(e){NULL})
    }
    funslist <- sapply(funs.exp, 
                       safeget, 
                       envir = as.environment(paste0("package:", package)))
    
    funlength <- function(fun){
        length(capture.output(print(fun))) - 1
    }
    
    
    safefunlength <- function(fun){
        tryCatch(funlength(fun), error = function(e){NULL})
    }
    
    # unlist added for ggplot2 ...
    funs.length <- unlist(sapply(funslist, safefunlength))
    mean.length <- mean(funs.length)
    sd.length <- sd(funs.length)
    min.length <- min(funs.length)
    max.length <- max(funs.length)
    
    funs.n.param <- sapply(funslist, function(x){length(formals(x))})
    mean.param <- mean(funs.n.param)
    sd.param <- sd(funs.n.param)
    min.param <- min(funs.n.param)
    max.param <- max(funs.n.param)
    
    exported <- funs.all %in% funs.exp
    prop.exported <- mean(exported)
    n.exported <- length(funs.exp)
    n.all <- length(funs.all)
    
    underscore.all <- contains_underscores(funs.all)
    underscore.exp <- contains_underscores(funs.exp)
    prop.underscore.exp <- mean(underscore.exp)
    prop.underscore.all <- mean(underscore.all)
    
    cc.all <- isCamelCase(funs.all)
    cc.exp <- isCamelCase(funs.exp)
    prop.cc.exp <- mean(cc.exp)
    prop.cc.all <- mean(cc.all)
    
    ans <- c(mean.length.funs = mean.length,
             sd.length.funs = sd.length,
             min.length.funs = min.length,
             max.length.funs = max.length,
             mean.param.funs = mean.param,
             sd.param.funs = sd.param,
             min.param.funs = min.param,
             max.param.funs = max.param,
             prop.exported.funs = prop.exported,
             n.exported.funs = n.exported,
             n.all.funs = n.all,
             prop.underscore.exp = prop.underscore.exp,
             prop.underscore.all = prop.underscore.all,
             prop.cc.exp = prop.cc.exp,
             prop.cc.all = prop.cc.all)
    


    ans
}