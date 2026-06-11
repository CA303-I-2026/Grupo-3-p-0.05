***Nivel descriptivo***

*Titular:* *La variable de la frecuencia de los reclamos no satisface la hipótesis de normalidad, de manera que se opta por el coeficiente de Spearman*

*Nombre del hallazgo/resultado:* la frecuencia de los reclamos no satisface la hipótesis de normalidad requerida en el coeficiente de Pearson, por lo que se recurre al coeficiente de Spearman para calcular las correlaciones entre las variables cuantitativas.

*Resumen en una oración:* tras aplicar la prueba de Shapiro-Wilk sobre una muestra de 5,000 valores de la variable *N_claims_year*; se obtuvo un estadístico W = 0.37226 y un p-valor \< 2.2e-16. Dado que el p-valor es menor a 0.05, se rechaza la hipótesis de normalidad, por lo que se descarta el coeficiente de Pearson y se utiliza Spearman para el análisis de correlación. Se eligió Spearman sobre Kendall porque con muestras grandes, como la de este proyecto, ambos coeficientes tienden a producir conclusiones similares, pero Spearman es computacionalmente más eficiente y es el más utilizado en la literatura de seguros para este tipo de análisis exploratorio.

*Método o análisis que lo produjo:* en la sección *Análisis de asociación entre las variables cuantitativas*, se desarrolló la prueba de Shapiro-Wilk sobre una muestra de 5,000 valores de la variable *N_claims_year.* El resultado detallado está contenido en la sección mencionada al inicio.

*Evidencia:* la evidencia que respalda el hallazgo, corresponde a la primera salida de código que se sitúa en la sección *Análisis de asociación entre las variables cuantitativas.*

***Nivel analítico***

*Conexión con la pregunta de investigación:* el elemento central del proyecto consiste en estudiar la intervención de las variables de la edad del asegurado, la antigüedad con la aseguradora, el
historial de siniestros y las características del vehículo, tanto en la frecuencia como en la seve
ridad de los siniestros, de forma que se busca determinar la naturaleza de la relación que existe entre las variables descritas. Para realizarlo, se calcula el coeficiente de correlación, sin embargo, es preciso seleccionar la metodología correcta de acuerdo a las características de los datos. En vista de lo anterior, el presente hallazgo cobra una gran importancia.

*Contraste con la literatura:* Vinuesa (2016) en el documento titulado *Correlación: teoría y práctica,* menciona que con tal de desarrollar pruebas de significancia bajo el coeficiente de Pearson, las variables deben estar normalmente distribuidas. Cuando el supuesto anterior no se satisface, explica que existen opciones alternativas, como el coeficiente de Spearman y el coeficiente de Kendall.

*Lo que NO explica este resultado:* si bien ya se determinó la metodología a aplicar,aún no se ha cubierto aquello que busca responder la pregunta de investigación: la relación que existe entre estas variables.

*Implicación para el siguiente paso:* calcular el coeficiente de correlación de Spearman de las variables cuantitativas contempladas, respecto a la frecuencia y la severidad de los siniestros.
