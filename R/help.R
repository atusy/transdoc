`?` <- function(e1, e2) {
  .help <- do.call(utils::`?`, list(e1 = substitute(e1), e2 = substitute(e2)))

  if (!identical("help_files_with_topic", class(.help))) {
    return(.help)
  }

  package <- sub(".*/([^/]+)/help/([^/]+)$", "\\1", .help[1])
  description <- utils::packageDescription(package)

  disconnected <- !curl::has_internet()
  on_cran <- identical(description$Repository, "CRAN")
  builtin <- any(c("base", "recommended") %in% description$Priority)
  unavailable <- !on_cran && !builtin
  if (disconnected || unavailable) {
    warning(
      "Showing local help ",
      if (disconnected) "because of being offline",
      if (disconnected && not_cran) "and",
      if (unavailable) "because the package is not installed from CRAN"
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
