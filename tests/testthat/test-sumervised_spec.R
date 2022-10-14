test_that("supervised_spec functions works", {
  model_spec <- list(a = 3, b = 5)

  expect_false(is_unsupervised_spec(model_spec))

  model_spec <- new_unsupervised_spec(model_spec)

  expect_true(is_unsupervised_spec(model_spec))

  expect_identical(
    model_spec,
    structure(list(a = 3, b = 5), class = c("list", "unsupervised_spec"))
  )
})
