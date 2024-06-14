
test_that("error on arguments in importPolarized", {
  expect_error(
    object = importPolarized(
      file = system.file("extdata", "data7x10.txt", package = "diemr"),
      changePolarity = rep(FALSE, 3),
      ChosenInds = 1:7
    ),
    regexp = "but changePolarity has length"
  )

  expect_error(
    object = importPolarized(
      file = system.file("extdata", "data7x10.txt", package = "diemr"),
      changePolarity = rep(FALSE, 10),
      ChosenInds = 1:8
    ),
    regexp = "contains fewer individuals"
  )
})


test_that("correct solution of importPolarized", {
  expect_equal(
    object = importPolarized(
      file = system.file("extdata", "data7x3.txt", package = "diemr"),
      changePolarity = rep(FALSE, 3),
      ChosenInds = 1:6
    ),
    expected = c(
      "0", "0", "1", "1", "2", "2", "1", "2", "1",
      "0", "0", "0", "0", "2", "2", "2", "1", "_"
    ),
    ignore_attr = TRUE
  )

  expect_equal(
    object = importPolarized(
      file = system.file("extdata", "data7x3.txt", package = "diemr"),
      changePolarity = c(FALSE, FALSE, TRUE),
      ChosenInds = 1:6
    ),
    expected = c(
      "0", "0", "1", "1", "2", "2",
      "1", "2", "1", "0", "0", "0",
      "2", "0", "0", "0", "1", "_"
    ),
    ignore_attr = TRUE
  )

  expect_equal(
    object = importPolarized(
      file = system.file("extdata", "data7x3.txt", package = "diemr"),
      changePolarity = c(TRUE, TRUE, TRUE),
      ChosenInds = 1:6
    ),
    expected = c(
      "2", "2", "1", "1", "0", "0",
      "1", "0", "1", "2", "2", "2",
      "2", "0", "0", "0", "1", "_"
    ),
    ignore_attr = TRUE
  )
})


test_that("correct dimnames in importPolarized", {
  expect_equal(
    object = importPolarized(
      file = system.file("extdata", "data7x3.txt", package = "diemr"),
      changePolarity = c(TRUE, TRUE, TRUE),
      ChosenInds = c(1:2, 4:6)
    ),
    expected = matrix(c(
      "2", "2", "1", "0", "0",
      "1", "0", "2", "2", "2",
      "2", "0", "0", "1", "_"
    ),
    ncol = 3,
    dimnames = list(c("1", "2", "4", "5", "6"), c("m1", "m2", "m3"))
    )
  )

  expect_equal(
    object = importPolarized(
      file = system.file("extdata", "data7x3.txt", package = "diemr"),
      changePolarity = c(TRUE, TRUE, TRUE),
      ChosenInds = c(1, 4, 2, 3, 6, 5)
    ),
    expected = matrix(c(
      "2", "1", "2", "1", "0", "0",
      "1", "2", "0", "1", "2", "2",
      "2", "0", "0", "0", "_", "1"
    ),
    ncol = 3,
    dimnames = list(c("1", "4", "2", "3", "6", "5"), c("m1", "m2", "m3"))
    )
  )
})
