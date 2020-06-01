dataset = read.table("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Machine Learning\\06 Régression\\TP Régression Logistique\\pima.txt",sep="\t",dec=".",header=T)
library(tidyverse)
library(lattice)
library(caret)
library(ggplot2)
set.seed(123)
y_train = dataset$diabete %>% createDataPartition(p = 0.7, list = FALSE)
X_train  = dataset[y_train, ]
X_test = dataset[-y_train, ]
y_test= dataset[-y_train, 9]
model = glm(formula = diabete~. , family = "binomial", data = X_train)
y_pred = model %>% predict(X_test)
summary(y_pred)
y_pred1=c()
for(i in 1:length(y_pred)){
	y_pred1[i]=exp(y_pred[i]/(1-y_pred[i]))
}
summary(y_pred1)
y_pred1[y_pred1>0.7]=1
y_pred1[y_pred1<=0.7]=0
table(y_pred1,y_test)

install.packages("pROC")
library(pROC)
roc=plot.roc(Y,P,main="", percent=TRUE, ci=TRUE)
library(ROCK)
roc=prediction(y_pred1,y_test)

library(MASS)
reduit = stepAIC(model)
model = glm(formula = diabete~serum+pedigree+pregnant+bodymass+plasma , family = "binomial", data = X_train)
y_pred = model %>% predict(X_test)
summary(y_pred)
y_pred1=c()
for(i in 1:length(y_pred)){
	y_pred1[i]=exp(y_pred[i]/(1-y_pred[i]))
}
summary(y_pred1)
y_pred1[y_pred1>0.7]=1
y_pred1[y_pred1<=0.7]=0
table(y_pred1,y_test)

#Courbes ROC confondues donc AIC comme critère désicif

#Régression polytomique
dataset = read.table("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Machine Learning\\06 Régression\\TP Régression Logistique\\hypertension.txt",sep="\t",dec=".",header=T)
summary(dataset)
library(mnet) #Contient fonction de régression polytomique
y_train = dataset$niveau %>% createDataPartition(p = 0.7, list = FALSE)
X_train  = dataset[y_train, ]
X_test = dataset[-y_train, ]
y_test= dataset[-y_train, 2:10]
y_pred = multinom(niveau~.,data=train)
summary(y_pred)

reduit=stepAIC(y_pred)

install.packages("VGAM")
library(VGAM)
model=vglm()


model = glm(formula = niveau~. , family = "quasibinomial", data = X_train)

#Régression polytomique ordinale adjacent
#Régression polytomique ordinale cumulatives
polr

#Utiliser les probabilités cumulatives
