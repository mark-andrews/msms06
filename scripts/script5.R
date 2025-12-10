library(tidyverse)
library(msmsr)

mtcars_formulas <- list(
  m1 = mpg ~ wt,
  m2 = mpg ~ wt + hp,
  m3 = mpg ~ wt + hp + cyl,
  m4 = mpg ~ wt + hp + am,
  m5 = mpg ~ wt + hp + cyl + disp
)

mtcars_models <- map(mtcars_formulas, ~ lm(.x, data = mtcars))
comparison <- model_table(mtcars_models)
comparison

# Model averaged prediction
new_car <- tibble(wt = 3.0, hp = 150, cyl = 6, am = 1, disp = 200)

# An example of one prediction
mtcars_models[[1]] |> predict(new_car)
# model 2's prediction
mtcars_models[[2]] |> predict(new_car)

model_averaged_prediction(mtcars_models, comparison, new_car)

variable_importance(mtcars_models, comparison)

# Model averaging with MuMIn ----------------------------------------------
library(MuMIn)
library(AmesHousing)

ames <- make_ames()

ames_full <- lm(
  Sale_Price ~
    Year_Built +
    Year_Remod_Add +
    Gr_Liv_Area +
    Full_Bath +
    Bedroom_AbvGr +
    TotRms_AbvGrd +
    Garage_Cars,
  data = ames,
  na.action = na.fail
)

ames_all <- dredge(ames_full, rank = "AIC")
