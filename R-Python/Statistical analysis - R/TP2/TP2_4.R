#Rcommander() package professionel pour importer des bases
db=read.table(file.choose(),header=TRUE,sep=",", dec=",")
head(db)
tail(db)
str(db)
colnames(db)
rownames(db)
tab=db[order(db$BWT),] #Tri par rapport à BWT
head(tab)
tail(tab)
tab_2=db[which((db$RACE==1|db$RACE==2)&(db$SMOKE==1)),]
#OR
tab_2=db[which((db$RACE!=3)&(db$SMOKE==1)),]
tab_2
