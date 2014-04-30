\name{downloadAndExtract}
\alias{downloadAndExtract}
\title{Download source for package}
\usage{
downloadAndExtract(package, tdir = tempdir())
}
\arguments{
  \item{package}{Character. Name of the package to
  download}

  \item{tdir}{Directory to where to store the source code.
  Defaults to a temporary directory}
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

