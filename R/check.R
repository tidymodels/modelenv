#' Error handling for incompatible modes
#'
#' @param spec_modes Character vector of modes
#' @param eng Character of specific engine
#' @param model Character of specific model
#'
#' @return An error
#' @examples
#' library(rlang)
#' tmp <- catch_cnd(stop_incompatible_mode("partition"))
#' @export
stop_incompatible_mode <- function(spec_modes,
                                   eng = NULL,
                                   model = NULL) {
  if (is.null(eng) & is.null(model)) {
    msg <- "Available modes are: "
  }
  if (!is.null(eng) & is.null(model)) {
    msg <- glue::glue("Available modes for engine {eng} are: ")
  }
  if (is.null(eng) & !is.null(model)) {
    msg <- glue::glue("Available modes for model type {model} are: ")
  }
  if (!is.null(eng) & !is.null(model)) {
    msg <- glue::glue(
      "Available modes for model type {model} with engine {eng} are: "
    )
  }

  msg <- glue::glue(
    msg,
    glue::glue_collapse(glue::glue("'{spec_modes}'"), sep = ", ")
  )
  rlang::abort(msg)
}

check_model_val <- function(model, call = rlang::caller_env()) {
  if (rlang::is_missing(model) || length(model) != 1 || !is.character(model)) {
    rlang::abort(
      "Please supply a character string for a model name (e.g. `'k_means'`)."
    )
  }

  current <- get_model_env()

  if (!any(current$models == model)) {
    rlang::abort(
      glue::glue("Model `{model}` has not been registered."),
      call = call
    )
  }

  invisible(NULL)
}

check_mode_val <- function(mode, call = rlang::caller_env()) {
  if (rlang::is_missing(mode) || length(mode) != 1 || !is.character(mode)) {
    rlang::abort(
      "Please supply a character string for a mode (e.g. `'partition'`).",
      call = call
    )
  }
  invisible(NULL)
}

check_eng_val <- function(eng, call = rlang::caller_env()) {
  if (rlang::is_missing(eng) || length(eng) != 1 || !is.character(eng)) {
    rlang::abort(
      "Please supply a character string for an engine name (e.g. `'stats'`).",
      call = call
    )
  }
  invisible(NULL)
}

#' Error handling for unknown mode
#'
#' Checks that a given model, mode, engine combination have been registered.
#'
#' @param model Character of specific model
#' @param mode Character of specific mode
#' @param eng Character of specific engine
#'
#' @inheritParams rlang::args_error_context
#'
#' @return An error
#' @examples
#' library(rlang)
#' tmp <- catch_cnd(check_spec_mode_engine_val("turtle", "partition", "vegan"))
#' @export
check_spec_mode_engine_val <- function(model,
                                       mode,
                                       eng,
                                       call = rlang::caller_env()) {
  all_modes <- get_from_env(paste0(model, "_modes"))
  if (!(mode %in% all_modes)) {
    rlang::abort(
      glue::glue("'{mode}' is not a known mode for model `{model}()`."),
      call = call
    )
  }

  model_info <- rlang::env_get(get_model_env(), model)

  # ------------------------------------------------------------------------------
  # First check engine against any mode for the given model class

  spec_engs <- model_info$engine
  # engine is allowed to be NULL
  if (!is.null(eng) && !(eng %in% spec_engs)) {
    rlang::abort(
      paste0(
        "Engine '", eng, "' is not supported for `", model, "()`. See ",
        "`show_engines('", model, "')`."
      ),
      call = call
    )
  }

  # ----------------------------------------------------------------------------
  # Check modes based on model and engine

  spec_modes <- model_info$mode
  if (!is.null(eng)) {
    spec_modes <- spec_modes[model_info$engine == eng]
  }
  spec_modes <- unique(c("unknown", spec_modes))

  if (!(mode %in% spec_modes)) {
    stop_incompatible_mode(spec_modes, eng)
  }

  invisible(NULL)
}
