#' Generating the data frame associated with a shape file
#'
#' It takes either a file_path indicating the path to the shape file the shape file of class sf itself, and
#' creates a tidy data frame with lat, long, order and group attributes.
#'
#' @param file Either a file path to the shape file or an data of class sf.
#' @param tolerance The value for thinning the polygon (default=0.1).
#'
#' @import sf
#' @import purrr
#' @import dplyr
#'
#' @export
#'
#' @return It returns a data frame with longitude, latitude, order and group for the polygon of the given shape
#' file.
#'
#' @examples
#' data("Iran")
#' df <- team_2(Iran, 0.1)
#'
team_2 <- function(file, tolerance) {

  if ("character" %in% class(file)) {
    oz <- read_sf(file)
    oz <- thin(oz, tolerance = tolerance)
  }

  if ("sf" %in% class(file)) {
    oz <- file
  }

  ozgeo = oz$geometry

  f = function(l){
    l = l %>% flatten() %>% flatten()
    for(i in 1:length(l)){
      l[[i]] = data.frame(l[[i]])
      colnames(l[[i]]) = c('long', 'lat')
      l[[i]]$order = 1:nrow(l[[i]])
      l[[i]]$group = i
    }
    do.call(rbind, l)
  }

  df = f(ozgeo)

}

