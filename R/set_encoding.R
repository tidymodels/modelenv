#' Register Encoding Options for Model
#'
#' This function is used to register encoding information for a model, engine,
#' and mode combination.
#'
#' @param model A single character string for the model type (e.g.
#'  `"k_means"`, etc).
#' @param mode A single character string for the model mode (e.g. "partition").
#' @param eng A single character string for the model engine.
#' @param options A list of options for engine-specific preprocessing encodings.
#'  See Details below.
#' @details
#'
#' The list passed to `options` needs the following values:
#'
#' - **predictor_indicators** describes whether and how to create
#'   indicator/dummy variables from factor predictors. There are three options:
#'   `"none"` (do not expand factor predictors), `"traditional"` (apply the
#'   standard `model.matrix()` encodings), and `"one_hot"` (create the complete
#'   set including the baseline level for all factors).
#' - **compute_intercept** controls whether `model.matrix()` should include the
#'   intercept in its formula. This affects more than the inclusion of an
#'   intercept column. With an intercept, `model.matrix()` computes dummy
#'   variables for all but one factor level. Without an intercept,
#'   `model.matrix()` computes a full set of indicators for the first factor
#'   variable, but an incomplete set for the remainder.
#' - **remove_intercept** removes the intercept column after `model.matrix()` is
#'   finished. This can be useful if the model function (e.g. `lm()`)
#'   automatically generates an intercept.
#' - **allow_sparse_x** specifies whether the model can accommodate a sparse
#'   representation for predictors during fitting and tuning.
#'
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#' set_model_mode("shallow_learning_model", "partition")
#' set_model_engine("shallow_learning_model", "partition", "stats")
#'
#' set_encoding(
#'   model = "shallow_learning_model",
#'   mode = "partition",
#'   eng = "stats",
#'   options = list(
#'     predictor_indicators = "traditional",
#'     compute_intercept = TRUE,
#'     remove_intercept = TRUE,
#'     allow_sparse_x = FALSE
#'   )
#' )
#'
#' get_encoding("shallow_learning_model")
#' get_encoding("shallow_learning_model")$value
#' @export
set_encoding <- function(model, mode, eng, options) {
  check_model_val(model)
  check_mode_val(mode)
  check_eng_val(eng)
  check_mode_val(mode)
  check_encodings(options)
  check_spec_mode_engine_val(model, mode, eng)

  keys <- tibble::tibble(model = model, engine = eng, mode = mode)
  options <- tibble::as_tibble(options)
  new_values <- vctrs::vec_cbind(keys, options)

  enc_check <- is_discordant_info(
    model = model,
    mode = mode,
    eng = eng,
    candidate = new_values,
    component = "encoding"
  )
  if (!enc_check) {
    return(invisible(NULL))
  }

  nm <- paste0(model, "_encoding")
  current <- get_from_env(nm)

  db_values <- vctrs::vec_cbind(current, new_values)
  set_env_val(nm, db_values)

  invisible(NULL)
}

#' @rdname set_encoding
#' @export
get_encoding <- function(model) {
  check_model_val(model)
  nm <- paste0(model, "_encoding")
  get_from_env(nm)
}

check_encodings <- function(x) {
  if (rlang::is_missing(x) || !is.list(x)) {
    rlang::abort("`values` should be a list.")
  }
  req_args <- list(
    predictor_indicators = rlang::na_chr,
    compute_intercept = rlang::na_lgl,
    remove_intercept = rlang::na_lgl,
    allow_sparse_x = rlang::na_lgl
  )

  missing_args <- setdiff(names(req_args), names(x))
  if (length(missing_args) > 0) {
    rlang::abort(
      glue::glue(
        "The values passed to `set_encoding()` are missing arguments: ",
        paste0("'", missing_args, "'", collapse = ", ")
      )
    )
  }
  extra_args <- setdiff(names(x), names(req_args))
  if (length(extra_args) > 0) {
    rlang::abort(
      glue::glue(
        "The values passed to `set_encoding()` had extra arguments: ",
        paste0("'", extra_args, "'", collapse = ", ")
      )
    )
  }
  invisible(x)
}

is_discordant_info <- function(model, mode, eng, candidate,
                               pred_type = NULL, component = "fit") {
  current <- get_from_env(paste0(model, "_", component))
  if (is.null(current)) {
    return(TRUE)
  }
  current <- vctrs::vec_slice(
    current,
    current$engine == eng & current$mode == mode
  )

  if (component == "predict" & !is.null(pred_type)) {
    current <- vctrs::vec_slice(current, current$type == pred_type)
    p_type <- paste0("and prediction type '", pred_type, "'")
  } else {
    p_type <- ""
  }

  if (nrow(current) == 0) {
    return(TRUE)
  }

  same_info <- isTRUE(all.equal(current, candidate, check.environment = FALSE))

  if (!same_info) {
    rlang::abort(
      glue::glue(
        "The combination of engine '{eng}' and mode '{mode}' {p_type} already ",
        "has {component} data for model '{model}' and the new information ",
        "being registered is different."
      )
    )
  }

  FALSE
}
