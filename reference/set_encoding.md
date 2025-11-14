# Register Encoding Options for Model

This function is used to register encoding information for a model,
engine, and mode combination.

## Usage

``` r
set_encoding(model, mode, eng, options)

get_encoding(model)
```

## Arguments

- model:

  A single character string for the model type (e.g. `"k_means"`, etc).

- mode:

  A single character string for the model mode (e.g. "partition").

- eng:

  A single character string for the model engine.

- options:

  A list of options for engine-specific preprocessing encodings. See
  Details below.

## Value

A tibble

## Details

The list passed to `options` needs the following values:

- **predictor_indicators** describes whether and how to create
  indicator/dummy variables from factor predictors. There are three
  options: `"none"` (do not expand factor predictors), `"traditional"`
  (apply the standard
  [`model.matrix()`](https://rdrr.io/r/stats/model.matrix.html)
  encodings), and `"one_hot"` (create the complete set including the
  baseline level for all factors).

- **compute_intercept** controls whether
  [`model.matrix()`](https://rdrr.io/r/stats/model.matrix.html) should
  include the intercept in its formula. This affects more than the
  inclusion of an intercept column. With an intercept,
  [`model.matrix()`](https://rdrr.io/r/stats/model.matrix.html) computes
  dummy variables for all but one factor level. Without an intercept,
  [`model.matrix()`](https://rdrr.io/r/stats/model.matrix.html) computes
  a full set of indicators for the first factor variable, but an
  incomplete set for the remainder.

- **remove_intercept** removes the intercept column after
  [`model.matrix()`](https://rdrr.io/r/stats/model.matrix.html) is
  finished. This can be useful if the model function (e.g.
  [`lm()`](https://rdrr.io/r/stats/lm.html)) automatically generates an
  intercept.

- **allow_sparse_x** specifies whether the model can accommodate a
  sparse representation for predictors during fitting and tuning.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
set_model_mode("shallow_learning_model", "partition")
set_model_engine("shallow_learning_model", "partition", "stats")

set_encoding(
  model = "shallow_learning_model",
  mode = "partition",
  eng = "stats",
  options = list(
    predictor_indicators = "traditional",
    compute_intercept = TRUE,
    remove_intercept = TRUE,
    allow_sparse_x = FALSE
  )
)

get_encoding("shallow_learning_model")
get_encoding("shallow_learning_model")$value
}
```
