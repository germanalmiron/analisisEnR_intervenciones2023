# analisis_En_R_intervenciones2023_STJ
Este proyecto analiza un dataset de "intervenciones realizadas en 2023" disponible en la plataforma de datos abiertos del Ministerio de Justicia y Derechos Humanos de la Nación Argentina, accesible en datos.jus.gob.ar con la herramienta R.

=>Limpieza y Preprocesamiento:

#1: Eliminación de duplicados: Se eliminaron filas duplicadas.
#2: Manejo de valores nulos: Se eliminaron filas con valores nulos en columnas clave.
#3: Conversión de tipos de datos: EDAD_HECHO se transformó a numérico, eliminando valores no numéricos.
#4: Validación: Se aseguraron columnas sin valores nulos en FECHA_INTERV y EDAD_HECHO.

Visualizaciones Generadas:

a) Histograma de Edades (distribucion_edades.png)

b) Gráfico de Dispersión (relacion_edad_intervenciones.png):

c) Gráfico de Barras por Nacionalidad (intervenciones_por_nacionalidad.png):

