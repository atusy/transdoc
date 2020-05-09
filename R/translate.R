#' Translate a text, web, or help document.
#'
#' The input is translated to a specified language with Google Translate.
#' For the translation of help document, the source document is derived from
#' RDocumentation. See `language` for the available languages.
#'
#' @param doc A character vector of text, a string of URL, or an object returned
#'  by `help` or `?`.
#' @param to `doc` is translated to the language specified to `to`
#'  (e.g., `"en"`, `"ja"`, `"de"`). The default value, `"default"`,
#'  is equivalent to `getOption("transdoc_to", "en")`.
#'  For `%to%`, the non-standard evaluation takes place for `to`.
#' @param from `doc` is translated from the specified language. Currently,
#' `"auto"` is the only supported value and is the default value.
#' @param ... Arguments passed to the methods.
#'
#' @references
#' Google Translate \url{https://translate.google.com/},
#' RDocumentation \url{https://www.rdocumentation.org/}
#'
#' @examples
#' \dontrun{
#' # Translate a text document
#' translate("This text will be translated", "ja")
#' "This text will be translated" %to% ja
#'
#' # Translate a web document
#' translate("https://transdoc.atusy.net/")
#' "https://transdoc.atusy.net/" %to% ja
#'
#' # Translate a help document
#' translate(help(str))
#' help(str) %to% ja
#' }
#'
#' @export
translate <- function(doc, to = "default", from = "auto", ...) {
  UseMethod("translate")
}

#' @rdname translate
#' @export
`%to%` <- function(doc, to = "default") {
  translate(doc, deparse(substitute(to)))
}

#' @rdname translate
#' @export
translate.character <- function(doc, to = "default", from = "auto", ...) {
  structure(
    list(topic = paste(doc, collapse = "\n"), to = to, from = from, ...),
    class = if (length(doc) == 1L && grepl("https?://", doc)) {
        "transdoc_website"
      } else {
        "transdoc_text"
      }
  )
}

#' @rdname translate
#' @export
translate.help_files_with_topic <- function(doc,
                                            to = "default",
                                            from = "auto",
                                            ...) {
  topic <- as_transdoc_help(doc)
  if (identical(class(topic),"help_files_with_topic")) {
    return(topic)
  }
  translate.transdoc_help(as_transdoc_help(doc), to = to, from = from, ...)
}

#' @rdname translate
#' @export
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


