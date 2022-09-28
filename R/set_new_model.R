#' Register New Model
#'
#' This function is used to register new types of models.
#'
#' @param model A single character string for the model type (e.g. "k_means",
#'   etc).
#' @details This function is available for users to add their own models or
#'   engines (in a package or otherwise) so that they can be accessed using
#'   packages that use modelenv.
#'
#' @examples
#' # set_new_model("shallow_learning_model")
#' @export
set_new_model <- function(model) {
  check_model_doesnt_exist(model)

  current <- get_model_env()

  set_env_val("models", c(current$models, model))
  set_env_val(
    model,
    tibble::tibble(engine = character(0), mode = character(0))
  )
  set_env_val(
    paste0(model, "_pkgs"),
    tibble::tibble(engine = character(0), pkg = list(), mode = character(0))
  )
  set_env_val(paste0(model, "_modes"), "unknown")
  set_env_val(
    paste0(model, "_args"),
    tibble::tibble(
      engine = character(0),
      modelenv = character(0),
      original = character(0),
      func = list(),
      has_submodel = logical(0)
    )
  )
  set_env_val(
    paste0(model, "_fit"),
    tibble::tibble(
      engine = character(0),
      mode = character(0),
      value = list()
    )
  )
  set_env_val(
    paste0(model, "_predict"),
    tibble::tibble(
      engine = character(0),
      mode = character(0),
      type = character(0),
      value = list()
    )
  )

  invisible(NULL)
}

check_model_doesnt_exist <- function(model) {
  if (rlang::is_missing(model) || length(model) != 1 || !is.character(model)) {
    rlang::abort(
      "Please supply a character string for a model name (e.g. `'k_means'`)"
    )
  }

  current <- get_model_env()

  if (any(current$models == model)) {
    rlang::abort(glue::glue("Model `{model}` already exists"))
  }

  invisible(NULL)
}
