#Q1
#Q2
#Q3
#Q4
#Voir cours

#Q5
data<-read.csv("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Analyse Factorielle\\femme_travail.csv",row.names = 1,header=T , sep=";",dec=".") 
summary(data)
dim(data)
data[,1]/1724
#Q6
View(data)
#Q7
#H0: les 2 var sont indépandantes
#H0: les 2 var ne sont pas indépandantes
#p<5% on rejète H0 (calcule d'écart)
resultat<-chisq.test(data[,1:3])
resultat
#Q8
resultat$expected
round(resultat$expected,2)

library("FactoMineR")
res.ca=CA(data[,1:3])
res.ca

#Q10
#ACP varience expliqué
#Ici le 1er axe représnet 86.29% de liaison entre les 2 variables
#il représente la quasi-totalité de l'écart entre ce qui est observé et ce qui théorique

res.ca$eig
plot(res.ca$eig)
barplot(res.ca$eig)
#L'origine du plan factoriel est confondu avec le profil moyen (baricentre) de chaqun
#des 2 nuages

plot.CA(res.ca, invisible="row")

#Le 1er axe repésente l'attitude envers le travail finminaine 
#il range les modalités de la seconde variable depuis la plus défavorable jusqu'au plus favorable 

#Q13
res.ca$col

#Q14
plot.CA(res.ca,invisible="col")

plot.CA(res.ca)
#Origine du plan factoriel : plan moyen

#Q16
#En AFC l'inertie tot rep l'intensité de la liaison entre les2 var que l'on croise
#pour obtenir le tableau de containgence, il ya une  grande diiffére avec l'ACP
#dont l'intertie total représente la variablité des individu ou variables

#On peut normer cet axe atitude à l'égard fiminine
#On peut illustrer ces disposistions en référant au profile ligne

#Q17
#Rester au foyer et de côté seul le marie trabail, modalité avec laquel elle s'associe 
#beaucoup et à l'opposé des autres modatlis avec lesquelles elle s'associe peu
#Ainsi lorsqu'un profile ligne i a une coordonées positif il s'associe globalement
#Plus que dans le modèle d'indépandance au modalité j ayant une modalité positive
#moins que dans le modèle d'indépandance au modalité j ayant une modalité négative

#Q18
res.ca1=CA(data,col.sup=4:ncol(data))
#Les modalité exprimant l'accord avec l'opinoion
#Les femmes au foyé se sont coupées du monde se trouve du côté des attitude défavorable 
#à l'égard du travail fémin et inversement

#Les points extrêmes sont plus intenses car ils sont distants du profile moyen
#qui est au mileu du map

#Q1
data('JO')
View(JO)
summary(JO)
str(JO)
dim(JO)

#Q2
#C'est un tableau de contingence
#Les individus sont les médailles et pays et les pays et la spécialité

#Q3
#La problematique associ a se tableau consiste a etudier la laision entre les 2 var epreuve et pays
#Cad la qiuestion qui se pose peutant considere que tout les pays on le même profile athletique
#ou au contraire certain pays sont ils plutôt performant dans cetraines épreuves

#Q4
res.ca=CA(JO)


res.ca$eig
barplot(res.ca$eig[,1])
#Par de cassure, on observe le pourcentage

#Q6
res.ca$col$contrib
plot.CA(res.ca,invisible="col")
#Le premier axe sépare les épreuves de courses d'endurance par rapport autre les épreuves 
#Toutes les épreuves sont triés dans la pratie négative du 1er axe de la plus longue 
#à la plus courte sans aucune exception

#Q7 (lignes pas colonnes)
plot.CA(res.ca,invisible="row")
#Les pays qui ont des coor negative sur le premier axe sont les pays qui gangee de nombreuse médail
#dans le s épreuve d'endurance parmi lesquelle on trouve des pays africain tel que Kenya

#Les deuxième axe sépare les épreuves de force (disque, marteau) et les épreuves de marche

#Pour voir mieux car le graphe n'est pas clair
res.ca$col$coor

#Pour les épreuves de force les pays de l'europe de l'est sont plus performants
sort(round(res.ca$col$contrib[,1],2))
#Ethiopie, Maroc, Kenya et USA sont les pays ont contribué de façon significative
#dans la 1er dimensions et ont gagner plus de 

#Les USA ont fortement dans la contribtions de l'axe 2 ceci exprime le nombre de médailles gangés.

sort(round(res.ca$col$contrib[,1],2))
plot.CA(res.ca,invisible="row",axes)
#Les axes 3 et 4 séparent à nouveau les épreuves de lancer et les épreuves de marche



sort(round(res.ca$col$contrib[,2],2))
plot.CA(res.ca,invisible="row",axes = 3:4)
## le javelot est une epreuve de lance different des epreuves du marteau e t du disque
## les pays nordique(norvege, chequie ,chisqoslovaquie ,finand) sont plus performant
## les axes 3 et 4 separe a nouveau les epreuve de lancer des epreuve de marche(20km et 50 km)


#Les grandes tandances qui se dégage des données les ép d'endurance sont dominé par les
#afriquain etles épr assez différentes