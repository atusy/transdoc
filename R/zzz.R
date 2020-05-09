check_offline <- function(action = stop, msg = "Being offline.", ...) {
  if (!curl::has_internet()) {
    action(msg, ...)
  }
}
