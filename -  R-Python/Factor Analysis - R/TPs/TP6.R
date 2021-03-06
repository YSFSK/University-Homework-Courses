data<-read.csv("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Analyse Factorielle\\the.csv",header=T , sep=";",dec=".") 
summary(data)
str(data)
data[,"�ge"]<-as.factor(data[,"�ge"])
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

#On remarque une d�croissance l�g�re dans le graphes das val propres il peut �tre int�ressant
#d'interpr�ter les autres axes apr�s l'interpr�tation du 1er plan

#Le 1er plan repr�sente 18% de l'information

#Q5.1
plot(res.mca, choix="ind")
plot(res.mca, invisible=c("var","quali.sup"),cex=0.7)
#On a pas de forme ni groupe particuliers

#Q5.3
res.mca$ind$coord
res.mca$ind$coord[200,]
res.mca$ind$coord[262,]

#Ils sont oppos� par rapport au 1er axe

#Les indiv 265 et 273 sont proche sur le plan factoriel car ils ont beaucoup de modalit� en commun 
#Des amateurs de th� des buveurs r�guliers
#Les indiv 200 et 262 sont proche sur le plan factoriel car ils ont beaucoup de modalit� en commun
#Les indiv 200 et 262 sont des buveurs irr�gulier ils boivent du th� � la maison occasionnellement
#Ces 2 couples sont �loign�s l'un de l'autre (oppos�s par le 1er axe) car ils ont tr�s peu
#de modalit� en commun

#Q6.1
plot(res.mca, invisible=c("ind","quali.supp"),cex=0.7)
#Le 1er axe oppose les buveurs r�guliers au buveurs ocassionnels
#On a plusieurs pas dans le c�t� n�gatif
#On confirm� l'hypoth�se d�j� cit�

#Le 2eme axe oppose un profil vieux � un profil jeune
#On peut dire que les vieux achete th� haute gamme dans magazin sp�cialis�
#Les jeunes ont plut�t tandances � acheter des marques inconnus par dans des magazins sp�cialis�q