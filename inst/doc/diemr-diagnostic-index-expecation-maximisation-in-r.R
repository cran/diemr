## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#",
  fig.path = "figures/",
  fig.height = 4.5, 
  fig.width = 6 
)

## ----setup, eval = FALSE------------------------------------------------------
#  # Attempt to load a package, if the package was not available, install and load
#  if(!require("diemr", character.only = TRUE)){
#      install.packages("diemr", dependencies = TRUE)
#      library("diemr", character.only = TRUE)
#  }

## ----eval = FALSE-------------------------------------------------------------
#  filepaths <- system.file("extdata", "data7x3.txt", package = "diemr")
#  # Analysing six individuals
#  samples <- 1:6
#  # Assuming diploid markers of all individuals
#  ploidies = rep(list(rep(2, nchar(readLines(filepaths[1])[1]) - 1)), length(filepaths))
#  CheckDiemFormat(files = filepaths,
#                  ChosenInds = samples,
#                  ploidy = ploidies)
#  # File check passed: TRUE
#  # Ploidy check passed: TRUE

## ----eval = FALSE-------------------------------------------------------------
#  res <- diem(files = filepaths,
#              ploidy = ploidies,
#              markerPolarity = list(c(FALSE, FALSE, TRUE)),
#              ChosenInds = samples,
#              nCores = 1)

## ----eval = FALSE-------------------------------------------------------------
#  res$DI
#  #   newPolarity         DI   Support Marker
#  # 1       FALSE  -4.872256 15.930181      1
#  # 2        TRUE  -3.520647 18.633399      2
#  # 3        TRUE -13.274822  6.130625      3

## ----eval = FALSE-------------------------------------------------------------
#  genotypes <- importPolarized(file = filepaths,
#                               changePolarity = res$markerPolarity,
#                               ChosenInds = samples)
#  
#  h <- apply(X = res$I4,
#             MARGIN = 1,
#             FUN = pHetErrOnStateCount)[1, ]
#  
#  plotPolarized(genotypes = genotypes,
#                HI = h[samples])

## ----echo = FALSE, fig.width = 6, fig.height = 4.5, fig.align = 'center'------
genotypes <- diemr::importPolarized(file = system.file("extdata", "data7x3.txt",
                         package = "diemr"), 
                             changePolarity = c(FALSE, TRUE, TRUE), 
                             ChosenInds = 1:6)
h <- c(.5,0,.33,.5,.83,1)
diemr::plotPolarized(genotypes = genotypes,
              HI = h)

## ----eval = FALSE-------------------------------------------------------------
#  S0011222
#  S1210001
#  S02221U0

## ----eval = FALSE-------------------------------------------------------------
#  filepaths2 <- c(system.file("extdata", "data7x3.txt", package = "diemr"),
#                  system.file("extdata", "data7x10.txt", package = "diemr"))
#  
#  ploidies2 <- list(rep(2, 7),
#                    c(2, 1, 2, 2, 2, 1, 2))
#  
#  CheckDiemFormat(files = filepaths2,
#                  ChosenInds = samples,
#                  ploidy = ploidies2)
#  # File check passed: TRUE
#  # Ploidy check passed: TRUE
#  
#  # Set random seed for repeatibility of null polarities (optional)
#  set.seed(39583782)
#  
#  # Run diem with verbose = TRUE to store hybrid indices with ploidy-aware allele counts
#  res2 <- diem(files = filepaths2,
#               ploidy = ploidies2,
#               markerPolarity = FALSE,
#               ChosenInds = samples,
#               nCores = 1,
#               verbose = TRUE)

## ----eval = FALSE-------------------------------------------------------------
#  # Import each compartment into a list
#  genotypes2 <- list(importPolarized(file = filepaths2[1],
#                         changePolarity = res2$markerPolarity[1:3],
#                         ChosenInds = samples),
#                    importPolarized(file = filepaths2[2],
#                         changePolarity = res2$markerPolarity[4:13],
#                         ChosenInds = samples))
#  
#  # Bind compartment genotypes into one matrix
#  genotypes2 <- Reduce(cbind, genotypes2)
#  
#  # Load individual hybrid indices from a stored file
#  h2 <- unlist(read.table("diagnostics/HIwithOptimalPolarities.txt"))
#  
#  # Plot the polarised genotypes
#  plotPolarized(genotypes = genotypes2,
#                HI = h2[samples])

## ----echo = FALSE, warning = FALSE,fig.width = 6, fig.height = 4.5, fig.align = 'center'----
genotypes2 <- Reduce(cbind, list(diemr::importPolarized(file = system.file("extdata", "data7x3.txt", package = "diemr"), 
                       changePolarity = c(FALSE, TRUE, TRUE), 
                       ChosenInds = 1:6),
                  diemr::importPolarized(file = system.file("extdata", "data7x10.txt", package = "diemr"), 
                       changePolarity = c(T,T,T,T,F,T,T,F,T,T), 
                       ChosenInds = 1:6)))
h2 <- c(.53, .217, .571, .39, .35, .85)
diemr::plotPolarized(genotypes = genotypes2,
              HI = h2)

## ----eval = FALSE-------------------------------------------------------------
#  install.packages(package = "diemr_1.3.tar.gz",
#                   repos = NULL, type = "source")

## ----eval = FALSE-------------------------------------------------------------
#  apply(res$I4, MARGIN = 1, FUN = pHetErrOnStateCount)
#  #          [,1] [,2]      [,3]      [,4]      [,5]      [,6]
#  # p   0.5000000    0 0.3333333 0.5000000 0.8333333 1.0000000
#  # Het 0.3333333    0 0.6666667 0.3333333 0.3333333 0.0000000
#  # Err 0.0000000    0 0.0000000 0.0000000 0.0000000 0.3333333

## ----eval = FALSE-------------------------------------------------------------
#  samples2 <- c(1, 3:6)
#  CheckDiemFormat(files = filepaths,
#                  ChosenInds = samples2,
#                  ploidy = ploidies)
#  # File check passed: TRUE
#  # Ploidy check passed: TRUE
#  
#  res2 <- diem(files = filepaths,
#               ChosenInds = samples2,
#               ploidy = ploidies,
#               nCores = 1,
#               markerPolarity = list(c(FALSE, FALSE, TRUE)))
#  
#  # calculate hybrid indices from updated I4
#  h.res2 <- apply(res2$I4,
#                  MARGIN = 1,
#                  FUN = pHetErrOnStateCount)[1, ]
#  
#  # set names for the hybrid index values
#  h.res2 <- setNames(h.res2, nm = samples2)
#  #    1    3    4    5    6
#  # 0.50 0.33 0.50 0.83 1.00
#  
#  # calculate the center of the maximum hybrid index change
#  diffs <- data.frame(rollmean = zoo::rollmean(sort(h.res2), k = 2),
#                      diff = diff(sort(h.res2), lag = 1))
#  h.res2.c <- diffs$rollmean[which.max(diffs$diff)]
#  # [1] 0.6666667

## ----eval = FALSE-------------------------------------------------------------
#  # Select 40% of markers with the highest diagnostic index
#  threshold <- quantile(res2$DI$DI, prob = 0.6)
#  genotypes3 <- genotypes2[, res2$DI$DI > threshold]
#  # Recalculate I4 and hybrid indices
#  h3 <- apply(genotypes3,
#              MARGIN = 1,
#              FUN = \(x) pHetErrOnStateCount(sStateCount(x)))[1, ]
#  # Plot the polarised markers
#  plotPolarized(genotypes3, h3)

## ----echo = FALSE-------------------------------------------------------------
genotypes3 <- genotypes2[, c(1,2,4,10,11)]
h3 <- apply(genotypes3, 
            MARGIN = 1,
            FUN = \(x) diemr::pHetErrOnStateCount(diemr::sStateCount(x)))[1, ]
diemr::plotPolarized(genotypes3, h3)

