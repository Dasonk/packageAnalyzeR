\name{downloadAndExtract}
\alias{downloadAndExtract}
\title{Download source for package}
\usage{
  downloadAndExtract(package)
}
\arguments{
  \item{package}{Character. Name of the package to
  download}
}
\description{
  Download the source code for an R package on CRAN and
  extract it.  This uses a temporary directory and returns
  the location of the extracted code.
}
\examples{
\dontrun{
downloadAndExtract("reshape2")
}
}

