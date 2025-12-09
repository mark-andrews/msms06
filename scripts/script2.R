library(msmsr)
library(tidyverse)

formulas <- list(
  m1 = Fertility ~ Education,
  m2 = Fertility ~ Education + Catholic
)
