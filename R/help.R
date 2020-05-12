#' Show help on Google Translate
#'
#' The help document is translated to the language based on
#' `getOption("transdoc_to, "en")`. See `language` for the available languages.
#'
#' @param e1,e2 Arguments passed to ``utils::`?` ``
#'
#' @examples
#' if (interactive()) {
#' options(transdoc_to = "ja")
#' ?base::c
#' }
#' 
#' @value
#' The `transdoc_help` class object which inherits the `help_files_with_topic`
#' class. In addition to the `help_files_with_topic` class object, the
#' returning value has attributes `package` to indicate which package does the
#' topic belongs,`version` to indicate the version of the `package` attribute,
#' and `topic` to indicate the help topic.
#' 
#' @export
`?` <- function(e1, e2) {
  .help <- do.call(utils::`?`, list(e1 = substitute(e1), e2 = substitute(e2)))
  as_transdoc_help(.help)
}

as_transdoc_help <- function(.help) {
  if (!identical("help_files_with_topic", class(.help))) {
    return(.help)
  }

  package <- sub(".*/([^/]+)/help/([^/]+)$", "\\1", .help[1])
  description <- utils::packageDescription(package)
  on_cran <- identical(description$Repository, "CRAN")
  builtin <- any(c("base", "recommended") %in% description$Priority)
  unavailable <- !on_cran && !builtin
  if (unavailable) {
    message(
      "Returning local help because the package is not installed from CRAN."
    )
    return(.help)
  }

  class(.help) <- c("transdoc_help", class(.help))
  attributes(.help)[["transdoc"]] <- list(
    package = package,
    version = description$Version,
    topic = sub(".*/", "", .help[1])
  )

  return(.help)
}
