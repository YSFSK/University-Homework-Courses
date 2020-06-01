db = read.table("SIDA.csv", header=T, sep=",", dec=".")
db
dim(db)
str(db)
niveau
db = read.table("SIDA.csv", header=T, sep=",", dec=".", na.string="")
#attach(db) on peut utiliser les variables du base en tant que var console (sans $)
attach(db)
niveau
rm(list = ls())
#5.1
db[,2]
db$sexe
#5.2
db[3,]
#5.3
db[3,2]
db$sexe[3]
#Modalitées
levels(db$sexe)
levels(db$niveau)
db$age[5]
db$age[5]=20
as.factor(db$departement)
str(db)
db$departement=as.factor(db$departement)
str(db)
mean(db$age, na.rm=TRUE)
db$niveau
db$niveau = ordered(db$niveau, levels=c("L1","L2","L3","M1","M2"))
str(db)
#Tri décroissant
tab_1 = db[order(db$niveau, decreasing=TRUE),]

