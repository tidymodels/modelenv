test_that("set_model_mode() works", {
  set_new_model("carrot")
  set_model_mode("carrot", "classification")

  expect_equal(get_from_env("carrot_modes"), c("unknown", "classification"))
})

test_that("set_model_mode() can be called multiple times", {
  set_new_model("banana")
  set_model_mode("banana", "classification")

  expect_no_error(set_model_mode("banana", "classification"))
})

test_that("set_model_mode() errors with wrong `model` argument", {
  set_new_model("boombox")
  set_new_model("egg")

  expect_snapshot(
    error = TRUE,
    set_model_mode("wagon")
  )

  expect_snapshot(
    error = TRUE,
    set_model_mode(c("boombox", "egg"), "classification")
  )
})

test_that("set_model_mode() errors with wrong `mode` argument", {
  set_new_model("glass")

  expect_snapshot(
    error = TRUE,
    set_model_mode("glass")
  )

  expect_snapshot(
    error = TRUE,
    set_model_mode("glass", c("classification", "regression"))
  )

  expect_snapshot(
    error = TRUE,
    set_model_mode("glass", NULL)
  )
})
