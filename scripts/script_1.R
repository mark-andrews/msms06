library(msmsr)
library(tidyverse)

# load up Ames data -------------------------------------------------------

ames <- AmesHousing::ames_raw |> select(price = SalePrice, area = `Gr Liv Area`)

set.seed(24)
ames_split <- train_test_split(ames)

# visualize the data: scatterplot of house price per area
ggplot(ames, aes(x = area, y = price)) +
  geom_point()

degrees <- 1:15

models <- map(degrees, ~ poly_reg(ames_split$train, "price", "area", .x))
