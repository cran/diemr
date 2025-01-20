## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#"
)

## ----echo = FALSE, fig.align = 'center', out.width = '100%', fig.cap = '**Figure 1**. Flowchart of how to control output files and their location in `diem`. Green -- functions generating or using the files. Except `diem` all functions are internal. Beige, grey -- variable values set by the user (grey) or by internal processes (beige). Orange -- stored output files. Yellow rectangles -- main processes generating files.'----
knitr::include_graphics("diemOutput.png")

## ----eval = FALSE-------------------------------------------------------------
# getwd()

## ----eval = FALSE-------------------------------------------------------------
# nullPolarities <- readLines("folder/NullMarkerPolarities.txt")[-1]
# nullPolarities <- lapply(
#     strsplit(nullPolarities, split = " "),
#     as.logical
# )
# diem(..., markerPolarities = nullPolarities)

