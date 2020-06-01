bout=as.data.frame(de(""))
bout
#Ajout les var de la base au console R
attach(bout)
mean(Tr1)
#fix donne la main pour la modification de la base
fix(bout)
#Les moyennes des colonnes quantitatifs
colMeans(bout)
#write.table extraire la base dans un fichier texe
write.table(bout,"boutton.txt",sep="\t")
