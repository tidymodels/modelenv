# Register Engine for Model

This function is used to register a mode for a model and mode
combination.

## Usage

``` r
set_model_engine(model, mode, eng)
```

## Arguments

- model:

  A single character string for the model type (e.g. "k_means", etc).

- mode:

  A single character string for the model mode (e.g. "partition").

- eng:

  A single character string for the model engine.

## Value

NULL invisibly

## Details

This function will error if called multiple times with the same
arguments. As you should only have one unique model, mode, eng
combination.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
set_model_mode("shallow_learning_model", "partition")

get_from_env("shallow_learning_model")

set_model_engine("shallow_learning_model", "partition", "stats")

get_from_env("shallow_learning_model")
}
```
