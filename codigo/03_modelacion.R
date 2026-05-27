# 03_modelacion.R
# Modelación estadística
# Autor:
# Fecha:

library(readr)
library(tidyverse)
library(here)


datos_modificados <- read.csv(here("datos", "procesados", "datos_modificados.csv"))
datos <- read.csv(here("datos", "originales", "Motor vehicle insurance data.csv"), sep = ";")


# Análisis fallido (Modelo de Poisson para modelar la frecuencia en el número de reclamos por año)

media_frecuencia <- mean(datos$N_claims_year, na.rm = TRUE) # Media de la frecuencia de los reclamos por año.
varianza_frecuencia <- var(datos$N_claims_year, na.rm = TRUE) # Varianza de la frecuencia de los reclamos por año.

razon_var_media <- round(varianza_frecuencia/media_frecuencia,2) # El resultado es 3.09, como esto es mayor a 1, entonces muestra una clara sobredisperción en la frecuencia de los reclamos por año, se sospechaba porque la varianza es mucho más grande que la media.

modelo_poisson <- glm(N_claims_year ~ edad + Seniority + N_claims_history + Type_risk + N_doors + Length + Weight , data = datos_modificados, family = poisson())
# Se usa la familia poisson, con las variables de edad de asegurado, antigüedad (Seniority), número de reclamos histórico (N_claims_history), tipo de vehículo (Type_risk), número de puertas (N_doors), largo (Length) y peso (Weight) para modelar la variable N_claims year.

summary(modelo_poisson) # Resumen del modelo, se puede observar que se omitieron 10.329 debido a NA, estos NA pertenecen a la variable Length, se puede observar que se usaron 95218 grados de libertad, que serían las observaciones totales menos los NA, menos el número de variables utilizadas.

residuo_varianza = sum(residuals(modelo_poisson, type = "deviance")^2) # Esto es la suma de los residuos de desviación estándar al cuadrado, los cuales miden la variabilidad total que el modelo no logra explicar.
grados_libertad_residuales = df.residual(modelo_poisson) # Número total de grados de libertad que el modeló utilizó.

dispersión = residuo_varianza/grados_libertad_residuales # El resultado de este cociente es 1.232824, por lo que los datos poseen sobredispersión  ya que el cociente es mayor a 1.

# Comparación de la proporción de ceros con respecto al total de datos
ceros_original <- sum(datos$N_claims_year == 0)/nrow(datos) # 81,388% delos datos son cero
media_observada <- mean(datos$N_claims_year) # Promedio observado en los datos
ceros_esperados <- exp(-media_observada) # Sería calcular la probabilidad de X = 0 en una poisson, usando la media que se obtuvo a partir de los datos originales
diferencia_medias <-  round((ceros_original - ceros_esperados),3)*100 # Hay una direfencia porcentual de 14 entre el porcentaje de ceros de los datos y el porcentaje de ceros que se esperaría obtener a partir de la posisson
# Como la diferencia porcentual es tan grande, es una justificación más para descarar el modelo glm Poisson para la investigación



