#ACM
#Tracer la typologie des indiv
#Liaison entre les vars qualitatives
#Les variables qui se repoussent ou s'attirent

#ACM il faut que les toutes les var soient qualitatives

#On analyse des donn�es issues des enqu�tes

#Q1
credit<-read.csv("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Analyse Factorielle\\Credit.csv",header=T , sep=";",dec=".") 
#Q2
str(credit)

#On doit convertir la var age en qualitative par l'aura besoin
credit[,"Age"]<-as.factor(credit[,"Age"])

#Les modalit�s rarent peuvent biaiser les sorties de l'ACM
#1er solution Regroupement naturel: On peut ajouter ces modalit�s � d'autre modalit�s
#2�me solution Ventilation : level.ventil=0.05 dans la fonction MCA ventile les modalit�s rares 
#3�me solution Suppression

#Q3
for(i in 1:ncol(credit)){
  par(ask=TRUE) #Permet de voir graphe le 1 par 1
    plot(credit[,i])
}
levels()
library("FactoMineR")
#Un seul indiv prent la modalit� Sidecar de la var Mache
#On r�alise un regroupement naturel de Sidecar avec Moto
levels(credit[,"Marche"])[5]<-"Moto"

#Q4
res.acm=MCA(credit,quali.sup=6:11,level.ventil=0)
#Le param level.ventil est par d�fault nul, si cet arg vaut 0.05 cela signifie 
#que la modalit� d'effectif inferieure ou �gale � 5% du total
#d'indiv sont ventil� de fa�on automatique par la fonction MCA

barplot(res.acm$eig[,1])
#La d�croissant des val propres est r�guliaires nous observant pas de cassures
#ou d�crochage flagrant donc il devient difficle de choisir les dimensions

res.acm$eig
#Les 2 premiers axe explique 28% de l'inertie totale autrement dit 28% de informations
#des donn�es est r�sum� par les 2 premiers dimensions

#Q6
plot(res.acm, invisible=c("var","quali.sup"))
#Ce graphe d'indiv d'apprecier l'allure g�n�rale de nuage de points
#pour voir s'il existe un groupe d'indiv particulier
#Ici ce n'est pas le cas

plot(res.acm, invisible=c("var","quali.sup"),habillage="Marche")

#On observe la typologie en faisant un habillage

#Le graphe des indiv montre que les 2 premiers axes factoriels expriment 28% d'inertie
#comme dans la plus part des traitements de data d'enqu�te les nuages des indiv comportet=nt
#on cherche uniquement � voir si ce d�gage une typologie remarquable
#Or ce n'est pas le cas ici, pour aider � l'interpreation il pourrait �tre int�ressant
#de colorier les individus en fonction de certaines variables.

#Q7
plot(res.acm, invisible="ind")

#Le premier axe oppose un profil jeune � droite � un profil vieux � gauche
#On retrouve ainsi les person plus �g� propri�taire contract� des cr�dits pour 
#de oppos�s � des personnes plus jeunes qui ont achet�s des scouters... 
#Les jeunes ont tandances � avoir un taux d'endaitement plus �lev�

#Le deuxi�me axe oppose principlement ceux qui ont des difficul� finac�re au bas au autre en haut
#On retrouve en bas imp_3ou+ et qui sont souscrit � l'assurance AID+Chommage

#Q8
plot(res.acm, choix="var")

res.acm$var$contrib
#La variable march� est la var qui a contrib� la plus � la dim 1
#La variable impay� est la var qui a contrib� la plus � la dim 2

#Q9
res.acm$var$eta2
#La commande correspond au rapport de correlation de la composante principale 
#(corrdonn�es des indiv sur la dimension) et chaque variable qualitative

#Q10
dimdesc(res.acm)

#Q11

plot(res.acm, invisible=c("var","quali.sup"), axes=3:4)
#On r�p�te les m�mes commandes avec axes 3:4 et on fait des interpr�taions
