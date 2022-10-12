# set_model_mode() errors with wrong `model` argument

    Code
      set_model_mode("wagon")
    Error <rlang_error>
      Model `wagon` has not been registered.

---

    Code
      set_model_mode(c("boombox", "egg"), "classification")
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

# set_model_mode() errors with wrong `mode` argument

    Code
      set_model_mode("glass")
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_mode("glass", c("classification", "regression"))
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_mode("glass", NULL)
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

