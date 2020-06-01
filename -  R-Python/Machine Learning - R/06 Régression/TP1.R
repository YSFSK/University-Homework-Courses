data = read.csv("C:\\Users\\Wael Dhouib\\Documents\\4DS2\\Machine Learning\\06 Régression\\consommation-autos.csv",sep="\t",dec=".", header=T, na.string = "")
summary(data)
dim(data)
model = lm(conso ~., data = data[,2:6])
model
summary(model)
plot(model)
