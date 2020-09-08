idps_8vo_2019 <- readRDS("~/Documents/R/proyectos/murders/data/idps_8vo_2019.rds")
#idps<- filter(idps_8vo_2019, var_ant != 'No Aplica' &  var_ant != 'Numero de respuestas')

#resultados_idps<- idps$Resultado
indicad <- idps_8vo_2019$indicador
table(indicad)

varant <- idps_8vo_2019$var_ant
varant1 <- table(varant)
varant1

vargse <- idps_8vo_2019$var_gruse
table(varant,vargse)

table(vargse)

varant2 <- prop.table(x=varant1)
varant2
table(varant, exclude = c('No Aplica', 'Numero de respuestas'))
      