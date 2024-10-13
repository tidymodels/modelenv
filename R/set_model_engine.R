#' Register Engine for Model
#'
#' This function is used to register a mode for a model and mode combination.
#'
#' @param model A single character string for the model type (e.g. "k_means",
#'   etc).
#' @param mode A single character string for the model mode (e.g. "partition").
#' @param eng A single character string for the model engine.
#' @details
#' This function will error if called multiple times with the same arguments. As
#' you should only have one unique model, mode, eng combination.
#'
#' @return NULL invisibly
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#' set_model_mode("shallow_learning_model", "partition")
#'
#' get_from_env("shallow_learning_model")
#'
#' set_model_engine("shallow_learning_model", "partition", "stats")
#'
#' get_from_env("shallow_learning_model")
#' @export
set_model_engine <- function(model, mode, eng) {
  check_model_val(model)
  check_mode_val(mode)
  check_eng_val(eng)
  check_mode_for_new_engine(model, eng, mode)

  new_eng <- tibble::tibble(engine = eng, mode = mode)
  old_eng <- get_from_env(model)

  engs <- vctrs::vec_rbind(old_eng, new_eng)
  engs <- vctrs::vec_unique(engs)

  set_env_val(model, engs)
  set_model_mode(model, mode)
  invisible(NULL)
}

check_mode_for_new_engine <- function(model, eng, mode,
                                      call = rlang::caller_env()) {
  all_modes <- get_from_env(paste0(model, "_modes"))
  if (!(mode %in% all_modes)) {
    cli::cli_abort(
      "'{mode}' is not a known mode for model {.fn {model}}.",
      call = call
    )
  }

  engs <- get_from_env(model)
  engs <- vctrs::vec_slice(engs, engs$engine == eng)
  engs <- vctrs::vec_slice(engs, engs$mode == mode)
  if (nrow(engs) > 0) {
    cli::cli_abort(
      "Engine {.val {eng}} already exists for {.fn {model}} with mode {.val {mode}}.",
      call = call
    )
  }

  invisible(NULL)
}
