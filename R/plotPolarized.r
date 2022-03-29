#' Plots polarized genotypes
#'
#' Plots genotypes that can be optionally polarized.
#' @param genotypes character matrix comprising of _012 encodings.
#' @param HI numeric vector of individual hybrid indices with length equal to number
#'   of rows in \code{genotypes}.
#' @inheritParams diem
#' @details To import and polarize genotypes, use the function \code{\link{importPolarized}}.
#'
#'   When using \code{\link{diem}} with argument \code{verbose = TRUE}, hybrid indices,
#'   \code{HI}, can be found in file 'HIwithOptimalPolarities.txt' in folder 'diagnostics'
#'   in the working directory.
#'
#' @return No return value, called for side effects. In the plot, red and blue represent
#'   side of the barrier to geneflow encoded as `0` and `2`, respectively, yellow shows 
#'   heterozygots and white missing or undetermined genotypes. Individuals are ordered 
#'   according to the \code{HI}.
#' @importFrom graphics image
#' @export
#' @examples
#' gen <- importPolarized(
#'   file = system.file("extdata", "data7x10.txt", package = "diemr"),
#'   changePolarity = c(TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
#'   ChosenInds = 1:7
#' )
#'
#' h <- c(0.625, 0.5, 0.455, 0.455, 0.227, 0.818, 0.292)
#'
#' plotPolarized(genotypes = gen, HI = h)

plotPolarized <- function(genotypes, HI, ...) {

  nMarkers <- ncol(genotypes)
  nInds <- nrow(genotypes)
  
  image(
    x = 1:nMarkers,
    y = 1:nInds,
    z = t(matrix(as.numeric(factor(genotypes[order(HI), ], 
                                   levels = c("_", "0", "1", "2"))), 
                 ncol = nMarkers)),
    col = c("white", "#D73027", "#FFFFBF", "#4575B4"),
    xlab = "Markers", ylab = "Individuals", axes = FALSE, useRaster = TRUE
  )
}
