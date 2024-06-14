
test_that("correct solution in ModelOfDiagnostics", {
  I4 <- t(apply(importPolarized(
    system.file("extdata", "data7x10.txt", package = "diemr"),
    rep(FALSE, 10), 1:7
  ),
  MARGIN = 1, FUN = sStateCount
  ))

  expect_equal(
    ignore_attr = TRUE,
    object = ModelOfDiagnostic(I4 = I4, apply(I4, 1, pHetErrOnStateCount)),
    expected = c(0.525342465753424, 0.508219178082192, 0.02, 0.02, 0.508219178082192, 0.02, 0.525342465753424, 1.57602739726027, 0.508219178082192, 9.93, 0, 0.508219178082192, 9.95, 1.05068493150685, 1.05068493150685, 0.508219178082192, 0.05, 0.05, 0.508219178082192, 0.01, 2.1013698630137, 6.84794520547945, 8.47534246575342, 0, 9.93, 8.47534246575342, 0.02, 6.32260273972603),
    tolerance = 1e-4
  )


  expect_equal(
    ignore_attr = TRUE,
    object = ModelOfDiagnostic(I4 = I4 * c(1, 1, 1, 1, 2, 2, 2), apply(I4, 1, pHetErrOnStateCount)),
    expected = c(0.525342465753424, 0.508219178082192, 0.02, 0.02, 1.01643835616438, 0.04, 1.05068493150685, 1.57602739726027, 0.508219178082192, 9.93, 0, 1.01643835616438, 10, 2.1013698630137, 1.05068493150685, 0.508219178082192, 0.05, 0.05, 1.01643835616438, 0.02, 4.2027397260274, 6.84794520547945, 8.47534246575342, 0, 9.93, 9.49178082191781, 0.04, 7.8986301369863),
    tolerance = 1e-4
  )

  expect_equal(
    ignore_attr = TRUE,
    object = ModelOfDiagnostic(I4 = I4 * c(1, 1, 1, 1, 0, 0, 0), apply(I4, 1, pHetErrOnStateCount)),
    expected = c(0.525342465753424, 0.508219178082192, 0.02, 0.02, 0, 0, 0, 1.57602739726027, 0.508219178082192, 9.93, 0, 0, 9.9, 0, 1.05068493150685, 0.508219178082192, 0.05, 0.05, 0, 0, 0, 6.84794520547945, 8.47534246575342, 0, 9.93, 7.45890410958904, 0, 4.74657534246575),
    tolerance = 1e-4
  )
})
