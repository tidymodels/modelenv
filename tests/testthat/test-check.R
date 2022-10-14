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
