# analisisEnR_intervenciones2023
Este proyecto analiza un dataset de "intervenciones realizadas en 2023" disponible en la plataforma de datos abiertos del Ministerio de Justicia y Derechos Humanos de la Nación Argentina, accesible en datos.jus.gob.ar, enfocándose en tres columnas clave: EDAD_HECHO, FECHA_INTERV y NACIONALIDAD. El script completo está disponible en GitHub.

=>Limpieza y Preprocesamiento:

#Eliminación de duplicados: Se eliminaron filas duplicadas.
#Manejo de valores nulos: Se eliminaron filas con valores nulos en columnas clave.
#Conversión de tipos de datos: EDAD_HECHO se transformó a numérico, eliminando valores no numéricos.
#Validación: Se aseguraron columnas sin valores nulos en FECHA_INTERV y EDAD_HECHO.

Visualizaciones Generadas:

#Histograma de Edades (distribucion_edades.png)

#Gráfico de Dispersión (relacion_edad_intervenciones.png):

Gráfico de Barras por Nacionalidad (intervenciones_por_nacionalidad.png):

