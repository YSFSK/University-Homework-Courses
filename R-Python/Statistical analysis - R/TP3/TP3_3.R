data = read.table(file.choose(),header=T,sep=" ",dec=".")
summary(data)
head(data)
tail(data)
dim(data)
length(data)
#3 variables 592 idiv
str(data)
levels(data$cheveux)
levels(data$yeux)
levels(data$sexe)
data$cheveux
data$yeux
data$sexe
#barplot ou piechart pour viz les var qualitatives
summary(data$cheveux)
summary(data$yeux)
summary(data$sexe)
frequency("Roux")
mode(data$cheveux)
yeuxcheveux=table(data$yeux,data$cheveux)
yeuxcheveux
chisq.test(yeuxcheveux)