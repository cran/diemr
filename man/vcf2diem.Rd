% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vcf2diem.r
\name{vcf2diem}
\alias{vcf2diem}
\title{Convert vcf files to diem format}
\usage{
vcf2diem(SNP, filename, chunk = 1L, ...)
}
\arguments{
\item{SNP}{character vector with a path to the '.vcf' or '.vcf.gz' file, or an \code{vcfR}
object. Diploid data are currently supported.}

\item{filename}{character vector with a path where to save the converted genotypes.}

\item{chunk}{numeric indicating by how many markers should the result be split into
separate files. \code{chunk = 1} saves all markers into one file.}

\item{...}{additional arguments.}
}
\value{
No value returned, called for side effects.
}
\description{
Reads vcf files and writes genotypes of the most frequent alleles based on
chromosome positions to diem format.
}
\details{
Importing vcf files larger than 1GB is not recommended. The path to the
vcf file in \code{SNP} reads the file line by line, and might be a solution for
very large genomic datasets.

\if{html}{\out{<div class="sourceCode">}}\preformatted{ The number of files \code{vcf2diem} creates depends on the \code{chunk} argument
 and class of the \code{SNP} object. 
 
  * When \code{chunk = 1}, one output file will be created.
  * Values of \code{chunk < 100} are interpreted as the number of files into which to
 split data in \code{SNP}. For \code{SNP} object of class \code{vcfR}, the number
 of markers per file is calculated from the dimensions of \code{SNP}. When class
 of \code{SNP} is \code{character}, the number of markers per file is approximated
 from a model with a message. If this number is inappropriate for the expected
 output, provide the intended number of markers per file in \code{chunk} greater
 than 100. \code{vcf2diem} will scan the whole input \code{SNP} file, creating
 additional output files until the last line in \code{SNP} is reached.
  * Values of \code{chunk >= 100} mean that each output file
 in diem format will contain \code{chunk} number of lines with the data in \code{SNP}.

 When the vcf file contains markers non-informative for genome polarisation, those 
 those are removed and listed in a file *omittedLoci.txt* in the working directory. 
 The omitted loci are identified by their information in the CHROM and POS columns.
}\if{html}{\out{</div>}}
}
\examples{
\dontrun{
# vcf2diem will write files to a working directory or a specified folder
# make sure the working directory or the folder are at a location with write permission
  myofile <- system.file("extdata", "myotis.vcf", package = "diemr")
  myovcf <- vcfR::read.vcfR(myofile)

  vcf2diem(SNP = myofile, filename = "test1")
  vcf2diem(SNP = myofile, filename = "test2", chunk = 3)
  vcf2diem(SNP = myovcf, filename = "test3")
  vcf2diem(SNP = myovcf, filename = "test4", chunk = 3)
}
}
