# set_encoding() errors with wrong `model` argument

    Code
      set_encoding("light")
    Error <rlang_error>
      Model `light` has not been registered.

---

    Code
      set_encoding(model = c("bear", "rabbit"), mode = "partition", eng = "stats",
      options = list(predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

# set_encoding() errors with wrong `mode` argument

    Code
      set_encoding("sticker")
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_encoding("sticker", c("classification", "regression"))
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_encoding("sticker", NULL)
    Error <rlang_error>
      Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_encoding(model = "sticker", mode = "not partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Error <rlang_error>
      'not partition' is not a known mode for model `sticker()`.

# set_encoding() errors with wrong `engine` argument

    Code
      set_encoding("lantern", "partition")
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_encoding("lantern", "partition", c("glmnet", "stats"))
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("lantern", "partition", NULL)
    Error <rlang_error>
      Please supply a character string for an engine name (e.g. `'stats'`).

# set_encoding() errors with wrong `value` argument

    Code
      set_encoding("chain", "partition", "stats")
    Error <rlang_error>
      `values` should be a list.

---

    Code
      set_encoding("chain", "partition", "stats", NULL)
    Error <rlang_error>
      `values` should be a list.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        compute_intercept = TRUE, remove_intercept = TRUE, allow_sparse_x = FALSE))
    Error <rlang_error>
      The values passed to `set_encoding()` are missing arguments: 'predictor_indicators'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", remove_intercept = TRUE,
        allow_sparse_x = FALSE))
    Error <rlang_error>
      The values passed to `set_encoding()` are missing arguments: 'compute_intercept'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        allow_sparse_x = FALSE))
    Error <rlang_error>
      The values passed to `set_encoding()` are missing arguments: 'remove_intercept'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE))
    Error <rlang_error>
      The values passed to `set_encoding()` are missing arguments: 'allow_sparse_x'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE, additional = "arg"))
    Error <rlang_error>
      The values passed to `set_encoding()` had extra arguments: 'additional'

