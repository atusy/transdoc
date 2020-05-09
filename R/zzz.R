check_offline <- function(action = stop, msg = "Being offline.", ...) {
  offline <- !curl::has_internet()
  if (offline) {
    action(msg, ...)
  }
  offline
}
