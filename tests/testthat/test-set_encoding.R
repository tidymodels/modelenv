test_that("set_encoding() works", {
  set_new_model("shorts")
  set_model_mode("shorts", "partition")
  set_model_engine("shorts", "partition", "stats")

  set_encoding(
    model = "shorts",
    mode = "partition",
    eng = "stats",
    options = list(
      predictor_indicators = "traditional",
      compute_intercept = TRUE,
      remove_intercept = TRUE,
      allow_sparse_x = FALSE
    )
  )

  expect_identical(
    get_encoding("shorts"),
    tibble::tibble(
      model = "shorts",
      engine = "stats",
      mode = "partition",
      predictor_indicators = "traditional",
      compute_intercept = TRUE,
      remove_intercept = TRUE,
      allow_sparse_x = FALSE
    )
  )
})

test_that("set_encoding() works", {
  set_new_model("shorts")
  set_model_mode("shorts", "partition")
  set_model_engine("shorts", "partition", "stats")

  set_encoding(
    model = "shorts",
    mode = "partition",
    eng = "stats",
    options = list(
      predictor_indicators = "traditional",
      compute_intercept = TRUE,
      remove_intercept = TRUE,
      allow_sparse_x = FALSE
    )
  )

  set_model_engine("shorts", "partition", "glmnet")

  set_encoding(
    model = "shorts",
    mode = "partition",
    eng = "glmnet",
    options = list(
      predictor_indicators = "traditional",
      compute_intercept = FALSE,
      remove_intercept = FALSE,
      allow_sparse_x = TRUE
    )
  )

  expect_identical(
    get_encoding("shorts"),
    tibble::tibble(
      model = c("shorts", "shorts"),
      engine = c("stats", "glmnet"),
      mode = c("partition", "partition"),
      predictor_indicators = c("traditional", "traditional"),
      compute_intercept = c(TRUE, FALSE),
      remove_intercept = c(TRUE, FALSE),
      allow_sparse_x = c(FALSE, TRUE)
    )
  )
})

test_that("set_encoding() errors with wrong `model` argument", {
  set_new_model("mower")
  set_model_mode("mower", "partition")
  set_model_engine("mower", "partition", "stats")
  set_new_model("stmower")
  set_model_mode("stmower", "partition")
  set_model_engine("stmower", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_encoding("light")
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = c("bear", "rabbit"),
      mode = "partition",
      eng = "stats",
      options = list(
        predictor_indicators = "traditional",
        compute_intercept = TRUE,
        remove_intercept = TRUE,
        allow_sparse_x = FALSE
      )
    )
  )
})

test_that("set_encoding() errors with wrong `mode` argument", {
  set_new_model("sticker")
  set_model_mode("sticker", "partition")
  set_model_engine("sticker", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_encoding("sticker")
  )

  expect_snapshot(
    error = TRUE,
    set_encoding("sticker", c("classification", "regression"))
  )

  expect_snapshot(
    error = TRUE,
    set_encoding("sticker", NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = "sticker",
      mode = "not partition",
      eng = "stats",
      options = list(
        predictor_indicators = "traditional",
        compute_intercept = TRUE,
        remove_intercept = TRUE,
        allow_sparse_x = FALSE
      )
    )
  )
})

test_that("set_encoding() errors with wrong `engine` argument", {
  set_new_model("lantern")
  set_model_mode("lantern", "partition")

  expect_snapshot(
    error = TRUE,
    set_encoding("lantern", "partition")
  )

  expect_snapshot(
    error = TRUE,
    set_encoding("lantern", "partition", c("glmnet", "stats"))
  )

  expect_snapshot(
    error = TRUE,
    set_model_engine("lantern", "partition", NULL)
  )
})

test_that("set_encoding() errors with wrong `value` argument", {
  set_new_model("chain")
  set_model_mode("chain", "partition")
  set_model_engine("chain", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_encoding("chain", "partition", "stats")
  )

  expect_snapshot(
    error = TRUE,
    set_encoding("chain", "partition", "stats", NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = "chain",
      mode = "partition",
      eng = "stats",
      options = list(
        compute_intercept = TRUE,
        remove_intercept = TRUE,
        allow_sparse_x = FALSE
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = "chain",
      mode = "partition",
      eng = "stats",
      options = list(
        predictor_indicators = "traditional",
        remove_intercept = TRUE,
        allow_sparse_x = FALSE
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = "chain",
      mode = "partition",
      eng = "stats",
      options = list(
        predictor_indicators = "traditional",
        compute_intercept = TRUE,
        allow_sparse_x = FALSE
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = "chain",
      mode = "partition",
      eng = "stats",
      options = list(
        predictor_indicators = "traditional",
        compute_intercept = TRUE,
        remove_intercept = TRUE
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_encoding(
      model = "chain",
      mode = "partition",
      eng = "stats",
      options = list(
        predictor_indicators = "traditional",
        compute_intercept = TRUE,
        remove_intercept = TRUE,
        allow_sparse_x = FALSE,
        additional = "arg"
      )
    )
  )
})
