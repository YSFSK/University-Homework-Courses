data<-read.csv("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Analyse Factorielle\\the.csv",header=T , sep=";",dec=".") 
summary(data)
str(data)
data[,"âge"]<-as.factor(data[,"âge"])
for(i in 1:ncol(data)){
  par(ask=TRUE) #Permet de voir graphe le 1 par 1
  plot(data[,i])
}
res.mca<-MCA(data,quanti.sup=22,quali.sup=c(19:21,23:36))
res.mca$eig
barplot(sort(res.mca$eig[1]))
library("ade4")
library("ggplot2")
library("factoextra")
fviz_eig(res.mca)

#On remarque une décroissance légère dans le graphes das val propres il peut être intéressant
#d'interpréter les autres axes après l'interprétation du 1er plan

#Le 1er plan représente 18% de l'information

#Q5.1
plot(res.mca, choix="ind")
plot(res.mca, invisible=c("var","quali.sup"),cex=0.7)
#On a pas de forme ni groupe particuliers

#Q5.3
res.mca$ind$coord
res.mca$ind$coord[200,]
res.mca$ind$coord[262,]

#Ils sont opposé par rapport au 1er axe

#Les indiv 265 et 273 sont proche sur le plan factoriel car ils ont beaucoup de modalité en commun 
#Des amateurs de thé des buveurs réguliers
#Les indiv 200 et 262 sont proche sur le plan factoriel car ils ont beaucoup de modalité en commun
#Les indiv 200 et 262 sont des buveurs irrégulier ils boivent du thé à la maison occasionnellement
#Ces 2 couples sont éloignés l'un de l'autre (opposés par le 1er axe) car ils ont très peu
#de modalité en commun

#Q6.1
plot(res.mca, invisible=c("ind","quali.supp"),cex=0.7)
#Le 1er axe oppose les buveurs réguliers au buveurs ocassionnels
#On a plusieurs pas dans le côté négatif
#On confirmé l'hypothèse déjà cité

#Le 2eme axe oppose un profil vieux à un profil jeune
#On peut dire que les vieux achete thé haute gamme dans magazin spécialisé
#Les jeunes ont plutôt tandances à acheter des marques inconnus par dans des magazins spécialiséq