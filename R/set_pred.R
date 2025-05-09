#' Register Prediction Method for Model
#'
#' This function is used to register prediction method information for a model,
#' mode, and engine combination.
#'
#' @param model A single character string for the model type (e.g. `"k_means"`,
#'   etc).
#' @param mode A single character string for the model mode (e.g. "partition").
#' @param eng A single character string for the model engine.
#' @param type A single character value for the type of prediction. Possible
#'  values are: `cluster` and `raw`.
#' @param value A list of values, described in the Details.
#' @details
#' The list passed to `value` needs the following values:
#'
#' - **pre** and **post** are optional functions that can preprocess the data
#'   being fed to the prediction code and to postprocess the raw output of the
#'   predictions. These won’t be needed for this example, but a section below
#'   has examples of how these can be used when the model code is not easy to
#'   use. If the data being predicted has a simple type requirement, you can
#'   avoid using a **pre** function with the **args** below.
#' - **func** is the prediction function (in the same format as above). In many
#'   cases, packages have a predict method for their model’s class but this is
#'   typically not exported. In this case (and the example below), it is simple
#'   enough to make a generic call to `predict()` with no associated package.
#' - **args** is a list of arguments to pass to the prediction function. These
#'   will most likely be wrapped in `rlang::expr()` so that they are not
#'   evaluated when defining the method. For mda, the code would be
#'   `predict(object, newdata, type = "class")`. What is actually given to the
#'   function is the model fit object, which includes a sub-object
#'   called `fit()` that houses the mda model object. If the data need to be a
#'   matrix or data frame, you could also use
#'   `newdata = quote(as.data.frame(newdata))` or similar.
#'
#' @return A tibble
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#' set_model_mode("shallow_learning_model", "partition")
#' set_model_engine("shallow_learning_model", "partition", "stats")
#'
#' set_pred(
#'   model = "shallow_learning_model",
#'   eng = "stats",
#'   mode = "partition",
#'   type = "cluster",
#'   value = list(
#'     pre = NULL,
#'     post = NULL,
#'     func = c(fun = "predict"),
#'     args =
#'       list(
#'         object = rlang::expr(object$fit),
#'         newdata = rlang::expr(new_data),
#'         type = "response"
#'       )
#'   )
#' )
#'
#' get_pred_type("shallow_learning_model", "cluster")
#' get_pred_type("shallow_learning_model", "cluster")$value
#' @export
set_pred <- function(model, mode, eng, type, value) {
  check_model_val(model)
  check_mode_val(mode)
  check_eng_val(eng)
  check_spec_mode_engine_val(model, mode, eng)
  check_pred_info(value, type)

  new_pred <- tibble::tibble(
    engine = eng,
    mode = mode,
    type = type,
    value = list(value)
  )

  pred_check <- is_discordant_info(
    model = model,
    mode = mode,
    eng = eng,
    candidate = new_pred,
    pred_type = type,
    component = "predict"
  )
  if (!pred_check) {
    return(invisible(NULL))
  }

  old_pred <- get_from_env(paste0(model, "_predict"))
  updated <- vctrs::vec_rbind(old_pred, new_pred)

  set_env_val(paste0(model, "_predict"), updated)

  invisible(NULL)
}

#' @rdname set_pred
#' @export
get_pred_type <- function(model, type) {
  check_model_val(model)
  pred_name <- paste0(model, "_predict")
  all_preds <- env_get(get_model_env(), pred_name)
  vctrs::vec_slice(all_preds, all_preds$type == type)
}

check_pred_info <- function(pred_obj, type, call = caller_env()) {
  if (is_missing(pred_obj)) {
    cli::cli_abort(
      "Argument {.arg value} is missing, with no default.",
      call = call
    )
  }

  if (all(type != pred_types)) {
    cli::cli_abort(
      "The prediction type should be one of: {pred_types}.",
      call = call
    )
  }

  exp_nms <- c("args", "func", "post", "pre")
  if (!isTRUE(all.equal(sort(names(pred_obj)), exp_nms))) {
    cli::cli_abort(
      "The {.code predict} module should have elements: {.code {exp_nms}}.",
      call = call
    )
  }

  if (!is.null(pred_obj$pre) & !is.function(pred_obj$pre)) {
    cli::cli_abort(
      "The {.arg pre} module should be {.code NULL} or a function.",
      call = call
    )
  }
  if (!is.null(pred_obj$post) & !is.function(pred_obj$post)) {
    cli::cli_abort(
      "The {.arg post} module should be {.code NULL} or a function.",
      call = call
    )
  }

  check_func_val(pred_obj$func, call = call)

  if (!is.list(pred_obj$args)) {
    cli::cli_abort("The {.arg args} element should be a list.", call = call)
  }

  invisible(NULL)
}
