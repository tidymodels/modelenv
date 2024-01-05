# set_encoding() errors with wrong `model` argument

    Code
      set_encoding("light")
    Condition
      Error in `check_model_val()`:
      ! Model `light` has not been registered.

---

    Code
      set_encoding(model = c("bear", "rabbit"), mode = "partition", eng = "stats",
      options = list(predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `check_model_val()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_encoding() errors with wrong `mode` argument

    Code
      set_encoding("sticker")
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_encoding("sticker", c("classification", "regression"))
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_encoding("sticker", NULL)
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_encoding(model = "sticker", mode = "not partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `check_spec_mode_engine_val()`:
      ! 'not partition' is not a known mode for model `sticker()`.

# set_encoding() errors with wrong `engine` argument

    Code
      set_encoding("lantern", "partition")
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_encoding("lantern", "partition", c("glmnet", "stats"))
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("lantern", "partition", NULL)
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

# set_encoding() errors with wrong `value` argument

    Code
      set_encoding("chain", "partition", "stats")
    Condition
      Error in `check_encodings()`:
      ! `values` should be a list.

---

    Code
      set_encoding("chain", "partition", "stats", NULL)
    Condition
      Error in `check_encodings()`:
      ! `values` should be a list.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        compute_intercept = TRUE, remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `check_encodings()`:
      ! The values passed to `set_encoding()` are missing arguments: 'predictor_indicators'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", remove_intercept = TRUE,
        allow_sparse_x = FALSE))
    Condition
      Error in `check_encodings()`:
      ! The values passed to `set_encoding()` are missing arguments: 'compute_intercept'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        allow_sparse_x = FALSE))
    Condition
      Error in `check_encodings()`:
      ! The values passed to `set_encoding()` are missing arguments: 'remove_intercept'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE))
    Condition
      Error in `check_encodings()`:
      ! The values passed to `set_encoding()` are missing arguments: 'allow_sparse_x'

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE, additional = "arg"))
    Condition
      Error in `check_encodings()`:
      ! The values passed to `set_encoding()` had extra arguments: 'additional'

# is_discordant_info() triggers for set_encoding()

    Code
      set_encoding(model = "longs", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = FALSE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `is_discordant_info()`:
      ! The combination of engine 'stats' and mode 'partition'  already has encoding data for model 'longs' and the new information being registered is different.

