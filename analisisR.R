# Instalación del paquete tidyverse (si no está ya instalado)
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

# Cargar librerías necesarias
library(tidyverse)

# Cargar el dataset desde el archivo CSV
data <- read.csv("D:/Desacargas2/datos-abiertos-intervenciones-2023-para-publicar.csv", encoding = "latin1", sep = ";")

# Mostrar las primeras filas del dataset
head(data)

# Inspeccionar la estructura del dataset
str(data)

# Generar estadísticas descriptivas del dataset
summary(data)

# Eliminar filas duplicadas
data <- data %>% distinct()

# Manejar valores nulos eliminando filas con NA
data_clean <- na.omit(data)

# Verificar el tipo de dato de EDAD_HECHO
str(data_clean$EDAD_HECHO)

# Convertir EDAD_HECHO a texto para inspección
data_clean$EDAD_HECHO <- as.character(data_clean$EDAD_HECHO)

# Identificar y filtrar valores no numéricos
data_clean <- data_clean %>%
  filter(!is.na(as.numeric(gsub(",", ".", EDAD_HECHO))))

# Convertir EDAD_HECHO a numérico
data_clean$EDAD_HECHO <- as.numeric(gsub(",", ".", data_clean$EDAD_HECHO))

# Verificar los primeros valores después de la conversión
head(data_clean$EDAD_HECHO)

# Contar el número de NAs en la columna EDAD_HECHO
sum(is.na(data_clean$EDAD_HECHO))

# Eliminar filas con valores NA resultantes de la conversión
data_clean <- na.omit(data_clean)

# Verificar y manejar valores faltantes en FECHA_INTERV y EDAD_HECHO
data_clean <- data_clean %>%
  filter(!is.na(FECHA_INTERV) & !is.na(EDAD_HECHO))

#####################HISTOGRAMA############################################

# Crear el histograma de la columna EDAD_HECHO
histograma <- ggplot(data_clean, aes(x = EDAD_HECHO)) + 
  geom_histogram(binwidth = 5, fill = "blue", color = "black") + 
  labs(title = "Distribución de Edades en el Momento del Hecho", x = "Edad", y = "Frecuencia")

# Guardar el histograma
ggsave("D:/Desacargas2/distribucion_edades.png", plot = histograma)

####################DISPERSION##############################################
dispercion <- ggplot(data_clean, aes(x = EDAD_HECHO, y = CANT_ITV_ANTERIORES)) + 
  geom_point(color = "red") + 
  labs(title = "Relación entre Edad y Cantidad de Intervenciones Anteriores", 
       x = "Edad en el Momento del Hecho", 
       y = "Cantidad de Intervenciones") +  # Ajuste en el título del eje Y
  theme(
    axis.title.x = element_text(size = 12),  # Ajustar tamaño del título del eje X
    axis.title.y = element_text(size = 12),  # Ajustar tamaño del título del eje Y
    plot.title = element_text(size = 14, face = "bold"),  # Ajustar tamaño del título del gráfico
    plot.margin = margin(1, 1, 1, 1, "cm"),  # Ajustar márgenes del gráfico
    panel.grid.major = element_line(color = "gray", size = 0.5)  # Ajustar la cuadrícula mayor
  )

# Guardar el gráfico de dispersión
ggsave("D:/Desacargas2/relacion_edad_intervenciones.png", plot = dispercion, width = 10, height = 8, dpi = 300)


###########################################################################

# Convertir la columna NACIONALIDAD a factor y ordenarla por frecuencia
data_clean$NACIONALIDAD <- as.factor(data_clean$NACIONALIDAD)
data_clean$NACIONALIDAD <- factor(data_clean$NACIONALIDAD, 
                                  levels = names(sort(table(data_clean$NACIONALIDAD), decreasing = TRUE)))

######################################BARRAS###############################

# Crear el gráfico de barras con ajustes para mejorar la legibilidad
barras_nacionalidad <- ggplot(data_clean, aes(x = NACIONALIDAD)) + 
  geom_bar(fill = "green", color = "black") + 
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 8),  # Ajustar el tamaño de los textos del eje x
    axis.text.y = element_text(size = 10),                        # Ajustar el tamaño de los textos del eje y
    axis.title.x = element_text(size = 12),                        # Ajustar el tamaño del título del eje x
    axis.title.y = element_text(size = 12),                        # Ajustar el tamaño del título del eje y
    plot.title = element_text(size = 14, face = "bold"),           # Ajustar el tamaño del título del gráfico
    plot.margin = margin(1, 1, 2, 1, "cm"),                        # Ajustar los márgenes del gráfico
    panel.grid.major.y = element_line(color = "gray", size = 0.5),  # Ajustar la cuadrícula mayor en el eje y
    panel.grid.minor.y = element_blank(),                           # Eliminar cuadrícula menor en el eje y
    panel.background = element_blank(),                             # Eliminar fondo del panel
    plot.background = element_rect(fill = "white")                  # Fondo blanco para el gráfico
  ) +
  labs(title = "Cantidad de Intervenciones por Nacionalidad", 
       x = "Nacionalidad", 
       y = "Frecuencia") +
  coord_flip() + # Cambiar orientación para mejor lectura
  theme(plot.title = element_text(hjust = 0.5))  # Centrar el título del gráfico

# Guardar el gráfico de barras
ggsave("D:/Desacargas2/intervenciones_por_nacionalidad.png", plot = barras_nacionalidad, width = 10, height = 8, dpi = 300)


