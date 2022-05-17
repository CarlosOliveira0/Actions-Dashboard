library(tidyquant)
library(dplyr)

prices <- c(
  "AERI3","KRSA3","CLSC4","FESA4","RIGG34",
  "IGTI3","SLCE3","EZTC3","ENEV3","STBP3"
) %>%
  paste0(".SA") %>%
  tq_get(get = "stock.prices", from = "2010-01-01") %>%
  mutate(symbol = sub(".SA", "", symbol))

write.table(prices, "prices.csv", sep =",", row.names = FALSE)
prices <- read.csv("C:/Users/caoli/OneDrive/Documentos/ProjectR/prices.csv") %>%
  mutate(date = as.Date(date))