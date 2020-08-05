library(tidyverse)
pruebas_S8_2019_data <- read_csv2("pruebas_S8_2019.csv")
data(pruebas_S8_2019_data)

#ggplot(data = pruebas_S8_2019_data)
with(pruebas_S8_2019_data, plot(RBD, Resultado))

#str(pruebas_S8_2019_data)

resultados<- pruebas_S8_2019_data$Resultado
hist(resultados)

variacion<- pruebas_S8_2019_data$`Valor de la variación`
hist(variacion)
plot(variacion)
