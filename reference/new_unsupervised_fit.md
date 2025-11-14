# Give object unsupervised fit class

Give object unsupervised fit class

## Usage

``` r
new_unsupervised_fit(x)
```

## Arguments

- x:

  an model fit object

## Value

x with added class `"unsupervised_fit"`

## See also

[`is_unsupervised_fit()`](https://modelenv.tidymodels.org/reference/is_unsupervised_fit.md)

## Examples

``` r
model_fit <- list(letters)
model_fit <- new_unsupervised_fit(model_fit)
model_fit
#> [[1]]
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p"
#> [17] "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
#> 
#> attr(,"class")
#> [1] "list"             "unsupervised_fit"
```
