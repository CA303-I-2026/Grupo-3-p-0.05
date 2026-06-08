***Nivel descriptivo***

*Título:* Methodology and Application of the Kruskal-Wallis Test

*Autor(es):* Ostertagová, E., Ostertag, O. y Kováč, J.

*Año:* 2014

*Nombre del tema:* Fundamentación matemática y aplicación práctica de la prueba de Kruskal-Wallis y sus procedimientos de comparación múltiple post-hoc.

*Clasificación:* Metodológica. Se eligió esta etiqueta porque el artículo no propone una teoría nueva ni realiza una revisión histórica del problema; en cambio, desarrolla el sustento matemático formal del estadístico H, incluyendo la corrección por empates y el procedimiento de comparaciones múltiples de Conover-Inman, y los ilustra mediante un ejemplo aplicado, lo que lo convierte en una guía técnica de implementación.

*Resumen en una oración:* Desarrollo formal del estadístico de Kruskal-Wallis con corrección por empates y comparaciones múltiples de Conover-Inman.

*Argumento central:* La prueba de Kruskal-Wallis constituye una alternativa no paramétrica robusta al ANOVA de una vía cuando no se cumplen los supuestos de normalidad u homocedasticidad. El artículo formaliza el cálculo del estadístico H basado en rangos, introduce la corrección necesaria cuando existen empates entre observaciones (situación frecuente en datos reales), y propone el procedimiento de Conover-Inman como método de comparaciones múltiples post-hoc, el cual aplica el método de mínima diferencia significativa de Fisher directamente sobre los rangos.

*Problemas con el argumento o el tema:* Los autores señalan que, si bien la prueba de Kruskal-Wallis es más flexible que el ANOVA paramétrico, sigue requiriendo que las distribuciones de los grupos tengan la misma forma, diferenciándose únicamente en su mediana, supuesto que en la práctica puede no verificarse. Además, el artículo trabaja con un ejemplo de n = 25 observaciones y cinco grupos de tamaño igual, condición que dista considerablemente de escenarios con grupos de tamaños muy desiguales o con cientos de miles de observaciones.

***Nivel analítico***

*Conexión con mi proyecto:* Este artículo aporta el respaldo matemático formal que justifica el uso de Kruskal-Wallis en el proyecto. Al comparar la frecuencia (N_claims_year) y la severidad (Cost_claims_year) entre categorías como el tipo de vehículo o la zona de circulación, es esperable que existan empates en los datos, por ejemplo múltiples pólizas con costo cero, por lo que la corrección del estadístico H por empates descrita en el artículo resulta directamente aplicable a la base de datos utilizada.

*Lo que NO dice el autor:* El artículo no discute el comportamiento de la prueba cuando el tamaño de muestra es muy grande, como ocurre en la base de datos de Lledó y Pavía (2024) con más de 100,000 observaciones, escenario en el que el estadístico H tiende a ser significativo casi con certeza incluso ante diferencias de magnitud pequeña. Esto implica que los resultados de la prueba deben interpretarse con cautela y en conjunto con los hallazgos descriptivos ya presentados, que aportan contexto sobre la magnitud real de las diferencias entre grupos.

*Contraste con otra fuente:* Este artículo complementa metodológicamente las fuentes ya citadas en el proyecto, como Počuča et al. (2020), quienes trabajan con datos de seguros con exceso de ceros y heterogeneidad entre grupos. Mientras que Počuča et al. proponen modelos para capturar esa heterogeneidad, Ostertagová et al. (2014) ofrecen una herramienta formal para verificar estadísticamente si las diferencias entre grupos son distinguibles del azar, sin asumir normalidad ni homogeneidad de varianzas.

*Evaluación de aplicabilidad (escala 1–5):* 4. La corrección del estadístico H por empates es directamente aplicable dado el alto volumen de ceros en las variables de siniestralidad. No alcanza el puntaje máximo porque no aborda el problema de potencia excesiva con muestras de gran tamaño, aspecto relevante para la interpretación de los resultados en este proyecto.

*Pregunta que le haría al autor:* Con una muestra de más de 100,000 observaciones donde prácticamente cualquier diferencia resulta estadísticamente significativa, ¿cómo recomendarían interpretar los resultados de la prueba para determinar si las diferencias entre grupos tienen relevancia práctica más allá de la significancia estadística?

*Resumen argumentativo:* El problema que Ostertagová et al. (2014) abordan es la necesidad de comparar más de dos grupos cuando los supuestos del ANOVA paramétrico no se cumplen, situación que aplica directamente al proyecto dado que las variables de siniestralidad presentan distribuciones asimétricas, gran cantidad de empates y grupos de tamaños desiguales. La prueba se utiliza en este proyecto como respaldo estadístico formal de las diferencias descriptivas ya observadas entre tipos de vehículo, entre zonas de circulación y entre tipos de combustible, con el objetivo de verificar que dichas diferencias no son producto del azar sino patrones sistemáticos en los datos.