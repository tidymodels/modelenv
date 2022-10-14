# set_fit() cannot be called multiple times

    Code
      set_fit(model = "tape", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Error <rlang_error>
      The combination of 'stats' and mode 'partition' already has a fit component for model 'tape'.

# set_fit() errors with wrong `model` argument

    Code
      set_fit("light")
    Error <rlang_error>
      Model `light` has not been registered.

---

    Code
      set_fit(model = c("bear", "rabbit"), mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

# set_fit() errors with wrong `mode` argument

    Code
      set_fit("camcorder")
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_fit("camcorder", c("classification", "regression"))
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_fit("camcorder", NULL)
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_fit(model = "camcorder", mode = "not partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Error <rlang_error>
      'not partition' is not a known mode for model `camcorder()`.

# set_fit() errors with wrong `engine` argument

    Code
      set_fit("dice", "partition")
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_fit("dice", "partition", c("glmnet", "stats"))
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("dice", "partition", NULL)
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

# set_fit() errors with wrong `value` argument

    Code
      set_fit("ladle", "partition", "stats")
    Error <rlang_error>
      The `fit` module cannot be NULL.

---

    Code
      set_fit("ladle", "partition", "stats", NULL)
    Error <rlang_error>
      The `fit` module cannot be NULL.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        protect = c("formula", "data"), func = c(pkg = "stats", fun = "lm"),
        defaults = list()))
    Error <rlang_error>
      The `fit` module should have elements: `defaults`, `func`, `interface`, `protect`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", func = c(pkg = "stats", fun = "lm"), defaults = list()))
    Error <rlang_error>
      The `fit` module should have elements: `defaults`, `func`, `interface`, `protect`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), defaults = list()))
    Error <rlang_error>
      The `fit` module should have elements: `defaults`, `func`, `interface`, `protect`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm")))
    Error <rlang_error>
      The `fit` module should have elements: `defaults`, `func`, `interface`, `protect`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list(), additional = "arg"))
    Error <rlang_error>
      The `fit` module can only have optional elements: `data`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list(), data = list("not", "named")))
    Error <rlang_error>
      All elements of the `data` argument vector must be named.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "not formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Error <rlang_error>
      The `interface` element should have a single value of: `data.frame`, `formula`, `matrix`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = c("formula", "matrix"), protect = c("formula", "data"), func = c(
          pkg = "stats", fun = "lm"), defaults = list()))
    Error <rlang_error>
      The `interface` element should have a single value of: `data.frame`, `formula`, `matrix`

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c("stats", "lm"),
        defaults = list()))
    Error <rlang_error>
      `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c("stats", pkg = "lm"),
        defaults = list()))
    Error <rlang_error>
      `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(fun = "stats",
          pkg = "lm", additional = "no"), defaults = list()))
    Error <rlang_error>
      `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(fun = lm,
          pkg = "lm"), defaults = list()))
    Error <rlang_error>
      `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(fun = "stats",
          pkg = lm), defaults = list()))
    Error <rlang_error>
      `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = NULL))
    Error <rlang_error>
      The `defaults` element should be a list: 

---

    Code
      set_fit(model = "ladle", mode = "partition", eng = "stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats"),
        defaults = list()))
    Error <rlang_error>
      `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

# set_fit() errors if engine doesn't match

    Code
      set_fit(model = "whale", mode = "partition", eng = "not stats", value = list(
        interface = "formula", protect = c("formula", "data"), func = c(pkg = "stats",
          fun = "lm"), defaults = list()))
    Error <rlang_error>
      Engine 'not stats' is not supported for `whale()`. See `show_engines('whale')`.

