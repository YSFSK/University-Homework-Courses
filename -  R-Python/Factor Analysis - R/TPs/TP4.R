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
#H0: les 2 var sont ind�pandantes
#H0: les 2 var ne sont pas ind�pandantes
#p<5% on rej�te H0 (calcule d'�cart)
resultat<-chisq.test(data[,1:3])
resultat
#Q8
resultat$expected
round(resultat$expected,2)

library("FactoMineR")
res.ca=CA(data[,1:3])
res.ca

#Q10
#ACP varience expliqu�
#Ici le 1er axe repr�snet 86.29% de liaison entre les 2 variables
#il repr�sente la quasi-totalit� de l'�cart entre ce qui est observ� et ce qui th�orique

res.ca$eig
plot(res.ca$eig)
barplot(res.ca$eig)
#L'origine du plan factoriel est confondu avec le profil moyen (baricentre) de chaqun
#des 2 nuages

plot.CA(res.ca, invisible="row")

#Le 1er axe rep�sente l'attitude envers le travail finminaine 
#il range les modalit�s de la seconde variable depuis la plus d�favorable jusqu'au plus favorable 

#Q13
res.ca$col

#Q14
plot.CA(res.ca,invisible="col")

plot.CA(res.ca)
#Origine du plan factoriel : plan moyen

#Q16
#En AFC l'inertie tot rep l'intensit� de la liaison entre les2 var que l'on croise
#pour obtenir le tableau de containgence, il ya une  grande diiff�re avec l'ACP
#dont l'intertie total repr�sente la variablit� des individu ou variables

#On peut normer cet axe atitude � l'�gard fiminine
#On peut illustrer ces disposistions en r�f�rant au profile ligne

#Q17
#Rester au foyer et de c�t� seul le marie trabail, modalit� avec laquel elle s'associe 
#beaucoup et � l'oppos� des autres modatlis avec lesquelles elle s'associe peu
#Ainsi lorsqu'un profile ligne i a une coordon�es positif il s'associe globalement
#Plus que dans le mod�le d'ind�pandance au modalit� j ayant une modalit� positive
#moins que dans le mod�le d'ind�pandance au modalit� j ayant une modalit� n�gative

#Q18
res.ca1=CA(data,col.sup=4:ncol(data))
#Les modalit� exprimant l'accord avec l'opinoion
#Les femmes au foy� se sont coup�es du monde se trouve du c�t� des attitude d�favorable 
#� l'�gard du travail f�min et inversement

#Les points extr�mes sont plus intenses car ils sont distants du profile moyen
#qui est au mileu du map

#Q1
data('JO')
View(JO)
summary(JO)
str(JO)
dim(JO)

#Q2
#C'est un tableau de contingence
#Les individus sont les m�dailles et pays et les pays et la sp�cialit�

#Q3
#La problematique associ a se tableau consiste a etudier la laision entre les 2 var epreuve et pays
#Cad la qiuestion qui se pose peutant considere que tout les pays on le m�me profile athletique
#ou au contraire certain pays sont ils plut�t performant dans cetraines �preuves

#Q4
res.ca=CA(JO)


res.ca$eig
barplot(res.ca$eig[,1])
#Par de cassure, on observe le pourcentage

#Q6
res.ca$col$contrib
plot.CA(res.ca,invisible="col")
#Le premier axe s�pare les �preuves de courses d'endurance par rapport autre les �preuves 
#Toutes les �preuves sont tri�s dans la pratie n�gative du 1er axe de la plus longue 
#� la plus courte sans aucune exception

#Q7 (lignes pas colonnes)
plot.CA(res.ca,invisible="row")
#Les pays qui ont des coor negative sur le premier axe sont les pays qui gangee de nombreuse m�dail
#dans le s �preuve d'endurance parmi lesquelle on trouve des pays africain tel que Kenya

#Les deuxi�me axe s�pare les �preuves de force (disque, marteau) et les �preuves de marche

#Pour voir mieux car le graphe n'est pas clair
res.ca$col$coor

#Pour les �preuves de force les pays de l'europe de l'est sont plus performants
sort(round(res.ca$col$contrib[,1],2))
#Ethiopie, Maroc, Kenya et USA sont les pays ont contribu� de fa�on significative
#dans la 1er dimensions et ont gagner plus de 

#Les USA ont fortement dans la contribtions de l'axe 2 ceci exprime le nombre de m�dailles gang�s.

sort(round(res.ca$col$contrib[,1],2))
plot.CA(res.ca,invisible="row",axes)
#Les axes 3 et 4 s�parent � nouveau les �preuves de lancer et les �preuves de marche



sort(round(res.ca$col$contrib[,2],2))
plot.CA(res.ca,invisible="row",axes = 3:4)
## le javelot est une epreuve de lance different des epreuves du marteau e t du disque
## les pays nordique(norvege, chequie ,chisqoslovaquie ,finand) sont plus performant
## les axes 3 et 4 separe a nouveau les epreuve de lancer des epreuve de marche(20km et 50 km)


#Les grandes tandances qui se d�gage des donn�es les �p d'endurance sont domin� par les
#afriquain etles �pr assez diff�rentes