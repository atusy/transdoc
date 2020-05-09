url_google_translate_base <- c(
  website = "https://translate.google.com/translate?hl=en&sl=auto&tl=%s&u=%s",
  text = "https://translate.google.com/?um=1&ie=UTF-8&hl=en&client=tw-ob#view=home&op=translate&sl=auto&tl=%s&text=%s"
)

#' @noRd
#' @param tl translated_to
#' @param u url
#' @param topic website or text
url_google_translate <- function(tl = "en",
                                 topic = "",
                                 type = c("website", "text")) {
  sprintf(
    url_google_translate_base[match.arg(type)],
    tl, utils::URLencode(topic, reserved = TRUE)
  )
}

url_rdocumentation <- function(package, version, topic) {
  sprintf(
    "https://www.rdocumentation.org/packages/%s/versions/%s/topics/%s",
    package, version, topic
  )
}

