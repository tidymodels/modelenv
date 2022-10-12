# set_dependency() errors with wrong `model` argument

    Code
      set_dependency("polarbear")
    Error <rlang_error>
      Model `polarbear` has not been registered.

---

    Code
      set_dependency(c("bear", "rabbit"), "partition", "stats", "stats")
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

# set_dependency() errors with wrong `mode` argument

    Code
      set_dependency("clip")
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_dependency("clip", c("classification", "regression"))
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_dependency("clip", 0)
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_dependency("clip", "not partition", "stats", "stats")
    Error <rlang_error>
      mode 'not partition' is not a valid mode for 'clip'.

# set_dependency() errors with wrong `engine` argument

    Code
      set_dependency("hamper", "partition")
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_dependency("hamper", "partition", c("glmnet", "stats"))
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("hamper", "partition", NULL)
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_dependency("duck", "partition", "stats")
    Error <rlang_error>
      Please supply a single character value for the package name.

---

    Code
      set_dependency("duck", "partition", "stats", c("glmnet", "stats"))
    Error <rlang_error>
      Please supply a single character value for the package name.

---

    Code
      set_dependency("duck", "partition", "stats", NULL)
    Error <rlang_error>
      Please supply a single character value for the package name.

