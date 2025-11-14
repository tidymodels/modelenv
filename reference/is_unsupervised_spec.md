# Determine object is has class unsupervised_spec

Determine object is has class unsupervised_spec

## Usage

``` r
is_unsupervised_spec(x)
```

## Arguments

- x:

  an model specification

## Value

A single logical indicating input has class `"unsupervised_spec"`

## See also

[`new_unsupervised_spec()`](https://modelenv.tidymodels.org/reference/new_unsupervised_spec.md)

## Examples

``` r
model_spec <- list(letters)

is_unsupervised_spec(model_spec)
#> [1] FALSE

model_spec <- new_unsupervised_spec(model_spec)

is_unsupervised_spec(model_spec)
#> [1] TRUE
```
