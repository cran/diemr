#' Dataset of modified genotypes of bats
#' 
#' A subset of single nucleotide polymorphisms in \emph{Myotis myotis} from Harazim et al. 
#' (2021). The genotypes were modified for testing purposes in such a way that markers
#' 15 and 17 now include additional indel and substitution alleles. Eight markers 
#' used in the dataset are monomorphic. 
#'
#' The data is used to test conversion of genotype data from vcf to diem format with 
#' function \code{vcf2diem}.
#' @name myotis
#' @format vcf file with 14 individuals and 20 markers.
#' @source Harazim M., Pialek L., Pikula J., Seidlova V., Zukal J., Bachorec E., 
#'    Bartonicka T., Kokurewicz T., Martinkova N. (2021) Associating physiological 
#'    functions with genomic variability in hibernating bats. 
#'    \emph{Evolutionary Ecology}, 35, 291-308, doi: 10.1007/s10682-020-10096-4.
#' @examples
#' filename <- system.file("extdata", "myotis.vcf", package = "diemr")
NULL
