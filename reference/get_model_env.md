# Working with the modelenv model environment

These functions read and write to the environment where the package
stores information about model specifications.

## Usage

``` r
get_model_env()

get_from_env(items)

set_env_val(name, value)
```

## Arguments

- items:

  A character string of objects in the model environment.

- name:

  A single character value for a new symbol in the model environment.

- value:

  A single value for a new value in the model environment.

## Value

The modelenv environment

## Examples

``` r
if (FALSE) {
# Access the model data:
current_code <- get_model_env()
ls(envir = current_code)

get_from_env("models")
get_from_env("modes")

get_from_env("example")
set_env_val("example", 4)
get_from_env("example")
}
```
