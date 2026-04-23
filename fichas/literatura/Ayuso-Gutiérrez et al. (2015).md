# Ayuso-Gutiérrez et al. (2015)

***Nivel descriptivo***

*Título:* *Modelización del tiempo de hospitalización en lesiones por tránsito*

*Autores:* Mercedes Ayuso-Gutiérrez, Lluís Bermúdez-Morata y Miguel Santolino-Prieto.

*Año:* 2015.

*Nombre del tema:* Análisis de los factores sociodemográficos y de las lesiones causadas por accidentes de tránsito que influyen en el tiempo de hospitalización de las víctimas.

*Clasificación:* Metodológica.

Se eligió esta etiqueta pues el artículo compara distribuciones como la Poisson, binomial negativa y Poisson-inversa gaussiana y sus modificaciones cero infladas para ver cuál brinda el mejor ajuste a los datos de severidad.

*Resumen en una oración:* Comparación entre distribuciones discretas para modelar días de hospitalización por accidentes de tránsito.

*Argumento central:* Se determinó que la distribución Poisson-inversa gaussiana cero inflada ha ofrecido mejores resultados a la hora de detectar los factores que inciden en la duración de la hospitalización y en qué medida.

*Problemas con el argumento o el tema:* Primero, los autores del artículo señalan que una de las grandes limitaciones fue no tener en cuenta las posibles interrelaciones de las distintas lesiones en una misma víctima; además, otra de las limitaciones fue que no se dispone de información sobre indicadores de severidad de las lesiones ni información acerca del uso de dispositivos de seguridad, ubicación de los pasajeros o conducción bajo efectos de sustancias.

***Nivel analítico***

*Conexión con mi proyecto:* Este artículo se relaciona en gran medida con el proyecto, pues una de las partes de la pregunta de investigación es qué factores influyen en el aumento abrupto en el umbral de los €900 en el costo de reclamos por año; como en el artículo se modela una variable de severidad la cual son los días de hospitalización, se podría adaptar para el caso de la variable "Cost_claims_year"; además trabaja con distribuciones cero infladas, extremadamente útil para el caso de esta investigación pues la variable "Cost_claims_year" posee muchos ceros.

*Lo que NO dice el autor:* El artículo no trabaja con datos monetarios, sino con unidades de tiempo, en este caso días, por lo que existe la limitación de análisis para el costo monetario de los siniestros.

*Contraste con otra fuente:* En referencia a la ficha de *Goldburd et al. (2025)* en la que se propone utilizar el modelo lineal generalizado GLM para modelar la severidad, asume de cierta forma que los datos son ideales y que no hay que hacerles modificaciones. Mientras que *Ayuso-Gutiérrez et al. (2015)* proponen una metodología para datos que poseen gran cantidad de ceros mediante la aplicación de distribuciones cero infladas, como es el caso de los datos del proyecto de investigación; de este modo, el artículo de Ayuso-Gutiérrez et al. (2015) se complementa con el de Goldburd et al. (2025) para el manejo de datos con concentración en determinado valor.

*Evaluación de aplicabilidad (escala 1–5):* 4.5.

La metodología propuesta en el artículo es altamente aplicable al proyecto de investigación, ya que brinda una opción para el manejo de una variable con una concentración de observaciones en valores específicos, como es el caso del 0 y 900. 

*Pregunta que le haría al autor:* ¿Cómo adaptaría su metodología para trabajar con datos monetarios en los que hay concentración de cantidad en el 0 y el 900?

*Resumen argumentativo:* Lo que los autores intentan resolver es cómo modelar una variable de severidad la cual es los días de hospitalización la cual posee una gran cantidad de observaciones en 0; descubren que los modelos usados comúnmente como Poisson, no logran obtener un buen ajuste ya que estos modelos no se ajustan bien para datos con sobredispersión; es por esto que deciden hacer una comparación entre distribuciones como la binomial negativa y la Poisson-inversa gaussiana incorporando versiones cero infladas, para determinar cuál brinda el mejor ajuste. Para el proyecto, esta metodología es altamente aplicable, ya que la variable "Cost_claims_year" posee una concentración de datos en 0 y en 900. Por esto, para el proyecto se usará la comparación de distribuciones, además, para medir el impacto de cada variable en la severidad, se utilizará la interpretación de coeficientes mediante exp(β), donde valores mayores a 1 implican un aumento en la severidad y valores menores a 1 implican una disminución
