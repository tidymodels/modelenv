# Register Mode for Model

This function is used to register a mode for a model.

## Usage

``` r
set_model_mode(model, mode)
```

## Arguments

- model:

  A single character string for the model type (e.g. "k_means", etc).

- mode:

  A single character string for the model mode (e.g. "partition").

## Value

NULL invisibly

## Details

This function can be called multiple times without error. This becomes
valuable when multiple packages adds the same mode to a model. Having
both packages use `set_model_mode()` avoids having one package depend on
the other.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")

get_from_env("shallow_learning_model_modes")

set_model_mode("shallow_learning_model", "partition")

get_from_env("shallow_learning_model_modes")
}
```
