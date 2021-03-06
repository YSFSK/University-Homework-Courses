data1=chickwts
summary(data1)
data1
?tapply
tapply(data1$weight,data1$feed,summary)
plot(data1$weight ~ data1$feed, data=data1)
model1<-lm(data1$weight ~ data1$feed)
summary(model1)
#Intercept modalit� de r�f�rence
#On compare par rapport l'Intercept
#-y= beta zero +(-163.383)*horsebean+(-104.833)linseed+...+epsilon
#Test d'hypoth�se
shapiro.test(residuals(model1))
#p-value H0 rejet� sanchant elle est vraie 
#p-value �rreur de premi�re espece
#p-value = 0.6272 > 0.05
#On accepte H0 
#Test d'homosc�dicit�' (homog�nit� des variances)
#H0: les variances sont �gales (homog�nes) 
#H1: il existe au moins 2 variances diff�rentes 

bartlett.test(weight ~ feed, data=data1)
#p-value>0.05 on accepte H0 
anova(model1)
#Pr(>F) = 5.936e-10 << 0.05 
#On rejete l'H0 on voit ainsi un effet tr�s marqu� du type de nourriture
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
#0.0136<0.05 on rej�te
#On a un effet de var quali
#Savoir qu'elles sont les moyennes diff�rentes
TukeyHSD(mon_anova)
#Si les p adj / p values sont < 5% les var sont significativement diffs 
#C'est le cas pour Tr1-Tr3
plot(TukeyHSD(mon_anova))
#Tout les intervalles contient 0 sauf Tr1-Tr3
#On choisit le Tr3 car il poss�de le d�lai de sicatrisation le + rapide 
#M�me chose pour Application 3 