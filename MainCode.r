## Trabajo final MAPP Otoño. Métodos cuantitativos.
## Integrantes:
## Guadalupe Álvarez
## Ángel Carrillo
## Eduardo Muñiz

Sys.setlocale("LC_ALL", "es_ES.UTF-8") # Cambiar locale para prevenir problemas con caracteres especiales
options(scipen=999) # Prevenir notación científica
rm(list=ls()) #Limpia todas las variables y objetos creados

##### Paquetería ----
library(tidyverse)
library(ggplot2)
library(ggcorrplot)
library(ggthemes)

library(cluster)
library(dplyr)
library(pacman)
library(factoextra)
library(dendextend)
library(purrr)

##### Base de datos ----
computoeinegi <- read.csv("2021 computoeinegi.csv")
str(computoeinegi)
head(computoeinegi)

 View(computoeinegi)
 
 
###################################
####### Indice de cosas por hacer:
###################################

 # FECHA DE ENTREGA: 13 Y 14 DE DICIEMBRE
 
 # Limpiar la base
# Estadistica descriptiva LALO
# ANOVA LUPITA
# Regresión lineal con variables explicativas CARILLO
 # Hito 1: DEBE ESTAR LISTO EL  25-NOV EN LA NOCHE
 # Ahí cordinarnos por mensajería sobre lo siguiente.
 
# Usar variables explicativas para analisis de componentes principales
 # crear subconjunto de variables
 # utilizar estas variables explicativas para:
 # Conglomerados
 # Nuevo grupos
 # con nuevos grupos analisis jerárquico. 

##### Estadística descriptiva ----

gr_participacion <- ggplot( computoeinegi, 
                   aes(x=distrito , y=participacion) )+ 
              geom_point(color=computoeinegi$id_entidad) + 
              labs(title="Participación electoral", 
                  subtitle="Proceso Electoral Federal 2021.", 
                  x="Distrito electoral federal",
                  y="Porcentaje de participación", 
                  caption="Elaboración propia con datos de INE(2021).") +
              theme_economist()+
              theme(axis.text.x=element_text(angle=50,size=12) )

plot(gr_participacion)

1+1
1+1

# Otro cambio de prueba

### Analisis de conglomerados ----

## para el análisis de conglomerados adaptamos la BD
row.names(computoeinegi)<-computoeinegi$distrito
computoeinegi<- computoeinegi[, -c(1,2,3,4,5,7)]
computoeinegi
View(computoeinegi)
str(computoeinegi)
computoeinegi$n_complejidad<-as.factor(computoeinegi$n_complejidad)

