# Počuča et al. (2020)

***Nivel descriptivo***

*Título:* *Modeling Frequency and Severity of Claims with the Zero-Inflated Generalized Cluster-Weighted Models*

*Autores:* Nikola Počuča, Petar Jevtić, Paul D. McNicholas y Tatjana Miljkovic.

*Año:* 2020.

*Nombre del tema:* modelización conjunta de la frecuencia y severidad de reclamos de seguros mediante modelos generalizados ponderados por conglomerados con inflación de ceros.

*Clasificación:* Metodológica.

Se eligió esta etiqueta porque el artículo propone una extensión metodológica de los modelos *cluster-weighted models* para adaptarlos a datos de seguros. En particular, introduce los modelos generalizados ponderados por conglomerados y una versión cero inflada para trabajar con reclamos que presentan exceso de ceros.

*Resumen en una oración:* el artículo propone modelos cero inflados basados en conglomerados para analizar conjuntamente la frecuencia y la severidad de reclamos de seguros.

*Argumento central:* los autores sostienen que los modelos tradicionales pueden ser insuficientes para representar datos de seguros cuando existen distintas fuentes de heterogeneidad y exceso de ceros; por ello, proponen los modelos ZI-GCWM, los cuales permiten clasificar observaciones en grupos latentes y, al mismo tiempo, modelar la presencia de ceros en los reclamos.

*Problemas con el argumento o el tema:* una posible limitación es que la metodología es más compleja que modelos más tradicionales como GLM, modelos cero inflados simples o distribuciones compuestas. Esto puede dificultar su implementación e interpretación en un proyecto aplicado. Además, aunque el artículo trabaja con exceso de ceros, no se enfoca específicamente en una acumulación en un valor monetario distinto de cero, como el umbral de €900.

***Nivel analítico***

*Conexión con mi proyecto:* este artículo se relaciona directamente con el proyecto porque la variable `Cost_claims_year` presenta una gran cantidad de ceros, lo cual sugiere que no todos los asegurados generan reclamos durante el periodo observado. La propuesta de los autores es útil porque permite modelar datos de seguros con exceso de ceros y, además, considera la heterogeneidad entre grupos de pólizas o asegurados. Esto puede ser relevante para analizar si ciertos grupos de observaciones tienen mayor probabilidad de presentar reclamos positivos o costos más altos.

*Lo que NO dice el autor:* el artículo no se centra en explicar un salto abrupto en un umbral monetario específico como €900. Aunque el modelo cero inflado ayuda a tratar el exceso de ceros, no resuelve directamente el problema de una concentración adicional en otro valor puntual. Por eso, para el proyecto, esta fuente debería complementarse con una metodología que permita analizar masas puntuales o cambios estructurales alrededor del umbral de €900.

*Contraste con otra fuente:* en comparación con *Marambakuyana y Shongwe (2024)*, este artículo se enfoca más en el exceso de ceros y en la modelización conjunta de frecuencia y severidad, mientras que Marambakuyana y Shongwe se concentran en distribuciones compuestas y de mezcla para datos positivos con colas pesadas. Por otra parte, en contraste con *Ayuso-Gutiérrez et al. (2015)*, ambos artículos consideran datos con exceso de ceros, pero *Počuča et al. (2020)* incorpora una estructura de conglomerados latentes que permite capturar heterogeneidad entre grupos de asegurados.

*Evaluación de aplicabilidad (escala 1–5):* 4.5.

La metodología es altamente aplicable al proyecto porque trabaja directamente con reclamos de seguros y con exceso de ceros, dos elementos centrales de la variable `Cost_claims_year`. Sin embargo, no recibe 5 porque no aborda de forma específica la acumulación en el valor €900, por lo que habría que adaptar el enfoque o combinarlo con otro modelo.

*Pregunta que le haría al autor:* ¿Cómo podría adaptarse el modelo ZI-GCWM para incluir no solo inflación en cero, sino también una concentración adicional en un valor monetario específico como €900?

*Resumen argumentativo:* Lo que los autores intentan resolver es cómo modelar datos de seguros donde la frecuencia y la severidad de los reclamos no se comportan de manera homogénea para todos los asegurados. Para esto, extienden los modelos ponderados por conglomerados y proponen una versión cero inflada, llamada ZI-GCWM, que permite trabajar con datos donde existen muchos ceros provenientes de distintas fuentes. La idea central es que los datos pueden estar formados por grupos latentes con comportamientos diferentes, por lo que un único modelo global podría no capturar adecuadamente la relación entre las variables explicativas, la frecuencia de reclamos y la severidad. Para el proyecto, esta metodología es especialmente útil porque `Cost_claims_year` tiene una concentración importante en cero, lo cual puede interpretarse como ausencia de reclamos o ausencia de costo durante el periodo observado. Además, el enfoque por conglomerados puede ayudar a identificar grupos de observaciones con distintos patrones de riesgo. No obstante, como el proyecto también analiza el comportamiento alrededor del umbral de €900, sería necesario complementar este enfoque con una estrategia que permita estudiar ese punto específico de acumulación.