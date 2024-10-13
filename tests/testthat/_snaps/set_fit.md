# set_fit() cannot be called multiple times

    Code
      set_fit(model = "tape", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! The combination of 'stats' and mode 'partition' already has a fit component for model 'tape'.

# set_fit() errors with wrong `model` argument

    Code
      set_fit("light")
    Condition
      Error in `set_fit()`:
      ! Model "light" has not been registered.

---

    Code
      set_fit(model = c("bear", "rabbit"), mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! Please supply a character string for a model name (e.g. "k_means"). Not a character vector.

# set_fit() errors with wrong `mode` argument

    Code
      set_fit("camcorder")
    Condition
      Error in `set_fit()`:
      ! Please supply a character string for a mode (e.g. "partition").

---

    Code
      set_fit("camcorder", c("classification", "regression"))
    Condition
      Error in `set_fit()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not a character vector.

---

    Code
      set_fit("camcorder", NULL)
    Condition
      Error in `set_fit()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not NULL.

---

    Code
      set_fit(model = "camcorder", mode = "not partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! "not partition" is not a known mode for model `camcorder()`.

# set_fit() errors with wrong `engine` argument

    Code
      set_fit("dice", "partition")
    Condition
      Error in `set_fit()`:
      ! Please supply a character string for an engine name (e.g. "stats").

---

    Code
      set_fit("dice", "partition", c("glmnet", "stats"))
    Condition
      Error in `set_fit()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not a character vector.

---

    Code
      set_model_engine("dice", "partition", NULL)
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not NULL.

# set_fit() errors with wrong `value` argument

    Code
      set_fit("ladle", "partition", "stats")
    Condition
      Error in `set_fit()`:
      ! The `fit` module cannot be `NULL`.

---

    Code
      set_fit("ladle", "partition", "stats", NULL)
    Condition
      Error in `set_fit()`:
      ! The `fit` module cannot be `NULL`.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        protect = c("formula", "data"), func = c(pkg = "stats", fun = "lm"),
        defaults = list()))
    Condition
      Error in `set_fit()`:
      ! The `fit` module should have elements: `defaults`, `func`, `interface`, and `protect`.
      i Use `cli_vec()` to specify vector truncation options if needed.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", func = c(pkg = "stats", fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! The `fit` module should have elements: `defaults`, `func`, `interface`, and `protect`.
      i Use `cli_vec()` to specify vector truncation options if needed.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! The `fit` module should have elements: `defaults`, `func`, `interface`, and `protect`.
      i Use `cli_vec()` to specify vector truncation options if needed.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm")))
    Condition
      Error in `set_fit()`:
      ! The `fit` module should have elements: `defaults`, `func`, `interface`, and `protect`.
      i Use `cli_vec()` to specify vector truncation options if needed.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list(), additional = "arg"))
    Condition
      Error in `set_fit()`:
      ! The `fit` module can only have optional elements:
      i Optional elements: `data`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list(), data = list("not", "named")))
    Condition
      Error in `set_fit()`:
      ! All elements of the `data` argument vector must be named.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "not formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      x The `interface` element should have a single value of:
      * data.frame, formula, and matrix.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = c("formula", "matrix"), protect = c("formula", "data"), func = c(
          pkg = "stats", fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      x The `interface` element should have a single value of:
      * data.frame, formula, and matrix.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c("stats", "lm"),
        defaults = list()))
    Condition
      Error in `set_fit()`:
      ! `func` should be a named vector with element `fun` and the optional elements `pkg`, `range`, `trans`, and `values`. `func` and `pkg` should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c("stats", pkg = "lm"),
        defaults = list()))
    Condition
      Error in `set_fit()`:
      ! `func` should be a named vector with element `fun` and the optional elements `pkg`, `range`, `trans`, and `values`. `func` and `pkg` should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(fun = "stats",
          pkg = "lm", additional = "no"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! `func` should be a named vector with element `fun` and the optional elements `pkg`, `range`, `trans`, and `values`. `func` and `pkg` should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(fun = lm,
          pkg = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! `func` should be a named vector with element `fun` and the optional elements `pkg`, `range`, `trans`, and `values`. `func` and `pkg` should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(fun = "stats",
          pkg = lm), defaults = list()))
    Condition
      Error in `set_fit()`:
      ! `func` should be a named vector with element `fun` and the optional elements `pkg`, `range`, `trans`, and `values`. `func` and `pkg` should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = NULL))
    Condition
      Error in `set_fit()`:
      ! The `defaults` element should be a list, not NULL.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats"),
        defaults = list()))
    Condition
      Error in `set_fit()`:
      ! `func` should be a named vector with element `fun` and the optional elements `pkg`, `range`, `trans`, and `values`. `func` and `pkg` should both be single character strings.

# set_fit() errors if engine doesn't match

    Code
      set_fit(model = "whale", mode = "partition", eng = "not stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Condition
      Error in `set_fit()`:
      x Engine "not stats" is not supported for `whale()`
      i See `show_engines("whale")`.

