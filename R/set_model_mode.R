#' Register Mode for Model
#'
#' This function is used to register a mode for a model.
#'
#' @param model A single character string for the model type (e.g. "k_means",
#'   etc).
#' @param mode A single character string for the model mode (e.g. "partition").
#' @details
#' This function can be called multiple times without error. This becomes
#' valuable when multiple packages adds the same mode to a model. Having both
#' packages use `set_model_mode()` avoids having one package depend on the
#' other.
#'
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#'
#' get_from_env("shallow_learning_model_modes")
#'
#' set_model_mode("shallow_learning_model", "partition")
#'
#' get_from_env("shallow_learning_model_modes")
#' @export
set_model_mode <- function(model, mode) {
  check_model_val(model)
  check_mode_val(mode)

  current <- get_model_env()

  if (!any(current$modes == mode)) {
    current$modes <- unique(c(current$modes, mode))
  }

  set_env_val(
    paste0(model, "_modes"),
    unique(c(get_from_env(paste0(model, "_modes")), mode))
  )
  invisible(NULL)
}
