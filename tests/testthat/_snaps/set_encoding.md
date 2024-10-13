# set_encoding() errors with wrong `model` argument

    Code
      set_encoding("light")
    Condition
      Error in `set_encoding()`:
      ! Model "light" has not been registered.

---

    Code
      set_encoding(model = c("bear", "rabbit"), mode = "partition", eng = "stats",
      options = list(predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `set_encoding()`:
      ! Please supply a character string for a model name (e.g. "k_means"). Not a character vector.

# set_encoding() errors with wrong `mode` argument

    Code
      set_encoding("sticker")
    Condition
      Error in `set_encoding()`:
      ! Please supply a character string for a mode (e.g. "partition").

---

    Code
      set_encoding("sticker", c("classification", "regression"))
    Condition
      Error in `set_encoding()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not a character vector.

---

    Code
      set_encoding("sticker", NULL)
    Condition
      Error in `set_encoding()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not NULL.

---

    Code
      set_encoding(model = "sticker", mode = "not partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `set_encoding()`:
      ! "not partition" is not a known mode for model `sticker()`.

# set_encoding() errors with wrong `engine` argument

    Code
      set_encoding("lantern", "partition")
    Condition
      Error in `set_encoding()`:
      ! Please supply a character string for an engine name (e.g. "stats").

---

    Code
      set_encoding("lantern", "partition", c("glmnet", "stats"))
    Condition
      Error in `set_encoding()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not a character vector.

---

    Code
      set_model_engine("lantern", "partition", NULL)
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not NULL.

# set_encoding() errors with wrong `value` argument

    Code
      set_encoding("chain", "partition", "stats")
    Condition
      Error in `set_encoding()`:
      ! `options` should be a list.

---

    Code
      set_encoding("chain", "partition", "stats", NULL)
    Condition
      Error in `set_encoding()`:
      ! `options` should be a list. Not a function.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        compute_intercept = TRUE, remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `set_encoding()`:
      x The values passed to `set_encoding()` had missing arguments:
      i predictor_indicators.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", remove_intercept = TRUE,
        allow_sparse_x = FALSE))
    Condition
      Error in `set_encoding()`:
      x The values passed to `set_encoding()` had missing arguments:
      i compute_intercept.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        allow_sparse_x = FALSE))
    Condition
      Error in `set_encoding()`:
      x The values passed to `set_encoding()` had missing arguments:
      i remove_intercept.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE))
    Condition
      Error in `set_encoding()`:
      x The values passed to `set_encoding()` had missing arguments:
      i allow_sparse_x.

---

    Code
      set_encoding(model = "chain", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = TRUE,
        remove_intercept = TRUE, allow_sparse_x = FALSE, additional = "arg"))
    Condition
      Error in `set_encoding()`:
      x The values passed to `set_encoding()` had extra arguments:
      i additional.

# is_discordant_info() triggers for set_encoding()

    Code
      set_encoding(model = "longs", mode = "partition", eng = "stats", options = list(
        predictor_indicators = "traditional", compute_intercept = FALSE,
        remove_intercept = TRUE, allow_sparse_x = FALSE))
    Condition
      Error in `set_encoding()`:
      ! The combination of engine "stats" and mode "partition" already has encoding data for model "longs" and the new information being registered is different.

