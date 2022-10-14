test_that("supervised_fit functions works", {
  model_fit <- list(a = 3, b = 5)

  expect_false(is_unsupervised_fit(model_fit))

  model_fit <- new_unsupervised_fit(model_fit)

  expect_true(is_unsupervised_fit(model_fit))

  expect_identical(
    model_fit,
    structure(list(a = 3, b = 5), class = c("list", "unsupervised_fit"))
  )
})
