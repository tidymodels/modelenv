test_that("set_fit() works", {
  set_new_model("water")
  set_model_mode("water", "partition")
  set_model_engine("water", "partition", "stats")
  set_fit(
    model = "water",
    mode = "partition",
    eng = "stats",
    value = list(
      interface = "formula",
      protect = c("formula", "data"),
      func = c(pkg = "stats", fun = "lm"),
      defaults = list()
    )
  )

  expect_identical(
    get_fit("water"),
    tibble::tibble(
      engine = "stats",
      mode = "partition",
      value = list(
        list(
          interface = "formula",
          protect = c("formula", "data"),
          func = c(pkg = "stats", fun = "lm"),
          defaults = list()
        )
      )
    )
  )
})

test_that("set_fit() cannot be called multiple times", {
  set_new_model("tape")
  set_model_mode("tape", "partition")
  set_model_engine("tape", "partition", "stats")
  set_fit(
    model = "tape",
    mode = "partition",
    eng = "stats",
    value = list(
      interface = "formula",
      protect = c("formula", "data"),
      func = c(pkg = "stats", fun = "lm"),
      defaults = list()
    )
  )
  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "tape",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )
})

test_that("set_fit() errors with wrong `model` argument", {
  set_new_model("ring")
  set_model_mode("ring", "partition")
  set_model_engine("ring", "partition", "stats")
  set_new_model("string")
  set_model_mode("string", "partition")
  set_model_engine("string", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_fit("light")
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = c("bear", "rabbit"),
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )
})

test_that("set_fit() errors with wrong `mode` argument", {
  set_new_model("camcorder")
  set_model_mode("camcorder", "partition")
  set_model_engine("camcorder", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_fit("camcorder")
  )

  expect_snapshot(
    error = TRUE,
    set_fit("camcorder", c("classification", "regression"))
  )

  expect_snapshot(
    error = TRUE,
    set_fit("camcorder", NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "camcorder",
      mode = "not partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )
})

test_that("set_fit() errors with wrong `engine` argument", {
  set_new_model("dice")
  set_model_mode("dice", "partition")

  expect_snapshot(
    error = TRUE,
    set_fit("dice", "partition")
  )

  expect_snapshot(
    error = TRUE,
    set_fit("dice", "partition", c("glmnet", "stats"))
  )

  expect_snapshot(
    error = TRUE,
    set_model_engine("dice", "partition", NULL)
  )
})

test_that("set_fit() errors with wrong `value` argument", {
  set_new_model("ladle")
  set_model_mode("ladle", "partition")
  set_model_engine("ladle", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_fit("ladle", "partition", "stats")
  )

  expect_snapshot(
    error = TRUE,
    set_fit("ladle", "partition", "stats", NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm")
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list(),
        additional = "arg"
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list(),
        data = list("not", "named")
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "not formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = c("formula", "matrix"),
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c("stats", "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c("stats", pkg = "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(fun = "stats", pkg = "lm", additional = "no"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(fun = lm, pkg = "lm"),
        defaults = list()
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "ladle",
      mode = "partition",
      eng = "stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(fun = "stats", pkg = lm),
        defaults = list()
      )
    )
  )
})

test_that("set_fit() errors if engine doesn't match", {
  set_new_model("whale")
  set_model_mode("whale", "partition")
  set_model_engine("whale", "partition", "stats")

  expect_snapshot(
    error = TRUE,
    set_fit(
      model = "whale",
      mode = "partition",
      eng = "not stats",
      value = list(
        interface = "formula",
        protect = c("formula", "data"),
        func = c(pkg = "stats", fun = "lm"),
        defaults = list()
      )
    )
  )
})
