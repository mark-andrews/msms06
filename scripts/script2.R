library(msmsr)
library(tidyverse)

formulas <- list(
  m1 = Fertility ~ Education,
  m2 = Fertility ~ Education + Catholic,
  m3 = Fertility ~ Education + Catholic + Infant.Mortality,
  m4 = Fertility ~ Education + Catholic + Infant.Mortality + Agriculture,
  m5 = Fertility ~ Education + Catholic + Infant.Mortality + Agriculture + Examination
)

# fit lm models according to each formula in formulas
models <- map(formulas, ~ lm(.x, data = swiss))

train_rmse <- map_dbl(models, ~ get_rmse(.x, data = swiss))
