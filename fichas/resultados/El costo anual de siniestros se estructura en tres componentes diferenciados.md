***Nivel descriptivo***

*Titular:* *El costo anual de siniestros se estructura en tres componentes diferenciados*

*Nombre del hallazgo/resultado:* El costo anual de siniestros puede representarse mediante una distribución mixta compuesta por una masa en cero, un componente de costos medios y un componente de costos altos.

*Resumen en una oración:* El 81.388 % de los registros corresponde a costos nulos, el 15.017 % a costos medios en el intervalo $0 < Y < 900$ y el 3.595 % a costos altos con $Y \geq 900$.

*Método o análisis que lo produjo:* Para obtener este resultado, se clasificó la variable `Cost_claims_year` en tres grupos: costos iguales a cero, costos positivos menores a 900 euros y costos mayores o iguales a 900 euros. Luego, se calcularon las proporciones observadas de cada grupo y se ajustaron distribuciones paramétricas a los componentes positivos mediante el paquete `fitdistrplus` de R. A partir de este procedimiento, se construyó una distribución mixta con una masa puntual en cero y dos componentes Lognormales.

*Evidencia:* El hallazgo se respalda en la **Tabla 14: Proporciones de los componentes de la distribución mixta** y en la **Tabla 15: Parámetros del modelo de distribución mixta para el costo anual de siniestros**. La Tabla 14 muestra que los costos nulos representan el 81.388 %, los costos medios el 15.017 % y los costos altos el 3.595 %. La Tabla 15 resume la estructura final del modelo, con una masa puntual para $Y = 0$ y dos componentes Lognormales: uno para $0 < Y < 900$ y otro para $Y \geq 900$.

***Nivel analítico***

*Conexión con la pregunta de investigación:* Este hallazgo se relaciona directamente con la pregunta de investigación porque permite estudiar el incremento abrupto de reclamos al superar el monto de 900 euros. En lugar de tratar el umbral como una simple variable indicadora, el modelo de distribución mixta permite interpretar el costo anual de siniestros como una variable compuesta por distintos comportamientos: ausencia de costo, costos moderados y costos de alta severidad. Esto ayuda a comprender por qué los reclamos no siguen una distribución única y por qué el umbral de 900 euros funciona como una separación relevante dentro de la severidad.

*Contraste con la literatura:* Este resultado coincide con lo planteado por Frees (2021) y Omari et al. (2018), quienes señalan que la frecuencia y la severidad de los siniestros deben analizarse con cuidado debido a su comportamiento estadístico particular. Además, se relaciona con lo planteado por Marambakuyana y Shongwe (2024), quienes explican que los modelos compuestos o de mezcla son útiles cuando los datos de reclamos presentan colas pesadas, heterogeneidad y distintos regímenes de severidad. En este caso, la mezcla permite representar simultáneamente la alta concentración de ceros y la presencia de costos positivos de distinta magnitud.

*Lo que NO explica este resultado:* Este resultado no permite identificar por sí solo cuáles variables del asegurado o del vehículo explican que un registro pertenezca al componente de costos altos. Tampoco demuestra causalidad ni determina si el umbral de 900 euros se debe a una característica del mercado asegurador, a criterios administrativos o a la propia estructura de los datos. El modelo describe la forma de la distribución, pero no explica completamente las razones detrás de cada componente.

*Implicación para el siguiente paso:* Este hallazgo permite utilizar la distribución mixta como base para interpretar la severidad anual de los siniestros. Además, sugiere que los análisis posteriores deberían estudiar qué variables se asocian con la pertenencia al grupo de costos altos, especialmente el tipo de vehículo, el historial de reclamos, la zona de circulación y el tipo de combustible.

