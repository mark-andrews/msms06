library(tidyverse)
library(msmsr)

mtcars_formulas <- list(
  mpg ~ wt,
  mpg ~ wt + hp,
  mpg ~ wt + hp + cyl,
  mpg ~ wt + hp + am,
  mpg ~ wt + hp + cyl + disp
)

mtcars_models <- map(mtcars_formulas, ~ lm(.x, data = mtcars))
