math=c(10,13,9,17,7,15,11)
phy=c(12,15,11,14,8,18,14)
plot(math,phy)
plot(math,phy,cex=2)
plot(math,phy,cex=2,pch=5)
plot(math,phy,cex=2,pch=5,col="red")
plot(math,phy,cex=2,pch=5,lwd=2,col="red")
plot(math,phy,cex=2,pch=5,lwd=2,col="red",xlim=c(0,20),ylim=c(0,20))
plot(math,phy,cex=2,pch=5,lwd=2,col="red",xlim=c(0,20),ylim=c(0,20),main="note",xlab="notemath",ylab="notephysique")
legend(0,15,"Math en fct de physique)