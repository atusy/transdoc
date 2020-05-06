translate <- function(doc, to = "default", from = "auto", ...) {
  UseMethod("translate")
}

`%to%` <- function(doc, to = "default") {
  translate(doc, deparse(substitute(to)))
}

translate.character <- function(doc, to = "default", from = "auto", ...) {
  if (length(doc) != 1L && !grepl("https?://", doc)) {
    stop(
      "If `doc` is a character vector",
      'it must be an URL starting with "http://" or "https://".'
    )
  }

  structure(list(url = doc, to = to, from = from, ...), class = "transdoc_website")
}

translate.transdoc_help <- function(doc, to = "default", from = "auto", ...) {
  translate.character(
    doc = do.call(
      url_rdocumentation,
      attr(doc, "transdoc", exact = TRUE)[c("package", "version", "topic")]
    ),
    to = to,
    from = from,
    ...
  )
}


