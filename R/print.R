#' @export
print.transdoc_help <- function(x, translate_to = "default", ...) {
  print.transdoc(translate(x, to = translate_to, ...))
}

print.transdoc_website <- function(x, ...) {
  str(x)
  x$to <- transdoc_to(x$to)
  browseURL(url_google_translate(x$to, x$url))
  invisible(x)
}


