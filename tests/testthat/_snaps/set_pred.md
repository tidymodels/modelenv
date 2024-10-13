# set_pred() errors with wrong `model` argument

    Code
      set_pred("light")
    Condition
      Error in `set_pred()`:
      ! Model "light" has not been registered.

---

    Code
      set_pred(model = c("tent", "shed"), mode = "partition", eng = "stats", type = "raw",
      value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = list(
        object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! Please supply a character string for a model name (e.g. "k_means"). Not a character vector.

# set_pred() errors with wrong `mode` argument

    Code
      set_pred("game")
    Condition
      Error in `set_pred()`:
      ! Please supply a character string for a mode (e.g. "partition").

---

    Code
      set_pred("game", c("classification", "regression"))
    Condition
      Error in `set_pred()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not a character vector.

---

    Code
      set_pred("game", NULL)
    Condition
      Error in `set_pred()`:
      ! Please supply a character string for a mode (e.g. "partition"). Not NULL.

---

    Code
      set_pred(model = "game", mode = "not partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! "not partition" is not a known mode for model `game()`.

# set_pred() errors with wrong `engine` argument

    Code
      set_pred("dog", "partition")
    Condition
      Error in `set_pred()`:
      ! Please supply a character string for an engine name (e.g. "stats").

---

    Code
      set_pred("dog", "partition", c("glmnet", "stats"))
    Condition
      Error in `set_pred()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not a character vector.

---

    Code
      set_model_engine("dog", "partition", NULL)
    Condition
      Error in `set_model_engine()`:
      ! Please supply a character string for an engine name (e.g. "stats"). Not NULL.

# set_pred() errors with wrong `value` argument

    Code
      set_pred("trunk", "partition", "stats", "raw")
    Condition
      Error in `set_pred()`:
      ! Argument `value` is missing, with no default.

---

    Code
      set_pred("trunk", "partition", "stats", "raw", NULL)
    Condition
      Error in `set_pred()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, and `pre`.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(post = NULL, func = c(fun = "predict"), args = list(object = rlang::expr(
          object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, and `pre`.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, func = c(fun = "predict"), args = list(object = rlang::expr(
          object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, and `pre`.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, args = list(object = rlang::expr(object$
          fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, and `pre`.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict")))
    Condition
      Error in `set_pred()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, and `pre`.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = "NULL", post = NULL, func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The `pre` module should be `NULL` or a function.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = "NULL", func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The `post` module should be `NULL` or a function.

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = "not a list"))
    Condition
      Error in `set_pred()`:
      ! The `args` element should be a list.

# set_pred() errors with wrong `type` argument

    Code
      set_pred(model = "scroll", mode = "partition", eng = "stats", type = "not raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The prediction type should be one of: cluster and raw.

# is_discordant_info() triggers for set_pred()

    Code
      set_pred(model = "diamond", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "not predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `set_pred()`:
      ! The combination of engine "stats" and mode "partition" and prediction type 'raw' already has predict data for model "diamond" and the new information being registered is different.

