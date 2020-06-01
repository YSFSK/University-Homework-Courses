shapiro.test(rnorm(100, mean = 5, sd = 3)) #H0 ne suit pas la loi normale.
#p-value > 0.05 : échantillion qui suit la loi normale(rejeté)
shapiro.test(runif(100, min = 2, max = 4)) #accepté ne suit pas la loi normale
#si p-value <0.01 la variable ne suit pas la loi normale.
vec <- c(2.4, 2.5, 3.1, 1.9, 3.5); 
#
vec1=c(2,1,3)
t.test(vec, mu = 2)
t.test(vec1, mu = 2)
#Remarque : Le test de Student est utilisé aussi pour tester si 2 échantillons gaussiens ont des moyennes différentes.
A <- c(79.98,80.04,80.02,80.04,80.03,80.03,80.04,79.97,80.05,80.03,80.02, 80.00,80.02)
B <- c(80.02,79.94,79.98,79.97,79.97,80.03,79.95,79.97)
t.test(A,B) 

#Exercice1:
c(5,5)*1000
V=c(850,740,900,1070,930,850,950,980,980,880,1000,980,930,1050,960,810,1000,1000,960,960)+299000 
V
shapiro.test(V)#pvalue > 0.05 donc c'est normalsié.
t.test(V,mu=299.990)#<0.05 donc on rejette qu'il sont différent donc 
#ils sont assez proches.
#H0 mu=m0 ou m0=m1(si 2 vecteurs) si p-v <0.05 on rejette légalité si non on accepte légalité et
#les moyenne sont égales
mean(V)
#Exercice2:
andro=c(3.22,3.07,3.17,2.91,3.40,3.58,3.23,3.11,3.62)

