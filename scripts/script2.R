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

set.seed(42)
cv_rmse <- map_dbl(formulas, ~ cv_rmse(.x, data = swiss, k = 10))
loocv_rmse <- map_dbl(formulas, ~ cv_rmse(.x, data = swiss, k = nrow(swiss)))

# Log likelihood of a model
logLik(models[["m3"]])

# AIC = -2 log likelihood + 2k
-2 * logLik(models[["m3"]]) + 2 * 5

# Using the built in in R
AIC(models[["m3"]])

# AIC for the five models
swiss_aic <- map_dbl(models, AIC)

# View relationship with loocv
plot(swiss_aic, loocv_rmse)

# BIC for the five models
swiss_bic <- map_dbl(models, BIC)

# BIC = -2 log likelihood + k log(n)
-2 * logLik(models[["m3"]]) + 5 * log(nrow(swiss))
