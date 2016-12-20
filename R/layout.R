grid <- function(x) {
  content_width <- 80

  buffer <- ''
  grid_rows <- lapply(
    pad(as.character(x), max(nchar(x))),
    function(c) {
      if (nchar(buffer) + nchar(c) > content_width) {
        output <- buffer
        buffer <<- c
        return(output)
      }
      buffer <<- paste(buffer, c)
      NULL
    }
  )

  filtered_rows <- Filter(Negate(is.null), grid_rows)
  char_rows <- vapply(filtered_rows, as.character, character(1))
  char_rows <- c(char_rows, buffer)

  paste(char_rows, collapse = '\n')
}
