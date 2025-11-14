# Register Prediction Method for Model

This function is used to register prediction method information for a
model, mode, and engine combination.

## Usage

``` r
set_pred(model, mode, eng, type, value)

get_pred_type(model, type)
```

## Arguments

- model:

  A single character string for the model type (e.g. `"k_means"`, etc).

- mode:

  A single character string for the model mode (e.g. "partition").

- eng:

  A single character string for the model engine.

- type:

  A single character value for the type of prediction. Possible values
  are: `cluster` and `raw`.

- value:

  A list of values, described in the Details.

## Value

A tibble

## Details

The list passed to `value` needs the following values:

- **pre** and **post** are optional functions that can preprocess the
  data being fed to the prediction code and to postprocess the raw
  output of the predictions. These won’t be needed for this example, but
  a section below has examples of how these can be used when the model
  code is not easy to use. If the data being predicted has a simple type
  requirement, you can avoid using a **pre** function with the **args**
  below.

- **func** is the prediction function (in the same format as above). In
  many cases, packages have a predict method for their model’s class but
  this is typically not exported. In this case (and the example below),
  it is simple enough to make a generic call to
  [`predict()`](https://rdrr.io/r/stats/predict.html) with no associated
  package.

- **args** is a list of arguments to pass to the prediction function.
  These will most likely be wrapped in
  [`rlang::expr()`](https://rlang.r-lib.org/reference/expr.html) so that
  they are not evaluated when defining the method. For mda, the code
  would be `predict(object, newdata, type = "class")`. What is actually
  given to the function is the model fit object, which includes a
  sub-object called `fit()` that houses the mda model object. If the
  data need to be a matrix or data frame, you could also use
  `newdata = quote(as.data.frame(newdata))` or similar.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
set_model_mode("shallow_learning_model", "partition")
set_model_engine("shallow_learning_model", "partition", "stats")

set_pred(
  model = "shallow_learning_model",
  eng = "stats",
  mode = "partition",
  type = "cluster",
  value = list(
    pre = NULL,
    post = NULL,
    func = c(fun = "predict"),
    args =
      list(
        object = rlang::expr(object$fit),
        newdata = rlang::expr(new_data),
        type = "response"
      )
  )
)

get_pred_type("shallow_learning_model", "cluster")
get_pred_type("shallow_learning_model", "cluster")$value
}
```
