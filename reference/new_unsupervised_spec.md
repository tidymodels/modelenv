# Give object unsupervised specification class

Give object unsupervised specification class

## Usage

``` r
new_unsupervised_spec(x)
```

## Arguments

- x:

  an model specification

## Value

x with added class `"unsupervised_spec"`

## See also

[`is_unsupervised_spec()`](https://modelenv.tidymodels.org/reference/is_unsupervised_spec.md)

## Examples

``` r
model_spec <- list(letters)
model_spec <- new_unsupervised_spec(model_spec)
model_spec
#> [[1]]
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p"
#> [17] "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
#> 
#> attr(,"class")
#> [1] "list"              "unsupervised_spec"
```
