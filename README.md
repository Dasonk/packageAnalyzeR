# packageAnalyzeR

This package was developed to facilitate data collection for the Stat 503 (Data Mining) final project.  The goal is to make it easy to download the source code of a package from CRAN and create various statistics for the package.  Once enough data is collected we can use the collected data to try to cluster the packages to see which packages are written in a similar manner.

Some examples of statistics that will eventually be supported:

* Number of .R files
* Average number of lines in each .R file
* Total number of lines over all .R files
* Spaces or tabs for indentations (probably won't make it in)
* Number of spaces per indentation level (probably won't make it in)
* Proportion of function names using camelCase
* Proportion of function names using under_scores
* Average number of definition (functions, environments, ...) per .R file
* Proportion of functions that are exported
* Number of other language source files used (C, C++, Fortran, Perl, ...)
* Average number of examples per exported function
* Average number of parameters per function
* Maximum number of parameters per function
* Does it use roxygen?
* Average length of help files
* Total length of test files
* License used
* Version format (major.minor, major.minor.tiny, major.minor-tiny)
* Number of Depends
* Number of Imports
* Number of Suggests
* Function definitions on a single line?


## Installation

Currently there isn't a release on [CRAN](http://cran.r-project.org/).

You can, however, download the [zip ball](https://github.com/Dasonk/packageAnalyzeR/zipball/master) or [tar ball](https://github.com/Dasonk/packageAnalyzeR/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **devtools** package to install the development version:

```r
## Make sure your current packages are up to date
update.packages()
## devtools is required
library(devtools)
install_github("packageAnalyzeR", "Dasonk")
```

Note: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.


## Help

For help you can figure it out yourself.  Eventually there will be help support but not yet.  Deal with it.