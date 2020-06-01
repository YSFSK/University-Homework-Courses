dataset = read.table("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Machine Learning\\06 Régression\\Cancer du sein.csv",sep=",",dec=".",header=T)
library(tidyverse)
library(lattice)
library(caret)
library(ggplot2)
set.seed(123)
y_train = dataset$classe %>% createDataPartition(p = 0.7, list = FALSE)
X_train  = dataset[y_train, ]
X_test = dataset[-y_train, ]
y_test= dataset[-y_train, 10]
model = glm(formula = classe~bnuclei+normnucl, family = "binomial", data = X_train)
y_pred = model %>% predict(X_test)
summary(y_pred)
y_pred[y_pred>0.5]=1
y_pred[y_pred<=0.5]=0
table(y_pred,y_test)

y_train = iris$Species %>% createDataPartition(p = 0.7, list = FALSE)
X_train  = iris[y_train, ]
X_test = iris[-y_train, ]
y_test= iris[-y_train, 5]
model = glm(formula = Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width , family = "binomial", data = X_train)
y_pred = model %>% predict(X_test)
summary(y_pred)
y_pred[y_pred>=50]=2
y_pred[y_pred<=-50]=0
for(i in 1:length(y_pred)){
	if(y_pred[i]!=2){
		if(y_pred[i]!=0){
			y_pred[i]=1
		}
	}
}
table(y_pred,y_test)
y_test
y_pred

dataset = read.table("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Machine Learning\\02 Segmentation\\winequality\\winequality-red.csv",sep=";",dec=".",header=T)
set.seed(123)
y_train = dataset$quality %>% createDataPartition(p = 0.7, list = FALSE)
X_train  = dataset[y_train, ]
X_test = dataset[-y_train, ]
y_test= dataset[-y_train, 12]
model = glm(formula = quality~. , family = "poisson", data = X_train)
y_pred = model %>% predict(X_test)
summary(y_pred)
y_pred[y_pred>=50]=2
y_pred[y_pred<=-50]=0
for(i in 1:length(y_pred)){
	if(y_pred[i]!=2){
		if(y_pred[i]!=0){
			y_pred[i]=1
		}
	}
}
table(y_pred,y_test)
y_test
y_pred
