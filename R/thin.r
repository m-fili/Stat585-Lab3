#' Making the shape file thin
#'
#' This function helps you thin the data to avoid crashing your R session for very large shape files
#'
#'
#' @param x A shape file
#' @param tolerance the value used for thinning the polygon (default=0.1)
#' @import rmapshaper
#' @export
#' @return It returns a thinned data frame regarding the original shape file
#' @examples
#' data("Iran")
#' dframe <- thin(Iran)
#'
thin <- function(x, tolerance = 0.1){
  rmapshaper::ms_simplify(x, snap_interval = tolerance)
}
