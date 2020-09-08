#ggplot
library(tidyverse)
library(dslabs)
data("lenguaje_4to_2019")
lenguaje_4to_2019 %>% ggplot() +
  geom_point(aes(x = N, y = PPE), size = 2) +
  geom_text(aes(N, PPE, label = RBD), nudge_x = 3)

