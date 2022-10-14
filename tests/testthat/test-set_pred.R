test_that("set_pred() works", {
  set_new_model("fire")
  set_model_mode("fire", "partition")
  set_model_engine("fire", "partition", "stats")
  set_pred(
    model = "fire",
    mode = "partition",
    eng = "stats",
    type = "raw",
    value = list(
      pre = NULL,
      post = NULL,
      func = c(fun = "predict"),
      args =
        list(
          object = rlang::expr(object$fit),
          newdata = rlang::expr(new_data),
          type = "response"
        )
    )
  )

  expect_identical(
    get_pred_type("fire", "raw"),
    tibble::tibble(
      engine = "stats",
      mode = "partition",
      type = "raw",
      value = list(
        list(
          pre = NULL,
          post = NULL,
          func = c(fun = "predict"),
          args = list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
        )
      )
    )
  )
})

test_that("set_pred() errors with wrong `model` argument", {
  set_new_model("tent")
  set_model_mode("tent", "partition")
  set_model_engine("tent", "partition", "stats")
  set_new_model("shed")
  set_model_mode("shed", "partition")
  set_model_engine("shed", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_pred("light")
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = c("tent", "shed"),
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = NULL,
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )
})

test_that("set_pred() errors with wrong `mode` argument", {
  set_new_model("game")
  set_model_mode("game", "partition")
  set_model_engine("game", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_pred("game")
  )

  expect_snapshot(
    error = TRUE,
    set_pred("game", c("classification", "regression"))
  )

  expect_snapshot(
    error = TRUE,
    set_pred("game", NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "game",
      mode = "not partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = NULL,
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )
})

test_that("set_pred() errors with wrong `engine` argument", {
  set_new_model("dog")
  set_model_mode("dog", "partition")

  expect_snapshot(
    error = TRUE,
    set_pred("dog", "partition")
  )

  expect_snapshot(
    error = TRUE,
    set_pred("dog", "partition", c("glmnet", "stats"))
  )

  expect_snapshot(
    error = TRUE,
    set_model_engine("dog", "partition", NULL)
  )
})

test_that("set_pred() errors with wrong `value` argument", {
  set_new_model("trunk")
  set_model_mode("trunk", "partition")
  set_model_engine("trunk", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_pred("trunk", "partition", "stats", "raw")
  )

  expect_snapshot(
    error = TRUE,
    set_pred("trunk", "partition", "stats", "raw", NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        post = NULL,
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = NULL,
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = NULL,
        func = c(fun = "predict")
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = "NULL",
        post = NULL,
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = "NULL",
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "trunk",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = NULL,
        func = c(fun = "predict"),
        args = "not a list"
      )
    )
  )
})

test_that("is_discordant_info() triggers for set_pred()", {
  set_new_model("diamond")
  set_model_mode("diamond", "partition")
  set_model_engine("diamond", "partition", "stats")

  set_pred(
    model = "diamond",
    mode = "partition",
    eng = "stats",
    type = "raw",
    value = list(
      pre = NULL,
      post = NULL,
      func = c(fun = "predict"),
      args =
        list(
          object = rlang::expr(object$fit),
          newdata = rlang::expr(new_data),
          type = "response"
        )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_pred(
      model = "diamond",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre =  NULL,
        post = NULL,
        func = c(fun = "not predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )
})

test_that("set_pred() can be called multiple times", {
  set_new_model("firetruck")
  set_model_mode("firetruck", "partition")
  set_model_engine("firetruck", "partition", "stats")
  set_pred(
    model = "firetruck",
    mode = "partition",
    eng = "stats",
    type = "raw",
    value = list(
      pre = NULL,
      post = NULL,
      func = c(fun = "predict"),
      args =
        list(
          object = rlang::expr(object$fit),
          newdata = rlang::expr(new_data),
          type = "response"
        )
    )
  )

  expect_no_error(
    set_pred(
      model = "firetruck",
      mode = "partition",
      eng = "stats",
      type = "raw",
      value = list(
        pre = NULL,
        post = NULL,
        func = c(fun = "predict"),
        args =
          list(
            object = rlang::expr(object$fit),
            newdata = rlang::expr(new_data),
            type = "response"
          )
      )
    )
  )
})
