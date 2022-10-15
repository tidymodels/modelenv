#' Give object unsupervised fit class
#'
#' @param x an model fit object
#' @return x with added class `"unsupervised_fit"`
#'
#' @seealso [is_unsupervised_fit()]
#'
#' @examples
#' model_fit <- list(letters)
#' model_fit <- new_unsupervised_fit(model_fit)
#' model_fit
#' @export
new_unsupervised_fit <- function(x) {
  class(x) <- c(class(x), "unsupervised_fit")
  x
}

#' Determine object is has class unsupervised_fit
#'
#' @param x an model fit object
#' @return A single logical indicating input has class `"unsupervised_fit"`
#'
#' @seealso [new_unsupervised_fit()]
#'
#' @export
#' @examples
#' model_fit <- list(letters)
#'
#' is_unsupervised_fit(model_fit)
#'
#' model_fit <- new_unsupervised_fit(model_fit)
#'
#' is_unsupervised_fit(model_fit)
is_unsupervised_fit <- function(x) {
  inherits(x, "unsupervised_fit")
}

