#' Readable Data Frames (tibbles)
#'
#' For now this function is a wrapper around \code{\link{print.tbl_df}} in
#' \pkg{tibble}.
#'
#' @details
#'
#' For more information about tibbles, please refer to \code{\link{tibble}}
#'
#' @export
composition.data.frame <- function(x, ..., n = NULL, width = NULL, n_extra) {
  print(tibble::as_tibble(x, ..., n = n, width = width, n_extra = n_extra))
}
