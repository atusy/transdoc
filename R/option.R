transdoc_to <- function(to = "default") {
  if (identical(to, "default")) {
    return(getOption("transdoc_to", "en"))
  }
  nm <- names(language)
  to <- match.arg(to, c(nm, language))
  if (to %in% nm) language[to] else to
}
