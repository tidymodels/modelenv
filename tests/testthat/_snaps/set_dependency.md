# set_dependency() errors with wrong `model` argument

    Code
      set_dependency("polarbear")
    Condition
      Error in `set_dependency()`:
      ! Model `polarbear` has not been registered.

---

    Code
      set_dependency(c("bear", "rabbit"), "partition", "stats", "stats")
    Condition
      Error in `check_model_val()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_dependency() errors with wrong `mode` argument

    Code
      set_dependency("clip")
    Condition
      Error in `set_dependency()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_dependency("clip", c("classification", "regression"))
    Condition
      Error in `set_dependency()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_dependency("clip", NULL)
    Condition
      Error in `set_dependency()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_dependency("clip", "not partition", "stats", "stats")
    Condition
      Error in `set_dependency()`:
      ! mode 'not partition' is not a valid mode for 'clip'.

# set_dependency() errors with wrong `engine` argument

    Code
      set_dependency("hamper", "partition")
    Condition
      Error in `set_dependency()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_dependency("hamper", "partition", c("glmnet", "stats"))
    Condition
      Error in `set_dependency()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("hamper", "partition", NULL)
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

# set_dependency() errors with wrong `pkg` argument

    Code
      set_dependency("duck", "partition", "stats")
    Condition
      Error in `set_dependency()`:
      ! Please supply a single character value for the package name.

---

    Code
      set_dependency("duck", "partition", "stats", c("glmnet", "stats"))
    Condition
      Error in `set_dependency()`:
      ! Please supply a single character value for the package name.

---

    Code
      set_dependency("duck", "partition", "stats", NULL)
    Condition
      Error in `set_dependency()`:
      ! Please supply a single character value for the package name.

# set_dependency() errors if engine doesn't match

    Code
      set_dependency("zebra", "partition", "not stats", "base")
    Condition
      Error in `set_dependency()`:
      ! The engine 'not stats' has not been registered for model 'zebra'.

