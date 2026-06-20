***Nivel descriptivo***

*Titular:* *La distribución Lognormal presenta mejor ajuste que la Gamma, Pareto y Weibull*

*Nombre del hallazgo/resultado:*  La distribución Lognormal presenta el mejor ajuste entre las distribuciones evaluadas para los costos positivos en ambos intervalos de la distribución mixta.

*Resumen en una oración:* En el intervalo $0 < Y < 900$, la Lognormal obtuvo un AIC = 211,340, supera a la Gamma con AIC = 212,685 y a la Weibull con AIC = 212,884; para el intervalo $Y≥900$, la Lognormal obtuvo un AIC = 64,537, superando a la Weibull con AIC = 66,089 y Pareto con AIC = 66,423.

*Método o análisis que lo produjo:* Se ajustaron tres distribuciones candidatas, Lognormal, Gamma y Weibull, para los costos anuales positivos menores a €900 y tres distribuciones candidatas (Lognormal, Pareto y Weibull) para los costos mayores o iguales a €900; estos ajustes se realizaron mediante el paquete `fitdistrplus` de R y la función `fitdist()`. Posteriormente, se compararon los valores del Criterio de Información de Akaike, AIC, para determinar cuál distribución presentaba mejor ajuste para cada intervalo.

*Evidencia:* Las figuras 3, 4, 5 y 6 muestran gráficamente la comparación de las distribuciones acompañadas del valor de los AIC correspondientes, en los cuatro gráficos, se observa que la distribución Lognormal se adapta mejor al histograma de los costos para cada intervalo. Además, los parámetros estimados para la distribución Lognormal fueron `μ₁ = 5.2785366`, `σ₁ = 0.9693318` y `μ₂ = 7.5571894`, `σ₂ = 0.6816524` para el intervalo `(0 < Y < 900)` y `(Y ≥ 900)` respectivamente.

***Nivel analítico*** 

*Conexión con la pregunta de investigación:* Este resultado se relaciona con la pregunta de investigación ya que permite estudiar la severidad de los siniestros, tanto para los costos positivos que no superan los €900 como para los que sí lo hacen. Esto permite identificar diferencias entre ambos intervalos de costos.

*Contraste con la literatura:* Este resultado se vincula directamente con lo planteado por Delignette-Muller y Dutang (2015), quienes señalan que el ajuste de distribuciones no debe limitarse a elegir una distribución y estimar sus parámetros, sino que requiere un proceso que incluya exploración gráfica, selección de distribuciones candidatas, estimación de parámetros y evaluación de la calidad del ajuste. En este caso, el uso de `fitdistrplus` permitió aplicar esa lógica metodológica al comparar la distribución Lognormal con la Gamma y la Weibull y la Lognormal con la Pareto y la Weibull mediante el AIC, respaldando la elección de la Lognormal para los costos positivos.

*Lo que NO explica este resultado:* Este resultado no explica qué características tanto del asegurado como del vehículo, influyen en la permanencia en alguno de los dos componentes de la distribución mixta, ya sea para los costos positivos que no alcanzan los €900 o para los que sí llegan a ese umbral. Este resultado tampoco explica el exceso de ceros en la variable de los costos.

*Implicación para el siguiente paso:* La distribución Lognormal se confirma como la distribución adecuada para ambos componentes positivos de la distribución mixta, lo que permite caracterizar con precisión la severidad de los siniestros. Los parámetros estimados, `μ₁ = 5.2785366`, `σ₁ = 0.9693318`, `μ₂ = 7.5571894` y `σ₂ = 0.6816524` pueden utilizarse para describir el comportamiento de los costos medios y altos, y su estabilidad será validada mediante intervalos de confianza asintóticos en el desarrollo de la investigación.