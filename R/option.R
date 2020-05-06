transdoc_to <- function(to = "default") {
  if (identical(to, "default")) {
    return(getOption("transdoc_to", "en"))
  }
  to
}
