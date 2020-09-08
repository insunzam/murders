#IDPS 8v0 2019
library(tidyverse)
library(dplyr)

#saveRDS(simce_8vo_2019_idps, file = "~/Documents/R/proyectos/murders/data/idps_8vo_2019.rds")
idps_8vo_2019 <- readRDS("~/Documents/R/proyectos/murders/data/idps_8vo_2019.rds")
idps<- filter(idps_8vo_2019, var_ant != 'No Aplica' &  var_ant != 'Numero de respuestas')

resultados_idps<- idps$Resultado
indicad <- idps$indicador
table(indicad)

varant <- idps$var_ant
varant1 <- table(varant)
vargse <- idps$var_gruse
vargse1 <- table(vargse)
varant1
vargse1
#plot(varant1, vargse1)

autoestim<-subset(idps, indicador =="Indicador Autoestima académica y motivación escolar")
clima<-subset(idps, indicador =="Indicador Clima de convivencia escolar")
participa<-subset(idps, indicador =="Indicador Participación y formación ciudadana")
habitos<-subset(idps, indicador =="Indicador Hábitos de vida saludable")

aggregate(idps[, 4], list(idps$indicador), mean)
aggregate(idps[, 4], list(idps$indicador), median)

hist(resultados_idps,
     main="Distribución de Puntajes IDPS 8vo Básico 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(50,100),
     col="Red")

resultados_idps<- autoestim$Resultado
hist(resultados_idps,
     main="Distribución de Puntajes Autoestima y Motivación 8vo Básico 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(50,100),
     col="blue")

resultados_idps<- clima$Resultado
hist(resultados_idps,
     main="Distribución de Puntaje Clima de Convivencia 8vo Básico 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(50,100),
     col="orange")

resultados_idps<- participa$Resultado
hist(resultados_idps,
     main="Distribución de Puntaje Participación 8vo Básico 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(50,100),
     col="green")

resultados_idps<- habitos$Resultado
hist(resultados_idps,
     main="Distribución de Puntaje Habitos y Vida 8vo Básico 2019",
     breaks = 10,
     labels = TRUE,
     xlab="Puntaje",
     xlim=c(50,100),
     col="gray")

boxplot(valor_var~var_ant,
        data=idps,
        main="Distribución de Variación segun Tipo de Variación IDPS 8vo Básico 2019",
        xlab="Tipo",
        ylab="Variación",
        col="orange",
        border="brown")

boxplot(Resultado~gruse,
        data=idps,
        main="Distribución de Puntaje IDPS segun Grupo Socioeconómico 8vo Básico 2019",
        xlab="Grupo Socioeconómico",
        ylab="Puntaje",
        col="green",
        border="brown")
