# set_model_engine() cannot be called multiple times

    Code
      set_model_engine("panda", "partition", "stats")
    Condition
      Error in `set_model_engine()`:
      ! Engine "stats" already exists for `panda()` with mode "partition".

# set_model_engine() errors with wrong `model` argument

    Code
      set_model_engine("stickynotes")
    Condition
      Error in `set_model_engine()`:
      ! Model "stickynotes" has not been registered.

---

    Code
      set_model_engine(c("boombox", "egg"), "partition", "stats")
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for a model name (e.g. "k_means"). Not a character vector.

# set_model_engine() errors with wrong `mode` argument

    Code
      set_model_engine("paper")
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for a mode (e.g. "partition").

---

    Code
      set_model_engine("paper", c("classification", "regression"))
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not a character vector.

---

    Code
      set_model_engine("paper", NULL)
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not NULL.

---

    Code
      set_model_engine("panda", "not partition", "stats")
    Condition
      Error in `set_model_engine()`:
      ! 'not partition' is not a known mode for model `panda()`.

# set_model_engine() errors with wrong `engine` argument

    Code
      set_model_engine("street", "partition")
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. "stats").

---

    Code
      set_model_engine("street", "partition", c("glmnet", "stats"))
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not a character vector.

---

    Code
      set_model_engine("street", "partition", NULL)
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not NULL.

