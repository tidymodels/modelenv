# Register New Model

This function is used to register new types of models.

## Usage

``` r
set_new_model(model)
```

## Arguments

- model:

  A single character string for the model type (e.g. "k_means", etc).

## Value

NULL invisibly

## Details

This function is available for users to add their own models or engines
(in a package or otherwise) so that they can be accessed using packages
that use modelenv.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
}
```
