data = read.table(file.choose(),header=TRUE,sep=",",dec=".",na.string="NaN")
summary(data)
str(data$sexe)
str(data$niveau)
str(data$frereEtSoeur)
effsexe=table(data$sexe)
effsexe
effniveau=table(data$niveau)
effniveau
efffrereEtSoeur=table(data$frereEtSoeur)
efffrereEtSoeur
efftaille=table(data$taille)
efftaille
#Mode
which.max(effsexe)
which.max(effniveau)
efffrereEtSoeur=sort(efffrereEtSoeur, decreasing=T)
mode=names(efffrereEtSoeur[1])
mode
efftaille=sort(efftaille, decreasing=T)
mode=names(efftaille[1])
mode
median(data$taille,na.rm=T)
vect=na.omit(data$taille)
install.packages(BioStatR)
cvar(vect)
boxplot(data$taille)
#On observe que c'est un distribution symétrique homogène
range(data$taille,na.rm=T)
classe=hist(data$taille, breaks=seq(1.60,1.85,0.05),plot=F)
names(classe)
classe$breaks
classe$counts
length(classe$breaks)
length(classe$counts)
ind=which.max(classe$counts)
ind
classemod=paste(classe$breaks[ind],classe$breaks[ind+1],sep="-")
classemod
classe=hist(data$taille, breaks=seq(1.60,1.85,0.05))
mean(data$age,na.rm=T)
var(data$age,na.rm=T)
sd(data$age,na.rm=T)
quantile(data$age,na.rm=T)
barplot(table(data$age))
#Proche de la loi normale
plot(data$age)
#Homogène (valeurs proches non dispersées)avec une valeur aberrante
#Symétrique : la médiane divise le box en 2 parties sym (boxplot 2 partie egales)
barplot(table(data$UFR))
pie(table(data$UFR))