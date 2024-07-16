test_that("resolveCompartments", {
  filenames <- c(system.file("extdata", "data7x3.txt", package = "diemr"),
                 system.file("extdata", "data7x10.txt", package = "diemr"))

  expect_equal(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = rep(TRUE, 13)),
    expected = list(rep(TRUE, 3), rep(TRUE, 10)),
    ignore_attr = TRUE  
  )

  expect_equal(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = rep(TRUE, 13), compartmentSizes = c(3,10)), 
    expected = list(rep(TRUE, 3), rep(TRUE, 10)),
    ignore_attr = TRUE  
  )

  expect_equal(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = "all"),
    expected = list(rep(TRUE, 3), rep(TRUE, 10)),
    ignore_attr = TRUE  
  )

  expect_equal(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = "no", compartmentSizes = c(3,10)), 
    expected = list(rep(TRUE, 3), rep(TRUE, 10)),
    ignore_attr = TRUE  
  )


  expect_error(
    object = resolveCompartments(, TRUE),
    regexp = "Provide paths to diem input files"
  )
  
  expect_error(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = list("all")), 
    regexp = "toBeCompartmentalized must be" 
  )
  
    expect_error(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = data.frame("all")), 
    regexp = "toBeCompartmentalized must be" 
  )

    expect_error(
    object = resolveCompartments(files = filenames, toBeCompartmentalized = TRUE), 
    regexp = "toBeCompartmentalized does not have the same length" 
  )

})