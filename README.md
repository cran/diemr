
<!-- README.md is generated from README.Rmd. Please edit that file -->

# diemr

<!-- badges: start -->
<!-- badges: end -->

*diemr* incorporates the diagnostic index expectation maximisation
algorithm used to estimate which genomic alleles belong to either side
of a barrier to geneflow. ## Installation

To start using *diemr*, load the package or install it from CRAN if it
is not yet available:

``` r
if(!require("diemr", character.only = TRUE)){
    install.packages("diemr", dependencies = TRUE)
    library("diemr", character.only = TRUE)
}
# Loading required package: diemr
```

## Check data format

Next, assemble paths to all files containing the data to be used by
*diemr*. Here, we will use a tiny example dataset for illustration that
is included in the package. A good practice is to check that all files
contain data in correct format for all individuals and markers.

``` r
filepaths <- system.file("extdata", "data6x3.txt",
                         package = "diemr")
CheckDiemFormat(filepaths, ChosenInds = 1:6)
# File check passed: TRUE
```

If the `CheckDiemFormat()` function fails, work through the error
messages and fix the stored input files accordingly. The algorithm
repeatedly accesses data from the harddisk, so seeing the passed file
check prior to analysis is critical.

``` r
diem.res <- diem(files = filepaths,
                 verbose = TRUE,
                 nCores = 1)
```

The results including marker polarisation, marker diagnostic index and
its support will be included in the list element `diem.res$DI`.
Additional elements in the results list contain basic tracking
information about the expectation maximisation iterations, with details
provided in the folder *diagnostics* in the working directory.
