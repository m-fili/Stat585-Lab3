% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thin.r
\name{thin}
\alias{thin}
\title{Making the shape file thin}
\usage{
thin(x, tolerance = 0.1)
}
\arguments{
\item{x}{A shape file}

\item{tolerance}{the value used for thinning the polygon (default=0.1)}
}
\value{
It returns a thinned data frame regarding the original shape file
}
\description{
This function helps you thin the data to avoid crashing your R session for very large shape files
}
\examples{
data("Iran")
dframe <- thin(Iran)

}
