pbinom(54,100,0.5)-pbinom(45,100,0.5)
#ou
sum(dbinom(46:54,100,0.5))
1-ppois(4,2.7)
1-pnorm(1.96)
#ou (par défaut 0,1 comme params)
1-pnorm(1.96,0,1)
qnorm(0.975)
qt(0.01,5)
rpois(100,2.7)
rnorm(100)
hist(rnorm(10000))
plot(rnorm(10000))
barplot(rnorm(10000))
rchisq(100,2)
rbinom(100,100,0.5)
plot(0:5,dbinom(0:5,5,0.2),type="h",ylab="P(X=x)")
curve(dnorm(x,5,1.5),0.5,9.5,ylab="f(x)")
plot(stepfun(0:15,c(0,pbinom(0:15,15,0.6))))
curve(pnorm(x,10,2),5,15)
sim=rnorm(1000)
hist(sim,probability=TRUE)
curve(dnorm(x),add=TRUE,col="red")
x=1:7
sample(x,4)
?sample
x=1:3
sample(x,prob=c(0.5,0.25,0.25))
simul1=rpois(1000,2)
summary(simul1)
plot(0:50,dbinom(0:50,50,0.4),type="h")
curve(dnorm(x,20,sqrt(12)),from=10,to=30,add=TRUE)
par(mfrow=c(1,3))
#ou bien
layout(1:3)
curve(dnorm(x,0,1),from=-3,to=3)
curve(dt(x,2),from=-3,to=3,add=T,col="red")

curve(dnorm(x,0,1),from=-3,to=3)
curve(dt(x,10),from=-3,to=3,add=T,col="red")

curve(dnorm(x,0,1),from=-3,to=3)
curve(dt(x,30),from=-3,to=3,add=T,col="red")

#On observe une convergance lorsque la degré de liberté > 30

sim=rpois(1000,2)
var(sim)
sim
mean(sim)
effect=table(sim)
effect
freq=effect/1000
barplot(effect)
barplot(freq)
points(dpois(0:9,2),col="red",type="h")

par(mfrow=c(2,2))
sim1=rpois(1000,5)
hist(sim1,probability=T)
curve(dnorm(x,5,sqrt(5)),add=T)
sim2=rpois(1000,20)
hist(sim2,probability=T)
curve(dnorm(x,20,sqrt(20)),add=T)
sim3=rpois(1000,50)
hist(sim3,probability=T)
curve(dnorm(x,50,sqrt(50)),add=T)
sim4=rpois(1000,100)
hist(sim4,probability=T)
curve(dnorm(x,100,sqrt(100)),add=T)
