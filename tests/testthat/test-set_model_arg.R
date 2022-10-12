test_that("set_model_arg() works", {
  set_new_model("ice")
  set_model_mode("ice", "partition")
  set_model_engine("ice", "partition", "stats")
  set_model_arg(
    model = "ice",
    eng = "stats",
    exposed = "method",
    original = "method",
    func = list(pkg = "stats", fun = "lm"),
    has_submodel = FALSE
  )

  expect_identical(
    get_model_arg("ice", "stats"),
    tibble::tibble(
      exposed = "method",
      original = "method",
      func = list(
        list(
          pkg = "stats",
          fun = "lm"
        )
      ),
      has_submodel = FALSE
    )
  )
})

test_that("set_model_arg() errors with wrong `model` argument", {
  set_new_model("phone")
  set_model_mode("phone", "partition")
  set_model_engine("phone", "partition", "stats")
  set_new_model("sock")
  set_model_mode("sock", "partition")
  set_model_engine("sock", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_model_arg("light")
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = c("phone", "sock")
    )
  )
})

test_that("set_model_arg() errors with wrong `engine` argument", {
  set_new_model("thermos")
  set_model_mode("thermos", "partition")

  expect_snapshot(
    error = TRUE,
    set_model_arg("thermos")
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg("thermos", c("glmnet", "stats"))
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg("thermos", NULL)
  )
})

test_that("set_model_arg() errors with wrong `exposed` argument", {
  set_new_model("marker")
  set_model_mode("marker", "partition")
  set_model_engine("marker", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "marker",
      eng = "stats"
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "marker",
      eng = "stats",
      exposed = c("glmnet", "stats")
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "marker",
      eng = "stats",
      exposed = NULL
    )
  )
})

test_that("set_model_arg() errors with wrong `original` argument", {
  set_new_model("mustache")
  set_model_mode("mustache", "partition")
  set_model_engine("mustache", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "mustache",
      eng = "stats",
      exposed = "method"
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "mustache",
      eng = "stats",
      exposed = "method",
      original = c("not", "method")
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "mustache",
      eng = "stats",
      exposed = "method",
      original = NULL
    )
  )
})

test_that("set_model_arg() errors with wrong `func` argument", {
  set_new_model("unicorn")
  set_model_mode("unicorn", "partition")
  set_model_engine("unicorn", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "unicorn",
      eng = "stats",
      exposed = "method",
      original = "moethod"
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "unicorn",
      eng = "stats",
      exposed = "method",
      original = "method",
      func = c("not", "method")
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "unicorn",
      eng = "stats",
      exposed = "method",
      original = "method",
      func = NULL
    )
  )
})

test_that("set_model_arg() errors with wrong `has_submodel` argument", {
  set_new_model("velcro")
  set_model_mode("velcro", "partition")
  set_model_engine("velcro", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "velcro",
      eng = "stats",
      exposed = "method",
      original = "moethod",
      func = list(pkg = "stats", fun = "lm")
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "velcro",
      eng = "stats",
      exposed = "method",
      original = "method",
      func = list(pkg = "stats", fun = "lm"),
      has_submodel = "yes"
    )
  )

  expect_snapshot(
    error = TRUE,
    set_model_arg(
      model = "velcro",
      eng = "stats",
      exposed = "method",
      original = "method",
      func = list(pkg = "stats", fun = "lm"),
      has_submodel = NULL
    )
  )
})
