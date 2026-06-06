***Nivel descriptivo***

*Nombre del hallazgo/resultado:* La distribución Poisson es inadecuada para modelar la frecuencia anual de siniestros debido a sobredispersión y exceso de ceros

*Resumen en una oración:* La Poisson predice 67.4% de ceros, pero los datos presentan 81.4%.

*Método o análisis que lo produjo:* Se calculó el índice de sobredispersión como la razón varianza/media sobre N_claims_year directamente desde los datos, obteniendo un valor de 3.09. La proporción de ceros esperada bajo Poisson se obtuvo aplicando la fórmula analítica $P(X = 0) = e^{-λ}$ con $λ = 0.39$ (la media observada de N_claims_year), lo que da 67.39 %. Ambos valores se compararon visualmente con la proporción observada de ceros (81.39 %), calculada como $mean(N_claims_year == 0) * 100$, mediante un gráfico de barras construido con ggplot2.

*Evidencia:* Figura 2 ("Comparación entre ceros observados y esperados"), Tabla 9 ("Estadísticos descriptivos de frecuencia y severidad") e índice de sobredispersión = 3.09 reportado en la sección 1.2.5.1, ambos de la bitácora 3.

***Nivel analítico***

*Conexión con la pregunta de investigación:* Este resultado es fundamental para la pregunta de investigación porque descarta un modelo de referencia clásico para la frecuencia de siniestros. Si la Poisson asumiera correctamente el comportamiento de N_claims_year, bastaría con un GLM estándar. Al fallar, se confirma que la estructura de los datos con exceso de ceros y sobredispersión, exige modelos más flexibles, como la binomial negativa o modelos con inflación de ceros, lo que orienta directamente la etapa de modelación formal.

*Contraste con la literatura:* Este resultado coincide plenamente con lo planteado por Počuča et al. (2020) en su ficha literaria, quienes advierten que los modelos tradicionales son insuficientes cuando los datos de seguros presentan distintas fuentes de heterogeneidad y exceso de ceros. La diferencia de 14 puntos porcentuales entre los ceros observados y los esperados bajo Poisson es, precisamente, la evidencia empírica que motiva el uso de modelos con inflación de ceros que los autores proponen.

*Comparación explícita entre lo obtenido y lo esperado según la literatura:* La literatura revisada, en particular Počuča et al. (2020) y Frees (2021), anticipaba que la distribución de Poisson podría ser un punto de partida razonable para modelar frecuencias de siniestros, pero advertía que los datos reales suelen presentar sobredispersión. El resultado obtenido confirma esta advertencia de manera contundente: el índice de sobredispersión de 3.09 indica que la varianza triplica a la media, y la brecha de 14 puntos porcentuales en la proporción de ceros hace que el modelo Poisson sea directamente inviable, no solo impreciso. Esta discrepancia no sorprende dado que los datos de seguros de automóviles incluyen asegurados muy heterogéneos, ya que algunos nunca tienen accidentes, otros los tienen frecuentemente, lo cual genera naturalmente un exceso de ceros que la Poisson no puede capturar con un único parámetro λ. La implicación es que cualquier análisis de frecuencia debe partir de modelos que separen la probabilidad de no tener ningún siniestro de la distribución de los siniestros cuando sí ocurren.

*Lo que NO explica este resultado:* Este resultado descarta la Poisson, pero no determina cuál distribución alternativa es la más adecuada. No permite distinguir entre una binomial negativa, una Poisson inflada de ceros o un modelo hurdle. Tampoco identifica qué variables explicativas generan la sobredispersión observada.

*Implicación para el siguiente paso:* Se debe explorar modelos alternativos para la frecuencia que contemplen sobredispersión y exceso de ceros, como lo son las cuatro etapas metodológicas que se han desarrollado a lo largo de esta bitácora.