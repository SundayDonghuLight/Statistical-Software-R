# 2.
# (c)
rm(list=ls())
X <- c(-2.1, -1.3, -0.4, 1.9, 5.1, 6.2)
par(mfrow=c(1,2))

hist(X,xlim=c(-6,10),ylim=c(0,0.18),freq=F,main="",
xlab="x",ylab="Density function",border="slateblue2")
box(bty="o")
rug(X)

f <- density(X,1.5)
plot(f,xlim=c(-6,10),ylim=c(0,0.18),col='blue',lwd=3,main="",
xlab="x",ylab="Density function")
rug(X)
fx <- function(x,i){
	dnorm(x,X[i],1.5)/6
}
for(i in c(1:6)){
	curve(fx(x,i),add=T,col='red',lty=2,lwd=2)
}

par(mfrow=c(1,2))
windows()
plot(f,xlim=c(-6,10),ylim=c(0,0.18),col='blue',lwd=3,main="Wikipedia")
rug(X)
plot(density(X),xlim=c(-6,10),ylim=c(0,0.18),lwd=3,main="Default")
rug(X)



# 4.
# (a)
choose(6,3)

# (b)
A=c("Ruud","Wu","Sass","Flores","Wilhelms","Schueller")
B=c(3,6,3,3,0,1)
sample_mean=NULL
i=1
n=1
while(i<=4){
    j=i+1
    while(j<=5){
        k=j+1
        while(k<=6){
            cat(c(A[i],A[j],A[k]),"\n") 
            cat(c(B[i],B[j],B[k]),"\n")
            cat("sum=",sum(c(B[i],B[j],B[k])),"\n")
            sample_mean[n]=mean(c(B[i],B[j],B[k]))
            cat("mean=",sample_mean[n],"\n")
            n=n+1
        k=k+1}
    j=j+1}
i=i+1}

# (c)
Population_data = c(3,6,3,3,0,1)
cat("population mean=",mean(Population_data),"\n")
cat("mean of the sample mean=",mean(sample_mean))

# (d)
par(mfrow=c(1,2))

Population_data = c(3,6,3,3,0,1)
means_freq = table(Population_data)
mf = data.frame(means_freq)
plot(as.vector(mf[[1]]),mf[[2]]/6,
     type='h',
     xlim = c(0.0,6.5),
     ylim=c(0.0,0.6),
     main = "Population Distribution",
     xlab = "Number of Cases",
     ylab = "Probability",
     col="purple2",
     lwd=5,
     las=1)
summary(Population_data)

points(2.667,-0.018,col="red",pch=19)
text(x=2.665, y=0.05,expression(mu),col = "red")

All_Possible_Outcomes_of_Sample_mean= c(4,4,3,10/3,3,2,7/3,2,7/3,4/3,4,3,10/3,3,10/3,7/3,2,7/3,4/3,4/3)
means_freq = table(All_Possible_Outcomes_of_Sample_mean)
mf = data.frame(means_freq)
plot(as.vector(mf[[1]]),mf[[2]]/20,
     type='h',
     xlim = c(1.0,4.5),
     ylim=c(0.0,0.25),
     main = "Distribution of Sample Mean",
     xlab = "Sample mean of 3 associates",
     ylab = "Probability",
     col="purple2",
     lwd=5,
     las=1)
summary(All_Possible_Outcomes_of_Sample_mean)

points(2.667,-0.007,col="red",pch=19)
text(x=2.665, y=0.02,expression(mu*bar(x)),col = "red")

# (e)
Population_data = c(3,6,3,3,0,1)
data_freq = table(Population_data)
(data.frame(data_freq/6))

c=as.vector(df[[1]])
d=sum((as.numeric(c))*(df[[2]]/6))
cat("population mean=",d,'\n')

All_Possible_Outcomes_of_Sample_mean= c(4,4,3,10/3,3,2,7/3,2,7/3,4/3,4,3,10/3,3,10/3,7/3,2,7/3,4/3,4/3)
means_freq = table(All_Possible_Outcomes_of_Sample_mean)
data.frame(means_freq/20)

z=as.vector(mf[[1]])
m=sum((as.numeric(z))*(mf[[2]]/20))
cat("mean of sample mean=",m)

# (f)
cat("population variance(3,6,3,3,0,1)=",var(Population_data)*5/6,"\n")
cat("variance of sample means=",var(sample_mean)*19/20,"\n")



# 5.
# (a)
NVRE <- read.table("North_Valley_Real_Estate.csv", header=TRUE, sep=",")
str(NVRE)
sum(is.na(NVRE$X))
sum(is.na(NVRE$X.1))
sum(is.na(NVRE$X.2))
sum(is.na(NVRE$X.3))
sum(is.na(NVRE$X.4))
sum(is.na(NVRE$X.5))
sum(is.na(NVRE$X.6))
sum(is.na(NVRE$X.7))
sum(is.na(NVRE$X.8))
sum(is.na(NVRE$X.9))
NVRE.rmNA <- within(NVRE, rm(X, X.1, X.2, X.3, X.4, X.5, X.6, X.7, X.8, X.9))
str(NVRE.rmNA)

# (b)
(mean.p <- mean(NVRE$Price))
(sd.p <- sqrt((sd(NVRE$Price)^2)*104/105))

# (c)
S <- sample(NVRE$record, 10, replace=F)
cat("sample:", S, "\n")
i <- 1
sum <- 0
for(i in 1:10)
{
  sum <- sum+NVRE[S[i],"Price"]
}

mean.s <- sum/10

cat("sample mean:", mean.s)

# (d)
y <- (mean.s-mean.p)/(sd.p/sqrt(10))
prob <- pnorm(y, lower.tail=F)
cat("the likelihood of a sample mean this large or larger from the population is", prob)


