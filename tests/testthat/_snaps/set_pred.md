# set_pred() errors with wrong `model` argument

    Code
      set_pred("light")
    Condition
      Error in `check_model_val()`:
      ! Model `light` has not been registered.

---

    Code
      set_pred(model = c("tent", "shed"), mode = "partition", eng = "stats", type = "raw",
      value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = list(
        object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_model_val()`:
      ! Please supply a character string for a model name (e.g. `'k_means'`).

# set_pred() errors with wrong `mode` argument

    Code
      set_pred("game")
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_pred("game", c("classification", "regression"))
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_pred("game", NULL)
    Condition
      Error in `check_mode_val()`:
      ! Please supply a character string for a mode (e.g. `'partition'`).

---

    Code
      set_pred(model = "game", mode = "not partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_spec_mode_engine_val()`:
      ! 'not partition' is not a known mode for model `game()`.

# set_pred() errors with wrong `engine` argument

    Code
      set_pred("dog", "partition")
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_pred("dog", "partition", c("glmnet", "stats"))
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

---

    Code
      set_model_engine("dog", "partition", NULL)
    Condition
      Error in `check_eng_val()`:
      ! Please supply a character string for an engine name (e.g. `'stats'`).

# set_pred() errors with wrong `value` argument

    Code
      set_pred("trunk", "partition", "stats", "raw")
    Condition
      Error in `set_pred()`:
      ! argument "value" is missing, with no default

---

    Code
      set_pred("trunk", "partition", "stats", "raw", NULL)
    Condition
      Error in `check_pred_info()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, `pre`

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(post = NULL, func = c(fun = "predict"), args = list(object = rlang::expr(
          object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_pred_info()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, `pre`

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, func = c(fun = "predict"), args = list(object = rlang::expr(
          object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_pred_info()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, `pre`

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, args = list(object = rlang::expr(object$
          fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_pred_info()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, `pre`

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict")))
    Condition
      Error in `check_pred_info()`:
      ! The `predict` module should have elements: `args`, `func`, `post`, `pre`

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = "NULL", post = NULL, func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_pred_info()`:
      ! The `pre` module should be null or a function: 

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = "NULL", func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_pred_info()`:
      ! The `post` module should be null or a function: 

---

    Code
      set_pred(model = "trunk", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = "not a list"))
    Condition
      Error in `check_pred_info()`:
      ! The `args` element should be a list.

# set_pred() errors with wrong `type` argument

    Code
      set_pred(model = "scroll", mode = "partition", eng = "stats", type = "not raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `check_pred_info()`:
      ! The prediction type should be one of: 'cluster', 'raw'

# is_discordant_info() triggers for set_pred()

    Code
      set_pred(model = "diamond", mode = "partition", eng = "stats", type = "raw",
        value = list(pre = NULL, post = NULL, func = c(fun = "not predict"), args = list(
          object = rlang::expr(object$fit), newdata = rlang::expr(new_data), type = "response")))
    Condition
      Error in `is_discordant_info()`:
      ! The combination of engine 'stats' and mode 'partition' and prediction type 'raw' already has predict data for model 'diamond' and the new information being registered is different.

