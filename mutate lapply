library(dplyr)
library(janitor)

iris

iris %>% mutate(across(starts_with("Sepal"), round))
iris %>% mutate(across(starts_with("Sepal"), ~ round_half_up(.x, digits = 0)))

iris["Sepal.Length.round"] <- lapply(iris["Sepal.Length"], round_half_up, digits = 0)
unlist ( lapply(iris$Sepal.Length, round_half_up, digits = 0) )
