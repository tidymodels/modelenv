# set_model_arg() errors with wrong `model` argument

    Code
      set_model_arg("light")
    Condition
      Error in `set_model_arg()`:
      ! Model `light` has not been registered.

---

    Code
      set_model_arg(model = c("phone", "sock"))
    Condition
      Error in `check_model_val()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_model_arg() errors with wrong `engine` argument

    Code
      set_model_arg("thermos")
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_arg("thermos", c("glmnet", "stats"))
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_arg("thermos", NULL)
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

# set_model_arg() errors with wrong `exposed` argument

    Code
      set_model_arg(model = "marker", eng = "stats")
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for the argument.

---

    Code
      set_model_arg(model = "marker", eng = "stats", exposed = c("glmnet", "stats"))
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for the argument.

---

    Code
      set_model_arg(model = "marker", eng = "stats", exposed = NULL)
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for the argument.

# set_model_arg() errors with wrong `original` argument

    Code
      set_model_arg(model = "mustache", eng = "stats", exposed = "method")
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for the argument.

---

    Code
      set_model_arg(model = "mustache", eng = "stats", exposed = "method", original = c(
        "not", "method"))
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for the argument.

---

    Code
      set_model_arg(model = "mustache", eng = "stats", exposed = "method", original = NULL)
    Condition
      Error in `set_model_arg()`:
      ! Please supply a character string for the argument.

# set_model_arg() errors with wrong `func` argument

    Code
      set_model_arg(model = "unicorn", eng = "stats", exposed = "method", original = "moethod")
    Condition
      Error in `set_model_arg()`:
      ! argument "func" is missing, with no default

---

    Code
      set_model_arg(model = "unicorn", eng = "stats", exposed = "method", original = "method",
        func = c("not", "method"))
    Condition
      Error in `set_model_arg()`:
      ! `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

---

    Code
      set_model_arg(model = "unicorn", eng = "stats", exposed = "method", original = "method",
        func = NULL)
    Condition
      Error in `set_model_arg()`:
      ! `func` should be a named vector with element 'fun' and the optional  elements 'pkg', 'range', 'trans', and 'values'. `func` and 'pkg' should both be single character strings.

# set_model_arg() errors with wrong `has_submodel` argument

    Code
      set_model_arg(model = "velcro", eng = "stats", exposed = "method", original = "moethod",
        func = list(pkg = "stats", fun = "lm"))
    Condition
      Error in `set_model_arg()`:
      ! argument "has_submodel" is missing, with no default

---

    Code
      set_model_arg(model = "velcro", eng = "stats", exposed = "method", original = "method",
        func = list(pkg = "stats", fun = "lm"), has_submodel = "yes")
    Condition
      Error in `set_model_arg()`:
      ! The `submodels` argument should be a single logical.

---

    Code
      set_model_arg(model = "velcro", eng = "stats", exposed = "method", original = "method",
        func = list(pkg = "stats", fun = "lm"), has_submodel = NULL)
    Condition
      Error in `set_model_arg()`:
      ! The `submodels` argument should be a single logical.

