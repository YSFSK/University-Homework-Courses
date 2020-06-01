data.train 1158,201
data.test 1000,201

target => objectie(positive ou negative)

Appliquer une méthode sur data.train
data.train=read.csv(file.choose(),sep=",",dec=".")
data.test=read.csv(file.choose(),sep=",",dec=".")
summary(data.train)
summary(data.test)
dim(data.train)
dim(data.test)
summary(data.train[0,])
model = lm(objective ~., data = data.train[-0,])
faux

Table de contigence(table) Calculer le taux de classification
	    postive negative
postive       . 
negative              .

Table de comparaison par models

appliquer plusieurs model
etude comparaisoon methodes dans le cours. accurag
precison
recallf1score
courbes roc 
