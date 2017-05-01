
rm(list = ls())
library(tidyr) 
library(plyr)
library(dplyr)

fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt", comment.char="#")
View(fullmat)

###¿Qué tipo de objeto creamos al cargar la base?

class(fullmat)

###¿Cómo se ven las primeras 6 líneas del archivo?

head(fullmat)

###¿Cuántas muestras hay?

nrow(fullmat)

### ¿De cuántos estados se tienen muestras?
  #se cuenta como vector para que al final se vea el numero de elementos en la lista, y no el nombre de cada uno
estados<-c(fullmat[,5])
estados<-as.factor(estados)
levels(estados)
  #de otro modo aparece la lista de nombres de estados y cuantas veces se repite cada uno
estados<-fullmat[,5]
estados<-as.factor(estados)
levels(estados)

### ¿Cuántas muestras fueron colectadas antes de 1980?
añocol<-c(fullmat[,10])
x<-añocol<1980
sum(x, na.rm = NA)
  

### ¿Cuántas muestras hay de cada raza?
razas<-fullmat[,4]
razas<-as.factor(razas)
table(razas)

### En promedio ¿a qué altitud fueron colectadas las muestras?
altitud<-c(fullmat[,16])
mean(altitud)

### ¿Y a qué altitud máxima y mínima fueron colectadas?

alt<-c(summary(altitud))
  #el primero y el último valor (min y max) del comando de resumen 
alt[c(1, 6)]

### Crea una nueva df de datos sólo con las muestras de la raza Olotillo


DF_Olotillo<-filter(fullmat, Raza == "Olotillo")
View(DF_Olotillo)


### Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho

DF_Raza<-filter(fullmat, Raza == "Reventador" | Raza == "Jala" | Raza == "Ancho")
View(DF_Raza)

### Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.

write.csv(DF_Raza, "../meta/submat.csv")

