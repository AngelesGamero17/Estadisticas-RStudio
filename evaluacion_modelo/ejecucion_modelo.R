datos <- read.csv(file = 'evaluacion_modelo.csv',sep = ',', header = TRUE)
#escalar los datos
evaluacion_modelo.scale <- as.data.frame(scale(datos[,3:4]))
#normalizar las puntuaciones
evaluacion_modelo <- scale(evaluacion_modelo.scale)
head(evaluacion_modelo.scale)
names(evaluacion_modelo.scale)

#calculamos los dos clusters

k2 <- kmeans(evaluacion_modelo.scale, centers = 2, nstart = 25)
k2
str(k2)

#plotear los cluster
fviz_cluster(k2, data = evaluacion_modelo.scale)
fviz_cluster(k2, 
             data = evaluacion_modelo.scale,
             ellipse.type = "euclid",
             repel = TRUE,
             star.plot = TRUE)

fviz_cluster(k2,
             data = evaluacion_modelo.scale,
             ellipse.type = "norm")
fviz_cluster(k2,
             data = evaluacion_modelo.scale,
             ellipse.type = "norm",
             palette = "Set2",
             ggtheme = theme_minimal())

res2 <- hcut(evaluacion_modelo.scale, k=6, stand = TRUE)
fviz_dend(res2,
          rect = TRUE,
          cex = 0.5,
          k_colors = c("purple","green","black","red","gray","pink"))
