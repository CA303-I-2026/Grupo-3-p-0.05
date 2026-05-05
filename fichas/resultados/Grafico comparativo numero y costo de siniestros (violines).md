
***Nivel descriptivo***

*Titular:* *Turismos lideran el costo anual de siniestros, furgonetas la frecuencia*

*Nombre del hallazgo/resultado:* Existen diferencias notables entre la frecuencia y severidad según el tipo de vehículo

*Resumen en una oración:* Turismos poseen mayor costo anual que otro tipo de vehículos, las furgonetas presentan mayor frecuencia de siniestros.

*Método o análisis que lo produjo:* Este análisis se produjo gracias a un gráfico realizado a través de los datos en el que se compara el número de siniestros según el tipo de vehículo y el costo de los siniestros por año según el vehículo. El gráfico se compone de dos gráficos de violín; para esto se utilizó la función geom_violin() y una escala logarítmica en base 10 en el eje Y para una mejor visualización.

*Evidencia:* El gráfico utilizado para este análisis corresponde a la figura 5 de la bitácora 2.

***Nivel analítico***

*Conexión con la pregunta de investigación:* A través de este hallazgo se puede evidenciar cierto patrón tanto en la frecuencia como en la severidad de los siniestros, uno de los componentes de la pregunta de investigación es qué factores influyen en la frecuencia y severidad de los siniestros; con este hallazgo se puede evidenciar que el tipo de vehículo influye en la frecuencia y severidad, donde los vehículos particulares (turismos) tienen mayor costo de siniestros por año, mientras que el tipo de vehículo de furgoneta posee mayor cantidad de siniestros por año

*Contraste con la literatura:* En contraste con las fichas de literatura, coincide con lo que proponen Fress (2021) y Omari et al. (2018) porque ambos trabajos plantean que se debe trabajar con la frecuencia y severidad por separado para así asignar distribuciones diferentes según el comportamiento de cada variable.

*Lo que NO explica este resultado:* Este hallazgo no responde a qué factores hacen que las furgonetas tengan mayor número de siniestros ni por qué los turismos poseen mayor costo anual que otro tipo de vehículos

*Implicación para el siguiente paso:* Este hallazgo permite incluir justificadamente al tipo de vehículo como una de las variables para modelos en la bitácora 3; además de utilizar distribuciones cero infladas para la frecuencia dada la concentración de ceros en la variable "N_claims_year" y para el costo de los siniestros por año se seguirá el enfoque de Omari et al. (2018) de evaluar empíricamente la distribución que ofrezca mejor ajuste.
