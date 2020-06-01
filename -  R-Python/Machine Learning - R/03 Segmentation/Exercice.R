#Frommages
f = read.table(file.choose(), header=T, sep="\t", dec=".", na.string="")
f
summary(f)

f0=f[,2:9]
km1=kmeans(f0,6)
km1
table(f,km1$cluster)

#Cars in Tunisia
c = read.table(file.choose(), header=T, sep="\t", dec=".", na.string="")
c
summary(c)
#rownames
c0=c[,1:5]
km2=kmeans(c0,3)
km2
table(c0,km2$cluster)

#Les voitures similaires au europeannes, il faut diviser en 2
#Pour trouver le cluster qui combienne EUR/JAP par exemple 
#USA diff voiture de luxe 

c0=c[,1:5]
km2=kmeans(c0,2)
km2
table(c$origin,km2$cluster)

#Centrage et réduction
c1=scale(c0, center=TRUE, scale=TRUE)
km3=kmeans(c1,2)
km3
table(c$origin,km3$cluster)


redwine = read.table(file.choose(), header=T, sep=";", dec=".", na.string="")
redwine
pairs(redwine)
summary(redwine)
rw1 = redwine[,1:11]
summary(rw1)
rw1=scale(rw1, center=TRUE, scale=TRUE)
summary(redwine$quality)
km1=kmeans(rw1,6)
km1
table(redwine$quality,km1$cluster)
table(redwine$residual.sugar,km1$cluster)
table(redwine$residual.sugar,redwine$quality)
?pairs