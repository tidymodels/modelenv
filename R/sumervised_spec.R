#' Give object unsupervised specification class
#'
#' @param x an model specification
#' @return x with added class `"unsupervised_spec"`
#'
#' @seealso [is_unsupervised_spec()]
#'
#' @export
#' @examples
#' model_spec <- list(letters)
#' model_spec <- new_unsupervised_spec(model_spec)
#' model_spec
new_unsupervised_spec <- function(x) {
  class(x) <- c(class(x), "unsupervised_spec")
  x
}

#' Determine object is has class unsupervised_spec
#'
#' @param x an model specification
#' @return A single logical indicating input has class `"unsupervised_spec"`
#'
#' @seealso [new_unsupervised_spec()]
#'
#' @export
#' @examples
#' model_spec <- list(letters)
#'
#' is_unsupervised_spec(model_spec)
#'
#' model_spec <- new_unsupervised_spec(model_spec)
#'
#' is_unsupervised_spec(model_spec)
is_unsupervised_spec <- function(x) {
  inherits(x, "unsupervised_spec")
}

