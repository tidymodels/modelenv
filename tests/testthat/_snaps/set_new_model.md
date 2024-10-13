# adding a new model

    Code
      set_new_model()
    Condition
      Error in `set_new_model()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

---

    Code
      set_new_model(2)
    Condition
      Error in `set_new_model()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

---

    Code
      set_new_model(letters[1:2])
    Condition
      Error in `set_new_model()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_env_val() errors currectly

    Code
      set_env_val(c("models", "modes"), NULL)
    Condition
      Error in `set_env_val()`:
      ! `name` must be a single string, not a character vector.

---

    Code
      set_env_val(1, NULL)
    Condition
      Error in `set_env_val()`:
      ! `name` must be a single string, not the number 1.

