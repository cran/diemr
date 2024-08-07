% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotMarkerAxis.r
\name{plotMarkerAxis}
\alias{plotMarkerAxis}
\title{Add a Marker Axis with Chromosome Names to a Plot of Polarized Genotypes}
\usage{
plotMarkerAxis(
  includedSites,
  ChosenSites,
  tickDist = 1e+06,
  axisInfo = NULL,
  ...
)
}
\arguments{
\item{includedSites}{character. Path to a file with columns \code{CHROM} and \code{POS}.}

\item{ChosenSites}{logical vector indicating which sites are to be included in the
analysis.}

\item{tickDist}{numeric. Indicates the spacing of physical tick marks along a chromosome.}

\item{axisInfo}{list with user-defined tick positions and labels for marker axis. See
Details.}

\item{...}{additional arguments.}
}
\value{
Returns an invisible \code{axisInfo} list with the tick positions and labels
for the marker axis.
}
\description{
This function adds a marker axis with chromosome names to an existing plot of polarized
genotypes. It requires that the plot is already created using \link{plotPolarized}.
}
\details{
The \code{includedSites} file should ideally be generated by
\link{vcf2diem} to ensure congruence between the plotted genotypes and
the respective metadata.

Tick mark distances within a chromosome are located at \code{tickDist} and formated to
multiples of millions.

The optional \code{axisInfo} argument must have five named elements with the following
information:
\itemize{
\item \code{CHROMbreaks}: Numeric vector with positions defining ticks separating
chromosomes. The metric for all positions is in the number of markers.
\item \code{CHROMnamesPos}: Numeric vector with positions to place the chromosome
labels.
\item \code{CHROMnames}: Character vector with the names of the chromosomes. Must be the
same length as \code{CHROMnamesPos}.
\item \code{ticksPos}: Numeric vector with positions of ticks within chromosomes.
\item \code{ticksNames}: Character vector with the names to be displayed at \code{ticksPos}.
}

When \code{axisInfo = NULL}, the function extracts the necessary information from the
\code{includedSites} file.
}
\examples{
\dontrun{
# Run this example in a working directory with write permissions
myo <- system.file("extdata", "myotis.vcf", package = "diemr")
vcf2diem(myo, "myo")
inds <- 1:14
fit <- diem("myo-001.txt", ChosenInds = inds, ploidy = FALSE)
gen <- importPolarized("myo-001.txt", fit$markerPolarity, inds)
h <- apply(gen, 1, function(x) pHetErrOnStateCount(sStateCount(x)))[1, ]
plotPolarized(gen, h, xlab = "")
plotMarkerAxis("myo-includedSites.txt", rep(TRUE, 11), tickDist = 100)
}
}
