iris
quanti=iris[,1:4]
quanti
gpe_kmeans=kmeans(quanti,3)
gpe_kmeans


?dist
d=dist(quanti,"euclidean")
d


?hclust
hc=hclust(d, method = "average")
hc
plot(hc)
gpe_cah=cutree(hc,3)
gpe_cah

table(iris$Species,gpe_kmeans$cluster)
table(iris$Species,gpe_cah)

