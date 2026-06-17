# 03_modelacion.R
# Modelación estadística
# Autor:
# Fecha:

library(readr)
library(tidyverse)
library(here)
library(cowplot)


paleta_pamplemousse <- c(
  "#E56B78",
  "#F29CA3",
  "#F2C38F",
  "#36B7B4",
  "#1E9CC7",
  "#253494"
)

estilo_grupo3 <- theme_cowplot(font_size = 12) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
)


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
ceros_original <- sum(datos$N_claims_year == 0)/nrow(datos) # 81.39% de los datos son cero
media_observada <- mean(datos$N_claims_year) # Promedio observado en los datos
ceros_esperados <- exp(-media_observada) # Sería calcular la probabilidad de X = 0 en una poisson, usando la media que se obtuvo a partir de los datos originales
diferencia_medias <-  round((ceros_original - ceros_esperados),3)*100 # Hay una diferencia porcentual de 14 entre el porcentaje de ceros de los datos y el porcentaje de ceros que se esperaría obtener a partir de la posisson
# Como la diferencia porcentual es tan grande, es una justificación más para descarar el modelo glm Poisson para la investigación



# Distribución mixta del costo de reclamos por año

library(fitdistrplus)

# Distribución para costos entre 0 y 900 (Sin incluir extremos)
# Filtrar el intervalo de costos ]0,900[:

costos_intervalo <- datos_modificados %>% 
  filter(Cost_claims_year > 0 & Cost_claims_year < 900) %>% 
  pull(Cost_claims_year) # Para que devuelva solamente la columna Cost_claims_year como un vector

ajuste_lognormal <- fitdist(costos_intervalo, "lnorm")
ajuste_gamma <- fitdist(costos_intervalo, "gamma")


# Comparación del AIC (Criterio de Información de Akaike)

comparacion <- data.frame(
  Distribución = c("Lognormal", "Gamma"),
  AIC = c(ajuste_lognormal$aic, ajuste_gamma$aic)
)

# Se puede observar que el AIC  de la lognomal es de 211,339.9 mientras que el de la gamma es de 212,684.5 resultando en una diferencia de 1344.6, por lo que el ajuste de la lognormal es mucho mejor que el ajuste de la gamma, lo que además indica una mejor representación de los datos

# Gráfico diagnóstico para la lognormal:
plot(ajuste_lognormal)
diagnostico_lognormal <- plot(ajuste_lognormal)

png("../../../bitacoras/bitacora_3/figuras/diagnostico_lognormal.png", 
    width = 10, height = 7, units = "in", res = 300)
plot(ajuste_lognormal)
dev.off() # Las últimas 3 líneas son para guardar el diagnóstico como una imagen

# Gráfico diagnóstico para la gamma:
plot(ajuste_gamma)
diagnostico_gamma <- plot(ajuste_gamma)

png("../../../bitacoras/bitacora_3/figuras/diagnostico_gamma.png", 
    width = 10, height = 7, units = "in", res = 300)
plot(ajuste_gamma)
dev.off()

# Comparación de las dos distribuciones con el histograma de los costos
denscomp(list(ajuste_lognormal, ajuste_gamma), # Tranformar los ajustes en arreglos
         legendtext = c("Lognormal", "Gamma"), # Nombre de los elementos del código de colores
         xlab = "Costo anual",
         ylab = "Densidad",
         main = "Comparación de densidades Lognormal y Gamma con el histograma del costo anual")


# Comparación evaluando la lognormal y la gamma:
valores_x <- seq(0.1, 900, length.out = 500) # Generar 500 números, empezando en 0.1 y terminando en 900, los números estarán distanciados por el mismo valor (Como ir de 1 en 1 o de 2 en 2)

curvas_comparacion <- data.frame(
  valor_x = rep(valores_x, times = 2), # Duplicar los números creados antes
  densidad = c(
    dlnorm(valores_x, meanlog = ajuste_lognormal$estimate[1], sdlog = ajuste_lognormal$estimate[2]), # Calcular la distribución de la lognormal evaluándola en los 1000 valores, usando la media y desviación canculada anteriormente con el ajuste
    dgamma(valores_x, shape = ajuste_gamma$estimate[1], rate = ajuste_gamma$estimate[2])),
  distribucion = factor(rep(c(paste0("Lognormal con AIC = ", round(ajuste_lognormal$aic, 0)), # Crear las etiquetas para mostrar la diferencia de AIC
                              paste0("Gamma con AIC = ", round(ajuste_gamma$aic, 0))), 
                            each = 500)) # Repetir cada etiqueta 500 veces, los primeros 1000 para la lognormal y los otros 500 para la gamma
)

# Gráfico para comparar la distribución de la Lognormal con la Gamma
comparacion_lognormal_gamma <- datos_modificados %>%
  filter(Cost_claims_year > 0 & Cost_claims_year < 900) %>% 
  ggplot(aes(x = Cost_claims_year)) +
  geom_histogram(aes(y = after_stat(density)), # Hacer que el alto total del histograma sea 1 (Representarlo como densidad)
                 bins = 50, fill = "gray80", color = "white", alpha = 0.6) + # Color del histograma
  geom_line(data = curvas_comparacion, aes(x = valor_x, y = densidad, color = distribucion), size = 1.2) + # Graficar la lognormal y la gamma y ponerlas sobre el histograma 
  scale_color_manual(values = c(paleta_pamplemousse[1], paleta_pamplemousse[6])) + # Roja la Gamma, azul la lognormal
  labs(title = "Comparación del ajuste de la lognormal y la Gamma",
       x = "Costo anual",
       y = "Densidad",
       color = "Distribución") +
  scale_x_continuous(breaks = seq(0,900,100))+
  estilo_grupo3

ggsave("../../../bitacoras/bitacora_3/figuras/comparacion_lognormal_gamma.png", comparacion_lognormal_gamma, width = 8, height = 5, dpi = 300)

# Distribución para los costos mayores a 900 y menores a 20000 (Acotado para mejor visualización):
library(actuar) # Para la dist Pareto

mayores_900 <- datos_modificados %>%
  filter(Cost_claims_year >= 900 & Cost_claims_year <= 20000) %>%
  pull(Cost_claims_year)

ajuste_pareto <- fitdist(mayores_900, "pareto", start = list(shape = 1, scale = 900)) # start hace que la función empiece probando con alpha = 1, y en 900 que es el valor donde empiezan los datos
ajuste_lognormal_mayores_900 <- fitdist(mayores_900, "lnorm")

comparacion_mayor_900 <- data.frame(
  Distribución = c("Lognormal", "Pareto"),
  AIC = c(ajuste_lognormal_mayores_900$aic, ajuste_pareto$aic)
)

# Gráfico diagnóstico para la pareto:
plot(ajuste_pareto)

png("../../../bitacoras/bitacora_3/figuras/diagnostico_pareto.png", 
    width = 10, height = 7, units = "in", res = 300)
plot(ajuste_pareto)
dev.off()

# Gráfico diagnóstico para la lognormal:
plot(ajuste_lognormal_mayores_900)

png("../../../bitacoras/bitacora_3/figuras/diagnostico_lognormal_mayores_900.png", 
    width = 10, height = 7, units = "in", res = 300)
plot(ajuste_lognormal_mayores_900)
dev.off()

valores_x_900 <-  seq(900, 20000, length.out = 1000)

curvas_comparacion_mayor_900 <- data.frame(
  valor_x = rep(valores_x_900, times = 2), # Duplicar los números creados antes
  densidad = c(
    dlnorm(valores_x_900, meanlog = ajuste_lognormal_mayores_900$estimate[1], sdlog = ajuste_lognormal_mayores_900$estimate[2]), # Calcular la distribución de la lognormal evaluándola en los 1000 valores, usando la media y desviación canculada anteriormente con el ajuste
    dpareto(valores_x_900, shape = ajuste_pareto$estimate[1], scale = ajuste_pareto$estimate[2])),
  distribucion = factor(rep(c(paste0("Lognormal con AIC = ", round(ajuste_lognormal_mayores_900$aic, 0)), # Crear las etiquetas para mostrar la diferencia de AIC
                              paste0("Pareto con AIC = ", round(ajuste_pareto$aic, 0))), 
                            each = 1000)) # Repetir cada etiqueta 1000 veces, los primeros 1000 para la lognormal y los otros 1000 para la Pareto
)

# Gráfico para comparar la distribución de la Lognormal con la Pareto
comparacion_lognormal_pareto <- datos_modificados %>%
  filter(Cost_claims_year >= 900 & Cost_claims_year <= 20000) %>% 
  ggplot(aes(x = Cost_claims_year)) +
  geom_histogram(aes(y = after_stat(density)), # Hacer que el alto total del histograma sea 1 (Representarlo como densidad)
                 bins = 50, fill = "gray80", color = "white", alpha = 0.6) + # Color del histograma
  geom_line(data = curvas_comparacion_mayor_900, aes(x = valor_x, y = densidad, color = distribucion), size = 1.2) + # Graficar la lognormal y la gamma y ponerlas sobre el histograma 
  scale_color_manual(values = c(paleta_pamplemousse[1], paleta_pamplemousse[6])) + # Roja la Gamma, azul la lognormal
  labs(title = "Comparación del ajuste de la lognormal y la Pareto",
       x = "Costo anual",
       y = "Densidad",
       color = "Distribución") +
  scale_x_continuous(breaks = seq(900,20000,1800))+
  estilo_grupo3

ggsave("../../../bitacoras/bitacora_3/figuras/comparacion_lognormal_pareto.png", comparacion_lognormal_pareto, width = 10, height = 6, dpi = 300)

# Cálculo de la proporción de cada componente: 
datos_modificados %>%
  mutate(grupo = case_when(
    Cost_claims_year == 0 ~ "Ceros",
    Cost_claims_year > 0 & Cost_claims_year < 900 ~ "Medios",
    Cost_claims_year >= 900 ~ "Altos"
  )) %>%
  group_by(grupo) %>%
  summarise(Frecuencia = n()) %>%
  mutate(Proporcion = round(Frecuencia / sum(Frecuencia), 4), # Dividir cada frecuencia por el total de observaciones y redondearlo a 4 decimales
         Porcentaje = Proporcion * 100)




# Bitácora 4

# Prueba de la distribución Weibull, para la distribución mixta de los costos de reclamos

# Distribución para costos entre 0 y 900 (Sin incluir extremos):
library(fitdistrplus)

# Ajuste para la distribución Weibull:
ajuste_weibull = fitdist(costos_intervalo, "weibull")

comparacion_weibull_lognormal <- data.frame(
  Distribución = c("Lognormal", "Weibull"),
  AIC = c(ajuste_lognormal$aic, ajuste_weibull$aic)
)

# Se puede observar que el AIC  de la lognomal es de 211,339.9 mientras que el de la distribución Weibull es de 212,884.4 resultando en una diferencia de 1,544.5, por lo que el ajuste de la lognormal es mucho mejor que el ajuste de la Weibull, lo que además indica una mejor representación de los datos

# Gráfico diagnóstico para la weibull:
plot(ajuste_weibull)
diagnostico_weibull <- plot(ajuste_weibull)


# Comparación gráfica entre la distribución Lognormal y la Weibull para el intervalo ]0,900[
valores_x_weibull <- seq(0.1, 900, length.out = 1000) # Generar 1000 números, empezando en 0.1 y terminando en 900, los números estarán distanciados por el mismo valor (Como ir de 1 en 1 o de 2 en 2)

curvas_comparacion_weibull <- data.frame(
  valor_x = rep(valores_x_weibull, times = 2), # Duplicar los números creados antes
  densidad = c(
    dlnorm(valores_x_weibull, meanlog = ajuste_lognormal$estimate[1], sdlog = ajuste_lognormal$estimate[2]), # Calcular la distribución de la lognormal evaluándola en los 1000 valores, usando la media y desviación calculada anteriormente con el ajuste
    dweibull(valores_x_weibull, shape = ajuste_weibull$estimate[1], scale = ajuste_weibull$estimate[2])),
  distribucion = factor(rep(c(paste0("Lognormal con AIC = ", round(ajuste_lognormal$aic, 0)), # Crear las etiquetas para mostrar la diferencia de AIC
                              paste0("Weibull con AIC = ", round(ajuste_weibull$aic, 0))), 
                            each = 1000)) # Repetir cada etiqueta 1000 veces, los primeros 1000 para la lognormal y los otros 1000 para la Weibull
)

# Gráfico para comparar la distribución de la Lognormal con la Weibull para el intervalo ]0,900[
comparacion_lognormal_weibull <- datos_modificados %>%
  filter(Cost_claims_year > 0 & Cost_claims_year < 900) %>% 
  ggplot(aes(x = Cost_claims_year)) +
  geom_histogram(aes(y = after_stat(density)), # Hacer que el alto total del histograma sea 1 (Representarlo como densidad)
                 bins = 50, fill = "gray80", color = "white", alpha = 0.6) + # Color del histograma
  geom_line(data = curvas_comparacion_weibull, aes(x = valor_x, y = densidad, color = distribucion), size = 1.2) + # Graficar la lognormal y la weibull y ponerlas sobre el histograma 
  scale_color_manual(values = c(paleta_pamplemousse[1], paleta_pamplemousse[6])) + # Roja la Lognormal, azul la Weibull
  labs(title = "Comparación del ajuste de la lognormal y la Weibull",
       x = "Costo anual",
       y = "Densidad",
       color = "Distribución") +
  scale_x_continuous(breaks = seq(0,900,100))+
  estilo_grupo3



# Comparación de las distribuciones Lognormal, Gamma y Weibull para el intervalo ]0,900[

valores_x_weibull_gamma <- seq(0.1, 900, length.out = 1000) # Generar 1000 números, empezando en 0.1 y terminando en 900, los números estarán distanciados por el mismo valor (Como ir de 1 en 1 o de 2 en 2)

curvas_comparacion_weibull_gamma <- data.frame(
  valor_x = rep(valores_x_weibull_gamma, times = 3), # Repetir 3 los números creados antes
  densidad = c(
    dlnorm(valores_x_weibull_gamma, meanlog = ajuste_lognormal$estimate[1], sdlog = ajuste_lognormal$estimate[2]), # Calcular la distribución de la lognormal evaluándola en los 1000 valores, usando la media y desviación calculada anteriormente con el ajuste
    dweibull(valores_x_weibull_gamma, shape = ajuste_weibull$estimate[1], scale = ajuste_weibull$estimate[2]),
    dgamma(valores_x_weibull_gamma, shape = ajuste_gamma$estimate[1], rate = ajuste_gamma$estimate[2])),
  distribucion = factor(rep(c(paste0("Lognormal con AIC = ", round(ajuste_lognormal$aic, 0)), # Crear las etiquetas para mostrar la diferencia de AIC
                              paste0("Weibull con AIC = ", round(ajuste_weibull$aic, 0)),
                              paste0("Gamma con AIC = ", round(ajuste_gamma$aic, 0))), 
                            each = 1000)) # Repetir cada etiqueta 1000 veces, los primeros 1000 para la lognormal, los siguientes 1000 para la Weibull y los útimos 1000 para la Gamma
)

# Gráfico para comparar la distribución de la Lognormal, la Weibull y la Gamma para el intervalo ]0,900[
comparacion_lognormal_weibull_gamma <- datos_modificados %>%
  filter(Cost_claims_year > 0 & Cost_claims_year < 900) %>% 
  ggplot(aes(x = Cost_claims_year)) +
  geom_histogram(aes(y = after_stat(density)), # Hacer que el alto total del histograma sea 1 (Representarlo como densidad)
                 bins = 50, fill = "gray80", color = "white", alpha = 0.6) + # Color del histograma
  geom_line(data = curvas_comparacion_weibull_gamma, aes(x = valor_x, y = densidad, color = distribucion), size = 1.2) + # Graficar la lognormal y la weibull y ponerlas sobre el histograma 
  scale_color_manual(values = c(paleta_pamplemousse[1], paleta_pamplemousse[3], paleta_pamplemousse[6])) + # Roja la Gamma, amarilla para la Lognormal y azul la Weibull
  labs(title = "Comparación del ajuste de la distribución Lognormal, Gamma y Weibull",
       x = "Costo anual",
       y = "Densidad",
       color = "Distribución") +
  scale_x_continuous(breaks = seq(0,900,100))+
  estilo_grupo3



# Comparación entre la distribución Lognormal y la Weibull para el intervalo ]900,2000[
ajuste_weibull_mayores_900 <- fitdist(mayores_900, "weibull")

comparacion_mayor_900_weibull <- data.frame(
  Distribución = c("Lognormal", "Weibull"),
  AIC = c(ajuste_lognormal_mayores_900$aic, ajuste_weibull_mayores_900$aic)
)

curvas_comparacion_mayor_900_weibull <- data.frame(
  valor_x = rep(valores_x_900, times = 2), # Duplicar los números creados antes
  densidad = c(
    dlnorm(valores_x_900, meanlog = ajuste_lognormal_mayores_900$estimate[1], sdlog = ajuste_lognormal_mayores_900$estimate[2]), # Calcular la distribución de la lognormal evaluándola en los 1000 valores, usando la media y desviación canculada anteriormente con el ajuste
    dweibull(valores_x_900, shape = ajuste_weibull_mayores_900$estimate[1], scale = ajuste_weibull_mayores_900$estimate[2])),
  distribucion = factor(rep(c(paste0("Lognormal con AIC = ", round(ajuste_lognormal_mayores_900$aic, 0)), # Crear las etiquetas para mostrar la diferencia de AIC
                              paste0("Weibull con AIC = ", round(ajuste_weibull_mayores_900$aic, 0))), 
                            each = 1000)) # Repetir cada etiqueta 1000 veces, los primeros 1000 para la lognormal y los otros 1000 para la Weibull
)

# Gráfico para comparar la distribución de la Lognormal con la Weibull para el intervalo [900, 20000[
comparacion_lognormal_weibull_mayores_900 <- datos_modificados %>%
  filter(Cost_claims_year >= 900 & Cost_claims_year <= 20000) %>% 
  ggplot(aes(x = Cost_claims_year)) +
  geom_histogram(aes(y = after_stat(density)), # Hacer que el alto total del histograma sea 1 (Representarlo como densidad)
                 bins = 50, fill = "gray80", color = "white", alpha = 0.6) + # Color del histograma
  geom_line(data = curvas_comparacion_mayor_900_weibull, aes(x = valor_x, y = densidad, color = distribucion), size = 1.2) + # Graficar la lognormal y la gamma y ponerlas sobre el histograma 
  scale_color_manual(values = c(paleta_pamplemousse[1], paleta_pamplemousse[6])) + # Roja la Lognormal, azul la Weibull
  labs(title = "Comparación del ajuste de la Distribución Lognormal y la Weibull",
       x = "Costo anual",
       y = "Densidad",
       color = "Distribución") +
  scale_x_continuous(breaks = seq(900,20000,1800))+
  estilo_grupo3



# Comparación de las distribuciones Lognormal, Pareto y Weibull para el intervalo [900, 20000[

curvas_comparacion_mayor_900_weibull_pareto <- data.frame(
  valor_x = rep(valores_x_900, times = 3), # Repetir 3 los números creados antes
  densidad = c(
    dlnorm(valores_x_900, meanlog = ajuste_lognormal_mayores_900$estimate[1], sdlog = ajuste_lognormal_mayores_900$estimate[2]), # Calcular la distribución de la lognormal evaluándola en los 1000 valores, usando la media y desviación canculada anteriormente con el ajuste
    dweibull(valores_x_900, shape = ajuste_weibull_mayores_900$estimate[1], scale = ajuste_weibull_mayores_900$estimate[2]),
    dpareto(valores_x_900, shape = ajuste_pareto$estimate[1], scale = ajuste_pareto$estimate[2])),
  distribucion = factor(rep(c(paste0("Lognormal con AIC = ", round(ajuste_lognormal_mayores_900$aic, 0)), # Crear las etiquetas para mostrar la diferencia de AIC
                              paste0("Weibull con AIC = ", round(ajuste_weibull_mayores_900$aic, 0)),
                              paste0("Pareto con AIC = ", round(ajuste_pareto$aic, 0))), 
                            each = 1000)) # Repetir cada etiqueta 1000 veces, los primeros 1000 para la lognormal, los siguientes 1000 para la Weibull y lo últimos 1000 para la Pareto
)

# Gráfico para comparar la distribución de la Lognormal, la Pareto y la Weibull para el intervalo [900, 20000[
comparacion_lognormal_weibull_mayores_pareto_900 <- datos_modificados %>%
  filter(Cost_claims_year >= 900 & Cost_claims_year <= 20000) %>% 
  ggplot(aes(x = Cost_claims_year)) +
  geom_histogram(aes(y = after_stat(density)), # Hacer que el alto total del histograma sea 1 (Representarlo como densidad)
                 bins = 50, fill = "gray80", color = "white", alpha = 0.6) + # Color del histograma
  geom_line(data = curvas_comparacion_mayor_900_weibull_pareto, aes(x = valor_x, y = densidad, color = distribucion), size = 1.2) + # Graficar la lognormal y la gamma y ponerlas sobre el histograma 
  scale_color_manual(values = c(paleta_pamplemousse[3], paleta_pamplemousse[1], paleta_pamplemousse[6])) + # Roja la Lognormal, azul la Weibull
  labs(title = "Comparación del ajuste de la Distribución Lognormal, Pareto y Weibull",
       x = "Costo anual",
       y = "Densidad",
       color = "Distribución") +
  scale_x_continuous(breaks = seq(900,20000,1800)) +
  scale_y_continuous(labels = scales::comma, breaks = seq(0,0.0007, 0.0001)) +
  estilo_grupo3
