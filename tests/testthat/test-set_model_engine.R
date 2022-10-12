test_that('set_model_engine() works', {
  set_new_model("camera")
  set_model_mode("camera", "partition")
  set_model_engine("camera", "partition", "stats")

  expect_identical(
    get_from_env("camera"),
    tibble:: tibble(engine = "stats", mode = "partition")
  )

  set_model_engine("camera", "partition", "glmnet")
  expect_identical(
    get_from_env("camera"),
    tibble:: tibble(
      engine = c("stats", "glmnet"),
      mode = c("partition", "partition")
    )
  )
})

test_that('set_model_engine() cannot be called multiple times', {
  set_new_model("panda")
  set_model_mode("panda", "partition")
  set_model_engine("panda", "partition", "stats")

  expect_snapshot(error = TRUE,
    set_model_engine("panda", "partition", "stats")
  )
})

test_that('set_model_engine() errors with wrong `model` argument', {
  set_new_model("pants")
  set_model_mode("pants", "partition")
  set_new_model("keys")
  set_model_mode("keys", "partition")

  expect_snapshot(error = TRUE,
    set_model_engine("stickynotes")
  )

  expect_snapshot(error = TRUE,
    set_model_engine(c("boombox", "egg"), "partition", "stats")
  )
})

test_that('set_model_engine() errors with wrong `mode` argument', {
  set_new_model("paper")
  set_model_mode("paper", "partition")

  expect_snapshot(error = TRUE,
    set_model_engine("paper")
  )

  expect_snapshot(error = TRUE,
    set_model_engine("paper", c("classification", "regression"))
  )

  expect_snapshot(error = TRUE,
    set_model_engine("paper", NULL)
  )

  expect_snapshot(error = TRUE,
    set_model_engine("panda", "not partition", "stats")
  )
})

test_that('set_model_engine() errors with wrong `engine` argument', {
  set_new_model("street")
  set_model_mode("street", "partition")

  expect_snapshot(error = TRUE,
    set_model_engine("street", "partition")
  )

  expect_snapshot(error = TRUE,
    set_model_engine("street", "partition", c("glmnet", "stats"))
  )

  expect_snapshot(error = TRUE,
    set_model_engine("street", "partition", NULL)
  )
})
