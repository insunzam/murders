#IDPS 4t0 2019
library(tidyverse)
library(dplyr)

#dataset <- read_delim("data/idps_4to_2019.csv", +     ";", escape_double = FALSE, trim_ws = TRUE)
#saveRDS(dataset, file = "~/Documents/R/proyectos/murders/data/idps_4to_2019.rds")

idps_4to_2019 <- readRDS("~/Documents/R/proyectos/murders/data/idps_4to_2019.rds")
#idps<- filter(idps_4to_2019, var_ant != 'No Aplica' &  var_ant != 'Numero de respuestas')

plot(x = idps_4to_2019$AAME_1, y = idps_4to_2019$AAME_2)
text(idps_4to_2019$AAME_1, idps_4to_2019$AAME_2, labels(idps_4to_2019$RBD), 
     cex=0.6, pos=4, col="red") 

plot(idps_4to_2019$AAME_1, idps_4to_2019$AAME_2, main="Autoestima académica y motivación escolar 4to básico 2019", 
     xlab="Autotesima", ylab="Motivación", pch=18, col="blue")
text(idps_4to_2019$AAME_1, idps_4to_2019$AAME_2, labels(idps_4to_2019$RBD), cex=0.6, pos=4, col="red") 
abline(corr_AAME, col="red", lwd=3)
