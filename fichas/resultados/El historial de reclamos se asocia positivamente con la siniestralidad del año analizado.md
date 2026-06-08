***Nivel descriptivo***

*Titular:* *El historial de reclamos se asocia positivamente con la siniestralidad del año analizado*

*Nombre del hallazgo/resultado:* La variable `N_claims_history` presenta las correlaciones más relevantes con las variables de siniestralidad anual.

*Resumen en una oración:* `N_claims_history` presenta una correlación positiva de $\rho = 0.38$ con `N_claims_year` y de $\rho = 0.36$ con `Cost_claims_year`.

*Método o análisis que lo produjo:* Se construyó una matriz de correlaciones de Spearman entre las variables numéricas del conjunto de datos, con el fin de identificar asociaciones entre las variables explicativas y las variables de frecuencia y severidad de los siniestros.

*Evidencia:* La matriz de correlaciones (figura 4 de la bitácora 3) muestra que `N_claims_history` tiene una correlación de 0.38 con `N_claims_year` y de 0.36 con `Cost_claims_year`.

***Nivel analítico***

*Conexión con la pregunta de investigación:* Este hallazgo se relaciona directamente con la pregunta de investigación, ya que permite identificar que el historial de reclamos del asegurado está asociado tanto con la frecuencia como con el costo anual de los siniestros.

*Contraste con la literatura:* En relación con lo planteado por Vinuesa (2016), este resultado muestra una aplicación práctica del análisis de correlación, ya que se utiliza para explorar la relación entre variables cuantitativas del proyecto. En particular, la correlación positiva entre `N_claims_history`, `N_claims_year` y `Cost_claims_year` permite identificar una asociación entre el historial de reclamos y la siniestralidad anual.

*Lo que NO explica este resultado:* La correlación no permite afirmar causalidad. Es decir, no se puede concluir que tener más reclamos históricos cause directamente más siniestros en el año analizado, sino solamente que ambas variables tienden a moverse en la misma dirección.

*Implicación para el siguiente paso:* La variable `N_claims_history` debe considerarse como una posible variable explicativa importante en los análisis posteriores, especialmente al estudiar la frecuencia de siniestros y los costos asociados.