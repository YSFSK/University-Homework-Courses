base?
iris
head(iris)
tail(iris)
colnames(iris)
str(iris$Species) #Factor variable qualitative
levels(iris$Species)
#S'il y avait des NA na.fail retour erreur
na.fail(iris) 
vect=c(1,2,3,NA)
na.fail(vect)
