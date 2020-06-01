arbres=c(1,2,4,1,6,3,2,1,2,0,1,2,2,1,3,0,3,2,1,2,2,3,2,3)
summary(arbres)
sort(arbres)
arbres
n=length(arbres)
n
unique(arbres)
effectif=table(arbres)
effectif
effcum=cumsum(effectif)
effcum
total=sum(arbres)
total
frequence=(effectif/n)*100
frequence
#Tableau d'effectif
plot(effectif)
par(mfrow=c(1,2))
#Tableau d'effectif cumulé
plot(effcum/n, type="l")
barplot(effectif)
mean(arbres)
summary(arbres)
boxplot(arbres)
#Si écart-type > moy/2 => série est dispersée
#Si écart-type < moy/2 => série est homogène
#Coef de variation
#CV=S/moy (moy x barre)
#Si CV>15% => série est disp
#Si CV<15% => série est homogène
#Variance
var(arbres)
#Ecart-type
sd(arbres)

poids=c(74,85,95,84,68,93,84,87,78,72,81,91,80,65,76,81,97,69,70,98)
hist(poids)
#Erreur interval non divisible par 7
hist(poids, breaks=seq(65,98,7))
#Changer la largeur des rectangles
hist(poids, breaks=seq(65,100,7))