# dierm 1.2.2, released 11-07-2023 

- Modified `vcf2diem` so that markers without homozygous genotypes or markers with only one heterozygous genotype are removed as non-informative for genome polarisation.
- Updated vignette `Importing data for genome polarisation`.
- Fixed formatting in `vcf2diem` documentation.


# diemr 1.2.1, released 19-04-2023

- Added link to bug reports page.
- Fixed bug in `vcf2diem` for multiallelic SNPs.


# diemr 1.2, released 21-03-2023

- Added `vcf2diem` to convert SNP in vcf format to diem genotypes.
- Added `myotis` vcf dataset with documentation.
- Added vignette `Importing data for genome polarisation`.
- Updated CITATION.



# diemr 1.1.1, released 02-02-2023

- Fixed potential infinite loop error in halting condition of `diem`.



# diemr 1.1, released 19-10-2022

- Updated README file.
- Added user-choice of colours in `plotPolarized`.
- Updated CITATION.
- Added efficient correction for other markers in likelihood calculation. 



# diemr 1.0, released 28-03-2022

- First public release.
- Updated citation.


# diemr 0.3, build 12-01-2022

- Added user choice of null polarities in the diem argument `markerPolarity`.
- Added FAQ to vignette.
- Added functions `importPolarized` and `plotPolarized`.


# diemr 0.2.1, build 02-12-2021

- Added examples to documentation.


# diemr 0.2, build 01-12-2021

- Added ploidy flexibility across compartments and across individuals.
- Updated documentation.


# diemr 0.1.2, build 09-07-2021

- Updated hybrid index calculation for consistency with diploid/haploid individuals.


# diemr 0.1.1, build 09-07-2021

- Added tolerance for unknown genotypes encoded either as `_` or `U`.
- Added vignette `diemr: Diagnostic index expectation maximisation in R`.
- Added a `NEWS.md` file to track changes to the package.
- Added `README.md` with quick start analysis instructions.
- Added default `ChosenInds` to include all individuals to `diem`. 


# diemr 0.1, build 29-06-2021

- First build