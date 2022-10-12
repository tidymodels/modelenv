# set_model_engine() cannot be called multiple times

    Code
      set_model_engine("panda", "partition", "stats")
    Error <rlang_error>
      Engine 'stats' already exists for `panda()` with mode `partition`.

# set_model_engine() errors with wrong `model` argument

    Code
      set_model_engine("stickynotes")
    Error <rlang_error>
      Model `stickynotes` has not been registered.

---

    Code
      set_model_engine(c("boombox", "egg"), "partition", "stats")
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

# set_model_engine() errors with wrong `mode` argument

    Code
      set_model_engine("paper")
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_engine("paper", c("classification", "regression"))
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_engine("paper", 0)
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_model_engine("panda", "not partition", "stats")
    Error <rlang_error>
      'not partition' is not a known mode for model `panda()`.

# set_model_engine() errors with wrong `engine` argument

    Code
      set_model_engine("street", "partition")
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("street", "partition", c("glmnet", "stats"))
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("street", "partition", 0)
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

