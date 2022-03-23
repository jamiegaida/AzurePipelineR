#' Hello world
#'
#' @param name (character; default = "Jamie") Name of person to greet
#'
#' @return Nothing
#' @export
#'
#' @examples \dontrun{
#' hello("Jamie")
#' }
hello <- function(name = "Jamie") {
  print(paste("Hello", name))
}
