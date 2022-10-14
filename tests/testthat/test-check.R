test_that("check_spec_mode_engine_val() works", {
  set_new_model("hoop")
  set_model_mode("hoop", "partition")
  set_model_mode("hoop", "raw")
  set_model_engine("hoop", "partition", "stats")
  expect_snapshot(
    error = TRUE,
    check_spec_mode_engine_val("hoop", "raw", "stats")
  )
})

test_that("stop_incompatible_mode() works", {
  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(spec_modes = "partition")
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(spec_modes = c("partition", "raw"))
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"))
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = "partition",
      eng = "stats"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = c("partition", "raw"),
      eng = "stats"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = c("partition", "raw", "another one"),
      eng = "stats"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = "partition",
      model = "shallow"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = c("partition", "raw"),
      model = "shallow"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = c("partition", "raw", "another one"),
      model = "shallow"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = "partition",
      eng = "stats",
      model = "shallow"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = c("partition", "raw"),
      eng = "stats",
      model = "shallow"
    )
  )

  expect_snapshot(
    error = TRUE,
    stop_incompatible_mode(
      spec_modes = c("partition", "raw", "another one"),
      eng = "stats",
      model = "shallow"
    )
  )
})
