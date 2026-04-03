# Goldburd et al. (2025)

***Nivel descriptivo***

*Título:* *Generalized Linear Models for Insurance Rating*

*Autores:* Mark Goldburd, Anand Khare, Dan Tevet y Dmitriy Guller.

*Año:* 2025.

*Nombre del tema:* Modelación de la frecuencia y severidad de siniestros usando Modelos Lineales Generalizados para tarifar seguros.

*Clasificación:* Metodológica.

Se eligió esta etiqueta porque no solamente habla de la teoría de la frecuencia y severidad, sino que da una guía de cómo modelarlos estadísticamente con modelos lineales generalizados (GLM), además, el capítulo 3 es sobre el proceso de construir el modelo.

*Resumen en una oración:* Guía para construir planes de tarifación utilizando Modelos Lineales Generalizados

*Argumento central:* A pesar de que el libro trata sobre la tarifación para seguros; los elementos metodológicos que utiliza, tales como la selección de las distribuciones y el uso de la variables, son los mismos que se necesitan para responder parte de la pregunta de investigación; específicamente cómo intervienen las variables en la frecuencia y severidad de los siniestros.

*Problemas con el argumento o el tema:* Primero, los autores del libro identificaron que los GLM se ajustan asumiendo que los datos son totalmente fiables, además, no tienen en cuenta la escasez de datos en los que se basa; por lo que si se tienen pocos datos, podría generarse un coeficiente poco confiable. Además de esto, los GLM asumen que la aleatoriedad de los datos no está coorelacionada, algo que no puede pasar si, por ejemplo, varios asegurados son afectados por un mismo factor, como un desastre natural.

***Nivel analítico***

*Conexión con mi proyecto:* Este libro se relaciona en gran medida con el proyecto, una parte de la pregunta de investigación es ver cómo influyen variables como la edad del asegurado, la antigüedad con la aseguradora, el historial de siniestros y las características del vehículo, en la frecuencia y severidad de los siniestros; en el libro, en el capítulo 2, sección 2.7, se habla de las distribuciones para la frecuencia y para la severidad, además, en las sección 2.4 se habla de cómo tratar con variables tanto categóricas como continuas. Luego, en el capítulo 5 se habla de elegir la variable objetivo, ya sea la frecuencia o la severidad, cómo elegir su distribución, cómo seleccionar y transformar variables. Finalmente, en el Capítulo 7 se explica cómo validar el modelo. 

*Lo que NO dice el autor:* La pregunta que no se responde para el proyecto es la explicación sobre el incremento abrupto de los reclamos por año en el umbral de los €900, además el libro asume que los datos están limpios y perfectos para modelar, tampoco profundiza en la limpieza de los datos ni manejo de los NA.

*Contraste con otra fuente:* En referencia a la ficha de *Patel (2025)* en la que se da una introducción al tema de coorelación, se señala que la principal limitación es que se asume una relación lineal entre las variables y no aplica para las relaciones no lineales u otras interacciones más complejas. Goldburd et al. (2025) trata esta limitación en la sección 5.4 del libro, titulada como "Transformation of Variables" en donde en la primer sección explican cómo detectar si una variable tiene relación no lineal con la variable que se está utilizando; y en las siguientes 4 secciones se explica cómo tratar la no linealidad por medio de diferentes métodos los cuales son: binning, términos polinomiales, funciones lineales por partes y natural cubic splines. De esta forma, Goldburd et al. (2025) resuelven la limitación identificada en el trabajo de Patel (2025)

*Evaluación de aplicabilidad (escala 1–5):* 4.5.

El libro de Goldburd et al. (2025) explica cómo modelar tanto la frecuencia como la severidad de siniestros por medio de GLM. Además, explica cómo tratar con variables categóricas y continuas, verificar si existen relaciones no lineales y cómo tratarlas y también se incluye una sección en donde se explica cómo validar los modelos, algo fundamental para verificar que el modelo esté bien.

*Pregunta que le haría al autor:* ¿Se podría descubrir por qué hay un aumento abrupto del número de reclamos por año en €900 y cómo lo haría?

*Resumen argumentativo:* Lo que los autores intentan resolver es explicar cómo hacer un plan de tarifación utilizando GLM, donde explican desde el manejo de los datos, hasta la creación y validación de modelos. La solución propuesta por los autores sirve para la investigación parcialmente, pues posee capítulos sumamente útiles como lo pueden ser el capítulo 2 y el 5, los cuales están relacionados directamente con la investigación, específicamente la parte de la relación entre distintas variables y la frecuencia y severidad de los siniestros. Pero el libro está destinado a la tarifación de seguros, tema que no trata nuestra investigación. Además de esto, el libro no aborda la otra parte de la pregunta de investigación, el aumento abrupto en la cantidad de reclamos por año en los €900. De este trabajo se utilizará la metodología propuesta para modelar la frecuencia y severidad, también se utilizará las técnicas para la transformación de variables; además de los métodos para detectar y tratar relaciones no lineales entre las variables; finalmente, no se utilizará la parte de tarifación de seguros.
