#' Reable R Objects
#'
#' Associate a human-readable version with a \R object. Under the hood all
#' \code{readable} does is add the \code{readable} to the classes of \code{x}.
#'
#' @param x An \R object
#'
#' @details
#'
#' @export
readable <- function(x, ...) {
  UseMethod('readable')
}

readable.default <- function(x, ...) {
  class(x) <- c('readable', class(x))
  x
}

print.readable <- function(x, ...) {
  old_classes <- class(x)
  class(x) <- class(x)[-1]
  cat(composition(x))
  class(x) <- old_classes
  invisible(x)
}

composition <- function(x, n = NULL, ...) {
  UseMethod('composition')
}

composition.readable <- function(x, ...) {
  NextMethod('composition')
}
