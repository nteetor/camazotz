#' Readable Numeric Vectors
#'
#'
#' @export
composition.numeric <- function(x, n = NULL, ...) {
  hdr <- paste('#', this_is(x), 'vector:', length(x))
  bdy <- paste(head(x, n %||% length(x)), collapse = ' ')

  output <- c(hdr, bdy)
  if (!is.null(n) && n < length(x)) {
    d <- length(x) - n
    ftr <- paste('# with', d, 'more', 'component' %s?% d)
    output <- c(output, ftr)
  }

  paste(output, collapse = '\n')
}

#' @rdname composition.numeric
composition.integer <- function(x, n = NULL, ...) {
  composition.numeric(x, n = n, ...)
}
