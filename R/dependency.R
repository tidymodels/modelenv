#' Register Dependency for Model
#'
#' This function is used to register a mode for a model, engine, and mode
#' combination.
#'
#' @param model A single character string for the model type (e.g.
#'  `"k_means"`, etc).
#' @param mode A single character string for the model mode (e.g. "partition").
#' @param eng A single character string for the model engine.
#' @param pkg An options character string for a package name.
#' @details
#' This function should for each package that needs to be added as a dependency.
#' The `mode` needs to be set explicitly, and dependencies needs to be specified
#' for each `model`, `mode` and `eng` combination.
#'
#' @examplesIf FALSE
#' set_new_model("shallow_learning_model")
#' set_model_mode("shallow_learning_model", "partition")
#' set_model_engine("shallow_learning_model", "partition", "stats")
#'
#' set_dependency("shallow_learning_model", "partition", "stats", "base")
#' get_dependency("shallow_learning_model")
#' get_dependency("shallow_learning_model")$pkg
#'
#' set_dependency("shallow_learning_model", "partition", "stats", "stats")
#' get_dependency("shallow_learning_model")
#' get_dependency("shallow_learning_model")$pkg
#'
#' # Only unique packages are kept
#' set_dependency("shallow_learning_model", "partition", "stats", "stats")
#' get_dependency("shallow_learning_model")
#' get_dependency("shallow_learning_model")$pkg
#' @export
set_dependency <- function(model, mode, eng, pkg) {
  check_model_val(model)
  check_mode_val(mode)
  check_eng_val(eng)
  check_pkg_val(pkg)

  model_info <- get_from_env(model)
  pkg_info <- get_from_env(paste0(model, "_pkgs"))

  # ----------------------------------------------------------------------------
  # Check engine
  has_engine <- model_info
  has_engine <- vctrs::vec_slice(has_engine, has_engine$engine == eng)
  has_engine <- vctrs::vec_unique(has_engine)

  if (nrow(has_engine) != 1) {
    rlang::abort(
      glue::glue(
        "The engine '{eng}' has not been registered for model '{model}'."
      )
    )
  }

  # ----------------------------------------------------------------------------
  # check mode
  all_modes <- unique(model_info$mode[model_info$engine == eng])
  if (!any(mode == all_modes)) {
    rlang::abort(
      glue::glue("mode '{mode}' is not a valid mode for '{model}'.")
    )
  }

  # ----------------------------------------------------------------------------

  new_pkgs <- tibble::tibble(engine = eng, pkg = list(pkg), mode = mode)

  # Add the new entry to the existing list for this engine (if any) and
  # keep unique results

  eng_pkgs <- vctrs::vec_rbind(
    vctrs::vec_slice(pkg_info, pkg_info$engine == eng),
    new_pkgs
  )
  # Take unique combinations in case packages have alread been registered
  eng_pkgs <- vctrs::vec_unique(eng_pkgs)

  eng_pkgs_groups <- eng_pkgs[, c("engine", "mode")]

  # In case there are existing results (in a list column pkg), aggregate the
  # list results and re-list their unique values.
  pkgs <- vctrs::vec_split(eng_pkgs$pkg, vctrs::vec_group_id(eng_pkgs_groups))
  pkgs <- pkgs$val
  pkgs <- lapply(pkgs, unlist)
  pkgs <- lapply(pkgs, unique)

  eng_pkgs <- vctrs::vec_cbind(
    vctrs::vec_slice(eng_pkgs_groups, vctrs::vec_unique_loc(eng_pkgs_groups)),
    pkg = pkgs
  )
  eng_pkgs <- eng_pkgs[, c("engine", "pkg", "mode")]

  pkg_info <- vctrs::vec_slice(pkg_info, pkg_info$engine != eng)
  pkg_info <- vctrs::vec_rbind(pkg_info, eng_pkgs)
  pkg_info <- vctrs::vec_slice(
    pkg_info,
    vctrs::vec_order(pkg_info[, c("engine", "mode")])
  )

  set_env_val(paste0(model, "_pkgs"), pkg_info)

  invisible(NULL)
}

#' @rdname set_dependency
#' @export
get_dependency <- function(model) {
  check_model_val(model)
  pkg_name <- paste0(model, "_pkgs")
  if (!any(pkg_name != rlang::env_names(get_model_env()))) {
    rlang::abort(
      glue::glue("`{model}` does not have a dependency list in modelenv.")
    )
  }
  rlang::env_get(get_model_env(), pkg_name)
}

check_pkg_val <- function(pkg) {
  if (rlang::is_missing(pkg) || length(pkg) != 1 || !is.character(pkg)) {
    rlang::abort("Please supply a single character value for the package name.")
  }
  invisible(NULL)
}
