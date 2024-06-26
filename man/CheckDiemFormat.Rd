% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CheckDiemFormat.r
\name{CheckDiemFormat}
\alias{CheckDiemFormat}
\title{diem input file checker}
\usage{
CheckDiemFormat(files, ChosenInds, ploidy)
}
\arguments{
\item{files}{character vector with paths to files with genotypes.}

\item{ChosenInds}{numeric vector of indices of individuals to be included in the analysis.}

\item{ploidy}{logical or list of length equal to length of \code{files}. Each element of the list
contains a numeric vector with ploidy numbers for all individuals specified in
the \code{files}.}
}
\value{
Returns invisible \code{TRUE} if all files are executable by \code{diem}. Exits
with informative error messages otherwise, specifying file names and lines with
potential problems. When too many lines contain problems, the first six are given.
}
\description{
Checks format of files with genotype data.
}
\details{
The input file must have genotypes of one marker for all individuals on one
line. The line must start with a letter "S" and contain only characters
"_" or "U" for unknown genotypes or a third/fourth allele, "0" for homozygots for
allele 1, "1" for heterozygots, and "2" for homozygots for allele 2. Check the
vignette with \code{browseVignettes(package = "diemr")} for the example of the
input format.

Ploidies must be given as a list with each element corresponding to a genomic
compartment (aka a file). For each compartment, the numeric vector specifying
ploidies of all individuals chosen for the specific analysis must be given.
}
\examples{
# set up input genotypes file names, ploidies and selection of individual samples
inputFile <- system.file("extdata", "data7x3.txt", package = "diemr")
ploidies <- list(c(2, 1, 2, 2, 2, 1, 2))
inds <- 1:7

# check input data
CheckDiemFormat(files = inputFile, ploidy = ploidies, ChosenInds = inds)
#  File check passed: TRUE
#  Ploidy check passed: TRUE
}
