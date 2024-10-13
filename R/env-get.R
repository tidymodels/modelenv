#' Working with the modelenv model environment
#'
#' These functions read and write to the environment where the package stores
#' information about model specifications.
#'
#' @param items A character string of objects in the model environment.
#' @param name A single character value for a new symbol in the model
#'   environment.
#' @param value A single value for a new value in the model environment.
#' @return The modelenv environment
#' @examplesIf FALSE
#' # Access the model data:
#' current_code <- get_model_env()
#' ls(envir = current_code)
#'
#' get_from_env("models")
#' get_from_env("modes")
#'
#' get_from_env("example")
#' set_env_val("example", 4)
#' get_from_env("example")
#' @export
get_model_env <- function() {
  utils::getFromNamespace("modelenv", ns = "modelenv")
}

#' @rdname get_model_env
#' @export
get_from_env <- function(items) {
  mod_env <- get_model_env()
  env_get(mod_env, items, default = NULL)
}

#' @rdname get_model_env
#' @export
set_env_val <- function(name, value) {
  check_string(name)

  mod_env <- get_model_env()
  x <- list(value)
  names(x) <- name
  env_bind(mod_env, !!!x)
}
