library(tidyverse)
library(dplyr)

#idps_8vo_2019 <- read_delim("simce_8vo_2019_idps.csv", ";", escape_double = FALSE, trim_ws = TRUE)
#prueba_8vo_2019 <- read_delim("simce_8vo_2019.csv", ";", escape_double = FALSE, trim_ws = TRUE)
#saveRDS(idps_8vo_2019, file = "data/idps_8vo_2019.rds)
idps_8vo_2019 <- readRDS("~/Documents/R/proyectos/murders/data/idps_8vo_2019.rds")
#saveRDS(prueba_8vo_2019, file = "data/prueba_8vo_2019.rds")
prueba_8vo_2019 <- readRDS("~/Documents/R/proyectos/murders/data/prueba_8vo_2019.rds")

pruebas<- filter(prueba_8vo_2019, var_res_ant != 'No Aplica' &  var_res_ant != 'Numero de respuestas')

resultados<- pruebas$Resultado
hist(resultados,
     main="Histograma Puntaje en Pruebas 2019",
     xlab="Puntaje",
     xlim=c(180,300),
     col="blue")

with(pruebas, plot(var_res_ant, valor_var))
boxplot(pruebas$valor_var, pruebas$valor_var_gs,
        main = "Dimensión de la Variación",
        at = c(1,2),
        names = c("Anterior", "Nacional"),
        las = 2,
        col = c("orange","red"),
        border = "brown",
        horizontal = TRUE)

boxplot(valor_var~var_res_ant,
        data=pruebas,
        main="Dimensión de Variación segun variable",
        xlab="Tipo",
        ylab="Variación",
        col="orange",
        border="brown")

table(resultados)
barplot(table(resultados),
        main="Resultados SIMCE 8vo 2019",
        xlab="Puntaje",
        ylab="Cantidad",
        border="red",
        col="blue",
        density=10)

idps<- filter(idps_8vo_2019, var_ant != 'No Aplica' &  var_ant != 'Numero de respuestas')

resultados<- idps$Resultado
h<-hist(resultados)
h
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))

hist(resultados,
     breaks=20,
     main="Histograma Puntaje en IDPS 2019",
     xlab="Puntaje",
     xlim=c(50,110),
     col="blue")

with(pruebas, plot(var_res_ant, valor_var))
boxplot(pruebas$valor_var, pruebas$valor_var_gs,
        main = "Dimensión de la Variación",
        at = c(1,2),
        names = c("Anterior", "Nacional"),
        las = 2,
        col = c("orange","red"),
        border = "brown",
        horizontal = TRUE)

boxplot(valor_var~var_res_ant,
        data=pruebas,
        main="Dimensión de Variación segun variable",
        xlab="Tipo",
        ylab="Variación",
        col="orange",
        border="brown")

table(resultados)
barplot(table(resultados),
        main="Resultados SIMCE 8vo 2019",
        xlab="Puntaje",
        ylab="Cantidad",
        border="red",
        col="blue",
        density=10)
