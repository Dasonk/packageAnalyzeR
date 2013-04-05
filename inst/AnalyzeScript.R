# set.seed(500)
# n <- 10
# packs <- available.packages()
# toget <- sample(packs[,1], n)

load_all()

packages <- c("adabag", "akima", "animation", "ascii", "base64", "benchmark", 
              "biglm", "bigmemory", "bitops", "boot", "brew", "cfa", "changepoint", 
              "chron", "classifly", "classify", "cluster", "coda", "codetools", 
              "colorspace", "combinat", "data.table", "dbConnect", "devtools", 
              "directlabels", "distr", "dlm", "Dmisc", "DMwR", "e1071", "esotericR", 
              "evaluate", "ez", "flexmix", "foreach", "foreign", "formatR", 
              "fortunes", "fun", "FunCluster", "functional", "FunNet", "gam", 
              "gamclass", "gamlr", "gdata", "geoR", "geoRglm", "GGally", "ggmap", 
              "ggmcmc", "ggparallel", "ggplot2", "ggsubplot", "ggthemes", "gridExtra", 
              "gsubfn", "gtable", "gtools", "gWidgets", "gWidgetsRGtk2", "h5r", 
              "hash", "hashFunction", "HLMdiag", "Hmisc", "httr", "inline", 
              "int64", "iplots", "jpeg", "Julia", "kernlab", "KernSmooth", 
              "knitr", "lattice", "lda", "LearnBayes", "lisp", "lme4", "lubridate", 
              "mapplots", "markdown", "MASS", "matlab", "Matrix", "memoise", 
              "mice", "microbenchmark", "mnormt", "msm", "multcomp", "mvtnorm", 
              "nlme", "nnet", "pander", "plotrix", "plyr", "productplots", 
              "profr", "proto", "quadprog", "qvalue", "randomForest", "rbenchmark", 
              "RColorBrewer", "Rcpp", "RcppArmadillo", "RcppClassic", "RcppClassicExamples", 
              "RcppEigen", "RCurl", "Rd2roxygen", "reports", "reshape", "reshape2", 
              "rgl", "RgoogleMaps", "RGtk2", "rJava", "rjson", "RMySQL", "Rook", 
              "roxygen2", "rpart", "RUnit", "RWeka", "scales", "sos", "spatial", 
              "splines", "sqldf", "stargazer", "stats", "stats4", "stringr", 
              "sudoku", "survival", "taRifx", "TeachingDemos", "testthat", 
              "tm", "tmvtnorm", "tools", "tree", "tuneR", "twitteR", "Unicode", 
              "unknownR", "VGAM", "whisker", "wordcloud", "wordnet", "XML", 
              "xtable", "zoo")

cranpacks <- available.packages()[,1]

toAnalyze <- packages[packages %in% cranpacks]

safeAnalyze <- function(package){
    # This will completely ignore packages that had an error somewhere...
    tryCatch(analyzePackage(package, temp = FALSE), error = function(e){NULL})
}

sink("inst/output.txt")
out <- lapply(packages, safeAnalyze)
sink(NULL)

dat <- as.data.frame(do.call(rbind, out))

packages[!(packages %in% dat[,1])]
toAnalyze[!(toAnalyze %in% dat[,1])]

write.csv(dat, file = "inst/packagedata.csv")