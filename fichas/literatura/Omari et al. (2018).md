# Omari et al. (2018)

***Nivel descriptivo***

*Título:* *Modeling the Frequency and Severity of Auto Insurance Claims Using Statistical Distributions*

*Autores:* Cyprian Ondieki Omari, Shalyne Gathoni Nyambura, Joan Martha Wairimu Mwangi
Department of Statistics and Actuarial Science, Dedan Kimathi University of Technology, Nyeri, Kenya.

*Año:* 2018

*Nombre del tema:* Frecuencia y la severidad de siniestros en seguros de autos.

*Clasificación:* Metodológica. 

Este estudio propone una metodología que podría adaptarse de manera efectiva en el proyecto que se está planteando. Esto, ya que el tema es parecido, frecuencia y severidad de seguros de automóviles. El artículo propone un procedimiento concreto para seleccionar distribuciones, estimar parámetros y evaluar ajuste, más que desarrollar una teoría nueva o revisar la evolución histórica del problema.

*Resumen en una oración:* Comparación de distribuciones estadísticas y estimación de parámetros para modelar frecuencia y severidad en reclamaciones vehiculares.

*Argumento central:* El artículo establece que que la frecuencia y severidad de los reclamos en el campo de los seguros de autos deben modelarse por separados, utilizando las distribuciones adecuadas a las características observadas. Además, establece que la selección del modelo debe basarse en estimación por máxima verosimilitud, pruebas de bondad de ajuste y criterios de información; en sus datos, la severidad se ajusta mejor con una lognormal y la frecuencia con distribuciones binomial negativa y geométrica.

*Problemas con el argumento o el tema:* Los autores señalan que uno de los principales problemas al modelar reclamaciones de seguros es que los datos no siguen distribuciones simples debido a su comportamiento observado. Los datos presentan asimetría positiva, el fenómeno de "colas pesadas" y una alta concentración de valores cero en la frecuencia de siniestros. Esto dificulta el uso de distribuciones clásicas como Poisson o binomial, ya que en varios casos no logran un ajuste adecuado según las pruebas de bondad de ajuste realizadas. Por eso, finalmente los autores utilizan una distribución lognormal.



***Nivel analítico***

*Conexión con mi proyecto:* En general, el proyecto planteado, al igual que en el artículo, también separa variables de frecuencia de siniestros, como N_claims_year o N_claims_history, y variables de severidad, como Cost_claims_year o el costo promedio por siniestro. Por tanto, este artículo sirve como potencial referencia metodológica para modelar frecuencia y severidad con distribuciones distintas, adecuadas para su comportamiento. Además, permite ver ejemplos de distribuciones que utilizan máxima verosimilitud y otras pruebas de bondad de ajuste.

*Lo que NO dice el autor:* El artículo no incorpora variables como edad, tipo de vehículo o historial de reclamos, como se plantea hacer en este proyecto. Tampoco profundiza en como modela la dependencia de un mismo asegurado a lo largo del tiempo, lo que sí es importante ya que los asegurados pueden aparecer múltiples veces dependiendo de las pólizas. Esto es una limitación importante, ya que se espera poder describir la distribución global de los reclamos así como entender su comportamiento usando información individual.

*Contraste con otra fuente:* Este artículo coincide con lo planteado por Frees (2021). En ese sentido, la frecuencia y la severidad de los siniestros deben analizarse por separado, ya que representan procesos aleatorios distintos. Frees explica que la frecuencia suele modelarse con distribuciones discretas como Poisson o binomial negativa, mientras que la severidad requiere distribuciones continuas, como gamma, Pareto o lognormal. La diferencia es que Omari et al. llevan ese planteamiento a una aplicación empírica concreta y muestran, mediante pruebas de bondad de ajuste, que en sus datos la distribución lognormal describe mejor la severidad y la binomial negativa la frecuencia.

*Evaluación de aplicabilidad (escala 1–5):* 4

La metodología es aplicable porque parte del mismo problema básico de la investigación: modelar frecuencia y severidad en seguros de autos con datos observados. Técnicamente, su separación entre variable discreta de conteo y variable continua positiva encaja bien con los datos con los que se va a trabajar. Aún así, el artículo trabaja sobre ajuste de distribuciones marginales y no desarrolla modelos con covariables, por eso únicamente se usará esta investigación como base para la metodología. 

*Pregunta que le haría al autor:* ¿Por qué la distribución lognormal ofreció un mejor ajuste para la severidad de los siniestros en comparación con otras distribuciones evaluadas, y qué características específicas de los datos influyeron más en ese resultado?

*Resumen argumentativo:* El problema que los autores intentan resolver es cómo escoger distribuciones adecuadas para representar la frecuencia y la severidad de reclamaciones en seguros de automóviles, ya que una mala elección afecta reservas, primas y proyecciones financieras. Su solución funciona bien como punto de partida porque sigue un procedimiento ordenado: seleccionar familias de distribuciones posibles, estimar parámetros por máxima verosimilitud y comparar ajustes con pruebas estadísticas e indicadores de información. Para el contexto del proyecto, este enfoque sí resulta útil, sobre todo para la etapa exploratoria y para justificar por qué la frecuencia y la severidad deben analizarse por separado. Sin embargo, se queda corto cuando el objetivo pasa de describir la distribución de los datos a explicar diferencias entre asegurados o a comprender comportamiento futuro usando variables del historial. En este proyecto, esa limitación es importante porque se quieren aprovechar columnas como N_claims_history y R_claims_history para estudiar evolución del riesgo a través del tiempo.
