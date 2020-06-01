data1=chickwts
summary(data1)
data1
?tapply
tapply(data1$weight,data1$feed,summary)
plot(data1$weight ~ data1$feed, data=data1)
model1<-lm(data1$weight ~ data1$feed)
summary(model1)
#Intercept modalité de référence
#On compare par rapport l'Intercept
#-y= beta zero +(-163.383)*horsebean+(-104.833)linseed+...+epsilon
#Test d'hypothèse
shapiro.test(residuals(model1))
#p-value H0 rejeté sanchant elle est vraie 
#p-value érreur de première espece
#p-value = 0.6272 > 0.05
#On accepte H0 
#Test d'homoscédicité' (homogénité des variances)
#H0: les variances sont égales (homogènes) 
#H1: il existe au moins 2 variances différentes 

bartlett.test(weight ~ feed, data=data1)
#p-value>0.05 on accepte H0 
anova(model1)
#Pr(>F) = 5.936e-10 << 0.05 
#On rejete l'H0 on voit ainsi un effet très marqué du type de nourriture
#sur la masse des poulets
#Effet de la var quli sur la var quanti

#Application 2 :
table1=as.data.frame(de(''))
table1
#traitement / duree de sicatrisation
duree <-stack(table1)$value
trait <-stack(table1)$ind
duree
trait
tapply(duree,trait, summary)
plot(duree ~ trait, data=table1)
mon_anova=aov(duree ~ trait)
summary(mon_anova)
#0.0136<0.05 on rejète
#On a un effet de var quali
#Savoir qu'elles sont les moyennes différentes
TukeyHSD(mon_anova)
#Si les p adj / p values sont < 5% les var sont significativement diffs 
#C'est le cas pour Tr1-Tr3
plot(TukeyHSD(mon_anova))
#Tout les intervalles contient 0 sauf Tr1-Tr3
#On choisit le Tr3 car il possède le délai de sicatrisation le + rapide 
#Même chose pour Application 3 