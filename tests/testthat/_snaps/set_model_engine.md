# set_model_engine() cannot be called multiple times

    Code
      set_model_engine("panda", "partition", "stats")
    Condition
      Error in `check_mode_for_new_engine()`:
      ! Engine 'stats' already exists for `panda()` with mode `partition`.

# set_model_engine() errors with wrong `model` argument

    Code
      set_model_engine("stickynotes")
    Condition
      Error in `check_model_val()`:
      ! Model `stickynotes` has not been registered.

---

    Code
      set_model_engine(c("boombox", "egg"), "partition", "stats")
    Condition
      Error in `check_model_val()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_model_engine() errors with wrong `mode` argument

    Code
      set_model_engine("paper")
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_engine("paper", c("classification", "regression"))
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_engine("paper", NULL)
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_engine("panda", "not partition", "stats")
    Condition
      Error in `check_mode_for_new_engine()`:
      ! 'not partition' is not a known mode for model `panda()`.

# set_model_engine() errors with wrong `engine` argument

    Code
      set_model_engine("street", "partition")
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("street", "partition", c("glmnet", "stats"))
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("street", "partition", NULL)
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

