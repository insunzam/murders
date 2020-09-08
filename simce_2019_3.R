#Pruebas 8vo 2019
library(tidyverse)
library(dplyr)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
#saveRDS(simce_8vo_2019, file = "~/Documents/R/proyectos/murders/data/prueba_8vo_2019.rds")
prueba_8vo_2019 <- readRDS("~/Documents/R/proyectos/murders/data/prueba_8vo_2019.rds")
pruebas<- filter(prueba_8vo_2019, var_res_ant != 'No Aplica' &  var_res_ant != 'Numero de respuestas')

resultados<- prueba_8vo_2019$Resultado
hist(resultados,
     main="Frecuencia de Puntaje en Pruebas 8vo 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(160,300),
     col="lightgreen")

aggregate(pruebas[, 4], list(pruebas$prueba), mean)
aggregate(pruebas[, 4], list(pruebas$prueba), median)

mediaPruebas<- mean(resultados)
medianaPruebas<- median(resultados)
modaPruebas<-getmode(resultados)

resultados<- pruebas$Resultado
hist(resultados,
     main="Frecuencia de Puntaje en Pruebas 8vo 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(160,300),
     col="lightblue")

lenguaj<-subset(pruebas, prueba == "Prueba Lengua y Literatura: Lectura")
mat<-subset(pruebas, prueba == "Prueba Matemática")
hgcs<-subset(pruebas, prueba == "Prueba Historia, Geografía y Ciencias Sociales")

resultados<- lenguaj$Resultado
mediaLeng<- mean(resultados)
medianaLeng<- median(resultados)
modaLeng<-getmode(resultados)

hist(resultados,
     main="Resultados Prueba de Lenguaje 8vo  2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(160,300),
     col="blue")

resultados <- sort(mat$Resultado)
mediaMat<- mean(resultados)
medianaMat<- median(resultados)
modaMat<-getmode(resultados)
resultados
hist(resultados,
     main="Resultados Prueba de Matemáticas 8vo 2019",
     breaks = 20,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(200,300),
     col="red")

resultados<- hgcs$Resultado
mediaHist<- mean(resultados)
medianaHist<- median(resultados)
modaHist<-getmode(resultados)
hist(resultados,
     main="Resultados Prueba de Historia 8vo 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(180,270),
     col="green")

table(prueba_8vo_2019$var_res_ant)
vra2 <- prop.table(table(prueba_8vo_2019$var_res_ant, exclude = c("No Aplica","Numero de respuestas")))
vra2
table(prueba_8vo_2019$var_res_ant, exclude = c("No Aplica","Numero de respuestas"))

boxplot(valor_var~var_res_ant,
        data=pruebas,
        main="Distribución de Variación segun Tipo de Variación 8vo Básico 2019",
        xlab="Tipo",
        ylab="Variación",
        col="orange",
        border="brown")

table(prueba_8vo_2019$gruse)
gruse2 <- prop.table(table(prueba_8vo_2019$gruse))
gruse2

boxplot(Resultado~gruse,
        data=pruebas,
        main="Distribución de Puntaje segun Grupo Socioeconómico 8vo Básico 2019",
        xlab="Grupo Socioeconómico",
        ylab="Puntaje",
        col="green",
        border="brown")



