**Ficha 6: convergencia del tercer cuartil en €882 entre grupos**

***Nivel descriptivo***

*Titular:* El umbral de €900 emerge como límite natural en múltiples grupos

*Nombre del hallazgo/resultado:* El tercer cuartil del costo positivo de siniestros es exactamente €882.00 en todos los grupos analizados, independientemente del tipo de vehículo, zona de circulación o tipo de combustible.

*Resumen en una oración:* El Q3 del costo positivo converge en €882.00 para todos los grupos categóricos analizados.

*Método o análisis que lo produjo:* Se calcularon estadísticos descriptivos del costo anual de siniestros positivos (Costo > €0) desagregados por las variables categóricas *Type_risk* (tipo de vehículo), *Area* (zona de circulación) y *Type_fuel* (tipo de combustible), utilizando `group_by()` y `summarise()` de R. Los resultados se presentaron en tablas resumen con los indicadores de frecuencia y severidad por grupo.

*Evidencia:* Tabla 11 (resumen por tipo de vehículo: Q3 = €882.00 para Furgoneta y Turismo), Tabla 12 (resumen por zona: Q3 = €882.00 para Rural y Urbana) y Tabla 13 (resumen por tipo de combustible: Q3 = €882.00 para Gasolina y Diésel).

***Nivel analítico***

*Conexión con la pregunta de investigación:* Este hallazgo conecta directamente con el segundo componente de la pregunta de investigación, que busca explicar el aumento abrupto de reclamos cuando el costo supera los €900. El hecho de que el 75 % de los siniestros con costo positivo se concentre por debajo de €882 en todos los grupos estudiados sugiere que el umbral de €900 no es arbitrario, sino que corresponde a un punto de corte estructural de la distribución del costo, independiente de las características del asegurado o del vehículo. Esto refuerza la pertinencia metodológica de usar €900 como separador entre el componente de costos medios y el de costos altos en el modelo de distribución mixta.

*Contraste con la literatura:* Este resultado es consistente con lo planteado por Marambakuyana y Shongwe (2024) en su ficha literaria, quienes señalan que los modelos compuestos dividen la distribución en dos partes: una para reclamos pequeños o moderados y otra para reclamos grandes. Esta división reconoce implícitamente la existencia de un punto de separación natural entre distintos regímenes de severidad. La convergencia del Q3 en €882 en todos los grupos sugiere que ese punto de separación constituye una propiedad de la distribución global del costo y no un efecto particular de algún subgrupo específico, lo cual fortalece la justificación del umbral como criterio de segmentación.

*Comparación explícita entre lo obtenido y lo esperado según la literatura:* La literatura revisada, en particular Marambakuyana y Shongwe (2024) y el planteamiento general de los modelos de distribución mixta, anticipaba que los datos de seguros presentan regímenes diferenciados de severidad, pero no especificaba que el punto de transición entre regímenes sería tan consistente entre subgrupos. Lo obtenido va más allá de lo esperado. No solo se confirma la existencia de un umbral de severidad, sino que este umbral se manifiesta de forma casi idéntica (Q3 ≈ €882) en los distintos tipos de vehículo, en ambas zonas de circulación y en ambos tipos de combustible. Este comportamiento no era predecible a partir de la literatura, ya que sería razonable esperar que grupos con perfiles de riesgo distintos, como furgonetas y motocicletas, o zonas urbanas y rurales, presentaran cuartiles superiores diferentes. La coincidencia observada sugiere que el umbral de €900 podría estar relacionado con alguna característica institucional del mercado asegurador, como franquicias, límites de cobertura o criterios administrativos. Aunque esta interpretación no puede confirmarse con los datos disponibles, constituye una hipótesis interesante para investigaciones futuras.

*Lo que NO explica este resultado:* Este resultado no explica por qué el tercer cuartil converge específicamente en €882 y no en otro valor cercano al umbral. Tampoco permite determinar si esta convergencia responde a una característica intrínseca de los datos, a una convención del mercado asegurador español o a algún aspecto del proceso de recolección de información. Además, no aporta evidencia sobre la distribución de los costos que exceden dicho umbral ni sobre las variables que podrían estar asociadas con la pertenencia al componente de costos altos.

*Implicación para el siguiente paso:* La consistencia del Q3 en €882 entre todos los grupos refuerza la decisión de utilizar €900 como umbral de segmentación en el modelo de distribución mixta. Además, sugiere que este umbral puede incorporarse como variable de análisis para comparar grupos, evaluando si la proporción de registros que supera los €900 difiere significativamente entre categorías. Este análisis ya se realizó parcialmente para el tipo de vehículo en la Figura 20 y podría extenderse a la zona de circulación y al tipo de combustible.
