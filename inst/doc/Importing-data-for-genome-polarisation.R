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
#  # Path to the vcf file
#  inputfile <- system.file("extdata", "myotis.vcf", package = "diemr")
#  # File name for the output
#  # If working directory does not have writing privileges, the filename must include a path to a suitable folder
#  outputfile <- "myotis"
#  # Convert the vcf file to two diem files
#  vcf2diem(SNP = inputfile, filename = outputfile, chunk = 2)
#  # Expecting to include 11 markers per diem file.
#  # If you expect more markers in the file, provide suitable chunk size.
#  # Done with chunk 1

## ----eval = FALSE-------------------------------------------------------------
#  5 8
#  ind1   AACCTTGG
#  ind2   TACGATGG
#  ind3   TACC-TGT
#  ind4   CACGTTGG
#  ind5   AACCTTGT

## ----eval = FALSE-------------------------------------------------------------
#  Marker1   022_0
#  Marker4   02020
#  Marker5   02_00
#  Marker8   00202

## ----eval = FALSE-------------------------------------------------------------
#  S022_0
#  S02020
#  S02_00
#  S00202

## ----eval = FALSE-------------------------------------------------------------
#  # Import the first converted file for all individuals
#  # and without changing marker polarity
#  myotis <- importPolarized("myotis-01.txt",
#                            changePolarity = rep(FALSE, 11),
#                            ChosenInds = 1:14)
#  # Check whether a marker includes heterozygotes
#  # or that there is more than one genotype
#  apply(myotis, MARGIN = 2,
#        FUN = \(x) any(grepl("1", x)) | sum(levels(factor(x)) %in% c("0", "1", "2")) > 1)
#  #    m1    m2    m3    m4    m5    m6    m7    m8    m9   m10   m11
#  # FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#  

