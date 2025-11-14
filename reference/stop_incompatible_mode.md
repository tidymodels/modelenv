# Error handling for incompatible modes

Error handling for incompatible modes

## Usage

``` r
stop_incompatible_mode(spec_modes, eng = NULL, model = NULL)
```

## Arguments

- spec_modes:

  Character vector of modes

- eng:

  Character of specific engine

- model:

  Character of specific model

## Value

An error

## Examples

``` r
library(rlang)
tmp <- catch_cnd(stop_incompatible_mode("partition"))
```
