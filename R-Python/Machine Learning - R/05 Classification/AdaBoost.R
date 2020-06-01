install.packages("adabag")
library(adabag)
#fi file hatha mawjouda colonne mta3 yes no li yia y 
adadata<-read.csv('C:/Users/Wael Dhouib/Downloads/ML Libs/bank-full.csv',header=TRUE,sep=";")


testa_final= adadata[1,] 
testa_final
adadata=adadat[-1,]

#coefleanr: une methode de Breiman pour calculer le poids. mfinak: nbr d'iteration
adaboost<-boosting(y~age+job+marital+education+default+balance+ housing+loan+contact+day+month+duration+campaign+pdays+previous+poutcome, data=adadata, mfinal=20,coeflearn='Breiman')

#  
adaboost$trees
#Pour chaque itération, on observe le poids qui augmente 
adaboost$weights

#importance renvoie l'importance relative de chaque variable dans la tâche de classification. Ce
#mesure est le nombre de fois que chaque variable est sélectionnée pour être divisée.
adaboost$importance
#Chaque iteration, nous obsersons le taux d'erreur et qui diminue à chaque fois vu à chaque iteration, nous tenons compte des autres taux d'erreur des précedents modèles afin de pourvoir diminuer 
#ce taux d'erruer
errorevol(adaboost,adadata)
#Nous allons voir ici les predictions à partir des observations
a=predict(adaboost,adadata)
a
#Nous avons choisie de simuler l arbre de la dernière iteration ou notre classification est assez fort grace à l'amélioration qui s'"est produite au cours des iterations
t1<-adaboost$trees[[19]]
t1
library(tree)
#simuler notre arbre de prediction
plot(t1)
#pour ajouter  les labels au noeuds avec pretty= 0 vous permet d'afficher les modalités des variables qualitatives (level)
text(t1,pretty=0)

# exemple de prediction
b=predict(adaboost,testa_final)
b

