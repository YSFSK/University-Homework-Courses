library("FactoMineR")
t<-read.csv(file=file.choose(),row.names = 1,header=T , sep=";",dec=".") 
summary(t)
names(t)
res=PCA(t,ind.sup =  9:18,quanti.sup = 27:30)
res
res$eig
plot(res)
plot.PCA(res)

#Pour obtenir une typologie des classes d'�ge fond� sur leur d�panse,
#on d�finie la distance sur unqiuement sur la base de leur d�pense dans diff�rentes rebriques
#ainsi les autre rebrqieu qui corespand � des tuto sont consid�res comme �tant des variables 
#suppl�mentaires.

res=PCA(t,ind.sup =  8:18,quanti.sup = 27:30)
res
plot(res)
plot.PCA(res)

#Les 2 premiers axes exprimment environe 80% de l'inertie totale en d'autre 93% de la variablit� 
#totale du nuage d'indiv ou des var et repr�sent� par le premier plan factoriel.

barplot(res$eig[,1])
#7-a
plot(res,choix="ind",invisible="ind.sup")
plot.PCA(res,choix="ind",invisible="ind.sup")


#7-b
#Le premier axe oppse le tanche d'age extreme au tranche moyenne
#Le deuxi�me axe range les tanches d'�ge de la plus haute � la plus basse

#7-c
res$ind
res$ind$contrib
sort(round(res$ind$contrib[,2],2))
sort(round(res$ind$cos2[,1]+res$ind$cos2[,2],3))
res$ind$coord
#L'individu qui a contribu� le plus est la classe d'�ge moins de 25 ans

#8-a
plot.PCA(res,choix="var",invisible="quanti.sup")

#8-b
#Toutes les variables sont corr�l�s positivement avec le premier axe sauf Gaz et Eau

plot.PCA(res,choix="var",invisible="quanti.sup")

#8-c
res$var
sort(round(res$ind$contrib[,1],2))
sort(round(res$ind$contrib[,1]+res$ind$contrib[,2],2))

#8-d
sort(round(res$var$cos2[,1]+res$var$cos2[,2],3))

#8-e
#Les trois var ne sont pas corr�l�es (Logement Eau Gaz perpandiculaire � Restaurant)
round(cor(t[,c(1,4,17)]),2)

#8-f
#Il y a une correlation

#8-g
plot.PCA(res,choix="var",invisible="var")
plot.PCA(res,choix="var")
#9-
res$quanti.sup
res$quanti.sup$cor

#Les 1er axe de variablit�: � droite ceux qui consomment beaucoup de produits alimentaires
#et � gauche ceux qui consomment peu de produits alimentaires

plot.PCA(res,choix="ind",invisible="ind")
#Affiche les indivs supplimentaires

#Le 1er axe oppose les tranches d'�ge qui d�paanse beaucoup avec ceux qui con peu
#en plus de d�taul cette 1ere composant principale est sur tout li�rs au d�pance
#alime ce qui est bien r�sum� par la forte corrlation de la var supp total aliment avec 
#le 1er axe (0.99)
#Rappelons aussi que la 1er comp princ est la combinaon line de l'ens des var
#qui la synth�tise le mieux

#Le 2�me axe oppose principlement les d�panse de fruits, huile, poissons et sant� avec
#logement Ea gaz �lect, tabat, communication, restauration

#Cet axe s�pare les classes d'�ge qui d�pensent peu 
#Les moins de 25 ans consome plus en consommation et tabat
#Les personnes �g� pr�sent un profile de d�pense oppos�

plot.PCA(res,choix="ind", axes=2:3)
plot.PCA(res,choix="var", axes=2:3)

#L'axe 3 est essentiellment li� � la variable enseignement et � moins degr�e 
#la variable autrepodalimentaire il oppose prin les tranche d'�ge
#25 � 34 au tranch moins de 25 et 45 � 54 qui d�pense plus tranches 
#en enseignement(�tudiant et leurs parents)









