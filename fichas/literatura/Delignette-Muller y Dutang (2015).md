# Delignette-Muller y Dutang (2015)

***Nivel descriptivo***

*Título:* *fitdistrplus: An R Package for Fitting Distributions*

*Autores:* Marie Laure Delignette-Muller y Christophe Dutang.

*Año:* 2015.

*Nombre del tema:* ajuste de distribuciones paramétricas en R mediante el paquete `fitdistrplus`.

*Clasificación:* Metodológica.

Se eligió esta etiqueta porque el artículo presenta una herramienta estadística en R para ajustar distribuciones a distintos tipos de datos. El paquete permite estimar parámetros, comparar distribuciones, generar gráficos de bondad de ajuste y utilizar criterios como AIC y BIC para evaluar cuál distribución describe mejor los datos.

*Resumen en una oración:* el artículo presenta el paquete `fitdistrplus` como una herramienta en R para ajustar y comparar distribuciones probabilísticas a datos observados.

*Argumento central:* los autores sostienen que ajustar una distribución a los datos no consiste únicamente en elegir una distribución y estimar sus parámetros, sino que requiere un proceso iterativo que incluye exploración gráfica, elección de distribuciones candidatas, estimación de parámetros y evaluación de la calidad del ajuste. Para esto, proponen el paquete `fitdistrplus`, que permite realizar este proceso de forma ordenada en R.

*Problemas con el argumento o el tema:* una limitación del artículo es que se concentra en el ajuste de distribuciones univariadas, por lo que no estudia directamente la relación entre la variable de severidad y variables explicativas como edad, tipo de vehículo o antigüedad de la licencia. Además, aunque el paquete permite comparar distribuciones, la decisión final no debe basarse únicamente en un criterio automático como AIC o BIC, sino también en la interpretación del problema y en el comportamiento visual de los datos.

***Nivel analítico***

*Conexión con mi proyecto:* este artículo se relaciona directamente con el proyecto porque el profesor recomendó utilizar el paquete `fitdistrplus` para analizar a qué distribución se ajusta mejor la variable `Cost_claims_year`. En lugar de asumir desde el inicio una distribución específica para los costos de reclamos, el paquete permite comparar varias distribuciones candidatas, observar gráficos de ajuste y utilizar criterios como AIC y BIC para respaldar la elección. Esto es útil especialmente para el análisis de los costos positivos y para estudiar si la variable presenta asimetría o cola derecha.

*Lo que NO dice el autor:* el artículo no propone un modelo específico para reclamos con acumulación en el valor 900 ni desarrolla una metodología particular para detectar umbrales monetarios. Tampoco resuelve por sí solo el problema de los ceros en `Cost_claims_year`; más bien, ofrece una herramienta general para ajustar distribuciones a datos observados.

*Contraste con otra fuente:* en comparación con *Marambakuyana y Shongwe (2024)*, este artículo es más práctico y menos especializado. Mientras Marambakuyana y Shongwe analizan modelos compuestos y de mezcla para datos de seguros con colas pesadas, *Delignette-Muller y Dutang (2015)* ofrecen una herramienta concreta en R para ajustar distribuciones y comparar su bondad de ajuste. Por eso, este artículo puede usarse como base operativa para implementar una parte sencilla de la metodología, mientras que Marambakuyana y Shongwe funciona mejor como respaldo teórico para explicar por qué los costos de reclamos pueden requerir distribuciones flexibles.

*Evaluación de aplicabilidad (escala 1–5):* 5.

La aplicabilidad es muy alta porque el paquete `fitdistrplus` puede incorporarse directamente en el análisis del proyecto. Permite trabajar en R, comparar distribuciones candidatas, estimar parámetros y generar criterios de ajuste para justificar la selección de una distribución para los costos positivos de reclamos.

*Pregunta que le haría al autor:* ¿Cómo recomendaría utilizar `fitdistrplus` cuando una variable de costos tiene muchos ceros y, además, una posible concentración en un valor específico como €900?

*Resumen argumentativo:* Lo que los autores intentan resolver es la necesidad de contar con una herramienta práctica en R para ajustar distribuciones probabilísticas a datos reales. El artículo explica que este proceso no debe limitarse a aplicar una fórmula, sino que requiere explorar los datos, escoger distribuciones candidatas, estimar parámetros y evaluar la calidad del ajuste mediante gráficos y criterios estadísticos. Para esto, presentan el paquete `fitdistrplus`, el cual permite ajustar distribuciones mediante diferentes métodos, como máxima verosimilitud, emparejamiento de momentos, emparejamiento de cuantiles y criterios de bondad de ajuste. Para el proyecto, este artículo es especialmente útil porque permite justificar el uso de `fitdistrplus` como herramienta para estudiar la distribución de `Cost_claims_year`, principalmente en los valores positivos. En este sentido, no sería necesario afirmar que se aplicará un modelo de mezcla complejo, sino que se compararán distribuciones candidatas de manera exploratoria y metodológicamente respaldada. 