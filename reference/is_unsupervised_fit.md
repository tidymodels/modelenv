# Determine object is has class unsupervised_fit

Determine object is has class unsupervised_fit

## Usage

``` r
is_unsupervised_fit(x)
```

## Arguments

- x:

  an model fit object

## Value

A single logical indicating input has class `"unsupervised_fit"`

## See also

[`new_unsupervised_fit()`](https://modelenv.tidymodels.org/reference/new_unsupervised_fit.md)

## Examples

``` r
model_fit <- list(letters)

is_unsupervised_fit(model_fit)
#> [1] FALSE

model_fit <- new_unsupervised_fit(model_fit)

is_unsupervised_fit(model_fit)
#> [1] TRUE
```
