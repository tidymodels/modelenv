# Register Fit method for Model

This function is used to register a fit method for a model, engine, and
mode combination.

## Usage

``` r
set_fit(model, mode, eng, value)

get_fit(model)
```

## Arguments

- model:

  A single character string for the model type (e.g. `"k_means"`, etc).

- mode:

  A single character string for the model mode (e.g. "partition").

- eng:

  A single character string for the model engine.

- value:

  A list of values, described in the Details.

## Value

A tibble

## Details

The list passed to `value` needs the following values:

- **interface** is a single character value that could be `“formula”`,
  `“data.frame”`, or `“matrix”`. This defines the type of interface used
  by the underlying fit function
  ([`stats::lm`](https://rdrr.io/r/stats/lm.html), in this case). This
  helps the translation of the data to be in an appropriate format for
  the that function.

- **protect** is an optional list of function arguments that should not
  be changeable by the user. In this case, we probably don’t want users
  to pass data values to these arguments (until the `fit()` function is
  called).

- **func** is the package and name of the function that will be called.
  If you are using a locally defined function, only `fun` is required.

- **defaults** is an optional list of arguments to the fit function that
  the user can change, but whose defaults can be set here. This isn’t
  needed in this case, but is described later in this document.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
set_model_mode("shallow_learning_model", "partition")
set_model_engine("shallow_learning_model", "partition", "stats")

set_fit(
  model = "shallow_learning_model",
  mode = "partition",
  eng = "stats",
  value = list(
    interface = "formula",
    protect = c("formula", "data"),
    func = c(pkg = "stats", fun = "lm"),
    defaults = list()
  )
)

get_fit("shallow_learning_model")
get_fit("shallow_learning_model")$value
}
```
