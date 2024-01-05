#' Register Argument for Model
#'
#' This function is used to register argument information for a model and engine
#' combination.
#'
#' @param model A single character string for the model type (e.g. `"k_means"`,
#'   etc).
#' @param eng A single character string for the model engine.
#' @param exposed A single character string for the "harmonized" argument name
#'   that the modeling function exposes.
#' @param original A single character string for the argument name that
#'   underlying model function uses.
#' @param func A named character vector that describes how to call a function.
#'   `func` should have elements `pkg` and `fun`. The former is optional but is
#'   recommended and the latter is required. For example, `c(pkg = "stats", fun
#'   = "lm")` would be used to invoke the usual linear regression function. In
#'   some cases, it is helpful to use `c(fun = "predict")` when using a
#'   package's `predict` method.
#' @param has_submodel A single logical for whether the argument can make
#'   predictions on multiple submodels at once.
#' @details
#' This function needs to be called once for each argument that you are
#' exposing.
#'
#' @return A tibble
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#' set_model_mode("shallow_learning_model", "partition")
#' set_model_engine("shallow_learning_model", "partition", "stats")
#'
#' set_model_arg(
#'   model = "shallow_learning_model",
#'   eng = "stats",
#'   exposed = "method",
#'   original = "method",
#'   func = list(pkg = "stats", fun = "lm"),
#'   has_submodel = FALSE
#' )
#'
#' get_model_arg("shallow_learning_model", "stats")
#' get_model_arg("shallow_learning_model", "stats")$func
#' @export
set_model_arg <- function(model, eng, exposed, original, func, has_submodel) {
  check_model_val(model)
  check_eng_val(eng)
  check_arg_val(exposed)
  check_arg_val(original)
  check_func_val(func)
  check_submodels_val(has_submodel)

  old_args <- get_from_env(paste0(model, "_args"))

  new_arg <-
    tibble::tibble(
      engine = eng,
      exposed = exposed,
      original = original,
      func = list(func),
      has_submodel = has_submodel
    )

  updated <- vctrs::vec_rbind(old_args, new_arg)
  updated <- vctrs::vec_unique(updated)
  set_env_val(paste0(model, "_args"), updated)

  invisible(NULL)
}

#' @rdname set_model_arg
#' @export
get_model_arg <- function(model, eng) {
  m_env <- get_model_env()
  args <- rlang::env_get(m_env, paste0(model, "_args"))
  args <- vctrs::vec_slice(args, args$engine == eng)
  args <- args[names(args) != "engine"]
  args
}

check_arg_val <- function(arg, call = rlang::caller_env()) {
  if (rlang::is_missing(arg) || length(arg) != 1 || !is.character(arg)) {
    rlang::abort(
      "Please supply a character string for the argument.",
      call = call
    )
  }
  invisible(NULL)
}

check_submodels_val <- function(has_submodel, call = rlang::caller_env()) {
  if (rlang::is_missing(has_submodel) ||
      !is.logical(has_submodel) ||
      length(has_submodel) != 1) {
    rlang::abort(
      "The `submodels` argument should be a single logical.",
      call = call
    )
  }
  invisible(NULL)
}
