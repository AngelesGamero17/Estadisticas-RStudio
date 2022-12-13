datos <- read.csv("ejecucion_modelo.csv", sep = ",", header = TRUE)
ejecucion_modelo.scale <- as.data.frame(scale(datos[,1:3]))

#normalizar las puntuaciones
ejecucion_modelo <- scale(ejecucion_modelo.scale)
head(ejecucion_modelo.scale)
names(ejecucion_modelo.scale)

#calcular distancias
m.distancia <- get_dist(ejecucion_modelo.scale,method = 'euclidean')
fviz_dist(m.distancia,
          gradient = list(low = "black",
                          mid = "white",
                          high = "red"))
#estimar el numero de cluster
fviz_nbclust(ejecucion_modelo.scale, kmeans, method = "wss")
fviz_nbclust(ejecucion_modelo.scale, kmeans, method = "silhouette")
fviz_nbclust(ejecucion_modelo.scale, kmeans, method = "gap_stat")

resnumclust <- NbClust(ejecucion_modelo.scale,
                       distance = "euclidean",
                       min.nc = 2,
                       max.nc = 10,
                       method = "kmeans",
                       index = "alllong")
fviz_nbclust(resnumclust)