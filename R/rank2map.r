#' Convert SNP Ranks To Windows Corresponding to Mapping Distance
#'
#' This function estimates positions of ordered single nucleotide polymorphisms (SNPs) that correspond
#' to a window spanning a user-defined distance in the SNP positions mapped to a reference.
#' Each window is centered at the SNP mapped position.
#' Conversion of a SNP rank position metric to a mapped position metric is useful for
#' kernel smoothing of the \code{diem}
#' output state along a genomic sequence.
#'
#' @inheritParams diem
#' @inheritParams plotMarkerAxis
#' @param windowSize A numeric window size for metric conversion in base-pairs.
#'
#' @details Single nucleotide polymorphisms (SNPs) tend to be spread across a genome randomly.
#' To facilitate interpretation of the \code{diem} output, the marker states should be
#' assessed on the metric of their position along chromosomes (contigs). The windows for
#' kernel smoothing might contain a variable number of markers. This function estimates
#' which markers should be assessed together given their proximity on a chromosome.
#'
#' Values in \code{includedSites} are in essence SNP positions in BED format with a header.
#' The \code{includedSites} file should ideally be generated by
#' \link{vcf2diem} to ensure congruence across all analyses. 
#'
#' The function reads SNP positions from the specified BED-like file and divides the
#' genome into segments based on chromosomes. Each segment is then processed to identify
#' genomic windows encompassing each SNP, considering the specified window size. This
#' process is parallelized to enhance performance, and each SNP is considered within
#' its chromosomal context to ensure accurate window placement.
#'
#' Minimum value of \code{windowSize} is equal to 3, but in genomic data evaluations, window
#' size should be at least two orders of magnitude larger. A good approximation of a
#' useful minimum window size is $(genome size) / ((number of SNPSs) / 2)$. Throughout the 
#' diemr package, \code{windowSize} refers to the genomic context of the respective SNP
#' that the user wishes to consider when smoothing over the polarized genomic states.
#'
#' @note The unit of parallelization when using \code{nCores > 1} is set per chromosome.
#' This may differ from the parallelization approach used in \link{diem}, where processing
#' of compartment files is parallelized. Note that while compartment files can correspond
#' to chromosomes, this is not necessarily the case. 
#' @author Natalia Martinkova
#' @author Filip Jagos <521160@mail.muni.cz>
#' @returns A two-column matrix with the number of rows corresponding to the number of 
#'   \code{ChosenSites}, indicating start and end indices of adjacent markers that are 
#'   within an interval of length \code{windowSize} centered on the specific marker.
#' @export
#' @seealso \link{smoothPolarizedGenotypes}
#' @examples
#'  \dontrun{
#'  # Run this example in a working directory with write permissions
#'  myo <- system.file("extdata", "myotis.vcf", package = "diemr")
#'  vcf2diem(myo, "myo")
#'  rank2map("myo-includedSites.txt", windowSize = 50)
#'  } 
rank2map <- function(includedSites, ChosenSites = "all", windowSize = 1e+07, nCores = 1){

  # read in ChosenSites from the includedSites file
  if(inherits(includedSites, "character")){
    bed <- readIncludedSites(includedSites = includedSites, ChosenSites = ChosenSites)
  } else {
    bed <- includedSites
  }
  
  # chromosome indices
  CHROMlengths <- c(1, rle(bed$CHROM)$lengths)
  iChrom <- sapply(1:(length(CHROMlengths) - 1), FUN = function(i) {
    c(sum(CHROMlengths[1:i]):sum(CHROMlengths[1:i+1]))
  })

  # indices per chromosome
  res <- parallel::mclapply(
    X = iChrom, 
    mc.cores = nCores,
    FUN = \(x) rank2mapChr(x = bed$POS[as.numeric(x)], windowSize = windowSize)
  )
  
  res = Map("+", res, cumsum(CHROMlengths[-length(CHROMlengths)]) - 1)

  return(do.call(rbind, res))
}


