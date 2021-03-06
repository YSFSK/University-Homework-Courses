#chargement de party
library(party)
#chargement des bases de donn�es int�gr�es
library(datasets)
# cr�ation de l'arbre
tree = ctree(Species ~ .,data = iris)
##description des r�sultats
print(tree)
#visualisation de l'arbre
plot(tree)
#comparaison de la classification aux valeurs r�elles
table(predict(tree),iris$Species)

#chargement de randomForest
library(randomForest)
#chargement des bases de donn�es int�gr�es
library(datasets)
#fixation du facteur al�atoire
set.seed(123)
#partage de donn�e en tranning set 67% et testing set 33%
iris2=sample(2,nrow(iris),replace=T,prob = c(2/3,1/3))
#la variable training contient les lignes d'entrainement
training=iris[iris2==1,]
#la variable test contient les ligne de test
test=iris[iris2==2,]
#ex�cution de randomForce avec 500 arbres
rf=randomForest(Species ~ .,data = training,ntree=500,proximity=T)
#descriptipon de r�sultat
print(rf)
#visualisation du marge d'erreur en fonction du nombre d'arbre
plot(rf)
#table des variables importantes
importance(rf)
#visualisation du degr� d'importance des variables
varImpPlot(rf)
#la phase de test du modele
pred=predict(rf,newdata = test)
#comparaison de la classification au valeur r�elles
table(pred,test$Species)
