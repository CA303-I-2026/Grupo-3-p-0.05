***Nivel descriptivo***

*Titular:* *La distribución Lognormal presenta mejor ajuste para los costos positivos menores a 900 euros*

*Nombre del hallazgo/resultado:* Para los costos anuales de siniestros ubicados en el intervalo entre 0 y 900 euros, la distribución Lognormal mostró un mejor ajuste que la distribución Gamma.

*Resumen en una oración:* En el intervalo $0 < Y < 900$, la distribución Lognormal obtuvo un AIC de 211,339.9, mientras que la distribución Gamma obtuvo un AIC de 212,684.5, por lo que se seleccionó la Lognormal como la distribución con mejor ajuste.

*Método o análisis que lo produjo:* Se ajustaron dos distribuciones candidatas, Lognormal y Gamma, para los costos anuales positivos menores a 900 euros mediante el paquete `fitdistrplus` de R y la función `fitdist()`. Posteriormente, se compararon los valores del Criterio de Información de Akaike, AIC, para determinar cuál distribución presentaba mejor ajuste.

*Evidencia:* El análisis del umbral de 900 euros (gráficos 10, 11 y 12 de la bitácora 3) muestra que la distribución Lognormal obtuvo un AIC menor que la distribución Gamma. Además, los parámetros estimados para la distribución Lognormal fueron `meanlog = 5.278536` y `sdlog = 0.969318`.

***Nivel analítico***

*Conexión con la pregunta de investigación:* Este resultado se relaciona con la pregunta de investigación porque permite estudiar la severidad de los siniestros, específicamente el comportamiento de los costos anuales positivos que no alcanzan el umbral de 900 euros. Esto ayuda a diferenciar los costos moderados de los costos de mayor severidad.

*Contraste con la literatura:* Este resultado se vincula directamente con lo planteado por Delignette-Muller y Dutang (2015), quienes señalan que el ajuste de distribuciones no debe limitarse a elegir una distribución y estimar sus parámetros, sino que requiere un proceso que incluya exploración gráfica, selección de distribuciones candidatas, estimación de parámetros y evaluación de la calidad del ajuste. En este caso, el uso de `fitdistrplus` permitió aplicar esa lógica metodológica al comparar la distribución Lognormal y la Gamma mediante el AIC, respaldando la elección de la Lognormal para los costos positivos menores a 900 euros.

*Lo que NO explica este resultado:* Este resultado no explica por qué ciertos asegurados presentan costos positivos menores a 900 euros, ni permite concluir cuáles variables del asegurado o del vehículo influyen en esos costos. Además, como advierten Delignette-Muller y Dutang (2015), la elección de una distribución no debería depender únicamente de un criterio automático como el AIC, sino que también debe considerar la interpretación del problema y la visualización del ajuste.

*Implicación para el siguiente paso:* La distribución Lognormal puede utilizarse como componente para modelar los costos positivos menores a 900 euros dentro del análisis de distribución mixta. Posteriormente, este componente debe complementarse con el análisis de la masa en cero y de los costos mayores o iguales a 900 euros, ya que `fitdistrplus` permite ajustar distribuciones a datos positivos, pero no resuelve por sí solo el problema de la alta concentración de ceros ni la posible cola derecha de los costos.