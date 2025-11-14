# Register Argument for Model

This function is used to register argument information for a model and
engine combination.

## Usage

``` r
set_model_arg(model, eng, exposed, original, func, has_submodel)

get_model_arg(model, eng)
```

## Arguments

- model:

  A single character string for the model type (e.g. `"k_means"`, etc).

- eng:

  A single character string for the model engine.

- exposed:

  A single character string for the "harmonized" argument name that the
  modeling function exposes.

- original:

  A single character string for the argument name that underlying model
  function uses.

- func:

  A named character vector that describes how to call a function. `func`
  should have elements `pkg` and `fun`. The former is optional but is
  recommended and the latter is required. For example,
  `c(pkg = "stats", fun = "lm")` would be used to invoke the usual
  linear regression function. In some cases, it is helpful to use
  `c(fun = "predict")` when using a package's `predict` method.

- has_submodel:

  A single logical for whether the argument can make predictions on
  multiple submodels at once.

## Value

A tibble

## Details

This function needs to be called once for each argument that you are
exposing.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
set_model_mode("shallow_learning_model", "partition")
set_model_engine("shallow_learning_model", "partition", "stats")

set_model_arg(
  model = "shallow_learning_model",
  eng = "stats",
  exposed = "method",
  original = "method",
  func = list(pkg = "stats", fun = "lm"),
  has_submodel = FALSE
)

get_model_arg("shallow_learning_model", "stats")
get_model_arg("shallow_learning_model", "stats")$func
}
```
