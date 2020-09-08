#Pruebas 4t0 2019
library(tidyverse)
library(dplyr)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#matematicas_4to_2019 <- read_delim("data/matematicas_4to_2019.csv", ";", 
#escape_double = FALSE, col_types = cols(`Datos y probabilidades` = col_integer(), 
#Geometría = col_integer(), Medición = col_integer(), 
#N = col_integer(), `Números y operaciones` = col_integer(), 
#PPE = col_integer(), `Patrones y algebra` = col_integer(), 
#RBD = col_character()), trim_ws = TRUE)
#saveRDS(matematicas_4to_2019, file = "~/Documents/R/proyectos/murders/data/matematicas_4to_2019.rds")
#saveRDS(lenguaje_4to_2019, file = "~/Documents/R/proyectos/murders/data/lenguaje_4to_2019.rds")

lenguaje_4to_2019 <- readRDS("~/Documents/R/proyectos/murders/data/lenguaje_4to_2019.rds")
matematicas_4to_2019 <- readRDS("~/Documents/R/proyectos/murders/data/matematicas_4to_2019.rds")

#suma N para lenguaje y mat
Nleng <- sum(subset(lenguaje_4to_2019, lenguaje_4to_2019$Resultado == 'Sí')$N)  
Nmat <- sum(subset(matematicas_4to_2019, matematicas_4to_2019$`Registra resultado` == 'Sí')$N)

resultado_leng <- lenguaje_4to_2019$PPE
resultado_mat <- matematicas_4to_2019$PPE

mediaLeng<- mean(resultado_leng)
medianaLeng<- median(resultado_leng)
modaLeng<-getmode(resultado_leng)

mediaMat<- mean(resultado_mat)
medianaMat<- median(resultado_mat)
modaMat<-getmode(resultado_mat)

aggregate(lenguaje_4to_2019[, 3], list(lenguaje_4to_2019$var_est_gse), mean)
aggregate(lenguaje_4to_2019[, 3], list(lenguaje_4to_2019$var_est_gse), median)

aggregate(matematicas_4to_2019[, 3], list(matematicas_4to_2019$var_est_gse), mean)
aggregate(matematicas_4to_2019[, 3], list(matematicas_4to_2019$var_est_gse), median)

hist(resultado_leng,     
     main="Distribución de Puntajes 4to Básico 2019",     
     breaks = 30,     
     labels = TRUE,     
     xlab="Puntaje",     
     xlim=c(150,400),     
     col="Red")

hist(resultado_mat,     
     main="Distribución de Puntajes 4to Básico 2019",     
     breaks = 10,     
     labels = TRUE,     
     xlab="Puntaje",     
     xlim=c(150,400),     
     col="gray")

mean(lenguaje_4to_2019$Adecuado %>% lenguaje_4to_2019$Resultado=='Sí')
find(lenguaje_4to_2019$Resultado == "Sí")

#sort(resultado_leng)
#plot(sort(resultado_leng))
#list(lenguaje_4to_2019$var_est_gse)

res_estandar <- lenguaje_4to_2019 %>%
  filter(lenguaje_4to_2019$Resultado == 'Sí') %>%
  select(lenguaje_4to_2019$Adecuado, lenguaje_4to_2019$Elemental, 
         lenguaje_4to_2019$Insuficiente)

res_estandar_leng <- lenguaje_4to_2019 %>%
  filter(lenguaje_4to_2019$Resultado == 'Sí')
mean(res_estandar_leng$Adecuado)
mean(res_estandar_leng$Elemental)
mean(res_estandar_leng$Insuficiente)

res_estandar_mat <- matematicas_4to_2019 %>%
  filter(matematicas_4to_2019$`Registra resultado` == 'Sí')
mean(res_estandar_mat$Adecuado)
mean(res_estandar_mat$Elemental)
mean(res_estandar_mat$Insuficiente)

indice_leng <- lenguaje_4to_2019$Resultado == 'Sí'
adecuado_leng <- lenguaje_4to_2019$Adecuado[indice_leng]
media_ade_leng <- sum(adecuado_leng)/length(adecuado_leng)
SD_leng <- sqrt(sum((adecuado_leng - media_ade_leng)^2)/length(adecuado_leng))

indice_mat <- matematicas_4to_2019$`Registra resultado` == 'Sí'
adecuado_mat <- matematicas_4to_2019$Adecuado[indice_mat]
media_ade_mat <- sum(adecuado_mat)/length(adecuado_mat)
SD_mat <- sqrt(sum((adecuado_mat - media_ade_mat)^2)/length(adecuado_mat))

adecuadosLeng <- (media_ade_leng / 100) * Nleng
adecuados_mat <- (media_ade_mat / 100) * Nmat
