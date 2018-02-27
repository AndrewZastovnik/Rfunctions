x<- c(7,8,9,10,15,16,17,18)
y <- c(.1,1.8,3.2,4.5,4.2,2.9,1.1,0)


model <- lm(y ~ poly(x,3))

x2<-seq(7,18,by=.1)
y2<-predict(model,data.frame(x=x2))

plot(x2,y2,type='l')
lines(x,y,type='l')

# want to know 10.5 to 14

sum((x2>10.5)*(x2<14)*(y2-5)*.1)
