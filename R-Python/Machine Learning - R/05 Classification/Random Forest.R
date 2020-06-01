#chargement de party
library(party)
#chargement des bases de données intégrées
library(datasets)
# création de l'arbre
tree = ctree(Species ~ .,data = iris)
##description des résultats
print(tree)
#visualisation de l'arbre
plot(tree)
#comparaison de la classification aux valeurs réelles
table(predict(tree),iris$Species)

#chargement de randomForest
library(randomForest)
#chargement des bases de données intégrées
library(datasets)
#fixation du facteur aléatoire
set.seed(123)
#partage de donnée en tranning set 67% et testing set 33%
iris2=sample(2,nrow(iris),replace=T,prob = c(2/3,1/3))
#la variable training contient les lignes d'entrainement
training=iris[iris2==1,]
#la variable test contient les ligne de test
test=iris[iris2==2,]
#exécution de randomForce avec 500 arbres
rf=randomForest(Species ~ .,data = training,ntree=500,proximity=T)
#descriptipon de résultat
print(rf)
#visualisation du marge d'erreur en fonction du nombre d'arbre
plot(rf)
#table des variables importantes
importance(rf)
#visualisation du degré d'importance des variables
varImpPlot(rf)
#la phase de test du modele
pred=predict(rf,newdata = test)
#comparaison de la classification au valeur réelles
table(pred,test$Species)
