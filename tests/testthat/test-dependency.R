test_that("set_dependency() works", {
  set_new_model("tiger")
  set_model_mode("tiger", "partition")
  set_model_engine("tiger", "partition", "stats")
  set_dependency("tiger", "partition", "stats", "base")

  expect_identical(
    get_dependency("tiger"),
    tibble::tibble(engine = "stats", pkg = list("base"), mode = "partition")
  )

  set_dependency("tiger", "partition", "stats", "Matrix")

  expect_identical(
    get_dependency("tiger"),
    tibble::tibble(
      engine = "stats",
      pkg = list(c("base", "Matrix")),
      mode = "partition"
    )
  )
})

test_that("set_dependency() don't store duplicates", {
  set_new_model("lion")
  set_model_mode("lion", "partition")
  set_model_engine("lion", "partition", "stats")
  set_model_engine("lion", "partition", "glmnet")
  set_dependency("lion", "partition", "stats", "base")
  set_dependency("lion", "partition", "stats", "survival")
  set_dependency("lion", "partition", "stats", "survival")
  set_dependency("lion", "partition", "glmnet", "ggplot2")
  set_dependency("lion", "partition", "glmnet", "ggplot2")
  set_dependency("lion", "partition", "glmnet", "glmnet")

  expect_identical(
    get_dependency("lion"),
    tibble::tibble(
      engine = c("glmnet", "stats"),
      pkg = list(c("ggplot2", "glmnet"), c("base", "survival")),
      mode = c("partition", "partition")
    )
  )
})

test_that('set_dependency() errors with wrong `model` argument', {
  set_new_model("bear")
  set_model_mode("bear", "partition")
  set_model_engine("bear", "partition", "stats")
  set_new_model("rabbit")
  set_model_mode("rabbit", "partition")
  set_model_engine("rabbit", "partition", "stats")

  expect_snapshot(error = TRUE,
    set_dependency("polarbear")
  )

  expect_snapshot(error = TRUE,
    set_dependency(c("bear", "rabbit"), "partition", "stats", "stats")
  )
})

test_that('set_dependency() errors with wrong `mode` argument', {
  set_new_model("clip")
  set_model_mode("clip", "partition")
  set_model_engine("clip", "partition", "stats")

  expect_snapshot(error = TRUE,
    set_dependency("clip")
  )

  expect_snapshot(error = TRUE,
    set_dependency("clip", c("classification", "regression"))
  )

  expect_snapshot(error = TRUE,
    set_dependency("clip", NULL)
  )

  expect_snapshot(error = TRUE,
    set_dependency("clip", "not partition", "stats", "stats")
  )
})

test_that('set_dependency() errors with wrong `engine` argument', {
  set_new_model("hamper")
  set_model_mode("hamper", "partition")

  expect_snapshot(error = TRUE,
    set_dependency("hamper", "partition")
  )

  expect_snapshot(error = TRUE,
    set_dependency("hamper", "partition", c("glmnet", "stats"))
  )

  expect_snapshot(error = TRUE,
    set_model_engine("hamper", "partition", NULL)
  )
})

test_that('set_dependency() errors with wrong `engine` argument', {
  set_new_model("duck")
  set_model_mode("duck", "partition")
  set_model_engine("duck", "partition", "stats")

  expect_snapshot(error = TRUE,
    set_dependency("duck", "partition", "stats")
  )

  expect_snapshot(error = TRUE,
    set_dependency("duck", "partition", "stats", c("glmnet", "stats"))
  )

  expect_snapshot(error = TRUE,
    set_dependency("duck", "partition", "stats", NULL)
  )
})
