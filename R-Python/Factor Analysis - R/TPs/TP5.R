#ACM
#Tracer la typologie des indiv
#Liaison entre les vars qualitatives
#Les variables qui se repoussent ou s'attirent

#ACM il faut que les toutes les var soient qualitatives

#On analyse des données issues des enquêtes

#Q1
credit<-read.csv("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Analyse Factorielle\\Credit.csv",header=T , sep=";",dec=".") 
#Q2
str(credit)

#On doit convertir la var age en qualitative par l'aura besoin
credit[,"Age"]<-as.factor(credit[,"Age"])

#Les modalités rarent peuvent biaiser les sorties de l'ACM
#1er solution Regroupement naturel: On peut ajouter ces modalités à d'autre modalités
#2ème solution Ventilation : level.ventil=0.05 dans la fonction MCA ventile les modalités rares 
#3ème solution Suppression

#Q3
for(i in 1:ncol(credit)){
  par(ask=TRUE) #Permet de voir graphe le 1 par 1
    plot(credit[,i])
}
levels()
library("FactoMineR")
#Un seul indiv prent la modalité Sidecar de la var Mache
#On réalise un regroupement naturel de Sidecar avec Moto
levels(credit[,"Marche"])[5]<-"Moto"

#Q4
res.acm=MCA(credit,quali.sup=6:11,level.ventil=0)
#Le param level.ventil est par défault nul, si cet arg vaut 0.05 cela signifie 
#que la modalité d'effectif inferieure ou égale à 5% du total
#d'indiv sont ventilé de façon automatique par la fonction MCA

barplot(res.acm$eig[,1])
#La décroissant des val propres est réguliaires nous observant pas de cassures
#ou décrochage flagrant donc il devient difficle de choisir les dimensions

res.acm$eig
#Les 2 premiers axe explique 28% de l'inertie totale autrement dit 28% de informations
#des données est résumé par les 2 premiers dimensions

#Q6
plot(res.acm, invisible=c("var","quali.sup"))
#Ce graphe d'indiv d'apprecier l'allure générale de nuage de points
#pour voir s'il existe un groupe d'indiv particulier
#Ici ce n'est pas le cas

plot(res.acm, invisible=c("var","quali.sup"),habillage="Marche")

#On observe la typologie en faisant un habillage

#Le graphe des indiv montre que les 2 premiers axes factoriels expriment 28% d'inertie
#comme dans la plus part des traitements de data d'enquête les nuages des indiv comportet=nt
#on cherche uniquement à voir si ce dégage une typologie remarquable
#Or ce n'est pas le cas ici, pour aider à l'interpreation il pourrait être intéressant
#de colorier les individus en fonction de certaines variables.

#Q7
plot(res.acm, invisible="ind")

#Le premier axe oppose un profil jeune à droite à un profil vieux à gauche
#On retrouve ainsi les person plus âgé propriétaire contracté des crédits pour 
#de opposés à des personnes plus jeunes qui ont achetés des scouters... 
#Les jeunes ont tandances à avoir un taux d'endaitement plus élevé

#Le deuxième axe oppose principlement ceux qui ont des difficulé finacère au bas au autre en haut
#On retrouve en bas imp_3ou+ et qui sont souscrit à l'assurance AID+Chommage

#Q8
plot(res.acm, choix="var")

res.acm$var$contrib
#La variable marché est la var qui a contribé la plus à la dim 1
#La variable impayé est la var qui a contribé la plus à la dim 2

#Q9
res.acm$var$eta2
#La commande correspond au rapport de correlation de la composante principale 
#(corrdonnées des indiv sur la dimension) et chaque variable qualitative

#Q10
dimdesc(res.acm)

#Q11

plot(res.acm, invisible=c("var","quali.sup"), axes=3:4)
#On répéte les mêmes commandes avec axes 3:4 et on fait des interprétaions
