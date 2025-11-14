# Register Dependency for Model

This function is used to register a mode for a model, engine, and mode
combination.

## Usage

``` r
set_dependency(model, mode, eng, pkg)

get_dependency(model)
```

## Arguments

- model:

  A single character string for the model type (e.g. `"k_means"`, etc).

- mode:

  A single character string for the model mode (e.g. "partition").

- eng:

  A single character string for the model engine.

- pkg:

  An options character string for a package name.

## Value

A tibble

## Details

This function should for each package that needs to be added as a
dependency. The `mode` needs to be set explicitly, and dependencies
needs to be specified for each `model`, `mode` and `eng` combination.

## Examples

``` r
if (FALSE) {
set_new_model("shallow_learning_model")
set_model_mode("shallow_learning_model", "partition")
set_model_engine("shallow_learning_model", "partition", "stats")

set_dependency("shallow_learning_model", "partition", "stats", "base")
get_dependency("shallow_learning_model")
get_dependency("shallow_learning_model")$pkg

set_dependency("shallow_learning_model", "partition", "stats", "stats")
get_dependency("shallow_learning_model")
get_dependency("shallow_learning_model")$pkg

# Only unique packages are kept
set_dependency("shallow_learning_model", "partition", "stats", "stats")
get_dependency("shallow_learning_model")
get_dependency("shallow_learning_model")$pkg
}
```
