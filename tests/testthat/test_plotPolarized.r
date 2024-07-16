
test_that("error on arguments in plotPolarized", {

  dat <- importPolarized(
      files = system.file("extdata", "data7x3.txt", package = "diemr"),
      changePolarity = rep(FALSE, 3),
      ChosenInds = 1:2,
      ChosenSites = "all"
    )
    
  expect_error(
    object = plotPolarized(dat, HI = seq(0,1,length.out = 3)),
    regexp = "Provide HI for all genotypes"
  )

  expect_warning(
    object = plotPolarized(dat, HI = c(0,1), cols = rep(TRUE, 4)),
    regexp = "Argument cols must contain four valid colors"
  )
  
    expect_warning(
    object = plotPolarized(dat, HI = c(0,1), cols = c("#FFFFFF", "#800080", "#FFE500")),
    regexp = "Argument cols must contain four valid colors"
  )

})
