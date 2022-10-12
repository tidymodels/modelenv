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

  has_engine <- vctrs::vec_slice(
    model_info,
    model_info$engine == eng & model_info$mode == mode
  )

  if (nrow(has_engine) != 1) {
    rlang::abort(
      glue::glue(
        "The combination of '{eng}' and mode '{mode}' has not ",
        "been registered for model '{model}'."
      )
    )
  }

  has_fit <- vctrs::vec_slice(
    old_fits,
    old_fits$engine == eng & old_fits$mode == mode
  )

  if (nrow(has_fit) > 0) {
    rlang::abort(
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

  updated <- try(vctrs::vec_rbind(old_fits, new_fit), silent = TRUE)
  if (inherits(updated, "try-error")) {
    rlang::abort("An error occured when adding the new fit module.")
  }

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
  if (!any(fit_name != rlang::env_names(get_model_env()))) {
    rlang::abort(
      glue::glue("`{model}` does not have a `fit` method in modelenv.")
    )
  }
  rlang::env_get(get_model_env(), fit_name)
}

check_fit_info <- function(fit_obj) {
  if (rlang::is_missing(fit_obj) || is.null(fit_obj)) {
    rlang::abort("The `fit` module cannot be NULL.")
  }

  # check required data elements
  exp_nms <- c("defaults", "func", "interface", "protect")
  has_req_nms <- exp_nms %in% names(fit_obj)

  if (!all(has_req_nms)) {
    rlang::abort(
      glue::glue(
        "The `fit` module should have elements: ",
        glue::glue_collapse(glue::glue("`{exp_nms}`"), sep = ", ")
      )
    )
  }

  # check optional data elements
  opt_nms <- c("data")
  other_nms <- setdiff(names(fit_obj), exp_nms)
  has_opt_nms <- other_nms %in% opt_nms
  if (any(!has_opt_nms)) {
    msg <- glue::glue(
      "The `fit` module can only have optional elements: ",
      glue::glue_collapse(glue::glue("`{opt_nms}`"), sep = ", ")
    )

    rlang::abort(msg)
  }

  if (any(other_nms == "data")) {
    data_nms <- names(fit_obj$data)
    if (length(data_nms) == 0 || any(data_nms == "")) {
      rlang::abort("All elements of the `data` argument vector must be named.")
    }
  }

  check_interface_val(fit_obj$interface)
  check_func_val(fit_obj$func)

  if (!is.list(fit_obj$defaults)) {
    rlang::abort("The `defaults` element should be a list: ")
  }

  invisible(NULL)
}

check_interface_val <- function(x) {
  exp_interf <- c("data.frame", "formula", "matrix")
  if (length(x) != 1 || !(x %in% exp_interf)) {
    rlang::abort(
      glue::glue(
        "The `interface` element should have a single value of: ",
        glue::glue_collapse(glue::glue("`{exp_interf}`"), sep = ", ")
      )
    )
  }
  invisible(NULL)
}

check_func_val <- function(func) {
  msg <-
    paste(
      "`func` should be a named vector with element 'fun' and the optional ",
      "elements 'pkg', 'range', 'trans', and 'values'.",
      "`func` and 'pkg' should both be single character strings."
    )

  nms <- sort(names(func))

  if (all(is.null(nms))) {
    rlang::abort(msg)
  }

  if (length(func) == 1) {
    if (isTRUE(any(nms != "fun"))) {
      rlang::abort(msg)
    }
  } else {
    # check for extra names:
    allow_nms <- c("fun", "pkg", "range", "trans", "values")
    not_allowed <- nms[!(nms %in% allow_nms)]
    if (length(not_allowed) > 0) {
      rlang::abort(msg)
    }
  }

  if (!is.character(func[["fun"]])) {
    rlang::abort(msg)
  }
  if (any(nms == "pkg") && !is.character(func[["pkg"]])) {
    rlang::abort(msg)
  }

  invisible(NULL)
}

check_mode_with_no_engine <- function(cls, mode) {
  spec_modes <- get_from_env(paste0(cls, "_modes"))
  if (!(mode %in% spec_modes)) {
    stop_incompatible_mode(spec_modes, cls = cls)
  }
}

stop_incompatible_mode <- function(spec_modes, eng = NULL, cls = NULL) {
  if (is.null(eng) & is.null(cls)) {
    msg <- "Available modes are: "
  }
  if (!is.null(eng) & is.null(cls)) {
    msg <- glue::glue("Available modes for engine {eng} are: ")
  }
  if (is.null(eng) & !is.null(cls)) {
    msg <- glue::glue("Available modes for model type {cls} are: ")
  }
  if (!is.null(eng) & !is.null(cls)) {
    msg <- glue::glue(
      "Available modes for model type {cls} with engine {eng} are: "
    )
  }

  msg <- glue::glue(
    msg,
    glue::glue_collapse(glue::glue("'{spec_modes}'"), sep = ", ")
  )
  rlang::abort(msg)
}

stop_incompatible_engine <- function(spec_engs, mode) {
  msg <- glue::glue(
    "Available engines for mode {mode} are: ",
    glue::glue_collapse(glue::glue("'{spec_engs}'"), sep = ", ")
  )
  rlang::abort(msg)
}
