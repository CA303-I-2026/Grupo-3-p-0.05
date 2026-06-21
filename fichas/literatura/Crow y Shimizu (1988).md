# Crow y Shimizu (1988)

***Nivel descriptivo***

*Título:* *Lognormal Distributions: Theory and Applications*

*Editores:* Edwin L. Crow y Kunio Shimizu.

*Año:* 1988.

*Nombre del tema:* teoría, propiedades, estimación y aplicaciones de la distribución Lognormal.

*Clasificación:* Teórica y metodológica.

Se eligió esta etiqueta porque el libro desarrolla la distribución Lognormal desde una perspectiva formal, incluyendo su definición, propiedades, métodos de estimación e intervalos de confianza. Además, permite justificar el uso de la transformación logarítmica cuando una variable positiva se modela mediante una distribución Lognormal.

*Resumen en una oración:* el libro presenta la teoría y las aplicaciones de la distribución Lognormal, incluyendo su relación con la distribución Normal mediante la transformación logarítmica.

*Argumento central:* Crow y Shimizu presentan la distribución Lognormal como una distribución adecuada para variables positivas y asimétricas, cuya característica central es que el logaritmo de la variable sigue una distribución Normal. Esta propiedad permite trabajar una variable sesgada en su escala original mediante una transformación logarítmica, donde los parámetros del modelo corresponden a la media y la desviación estándar del logaritmo de la variable.

*Problemas con el argumento o el tema:* una limitación para el proyecto es que el libro no se concentra específicamente en seguros de automóviles ni en datos de reclamos. Además, aunque la distribución Lognormal puede ajustarse bien a variables positivas y asimétricas, esto no garantiza que siempre sea la mejor distribución para datos de severidad. Por esta razón, en el proyecto fue necesario compararla con otras distribuciones candidatas, como Gamma, Weibull y Pareto.

***Nivel analítico***

*Conexión con mi proyecto:* esta referencia se relaciona directamente con el análisis del costo anual positivo de los siniestros. En el proyecto, la variable `Cost_claims_year` presentó valores positivos con asimetría hacia la derecha, por lo que se evaluó la distribución Lognormal como candidata para los componentes positivos de la distribución mixta. La referencia de Crow y Shimizu (1988) permitió justificar teóricamente que, si $Y$ sigue una distribución Lognormal, entonces $W = \ln(Y)$ sigue una distribución Normal. Esta propiedad fue clave para construir intervalos de confianza para los parámetros $\mu$ y $\sigma$ en escala logarítmica.

*Lo que NO dice el autor:* el libro no estudia el umbral de 900 euros ni propone una metodología específica para separar costos medios y costos altos en datos de reclamos. Tampoco aborda directamente el exceso de ceros ni la construcción de una distribución mixta con una masa puntual en cero. Su aporte al proyecto se concentra en la justificación teórica de la Lognormal y de la transformación logarítmica.

*Contraste con otra fuente:* en comparación con Delignette-Muller y Dutang (2015), Crow y Shimizu (1988) aportan una fundamentación más teórica de la distribución Lognormal. Delignette-Muller y Dutang (2015) son más útiles para justificar el ajuste computacional de distribuciones mediante `fitdistrplus`, mientras que Crow y Shimizu (1988) permiten explicar por qué la transformación $W = \ln(Y)$ lleva a una escala Normal cuando el modelo Lognormal es adecuado. Ambas fuentes se complementan: una respalda la herramienta de ajuste y la otra respalda la propiedad probabilística utilizada para los intervalos de confianza.

*Evaluación de aplicabilidad (escala 1–5):* 4.

La referencia es aplicable porque justifica una parte central del análisis de severidad: el uso de la Lognormal para modelar costos positivos y la construcción de intervalos de confianza en escala logarítmica. No recibe 5 porque no está enfocada específicamente en datos de seguros ni en el problema del umbral de 900 euros.

*Pregunta que le haría al autor:* ¿Qué criterios recomendaría utilizar para decidir cuándo una distribución Lognormal es preferible a distribuciones como Gamma, Weibull o Pareto en datos de reclamos de seguros con colas derechas?

*Resumen argumentativo:* Lo que Crow y Shimizu (1988) permiten justificar es la base teórica de la distribución Lognormal. Si una variable positiva $Y$ es Lognormal, entonces su logaritmo natural $W = \ln(Y)$ sigue una distribución Normal. Esta relación es importante porque permite transformar una variable positiva y asimétrica en una variable que puede analizarse bajo el marco de la Normal. Para el proyecto, esta propiedad fue fundamental porque los costos positivos de siniestros se modelaron mediante distribuciones Lognormales dentro de una distribución mixta. Además, permitió justificar que los intervalos de confianza para los parámetros $\mu$ y $\sigma$ se construyeran en la escala logarítmica, ya que esos parámetros describen la media y la desviación estándar de $\ln(Y)$, no directamente del costo en su escala original.