***Nivel descriptivo***

*Titular:* *Más del 85 % de asegurados no reportó siniestros en el año*

*Nombre del hallazgo/resultado:* Exceso de ceros en las variables de frecuencia y severidad anual

*Resumen en una oración:* La gran mayoría de los registros anuales presenta cero siniestros y costo nulo.

*Método o análisis que lo produjo:* Este hallazgo se obtuvo mediante estadísticos descriptivos calculados con la función stat.desc() del paquete pastecs, complementados con tablas resumen por tipo de vehículo y zona. Se observó que la mediana de N_claims_year y Cost_claims_year es igual a cero, mientras que sus medias son mayores a cero, lo que evidencia una distribución fuertemente asimétrica.

*Evidencia:* La Tabla 6 de la segunda bitácora muestra que la mediana de N_claims_year es 0 frente a una media de 0.39, y que la mediana de Cost_claims_year es 0 frente a una media de 153.56. Esto implica que al menos el 50 % de los registros son cero, mientras que unos pocos valores positivos elevan la media, lo que evidencia una alta concentración de ceros. Adicionalmente, la Tabla 4 de la segunda bitácora refuerza este patrón al mostrar que la mayoría de observaciones presentan ausencia de siniestros independientemente del tipo de vehículo.

***Nivel analítico***

*Conexión con la pregunta de investigación:* La pregunta de investigación busca identificar los factores que influyen en la frecuencia y severidad de los siniestros. Este hallazgo es fundamental porque establece que ambas variables presentan un exceso de ceros, lo que condiciona la forma en que deben modelarse y evita el uso de enfoques que asuman distribuciones estándar sin este comportamiento.

*Contraste con la literatura:* Este resultado es consistente con lo planteado por Melgar Hiraldo &Guerrero Casas (2005), quienes documentan una alta concentración de ceros en datos de frecuencia de seguros y argumentan que parte de estos no responde a ausencia de riesgo, sino a la no declaración de siniestros pequeños. Asimismo, coincide con Ayuso-Gutiérrez et al. (2015), quienes evidencian que distribuciones clásicas como la Poisson no logran capturar adecuadamente este tipo de datos, especialmente en presencia de exceso de ceros.

*Lo que NO explica este resultado:* Este hallazgo no permite diferenciar si los ceros observados corresponden a asegurados que no experimentaron siniestros o a aquellos que decidieron no reportarlos. Tampoco permite identificar los factores que explican esta acumulación de ceros, por lo que no es suficiente para definir por sí solo el modelo adecuado.

*Implicación para el siguiente paso:* En próximos avances deberá compararse la proporción de ceros observada en N_claims_year y Cost_claims_year contra la proporción que distribuciones estándar como la Poisson o la binomial negativa esperarían generar con los mismos parámetros. Si los datos tienen más ceros de los que esas distribuciones predicen, entonces un modelo estándar los va a ajustar mal y será necesario usar modelos inflados de ceros, como el ZINB para frecuencia o la Poisson-inversa gaussiana cero inflada para severidad, tal como proponen Melgar Hiraldo & Guerrero Casas (2005) y Ayuso-Gutiérrez et al. (2015) respectivamente. Si el exceso no se confirma, un GLM convencional podría ser suficiente.