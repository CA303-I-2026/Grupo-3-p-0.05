***Nivel descriptivo***

*Titular:* *Las furgonetas tienen mayor frecuencia promedio de siniestros*

*Nombre del hallazgo/resultado:*  Existen diferencias notables en la frecuencia promedio anual según el tipo de vehículo.

*Resumen en una oración:* Las furgonetas poseen la mayor frecuencia promedio, 0.568, turismos 0.397, motocicletas 0.145 y agrícolas 0.001.

*Método o análisis que lo produjo:* Se calculó el promedio de la variable "N_claims_year" agrupada por el tipo de vehículo "categoria", para esto se utilizaron las funciones "group_by()" y "summarise()" de R y para la visualización de los resultados se utilizó un gráfico de barras.

*Evidencia:* El gráfico que respalda este hallazgo corresponde a la figura 5 de la tercer bitácora, titulada "Frecuencia promedio de siniestros por año según el tipo de vehículo".

***Nivel analítico***

*Conexión con la pregunta de investigación:* Este hallazgo responde directamente una parte de la pregunta de investigación, ya que confirma que el tipo de vehículo influye en la frecuencia de los siniestros, al encontrarse que las furgonetas y los turismos poseen una frecuencia promedio mayor a la de las motocicletas y vehículos agrícolas, los cuales poseen una frecuencia promedio mucho menor. 

*Contraste con la literatura:* En relación con lo planteado por Alvia Párraga & Linares Giler (2024), se encuentra una concordancia ya que los autores plantean que el tipo de vehículo es un factor de riesgo asociado a la ocurrencia de accidentes de tránsito.

*Lo que NO explica este resultado:* Este resultado no explica a qué factores se debe que las furgonetas tengan la mayor frecuencia promedio, tales como si es por el kilometraje, el uso comercial, las características de los conductores, etc.

*Implicación para el siguiente paso:* La variable "categoria" creada a partir de la variable "Type_risk" del data set original, se considerará como un posible factor explicativo en el análisis de la frecuencia de los siniestros, acompañada de otras variables que también influyan en la frecuencia de los siniestros, en caso de ser identificadas.

  