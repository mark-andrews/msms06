# update msmsr
devtools::install_github("mark-andrews/msmsr-pkg", force = TRUE)

# install glmnet, MuMIn, broom, lme4
install.packages("glmnet")
install.packages("MuMIn")
install.packages("broom")
install.packages("lme4")

# load packages -----------------------------------------------------------

library(msmsr)
library(tidyverse)

n <- 100 # sample
p <- 10 # number of predictors

noise_1 <- make_noise_data(n = n, p = p, seed = 123)

# fit the model to all predictors
full_model <- lm(y ~ ., data = noise_1)

step(full_model, direction = "both", trace = 1)
selected_model <- step(full_model, direction = "both", trace = 0)
summary(selected_model)

noise_2 <- make_noise_data(n = n, p = p, seed = 456)
full_model_2 <- lm(y ~ ., data = noise_2)
selected_model_2 <- step(full_model_2, direction = "both", trace = 0)

summary(selected_model_2)


# All subsets -------------------------------------------------------------

library(AmesHousing)
ames <- make_ames()

# lm(Sale_Price ~ Year_Built + Year_Remod_Add + Gr_Liv_Area + Full_Bath + Bedroom_AbvGr + TotRms_AbvGrd + Garage_Cars, data = ames)
ames_subset_lm <- all_subsets_lm(
  Sale_Price ~
    Year_Built +
    Year_Remod_Add +
    Gr_Liv_Area +
    Full_Bath +
    Bedroom_AbvGr +
    TotRms_AbvGrd +
    Garage_Cars,
  data = ames
)

ames_subset_lm |>
  arrange(aic) |>
  mutate(delta_aic = aic - min(aic)) |>
  mutate(weight = round(akaike_weights(aic), 3))

# Elastic net -------------------------------------------------------------
