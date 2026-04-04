# Frees (2021)

***Nivel descriptivo***

*Título:* *Loss Data Analytics*

*Autores:* Edward Frees.

*Año:* 2021

*Nombre del tema:* Fundamentos para el análisis de frecuencia y severidad de siniestros en el campo de seguros.

*Clasificación:* Teórica.

El documento desarrolla principios básicos y generales de modelación de variables y fundamientos probabilísticos que ciertamente sirven como base conceptual para distintos tipos de análisis.

*Resumen en una oración:* Explica cómo modelar frecuencia y severidad de pérdidas mediante distribuciones probabilísticas.

*Argumento central:* Este es un libro que presenta información acerca de el análisis de pérdida. Para el contexto de este proyecto, el documento sostiene que el riesgo asegurador puede analizarse separando el número de siniestros (frecuencia) y el costo de cada uno (severidad), utilizando distribuciones probabilísticas distintas para cada componente según la naturaleza de los datos y lo que se reporta al observarlos.

*Problemas con el argumento o el tema:* El autor señala que uno de los principales retos es seleccionar distribuciones adecuadas porque los datos de seguros suelen presentar asimetría, valores extremos y heterogeneidad entre asegurados, lo que dificulta que un único modelo funcione en todos los contextos.



***Nivel analítico***

*Conexión con mi proyecto:* Este documento se relaciona directamente con la investigación porque proporciona el fundamento teórico para analizar la variable N_claims_year como frecuencia y Cost_claims_year como severidad dentro de la base de datos de seguros vehiculares. Además, justifica el uso de distribuciones discretas para frecuencia y distribuciones continuas para severidad, que son precisamente los enfoques que se quieren considerar en el estudio.

*Lo que NO dice el autor:* Aunque explica bien la lógica general de frecuencia y severidad, no profundiza en cómo adaptar esos modelos cuando existe un alto porcentaje de ceros o cuando los datos provienen de mercados específicos con características regulatorias distintas, como puede ocurrir en una base de datos particular y real de seguros de automóviles.

*Contraste con otra fuente:* Este libro complementa el artículo de Omari et al. (2018), porque Frees presenta el marco teórico general de frecuencia–severidad, mientras que Omari et al. muestran una aplicación empírica concreta donde se verifica que la binomial negativa y la lognormal ofrecen mejor ajuste para datos reales.

*Evaluación de aplicabilidad (escala 1–5):* 3

La metodología es altamente aplicable porque el modelo frecuencia–severidad coincide directamente con la estructura de la base de datos; sin embargo, requiere ajustes adicionales para manejar características específicas que presenten los mismos.

*Pregunta que le haría al autor:* Cuando varias distribuciones parecen razonables teóricamente para severidad, ¿qué criterio considera más importante para seleccionar una en una base de datos real?

*Resumen argumentativo:* El problema principal que aborda el autor es cómo representar matemáticamente el riesgo en seguros cuando las pérdidas no son determinísticas. Su propuesta funciona porque separa dos procesos aleatorios distintos: cuántos siniestros ocurren y cuánto cuesta cada uno. Esta división permite asignar distribuciones diferentes según el comportamiento de cada variable. En en contexto del proyecto, esta estructura resulta útil porque las variables de frecuencia y severidad están claramente diferenciadas en la base de datos. Sin embargo, el texto no resuelve completamente cómo proceder cuando los datos presentan exceso de ceros o comportamientos extremos muy marcados, como sucede en un estudio real como el de Omari et al. (2018).
