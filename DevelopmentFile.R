
## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("~/Documents/Applied_Statistical_Programming/PS5") 

## This is run once when the package strcuture is first created


## At this point put the *.R files into the correcto directories and edit the DESCRIPTION file

current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)
test(current.code)


## View of function
integrateIt

## Examples of function
x <- c(1,2,3)
y <- c(1,2,3)
integrateIt(x,y,"trap")
integrateIt(x,y,"simpson")
