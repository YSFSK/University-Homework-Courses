ccont = c(11,13,15.5,12,8,9,13,16)
ccont 
exam = c(8.5,7,16,9,7,13,14,17)
exam
moyenne = ccont*0.4+exam*0.6
moyenne
Note = data.frame(ccont,exam,moyenne)
Note
# Note tab à 2 dim l,c
# vect= Note$moyenne accéder à une variable
# Note[l,c]  accéder à une case
# vect = Note[,3] accéder à la 3ème col
Note_1 = Note[order(Note$moyenne),]
# Note_1 = Note[order(Note$moyenne, decreassing=T),] si ordre décroissant 
Note_1
a = Note[which(Note$moyenne>=10),]
a
nrow(a)
b = Note[which.max(Note$moy),]
b
c = Note[which.min(Note$moy),]
c
d = Note[which(Note$moyenne>15),]
d
nrow(d)
#Suppression ou affectation
tab = Note[,-3]
tab
tab_1 = Note[-c(1,2,3),]
tab_1
tab_2 = Note[-(1:3),]
tab_2
Note
?write.table
write.table(Note,"Validation.txt",sep=" ")
