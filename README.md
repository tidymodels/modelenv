
<!-- README.md is generated from README.Rmd. Please edit that file -->

# modelenv

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/tidymodels/modelenv/branch/main/graph/badge.svg)](https://app.codecov.io/gh/tidymodels/modelenv?branch=main)
[![R-CMD-check](https://github.com/tidymodels/modelenv/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tidymodels/modelenv/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

modelenv is a *developer focused* package designed to provide tools to
register models much in the same as is [done in
parsnip](https://parsnip.tidymodels.org/reference/set_new_model.html).
This package **does not** replace parsnip’s registration functions, but
will be used in tidyclust and future non-parsnip modeling packages to
avoid complex dependencies.

## Installation

You can install the released version of modelenv from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("modelenv")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("tidymodels/modelenv")
```

## Learn more

These functions have near identical interfaces to their parsnip
equivalent, see [tidymodels.org - How to build a parsnip
model](https://www.tidymodels.org/learn/develop/models/) for
instructions of how to use these functions.
