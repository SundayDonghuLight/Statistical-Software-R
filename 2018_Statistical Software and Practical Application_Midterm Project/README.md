# Midterm Project
410411325 林皓翔，410511303 陳曼琳，410511331 李阜舫  

### 2. Referring to the webpage of Kernel density estimation on Wikipedia, do the following:

#### a.(10 pts) Describe what is called a kernel estimate of an unknown pdf.Also show that the kernel estimate <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}">of an unknown pdf <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> is a legitimate pdf. That is, show that <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}"> is nonnegative and its integral over R is one.

>中文說明:<p>
核密度估計是一種無母數的估測方式用來估計一個隨機變數背後的機率密度函數。
從概念上來說，基於有限的數據樣本，我們使用一個kernel function去對每一筆觀測值生成以該點為中心的分配，然後將這些分配加總後取平均來作為所估測的母體分配。
事實上，在使用核密度估計時，還會用到一個平滑參數 h，用來調控估測分配的平滑程度，h 越小對每個觀測值就越敏感，越大則分配曲線就越平滑。當樣本的觀測值夠多時，我們可以試著使用較小的 h 來獲得更好的估測結果。<p>
English description:<p>
Kernel density estimation is a non-parametric way to estimate the probability density function of a random variable.
Conceptually, based a finite data sample, we use a kernel function generate a probability density distribution for each observe data, and then average the sum of these distributions, come as the population distribution estimation.
In fact, we also use a smoothing parameter h to adjust the smoothness of the distribution when using kernel density estimation.
The smaller the h, the more the estimator will be sensitive to each observation, and when h be larger, distribution curve will be more smoother.
We can try to use a smaller h to get a better result when there are lots of data in the sample.


>**To show that kernel estimate <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}"> of an unknown pdf <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> is a legitimate pdf:**<p>
Let <img src="http://chart.googleapis.com/chart?cht=tx&chl=\left(x_{1},x_{2},...,x_{n}\right)"> be a univariate independent and identically distributed sample drawn from some distribution with an unknown density <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> . We are interested in estimating the shape of this function <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> . Its kernel density estimator is <p>
　　　　　　<img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}\left(x\right)=\frac{1}{n}\sum_{i=1}^{n}K_{h}\left(x-x_{i}\right)=\frac{1}{nh}\sum_{i=1}^{n}K\left(\frac{x-x_{i}}{h}\right)" style="border:none;"> </p>
(i).  <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}\geq+0:"> <p>
　　Since <img src="http://chart.googleapis.com/chart?cht=tx&chl=K\geq0and"> <img src="http://chart.googleapis.com/chart?cht=tx&chl=h>0">, so <img src="http://chart.googleapis.com/chart?cht=tx&chl=\frac{1}{nh}\sum_{i=1}^{n}K\left(\frac{x-x_{i}}{h}\right)\geq0,+\forall+x"> </p> <p>
　　 and hence <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}\geq+0,+\forall+x"> </p>
(ii).  <img src="http://chart.googleapis.com/chart?cht=tx&chl=\int_{-\infty}^{\infty}\widehat{f_{h}}\left(x\right)dx=1:"><p>
　　<img src="http://chart.googleapis.com/chart?cht=tx&chl=\int_{-\infty}^{\infty}\widehat{f_{h}}\left(x\right)dx=\frac{1}{nh}\sum_{i=1}^{n}\int_{-\infty}^{\infty}K\left(\frac{x-x_{i}}{h}\right)dx"><p>
　　　　　　　　　　　　　　　　　　　　(變數變換 <img src="http://chart.googleapis.com/chart?cht=tx&chl=u=\frac{x-x_{i}}{h}">　<img src="http://chart.googleapis.com/chart?cht=tx&chl=du=\frac{1}{h}dx"><p>
　　　　　　　　　<img src="http://chart.googleapis.com/chart?cht=tx&chl==\frac{1}{n}+\sum_{i=1}^{n}\int_{\infty}^{\infty}K\left(u\right)du"><p>
　　　　　　　 　　<img src="http://chart.googleapis.com/chart?cht=tx&chl==\frac{1}{n}+\sum_{i=1}^{n}1"><p>
　　　　　　　 　　<img src="http://chart.googleapis.com/chart?cht=tx&chl==\frac{n}{n}=1"></p>
 
#### b.(10 pts) Try to explain and distinguish the three terms: kernel, scaled kernel, and individual kernel.

>**Kernel:**<p>
Kernel is a non-negative function that integrates to one which we refer to construction of the estimated distribution. For most applications, it is desirable to define the function to satisfy two additional requirements:
- Normalization:<p>
　　<img src="http://chart.googleapis.com/chart?cht=tx&chl=\int_{-\infty}^{\infty}K\left+(+u+\right+)du=1">
- Symmetry:<p>
　　<img src="http://chart.googleapis.com/chart?cht=tx&chl=K\left+(+-u+\right+)=K\left+(+u+\right+)"> for all value of <img src="http://chart.googleapis.com/chart?cht=tx&chl=u"><p>

>**Scaled kernel:**<p>
A kernel with subscript h is called the scaled kernel and defined as <img src="http://chart.googleapis.com/chart?cht=tx&chl=K_{h}\left+(+x\right+)=+\frac{1}{h}K\left+(+\frac{x}{h}\right+)">, among h > 0 is a smoothing parameter called the bandwidth.
	
>**Individual kernel:**<p>
Individual kernel means that we use the kernel function construct the distribution for each data from the sample individually. And the Individual kernels are these distribution, center respectively are the obersave data points.</p>
　　mathematical representation:<img src="http://chart.googleapis.com/chart?cht=tx&chl=\frac{1}{n}K_{h}\left+(+x-x_{i}\right+)">

	
#### c. (30 pts) Consider the data: −2.1,−1.3,−0.4,1.9,5.1,6.2 used in the illustrating example on Wikipedia, reproduce the density histogram and kernel density plot with normal kernels shown on that webpage. Compare it to the kernel density plot with the choice of default values of optional input arguments of R function density. Explain why they are not the same.


```r
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
```
![Aaron Swartz](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Midterm%20Project/figure-html/unnamed-chunk-1-1.png)

```r
plot(f,xlim=c(-6,10),ylim=c(0,0.18),col='blue',lwd=3,main="Wikipedia")
rug(X)

plot(density(X),xlim=c(-6,10),ylim=c(0,0.18),lwd=3,main="Default")
rug(X)
```
![Aaron Swartz](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Midterm%20Project/figure-html/unnamed-chunk-1-2.png)

>Two graphs are use the same kernel, normal, but different bandwidth h.
The figure which use default values of optional input arguments of R function density has a larger h than the wikipedia one, hence its density curve is more smoothly. And the wikipedia one is more sensitive to each observation, it’s a obviously bimodal distribution.<p>

　　<p>
　　<p>

### 4. In the law firm Tybo and Associates, there are six partners. Listed below is the number of cases each associate actually tried in court last month.

#### 4a.(5 pts) How many different samples of 3 associates are possible?

```r
choose(6,3)
```

```
## [1] 20
```
#### 4b.(20 pts) List all possible samples of three associates, and the corresponding number of cases, and compute/list the sample sum and sample mean of the number of cases in each sample.

```r
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
```

```
## Ruud Wu Sass 
## 3 6 3 
## sum= 12 
## mean= 4 
## Ruud Wu Flores 
## 3 6 3 
## sum= 12 
## mean= 4 
## Ruud Wu Wilhelms 
## 3 6 0 
## sum= 9 
## mean= 3 
## Ruud Wu Schueller 
## 3 6 1 
## sum= 10 
## mean= 3.333333 
## Ruud Sass Flores 
## 3 3 3 
## sum= 9 
## mean= 3 
## Ruud Sass Wilhelms 
## 3 3 0 
## sum= 6 
## mean= 2 
## Ruud Sass Schueller 
## 3 3 1 
## sum= 7 
## mean= 2.333333 
## Ruud Flores Wilhelms 
## 3 3 0 
## sum= 6 
## mean= 2 
## Ruud Flores Schueller 
## 3 3 1 
## sum= 7 
## mean= 2.333333 
## Ruud Wilhelms Schueller 
## 3 0 1 
## sum= 4 
## mean= 1.333333 
## Wu Sass Flores 
## 6 3 3 
## sum= 12 
## mean= 4 
## Wu Sass Wilhelms 
## 6 3 0 
## sum= 9 
## mean= 3 
## Wu Sass Schueller 
## 6 3 1 
## sum= 10 
## mean= 3.333333 
## Wu Flores Wilhelms 
## 6 3 0 
## sum= 9 
## mean= 3 
## Wu Flores Schueller 
## 6 3 1 
## sum= 10 
## mean= 3.333333 
## Wu Wilhelms Schueller 
## 6 0 1 
## sum= 7 
## mean= 2.333333 
## Sass Flores Wilhelms 
## 3 3 0 
## sum= 6 
## mean= 2 
## Sass Flores Schueller 
## 3 3 1 
## sum= 7 
## mean= 2.333333 
## Sass Wilhelms Schueller 
## 3 0 1 
## sum= 4 
## mean= 1.333333 
## Flores Wilhelms Schueller 
## 3 0 1 
## sum= 4 
## mean= 1.333333
```
####  4c.(5 pts) Compare the mean of the distribution of sample means to the population mean.

```r
Population_data = c(3,6,3,3,0,1)
cat("population mean=",mean(Population_data),"\n")
```

```
## population mean= 2.666667
```

```r
cat("mean of the sample mean=",mean(sample_mean))
```

```
## mean of the sample mean= 2.666667
```
>以mean of sample means來看,<img src="http://chart.googleapis.com/chart?cht=tx&chl=\frac{\sum_{i=1}^{20}(ith.sample.mean)}{20}=\frac{\sum_{i=1}^{20}(partial.sum.of.sample.i)}{60}=\frac{10*(sum.of.everyone.cases)}{60}=\frac{1}{6}*(sum.of.everyone.cases)"> <p>
所以,mean of sample means會等於population mean。

#### 4d.(35 pts) Compare the dispersion in the population with that of the sample means based on a chart similar to the side-by-side probability histograms for discrete random variables given below,

```r
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
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   0.000   1.500   3.000   2.667   3.000   6.000
```

```r
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
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   1.333   2.000   2.667   2.667   3.333   4.000
```

```r
points(2.667,-0.007,col="red",pch=19)
text(x=2.665, y=0.02,expression(mu*bar(x)),col = "red")
```

![Aaron Swartz](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Midterm%20Project/figure-html/unnamed-chunk-5-1.png)

>由此圖可以看出population mean和mean of sample mean是一樣的。比較右圖和左圖,可以發現到sample mean的分佈比population的分布還集中。

#### 4e.(5 pts) Using the concept that the mean of a random variable is the average of its possible values weighted by the probability mass, compute and compare the population mean and the mean of the sample mean.

```r
Population_data = c(3,6,3,3,0,1)
data_freq = table(Population_data)
(data.frame(data_freq/6))
```

```
##   Population_data      Freq
## 1               0 0.1666667
## 2               1 0.1666667
## 3               3 0.5000000
## 4               6 0.1666667
```

```r
c=as.vector(df[[1]])
d=sum((as.numeric(c))*(df[[2]]/6))
cat("population mean=",d,'\n')
```

```
## population mean= 2.666667
```

```r
All_Possible_Outcomes_of_Sample_mean= c(4,4,3,10/3,3,2,7/3,2,7/3,4/3,4,3,10/3,3,10/3,7/3,2,7/3,4/3,4/3)
means_freq = table(All_Possible_Outcomes_of_Sample_mean)
data.frame(means_freq/20)
```

```
##   All_Possible_Outcomes_of_Sample_mean Freq
## 1                     1.33333333333333 0.15
## 2                                    2 0.15
## 3                     2.33333333333333 0.20
## 4                                    3 0.20
## 5                     3.33333333333333 0.15
## 6                                    4 0.15
```

```r
z=as.vector(mf[[1]])
m=sum((as.numeric(z))*(mf[[2]]/20))
cat("mean of sample mean=",m)
```

```
## mean of sample mean= 2.666667
```

>用期望值的方式來算population mean和mean of sample mean,<p>
可以發現population mean= 2.666667= mean of sample mean。



#### 4f.(10 pts) Compare the variance of the distribution of sample means to the population variance.

```r
cat("population variance(3,6,3,3,0,1)=",var(Population_data)*5/6,"\n")
```

```
## population variance(3,6,3,3,0,1)= 3.555556
```

```r
cat("variance of sample means=",var(sample_mean)*19/20,"\n")
```

```
## variance of sample means= 0.7111111
```
>因為population mean= 2.666667 =mean of the sample mean,<p>
但是population variance=3.555556 > 0.7111111 = variance of sample means,
因此可以由variance的性質可知,population 的分布相較於sample means的分布還要分散。<p>

　　<p>
　　<p>

### 5. Refer to the Real Estate data, which report information on the homes sold in the Goodyear, Arizona, area last year. Assume this to be the population. Do not edit/modify the content of the data file using softare other than R. Read the data file into a data frame using R function `read.table` with appropriate specification of input arguments. Answer the following with help of R.
<p>
First, I read the data file into a data frame. 

```r
NVRE <- read.table("North_Valley_Real_Estate.csv", header=TRUE, sep=",")
```

#### a.
#### (i) How many observations are there in the data file?
>There are 105 observations in this data file.

#### (ii) Take a look at the structure of the data frame. How many variables have missing values?

```r
str(NVRE)
```

```
## 'data.frame':	105 obs. of  24 variables:
##  $ record            : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Agent             : Factor w/ 5 levels "Carter","Isaacs",..: 3 5 1 4 1 4 1 2 4 2 ...
##  $ Price             : int  206424 346150 372360 310622 496100 294086 228810 384420 416120 487494 ...
##  $ Size              : int  1820 3010 3210 3330 4510 3440 2630 4470 4040 4380 ...
##  $ Bedrooms          : int  2 3 4 3 6 4 4 5 5 6 ...
##  $ Baths             : num  1.5 2 3 2.5 4.5 3 2.5 3.5 3.5 4 ...
##  $ Pool..yes.is.1.   : int  1 0 0 1 0 1 0 0 0 1 ...
##  $ Garage..Yes.is.1. : int  1 0 1 0 1 1 1 1 1 1 ...
##  $ Days              : int  33 36 21 26 13 31 39 26 26 32 ...
##  $ Township          : int  2 4 2 3 4 4 4 2 4 3 ...
##  $ Mortgage.type     : Factor w/ 2 levels "Adjustable","Fixed": 2 2 2 2 2 2 1 2 2 2 ...
##  $ Years             : int  2 9 18 17 17 19 10 6 3 6 ...
##  $ FICO              : int  824 820 819 817 816 813 813 812 810 808 ...
##  $ Default..Yes.is.1.: int  0 0 0 0 0 0 0 0 0 0 ...
##  $ X                 : logi  NA NA NA NA NA NA ...
##  $ X.1               : logi  NA NA NA NA NA NA ...
##  $ X.2               : logi  NA NA NA NA NA NA ...
##  $ X.3               : logi  NA NA NA NA NA NA ...
##  $ X.4               : logi  NA NA NA NA NA NA ...
##  $ X.5               : logi  NA NA NA NA NA NA ...
##  $ X.6               : logi  NA NA NA NA NA NA ...
##  $ X.7               : logi  NA NA NA NA NA NA ...
##  $ X.8               : logi  NA NA NA NA NA NA ...
##  $ X.9               : logi  NA NA NA NA NA NA ...
```
>10 variables have missing values. (They are X, X.1,..., X.9, respectively.)

#### (iii) Determine if all the observed values of these variables are missing.

```r
sum(is.na(NVRE$X))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.1))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.2))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.3))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.4))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.5))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.6))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.7))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.8))
```

```
## [1] 105
```

```r
sum(is.na(NVRE$X.9))
```

```
## [1] 105
```
>Yes. Because there are not any observed values recorded in all of the 10 variables.

#### (iv) Remove these variables using R functions rm and within.

```r
NVRE.rmNA <- within(NVRE, rm(X, X.1, X.2, X.3, X.4, X.5, X.6, X.7, X.8, X.9))
str(NVRE.rmNA)
```

```
## 'data.frame':    105 obs. of  14 variables:
##  $ record            : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Agent             : Factor w/ 5 levels "Carter","Isaacs",..: 3 5 1 4 1 4 1 2 4 2 ...
##  $ Price             : int  206424 346150 372360 310622 496100 294086 228810 384420 416120 487494 ...
##  $ Size              : int  1820 3010 3210 3330 4510 3440 2630 4470 4040 4380 ...
##  $ Bedrooms          : int  2 3 4 3 6 4 4 5 5 6 ...
##  $ Baths             : num  1.5 2 3 2.5 4.5 3 2.5 3.5 3.5 4 ...
##  $ Pool..yes.is.1.   : int  1 0 0 1 0 1 0 0 0 1 ...
##  $ Garage..Yes.is.1. : int  1 0 1 0 1 1 1 1 1 1 ...
##  $ Days              : int  33 36 21 26 13 31 39 26 26 32 ...
##  $ Township          : int  2 4 2 3 4 4 4 2 4 3 ...
##  $ Mortgage.type     : Factor w/ 2 levels "Adjustable","Fixed": 2 2 2 2 2 2 1 2 2 2 ...
##  $ Years             : int  2 9 18 17 17 19 10 6 3 6 ...
##  $ FICO              : int  824 820 819 817 816 813 813 812 810 808 ...
##  $ Default..Yes.is.1.: int  0 0 0 0 0 0 0 0 0 0 ...
```
<p>

#### b. Compute the mean and the standard deviation of the selling prices.

```r
(mean.p <- mean(NVRE$Price))
```

```
## [1] 357026.5
```

```r
(sd.p <- sqrt((sd(NVRE$Price)^2)*104/105))
```

```
## [1] 159933.1
```
>The mean of the selling prices is 357026.5; the standard deviation of the selling prices is 159933.1.

#### c. Select randomly a sample of 10 homes using certain R function. Compute the mean of the sample.

```r
S <- sample(NVRE$record, 10, replace=F)
cat("sample:", S, "\n")
```

```
## sample: 53 54 68 40 34 13 27 60 49 3
```

```r
i <- 1
sum <- 0
for(i in 1:10)
{
  sum <- sum+NVRE[S[i],"Price"]
}

mean.s <- sum/10

cat("sample mean:", mean.s)
```

```
## sample mean: 291824.8
```
<p>

#### d. Determine the likelihood of a sample mean this large or larger from the population based on an approximate method that takes into account that the observed sample is selected from a finite population without replacement.
><img src="http://chart.googleapis.com/chart?cht=tx&chl=P\left(\overline{X}\geq\overline{x}\right)="> <img src="http://chart.googleapis.com/chart?cht=tx&chl=P\left(\frac{\overline{X}-\mu}{\frac{\sigma}{\sqrt{n}}}\geq\frac{\overline{x}-\mu}{\frac{\sigma}{\sqrt{n}}}\right)"> <img src="http://chart.googleapis.com/chart?cht=tx&chl=\approx+P\left+(Z\geq\frac{\overline{x}-\mu}{\frac{\sigma}{\sqrt{n}}}\right)"><p>
Let <img src="http://chart.googleapis.com/chart?cht=tx&chl=y=\frac{\overline{x}-\mu}{\frac{\sigma}{\sqrt{n}}}">

```r
y <- (mean.s-mean.p)/(sd.p/sqrt(10))
prob <- pnorm(y, lower.tail=F)
cat("the likelihood of a sample mean this large or larger from the population is", prob)
```

```
## the likelihood of a sample mean this large or larger from the population is 0.9013358
```

#### e. 
#### (i) Justify the appropriateness of the approximate method you adopted in computing the above likelihood by conducting a study on the sampling distribution of the sample means for small samples taken from the given finite population.
>我想用Central Limit Theorem來解釋5.(d)：<p>
使用這個定理有一個很重要的前提是，每組sample裡的sample point必須是independent。但sampling without replacement這個方法會因為某個sample point被抽取而影響下一個sample point被抽取的機率，所以sample point是dependent。雖說如此，我們還是能藉由控制sample size，讓其小於10%的population，來有效降低dependent sample point的影響。
<p>
<p>
<p>
