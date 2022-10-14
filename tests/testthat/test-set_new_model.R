test_that("adding a new model", {
  set_new_model("sponge")

  mod_items <- get_model_env() %>% rlang::env_names()
  sponges <- grep("sponge", mod_items, value = TRUE)
  exp_obj <- c(
    "sponge_modes", "sponge_fit", "sponge_args",
    "sponge_predict", "sponge_pkgs", "sponge"
  )
  expect_equal(sort(sponges), sort(exp_obj))

  expect_equal(
    get_from_env("sponge"),
    tibble::tibble(engine = character(0), mode = character(0))
  )

  expect_equal(
    get_from_env("sponge_pkgs"),
    tibble::tibble(engine = character(0), pkg = list(), mode = character(0))
  )

  expect_equal(
    get_from_env("sponge_modes"), "unknown"
  )

  expect_equal(
    get_from_env("sponge_args"),
    tibble::tibble(
      engine = character(0), exposed = character(0),
      original = character(0), func = vector("list"),
      has_submodel = logical(0)
    )
  )

  expect_equal(
    get_from_env("sponge_fit"),
    tibble::tibble(
      engine = character(0),
      mode = character(0),
      value = vector("list")
    )
  )

  expect_equal(
    get_from_env("sponge_predict"),
    tibble::tibble(
      engine = character(0), mode = character(0),
      type = character(0), value = vector("list")
    )
  )

  expect_snapshot(
    error = TRUE,
    set_new_model()
  )
  expect_snapshot(
    error = TRUE,
    set_new_model(2)
  )
  expect_snapshot(
    error = TRUE,
    set_new_model(letters[1:2])
  )
})

test_that("set_new_model can be called multiple times", {
  set_new_model("starfish")
  expect_no_error(
    set_new_model("starfish")
  )
})

test_that("set_env_val() errors currectly", {
  expect_snapshot(
    error = TRUE,
    set_env_val(c("models", "modes"), NULL)
  )

  expect_snapshot(
    error = TRUE,
    set_env_val(1, NULL)
  )
})
