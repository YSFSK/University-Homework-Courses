library("FactoMineR")
t<-read.csv(file=file.choose(),row.names = 1,header=T , sep=";",dec=".") 
summary(t)
names(t)
res=PCA(t,ind.sup =  9:18,quanti.sup = 27:30)
res
res$eig
plot(res)
plot.PCA(res)

#Pour obtenir une typologie des classes d'âge fondé sur leur dépanse,
#on définie la distance sur unqiuement sur la base de leur dépense dans différentes rebriques
#ainsi les autre rebrqieu qui corespand à des tuto sont considéres comme étant des variables 
#supplémentaires.

res=PCA(t,ind.sup =  8:18,quanti.sup = 27:30)
res
plot(res)
plot.PCA(res)

#Les 2 premiers axes exprimment environe 80% de l'inertie totale en d'autre 93% de la variablité 
#totale du nuage d'indiv ou des var et représenté par le premier plan factoriel.

barplot(res$eig[,1])
#7-a
plot(res,choix="ind",invisible="ind.sup")
plot.PCA(res,choix="ind",invisible="ind.sup")


#7-b
#Le premier axe oppse le tanche d'age extreme au tranche moyenne
#Le deuxième axe range les tanches d'âge de la plus haute à la plus basse

#7-c
res$ind
res$ind$contrib
sort(round(res$ind$contrib[,2],2))
sort(round(res$ind$cos2[,1]+res$ind$cos2[,2],3))
res$ind$coord
#L'individu qui a contribué le plus est la classe d'âge moins de 25 ans

#8-a
plot.PCA(res,choix="var",invisible="quanti.sup")

#8-b
#Toutes les variables sont corrélés positivement avec le premier axe sauf Gaz et Eau

plot.PCA(res,choix="var",invisible="quanti.sup")

#8-c
res$var
sort(round(res$ind$contrib[,1],2))
sort(round(res$ind$contrib[,1]+res$ind$contrib[,2],2))

#8-d
sort(round(res$var$cos2[,1]+res$var$cos2[,2],3))

#8-e
#Les trois var ne sont pas corrélées (Logement Eau Gaz perpandiculaire à Restaurant)
round(cor(t[,c(1,4,17)]),2)

#8-f
#Il y a une correlation

#8-g
plot.PCA(res,choix="var",invisible="var")
plot.PCA(res,choix="var")
#9-
res$quanti.sup
res$quanti.sup$cor

#Les 1er axe de variablité: à droite ceux qui consomment beaucoup de produits alimentaires
#et à gauche ceux qui consomment peu de produits alimentaires

plot.PCA(res,choix="ind",invisible="ind")
#Affiche les indivs supplimentaires

#Le 1er axe oppose les tranches d'âge qui dépaanse beaucoup avec ceux qui con peu
#en plus de détaul cette 1ere composant principale est sur tout liérs au dépance
#alime ce qui est bien résumé par la forte corrlation de la var supp total aliment avec 
#le 1er axe (0.99)
#Rappelons aussi que la 1er comp princ est la combinaon line de l'ens des var
#qui la synthétise le mieux

#Le 2ème axe oppose principlement les dépanse de fruits, huile, poissons et santé avec
#logement Ea gaz élect, tabat, communication, restauration

#Cet axe sépare les classes d'âge qui dépensent peu 
#Les moins de 25 ans consome plus en consommation et tabat
#Les personnes âgé présent un profile de dépense opposé

plot.PCA(res,choix="ind", axes=2:3)
plot.PCA(res,choix="var", axes=2:3)

#L'axe 3 est essentiellment lié à la variable enseignement et à moins degrée 
#la variable autrepodalimentaire il oppose prin les tranche d'âge
#25 à 34 au tranch moins de 25 et 45 à 54 qui dépense plus tranches 
#en enseignement(étudiant et leurs parents)









