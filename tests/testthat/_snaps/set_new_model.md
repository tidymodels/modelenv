# adding a new model

    Code
      set_new_model()
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

---

    Code
      set_new_model(2)
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

---

    Code
      set_new_model(letters[1:2])
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

# set_env_val() errors currectly

    Code
      set_env_val(c("models", "modes"), NULL)
    Error <rlang_error>
      `name` should be a single character value.

---

    Code
      set_env_val(1, NULL)
    Error <rlang_error>
      `name` should be a single character value.

