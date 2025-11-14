# Error handling for unknown mode

Checks that a given model, mode, engine combination have been
registered.

## Usage

``` r
check_spec_mode_engine_val(model, mode, eng, call = caller_env())
```

## Arguments

- model:

  Character of specific model

- mode:

  Character of specific mode

- eng:

  Character of specific engine

- call:

  The execution environment of a currently running function, e.g.
  [`caller_env()`](https://rlang.r-lib.org/reference/stack.html). The
  function will be mentioned in error messages as the source of the
  error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

## Value

An error

## Examples

``` r
library(rlang)
tmp <- catch_cnd(check_spec_mode_engine_val("turtle", "partition", "vegan"))
```
