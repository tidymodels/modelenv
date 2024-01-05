# set_model_mode() errors with wrong `model` argument

    Code
      set_model_mode("wagon")
    Condition
      Error in `set_model_mode()`:
      ! Model `wagon` has not been registered.

---

    Code
      set_model_mode(c("boombox", "egg"), "classification")
    Condition
      Error in `check_model_val()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_model_mode() errors with wrong `mode` argument

    Code
      set_model_mode("glass")
    Condition
      Error in `set_model_mode()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_mode("glass", c("classification", "regression"))
    Condition
      Error in `set_model_mode()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_mode("glass", NULL)
    Condition
      Error in `set_model_mode()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

