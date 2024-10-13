#' Register Fit method for Model
#'
#' This function is used to register a fit method for a model, engine, and mode
#' combination.
#'
#' @param model A single character string for the model type (e.g.
#'  `"k_means"`, etc).
#' @param mode A single character string for the model mode (e.g. "partition").
#' @param eng A single character string for the model engine.
#' @param value A list of values, described in the Details.
#' @details
#'
#' The list passed to `value` needs the following values:
#'
#' - **interface** is a single character value that could be `“formula”`,
#'   `“data.frame”`, or `“matrix”`. This defines the type of interface used by
#'   the underlying fit function (`stats::lm`, in this case). This helps the
#'   translation of the data to be in an appropriate format for the that
#'   function.
#' - **protect** is an optional list of function arguments that should not be
#'   changeable by the user. In this case, we probably don’t want users to pass
#'   data values to these arguments (until the `fit()` function is called).
#' - **func** is the package and name of the function that will be called. If
#'   you are using a locally defined function, only `fun` is required.
#' - **defaults** is an optional list of arguments to the fit function that the
#'   user can change, but whose defaults can be set here. This isn’t needed in
#'   this case, but is described later in this document.
#'
#' @return A tibble
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#' set_model_mode("shallow_learning_model", "partition")
#' set_model_engine("shallow_learning_model", "partition", "stats")
#'
#' set_fit(
#'   model = "shallow_learning_model",
#'   mode = "partition",
#'   eng = "stats",
#'   value = list(
#'     interface = "formula",
#'     protect = c("formula", "data"),
#'     func = c(pkg = "stats", fun = "lm"),
#'     defaults = list()
#'   )
#' )
#'
#' get_fit("shallow_learning_model")
#' get_fit("shallow_learning_model")$value
#' @export
set_fit <- function(model, mode, eng, value) {
  check_model_val(model)
  check_mode_val(mode)
  check_eng_val(eng)
  check_fit_info(value)
  check_spec_mode_engine_val(model, mode, eng)

  model_info <- get_from_env(model)
  old_fits <- get_from_env(paste0(model, "_fit"))

  has_fit <- vctrs::vec_slice(
    old_fits,
    old_fits$engine == eng & old_fits$mode == mode
  )

  if (nrow(has_fit) > 0) {
    cli::cli_abort(
      glue::glue(
        "The combination of '{eng}' and mode '{mode}' ",
        "already has a fit component for model '{model}'."
      )
    )
  }

  new_fit <- tibble::tibble(
    engine = eng,
    mode = mode,
    value = list(value)
  )

  updated <- vctrs::vec_rbind(old_fits, new_fit)

  set_env_val(
    paste0(model, "_fit"),
    updated
  )

  invisible(NULL)
}

#' @rdname set_fit
#' @export
get_fit <- function(model) {
  check_model_val(model)
  fit_name <- paste0(model, "_fit")
  rlang::env_get(get_model_env(), fit_name)
}

check_fit_info <- function(fit_obj, call = rlang::caller_env()) {
  if (rlang::is_missing(fit_obj) || is.null(fit_obj)) {
    cli::cli_abort("The {.arg fit} module cannot be {.code NULL}.", call = call)
  }

  # check required data elements
  exp_nms <- c("defaults", "func", "interface", "protect")
  has_req_nms <- exp_nms %in% names(fit_obj)

  if (!all(has_req_nms)) {
    cli::cli_abort(
      c(
        "The {.code fit} module should have elements: {.code {exp_nms}}.",
        "i" = "Use {.fn cli_vec} to specify vector truncation options if needed."
      ),
      call = call
    )
  }

  # check optional data elements
  opt_nms <- c("data")
  other_nms <- setdiff(names(fit_obj), exp_nms)
  has_opt_nms <- other_nms %in% opt_nms
  if (any(!has_opt_nms)) {
    cli::cli_abort(
      c(
        "The {.code fit} module can only have optional elements:",
        "i" = "Optional elements: {.code {opt_nms}}"
      ),
      call = call
    )
  }

  if (any(other_nms == "data")) {
    data_nms <- names(fit_obj$data)
    if (length(data_nms) == 0 || any(data_nms == "")) {
      cli::cli_abort(
        "All elements of the {.var data} argument vector must be named.",
        call = call
      )
    }
  }

  check_interface_val(fit_obj$interface, call = call)
  check_func_val(fit_obj$func, call = call)

  if (!is.list(fit_obj$defaults)) {
    cli::cli_abort(
      "The {.var defaults} element should be a list, \\
      not {.obj_type_friendly {fit_obj$defaults}}.",
      call = call
    )
  }

  invisible(NULL)
}

check_interface_val <- function(x, call = rlang::caller_env()) {
  exp_interf <- c("data.frame", "formula", "matrix")
  if (length(x) != 1 || !(x %in% exp_interf)) {
    cli::cli_abort(
      c(
        x = "The {.var interface} element should have a single value of:",
        "*" = "{exp_interf}."
      ),
      call = call
    )
  }
  invisible(NULL)
}

check_func_val <- function(func, call = rlang::caller_env()) {
  msg <- "{.arg func} should be a named vector with element {.var fun} and \\
         the optional elements {.var pkg}, {.var range}, {.var trans}, and \\
         {.var values}. {.var func} and {.var pkg} should both be single \\
         character strings."

  if (rlang::is_missing(func) || all(is.null(sort(names(func))))) {
    cli::cli_abort(msg, call = call)
  }

  nms <- sort(names(func))

  if (length(func) == 1) {
    if (isTRUE(any(nms != "fun"))) {
      cli::cli_abort(msg, call = call)
    }
  } else {
    # check for extra names:
    allow_nms <- c("fun", "pkg", "range", "trans", "values")
    not_allowed <- nms[!(nms %in% allow_nms)]
    if (length(not_allowed) > 0) {
      cli::cli_abort(msg, call = call)
    }
  }

  if (!is.character(func[["fun"]])) {
    cli::cli_abort(msg, call = call)
  }
  if (any(nms == "pkg") && !is.character(func[["pkg"]])) {
    cli::cli_abort(msg, call = call)
  }

  invisible(NULL)
}
