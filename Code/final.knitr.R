
############### HTML report

# 1. copy R_graphs.pdf to another safe file!
# 2. then link the following to the R_graphs.r
# before running it you must ensure that the package stringi is installed

require(knitr)
stitch("~/Downloads/R_code_vegetation_indices.R", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

# knit2html("~/Downloads/R_code_vegetation_indices.R")

# a minimal example
# writeLines(c("# hello markdown", "```{r hello-random, echo=TRUE}", "rnorm(5)", "```"),
# "test.Rmd")
# knit2html("test.Rmd")
# if (interactive()) browseURL("test.html")
# unlink(c("test.Rmd", "test.html", "test.md"))

# simply modify the R_graphs.r with all the functions and launch the above function stich

# knit("r-report.html")

# library(R2HTML)
# HTML("~/Downloads/R_code_vegetation_indices.R")

rmd_stub <- "~/Downloads/r-notebook-stub.Rmd"
contents <- readLines("~/Downloads/R_code_vegetation_indices.R")
cat(contents, sep = "\n")
