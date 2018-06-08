# Midterm Project
410411325 林皓翔，410511303 陳曼琳，410511331 李阜舫  

### 2. Referring to the webpage of Kernel density estimation on Wikipedia, do the following:

#### a.(10 pts) Describe what is called a kernel estimate of an unknown pdf.Also show that the kernel estimate <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}">of an unknown pdf <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> is a legitimate pdf. That is, show that <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}"> is nonnegative and its integral over R is one.

>中文說明:<p>
核密度估計是一種無母數的估測方式用來估計一個隨機變數背後的機率密度函數。
從概念上來說，基於有限的數據樣本，我們使用一個kernel function去對每一筆觀測值生成以該點為中心的分配，然後將這些分配加總後取平均來作為所估測的母體分配。
事實上，在使用核密度估計時，還會用到一個平滑參數$h$，用來調控估測分配的平滑程度，$h$越小對每個觀測值就越敏感，越大則分配曲線就越平滑。當樣本的觀測值夠多時，我們可以試著使用較小的$h$來獲得更好的估測結果。<p>
English description:<p>
Kernel density estimation is a non-parametric way to estimate the probability density function of a random variable.
Conceptually, based a finite data sample, we use a kernel function generate a probability density distribution for each observe data, and then average the sum of these distributions, come as the population distribution estimation.
In fact, we also use a smoothing parameter $h$ to adjust the smoothness of the distribution when using kernel density estimation.
The smaller the $h$, the more the estimator will be sensitive to each observation, and when $h$ be larger, distribution curve will be more smoother.
We can try to use a smaller $h$ to get a better result when there are lots of data in the sample.


>**To show that kernel estimate <img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}"> of an unknown pdf <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> is a legitimate pdf:**<p>
Let <img src="http://chart.googleapis.com/chart?cht=tx&chl=\left(x_{1},x_{2},...,x_{n}\right)"> be a univariate independent and identically distributed sample drawn from some distribution with an unknown density <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> . We are interested in estimating the shape of this function <img src="http://chart.googleapis.com/chart?cht=tx&chl=f"> . Its kernel density estimator is <p>
　　　　　　<img src="http://chart.googleapis.com/chart?cht=tx&chl=\widehat{f_{h}}\left(x\right)=\frac{1}{n}\sum_{i=1}^{n}K_{h}\left(x-x_{i}\right)=\frac{1}{nh}\sum_{i=1}^{n}K\left(\frac{x-x_{i}}{h}\right)" style="border:none;"> </p>
(i). $\widehat{f_{h}}\left ( x \right )\geq 0:$<p>
　　Since $K \geq 0$ and $h > 0$,　so $\frac{1}{nh}\sum_{i=1}^{n}K\left ( \frac{x-x_{i}}{h} \right ) \geq 0, \forall x$<p>
　　and hence $\widehat{f_{h}}\geq 0, \forall x$
 <p>
(ii). $\int_{-\infty}^{\infty}\widehat{f_{h}}\left ( x \right )dx =1 :$<p>
　　$\int_{-\infty}^{\infty}\widehat{f_{h}}\left ( x \right )dx =
\frac{1}{nh} \sum_{i=1}^{n}\int_{-\infty}^{\infty}K\left ( \frac{x-x_{i}}{h} \right )dx$<p>
　　　　　　　　　　　　　　　　　　　　(變數變換 $u= \frac{x-x_{i}}{h}$　$du= \frac{1}{h}dx$<p>
　　　　　　　 　　$=\frac{1}{n} \sum_{i=1}^{n}\int_{-\infty}^{\infty}K\left ( u \right )du$<p>
　　　　　　　 　　$=\frac{1}{n} \sum_{i=1}^{n}1$<p>
　　　　　　　 　　$=\frac{n}{n}=1$<p>
 
#### b.(10 pts) Try to explain and distinguish the three terms: kernel, scaled kernel, and individual kernel.

>**Kernel:**<p>
Kernel is a non-negative function that integrates to one which we refer to construction of the estimated distribution. For most applications, it is desirable to define the function to satisfy two additional requirements:<p>
 - Normalization:<p>
　　$\int_{-\infty}^{\infty}K\left ( u \right )du=1$
 - Symmetry:<p>
　　$K\left ( -u \right )=K\left ( u \right )$ for all value of $u$<p>

>**Scaled kernel:**<p>
A kernel with subscript $h$ is called the scaled kernel and defined as $K_{h}\left ( x\right )= \frac{1}{h}K\left ( \frac{x}{h}\right )$, among $h$ > 0 is a smoothing parameter called the bandwidth.


>**Individual kernel:**<p>
Individual kernel means that we use the kernel function construct the distribution for each data from the sample individually. And the Individual kernels are these distribution, center respectively are the obersave data points.<p>


####c. (30 pts) Consider the data: −2.1,−1.3,−0.4,1.9,5.1,6.2 used in the illustrating example on Wikipedia, reproduce the density histogram and kernel density plot with normal kernels shown on that webpage. Compare it to the kernel density plot with the choice of default values of optional input arguments of R function density. Explain why they are not the same.


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

![](Midterm_Project_林皓翔陳曼琳李阜舫__files/figure-html/unnamed-chunk-1-1.png)<!-- -->

```r
plot(f,xlim=c(-6,10),ylim=c(0,0.18),col='blue',lwd=3,main="Wikipedia")
rug(X)

plot(density(X),xlim=c(-6,10),ylim=c(0,0.18),lwd=3,main="Default")
rug(X)
```

![](Midterm_Project_林皓翔陳曼琳李阜舫__files/figure-html/unnamed-chunk-1-2.png)<!-- -->

>Two graphs are use the same kernel, normal, but different bandwidth h.
The figure which use default values of optional input arguments of R function density has a larger h than the wikipedia one, hence its density curve is more smoothly. And the wikipedia one is more sensitive to each observation, it’s a obviously bimodal distribution.<p>
　　<p>
　　<p>

###4. In the law firm Tybo and Associates, there are six partners. Listed below is the number of cases each associate actually tried in court last month.

####4a.(5 pts) How many different samples of 3 associates are possible?

```r
choose(6,3)
```

```
## [1] 20
```
####4b.(20 pts) List all possible samples of three associates, and the corresponding number of cases, and compute/list the sample sum and sample mean of the number of cases in each sample.

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
####4c.(5 pts) Compare the mean of the distribution of sample means to the population mean.

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
>以mean of sample means來看,$\frac{\sum_{i=1}^{20}(ith.sample.mean)}{20}= \frac{\sum_{i=1}^{20}(partial.sum.of.sample.i)}{60}= \frac{10*(sum.of.everyone.cases)}{60}=\frac{1}{6}*(sum.of.everyone.cases)$<p>
所以,mean of sample means會等於population mean。

####4d.(35 pts) Compare the dispersion in the population with that of the sample means based on a chart similar to the side-by-side probability histograms for discrete random variables given below,

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

![](Midterm_Project_林皓翔陳曼琳李阜舫__files/figure-html/unnamed-chunk-5-1.png)<!-- -->

>由此圖可以看出population mean和mean of sample mean是一樣的。比較右圖和左圖,可以發現到sample mean的分佈比population的分布還集中。

####4e.(5 pts) Using the concept that the mean of a random variable is the average of its possible values weighted by the probability mass, compute and compare the population mean and the mean of the sample mean.

```r
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
>以mean of sample means來看,$\frac{\sum_{i=1}^{20}(ith.sample.mean)}{20}= \frac{\sum_{i=1}^{20}(partial.sum.of.sample.i)}{60}= \frac{10*(sum.of.everyone.cases)}{60}=\frac{1}{6}*(sum.of.everyone.cases)$<p>
所以,mean of sample means會等於population mean。


####4f.(10 pts) Compare the variance of the distribution of sample means to the population variance.

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

###5. Refer to the Real Estate data, which report information on the homes sold in the Goodyear, Arizona, area last year. Assume this to be the population. Do not edit/modify the content of the data file using softare other than R. Read the data file into a data frame using R function  read.table with appropriate specification of input arguments. Answer the following with help of R.
<p>
First, I read the data file into a data frame. 

```r
NVRE <- read.table("North_Valley_Real_Estate.csv", header=TRUE, sep=",")
```
<p>
####a.
####(i) How many observations are there in the data file?
>There are 105 observations in this data file.
<p>

####(ii) Take a look at the structure of the data frame. How many variables have missing values?

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
<p>

####(iii) Determine if all the observed values of these variables are missing.

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
<p>

####(iv) Remove these variables using R functions rm and within.

```r
within(NVRE, rm(X, X.1, X.2, X.3, X.4, X.5, X.6, X.7, X.8, X.9))
```

```
##     record    Agent  Price Size Bedrooms Baths Pool..yes.is.1.
## 1        1    Marty 206424 1820        2   1.5               1
## 2        2     Rose 346150 3010        3   2.0               0
## 3        3   Carter 372360 3210        4   3.0               0
## 4        4 Peterson 310622 3330        3   2.5               1
## 5        5   Carter 496100 4510        6   4.5               0
## 6        6 Peterson 294086 3440        4   3.0               1
## 7        7   Carter 228810 2630        4   2.5               0
## 8        8   Isaacs 384420 4470        5   3.5               0
## 9        9 Peterson 416120 4040        5   3.5               0
## 10      10   Isaacs 487494 4380        6   4.0               1
## 11      11     Rose 448800 5280        6   4.0               0
## 12      12 Peterson 388960 4420        4   3.0               0
## 13      13    Marty 335610 2970        3   2.5               0
## 14      14     Rose 276000 2300        2   1.5               0
## 15      15     Rose 346421 2970        4   3.0               1
## 16      16   Isaacs 453913 3660        6   4.0               1
## 17      17   Carter 376146 3290        5   3.5               1
## 18      18 Peterson 694430 5900        5   3.5               1
## 19      19     Rose 251269 2050        3   2.0               1
## 20      20     Rose 547596 4920        6   4.5               1
## 21      21    Marty 214910 1950        2   1.5               1
## 22      22     Rose 188799 1950        2   1.5               1
## 23      23   Carter 459950 4680        4   3.0               1
## 24      24   Isaacs 264160 2540        3   2.5               0
## 25      25   Carter 393557 3180        4   3.0               1
## 26      26   Isaacs 478675 4660        5   3.5               1
## 27      27   Carter 384020 4220        5   3.5               0
## 28      28    Marty 313200 3600        4   3.0               0
## 29      29   Isaacs 274482 2990        3   2.0               1
## 30      30    Marty 167962 1920        2   1.5               1
## 31      31   Isaacs 175823 1970        2   1.5               1
## 32      32   Isaacs 226498 2520        4   3.0               1
## 33      33   Carter 316827 3150        4   3.0               1
## 34      34   Carter 189984 1550        2   1.5               1
## 35      35    Marty 366350 3090        3   2.0               1
## 36      36   Isaacs 416160 4080        4   3.0               0
## 37      37   Isaacs 308000 3500        4   3.0               0
## 38      38     Rose 294357 2620        4   3.0               1
## 39      39   Carter 337144 2790        4   3.0               1
## 40      40 Peterson 299730 2910        3   2.0               0
## 41      41     Rose 445740 4370        4   3.0               0
## 42      42     Rose 410592 4200        4   3.0               1
## 43      43 Peterson 667732 5570        5   3.5               1
## 44      44     Rose 523584 5050        6   4.0               1
## 45      45    Marty 336000 3360        3   2.0               0
## 46      46    Marty 202598 2270        3   2.0               1
## 47      47    Marty 326695 2830        3   2.5               1
## 48      48     Rose 321320 2770        3   2.0               0
## 49      49   Isaacs 246820 2870        4   3.0               0
## 50      50   Isaacs 546084 5910        6   4.0               1
## 51      51   Isaacs 793084 6800        8   5.5               1
## 52      52   Isaacs 174528 1600        2   1.5               1
## 53      53 Peterson 392554 3970        4   3.0               1
## 54      54 Peterson 263160 3060        3   2.0               0
## 55      55     Rose 237120 1900        2   1.5               1
## 56      56   Carter 225750 2150        2   1.5               1
## 57      57   Isaacs 848420 7190        6   4.0               0
## 58      58   Carter 371956 3110        5   3.5               1
## 59      59   Carter 404538 3290        5   3.5               1
## 60      60     Rose 250090 2810        4   3.0               0
## 61      61 Peterson 369978 3830        4   2.5               1
## 62      62 Peterson 209292 1630        2   1.5               1
## 63      63   Isaacs 190032 1850        2   1.5               1
## 64      64   Isaacs 216720 2520        3   2.5               0
## 65      65    Marty 323417 3220        4   3.0               1
## 66      66   Isaacs 316210 3070        3   2.0               0
## 67      67 Peterson 226054 2090        2   1.5               1
## 68      68    Marty 183920 2090        3   2.0               0
## 69      69     Rose 248400 2300        3   2.5               1
## 70      70   Isaacs 466560 5760        5   3.5               0
## 71      71     Rose 667212 6110        6   4.0               1
## 72      72 Peterson 362710 4370        4   2.5               0
## 73      73     Rose 265440 3160        5   3.5               1
## 74      74     Rose 706596 6600        7   5.0               1
## 75      75    Marty 293700 3300        3   2.0               0
## 76      76    Marty 199448 2330        2   1.5               1
## 77      77   Carter 369533 4230        4   3.0               1
## 78      78    Marty 230121 2030        2   1.5               1
## 79      79    Marty 169000 1690        2   1.5               0
## 80      80 Peterson 190291 2040        2   1.5               1
## 81      81     Rose 393584 4660        4   3.0               1
## 82      82    Marty 363792 2860        3   2.5               1
## 83      83   Carter 360960 3840        6   4.5               0
## 84      84   Carter 310877 3180        3   2.0               1
## 85      85 Peterson 919480 7670        8   5.5               1
## 86      86   Carter 392904 3400        3   2.0               1
## 87      87   Carter 200928 1840        2   1.5               1
## 88      88   Carter 537900 4890        6   4.0               0
## 89      89     Rose 258120 2390        3   2.5               0
## 90      90   Carter 558342 6160        6   4.0               1
## 91      91    Marty 302720 3440        4   2.5               0
## 92      92   Isaacs 240115 2220        2   1.5               1
## 93      93   Carter 793656 6530        7   5.0               1
## 94      94 Peterson 218862 1930        2   1.5               1
## 95      95 Peterson 383081 3510        3   2.0               1
## 96      96    Marty 351520 3380        3   2.0               0
## 97      97 Peterson 841491 7030        6   4.0               1
## 98      98    Marty 336300 2850        3   2.5               0
## 99      99   Isaacs 312863 3750        6   4.0               1
## 100    100   Carter 275033 3060        3   2.0               1
## 101    101 Peterson 229990 2110        2   1.5               0
## 102    102   Isaacs 195257 2130        2   1.5               1
## 103    103    Marty 194238 1650        2   1.5               1
## 104    104 Peterson 348528 2740        4   3.0               1
## 105    105 Peterson 241920 2240        2   1.5               0
##     Garage..Yes.is.1. Days Township Mortgage.type Years FICO
## 1                   1   33        2         Fixed     2  824
## 2                   0   36        4         Fixed     9  820
## 3                   1   21        2         Fixed    18  819
## 4                   0   26        3         Fixed    17  817
## 5                   1   13        4         Fixed    17  816
## 6                   1   31        4         Fixed    19  813
## 7                   1   39        4    Adjustable    10  813
## 8                   1   26        2         Fixed     6  812
## 9                   1   26        4         Fixed     3  810
## 10                  1   32        3         Fixed     6  808
## 11                  1   35        4         Fixed     8  806
## 12                  1   50        2    Adjustable     9  805
## 13                  1   25        3    Adjustable     9  801
## 14                  0   34        1         Fixed    20  798
## 15                  1   17        3    Adjustable    10  795
## 16                  1   12        3         Fixed    18  792
## 17                  1   28        2    Adjustable     9  792
## 18                  1   36        3    Adjustable    10  788
## 19                  1   38        3         Fixed    16  786
## 20                  1   37        5         Fixed     2  785
## 21                  0   20        4         Fixed     6  784
## 22                  0   52        1         Fixed    10  782
## 23                  1   31        4         Fixed     8  781
## 24                  1   40        1         Fixed    18  780
## 25                  1   54        1         Fixed    20  776
## 26                  1   26        5    Adjustable     9  773
## 27                  1   23        4    Adjustable     9  772
## 28                  1   31        3         Fixed    19  772
## 29                  0   37        3         Fixed     5  769
## 30                  1   31        5         Fixed     6  769
## 31                  0   28        5    Adjustable     9  766
## 32                  1   28        3         Fixed     8  763
## 33                  1   22        4         Fixed     2  759
## 34                  0   22        2         Fixed    17  758
## 35                  1   23        3         Fixed     5  754
## 36                  1   25        4         Fixed    12  753
## 37                  1   37        2         Fixed    18  752
## 38                  1   15        4         Fixed    10  751
## 39                  1   19        3         Fixed    15  749
## 40                  0   31        2         Fixed    13  748
## 41                  1   19        3         Fixed     5  746
## 42                  1   27        1    Adjustable     9  741
## 43                  1   29        5         Fixed     4  740
## 44                  1   19        5    Adjustable    10  739
## 45                  0   32        3         Fixed     6  737
## 46                  0   28        1         Fixed    10  737
## 47                  0   30        4         Fixed     8  736
## 48                  1   23        4         Fixed     6  736
## 49                  1   27        5         Fixed    13  735
## 50                  1   35        5    Adjustable    10  731
## 51                  1   27        4         Fixed     6  729
## 52                  0   39        2         Fixed    15  728
## 53                  1   30        4         Fixed    17  726
## 54                  1   26        3         Fixed    10  726
## 55                  0   14        3         Fixed    18  723
## 56                  1   27        2         Fixed    15  715
## 57                  1   49        1         Fixed     5  710
## 58                  1   29        5         Fixed     8  710
## 59                  1   24        2         Fixed    14  707
## 60                  1   18        5         Fixed    11  704
## 61                  1   27        4         Fixed    10  703
## 62                  0   18        3         Fixed    10  701
## 63                  1   30        4    Adjustable     2  675
## 64                  0    2        4    Adjustable     5  674
## 65                  1   22        4    Adjustable     2  673
## 66                  0   30        1    Adjustable     1  673
## 67                  1   28        1    Adjustable     6  670
## 68                  0   30        2    Adjustable     8  669
## 69                  1   50        2    Adjustable     4  667
## 70                  1   42        4    Adjustable     3  665
## 71                  1   21        3    Adjustable     8  662
## 72                  1   24        1    Adjustable     2  656
## 73                  1   22        5    Adjustable     3  653
## 74                  1   40        3    Adjustable     7  652
## 75                  0   14        4    Adjustable     7  647
## 76                  1   25        3    Adjustable     5  644
## 77                  1   32        2    Adjustable     2  642
## 78                  0   21        2    Adjustable     3  639
## 79                  0   20        1    Adjustable     7  639
## 80                  1   31        4    Adjustable     6  631
## 81                  1   34        3    Adjustable     7  630
## 82                  1   48        5    Adjustable     3  626
## 83                  1   32        2    Adjustable     5  626
## 84                  1   40        1    Adjustable     6  624
## 85                  1   30        4    Adjustable     1  623
## 86                  0   40        2    Adjustable     8  618
## 87                  1   36        4    Adjustable     3  618
## 88                  1   23        1    Adjustable     7  614
## 89                  1   23        1    Adjustable     6  614
## 90                  1   24        3    Adjustable     7  613
## 91                  1   38        3    Adjustable     3  609
## 92                  0   39        5    Adjustable     1  609
## 93                  1   53        4    Adjustable     3  605
## 94                  0   58        4    Adjustable     1  604
## 95                  1   27        2    Adjustable     6  601
## 96                  1   35        2    Adjustable     8  599
## 97                  1   50        4    Adjustable     8  596
## 98                  0   28        1    Adjustable     6  595
## 99                  1   12        4    Adjustable     2  595
## 100                 1   27        3    Adjustable     3  593
## 101                 0   37        3    Adjustable     6  591
## 102                 0   11        5    Adjustable     8  591
## 103                 1   30        2    Adjustable     7  590
## 104                 1   27        5    Adjustable     3  584
## 105                 1   34        5    Adjustable     8  583
##     Default..Yes.is.1.
## 1                    0
## 2                    0
## 3                    0
## 4                    0
## 5                    0
## 6                    0
## 7                    0
## 8                    0
## 9                    0
## 10                   0
## 11                   1
## 12                   1
## 13                   1
## 14                   0
## 15                   0
## 16                   0
## 17                   1
## 18                   0
## 19                   0
## 20                   0
## 21                   0
## 22                   0
## 23                   0
## 24                   0
## 25                   0
## 26                   0
## 27                   1
## 28                   0
## 29                   0
## 30                   0
## 31                   1
## 32                   1
## 33                   1
## 34                   0
## 35                   1
## 36                   0
## 37                   0
## 38                   0
## 39                   0
## 40                   0
## 41                   0
## 42                   1
## 43                   0
## 44                   0
## 45                   0
## 46                   0
## 47                   0
## 48                   0
## 49                   0
## 50                   0
## 51                   0
## 52                   0
## 53                   0
## 54                   0
## 55                   0
## 56                   0
## 57                   0
## 58                   0
## 59                   0
## 60                   0
## 61                   0
## 62                   0
## 63                   0
## 64                   1
## 65                   0
## 66                   0
## 67                   0
## 68                   1
## 69                   0
## 70                   0
## 71                   1
## 72                   0
## 73                   0
## 74                   1
## 75                   1
## 76                   1
## 77                   0
## 78                   0
## 79                   1
## 80                   1
## 81                   1
## 82                   0
## 83                   1
## 84                   1
## 85                   0
## 86                   1
## 87                   1
## 88                   0
## 89                   1
## 90                   0
## 91                   1
## 92                   0
## 93                   1
## 94                   0
## 95                   1
## 96                   1
## 97                   1
## 98                   1
## 99                   0
## 100                  0
## 101                  1
## 102                  1
## 103                  1
## 104                  1
## 105                  1
```
<p>

####b. Compute the mean and the standard deviation of the selling prices.

```r
mean(NVRE$Price)
```

```
## [1] 357026.5
```

```r
sd(NVRE$Price)
```

```
## [1] 160700.1
```
>The mean of the selling prices is 357026.5; the standard deviation of the selling prices is 160700.1.
<p>

####c. Select randomly a sample of 10 homes using certain R function. Compute the mean of the sample.

```r
S <- sample(NVRE$record, 10)
cat("sample:",S,"\n")
```

```
## sample: 70 89 1 66 84 23 87 4 49 25
```

```r
i <- 1
sum <- 0
for(i in 1:10)
{
  sum <- sum+NVRE[S[i],"Price"]
}

cat("sample mean:", sum/10)
```

```
## sample mean: 317006.8
```
<p>

####d. Determine the likelihood of a sample mean this large or larger from the population based on an approximate method that takes into account that the observed sample is selected from a finite population without replacement.
>I randomly draw 100000 samples of sample size 10 from the population. Also, I calculate their respective sample means. Then I set a counter to count the number of sample means which are larger than population mean. Finally I calculate its proportion.

```r
i <- 1
j <- 1
k <- 0 
m <- 100000 #sampling frequency
n <- 10 #sample size 
for(j in 1:m)
{
  S <- sample(NVRE$record, n, replace=FALSE)
  sum <- 0
  
  for(i in 1:n)
  {
    sum <- sum+NVRE[S[i],"Price"]
  }
  mean.s <- sum/n
  
  if(mean.s>357026.5)
  {
    k <- k+1
  }
}
cat("the number of sample means which are larger than population mean:",k,"(times)\n")
```

```
## the number of sample means which are larger than population mean: 47194 (times)
```

```r
cat("proportion of sample means which are larger than population mean:", k/m)
```

```
## proportion of sample means which are larger than population mean: 0.47194
```
<p>

####e. 
####(i) Justify the appropriateness of the approximate method you adopted in computing the above likelihood by conducting a study on the sampling distribution of the sample means for small samples taken from the given finite population.
>我想用Central Limit Theorem來解釋5.(d)：<p>
><p>
>使用這個定理有一個很重要的前提是，每組sample裡的sample point必須是independent。但sampling without replacement這個方法會因為某個sample point被抽取而影響下一個sample point被抽取的機率，所以sample point是dependent。雖說如此，我們還是能藉由控制sample size，讓其小於10%的population，來有效排除dependent sample point。
><p>
>（考量到整個population有105筆紀錄，於是在處理5.(d)時，我選擇10作為sample size。）
<p>

####(ii) Summarize your findings.
>(設m: sampling frequency; n:sample size; p: probability that a sample mean is larger than population mean)
><p>
>**＊當m越大，估算出來的p浮動越小。**
<p>
固定n=10，分別重複5次用 m1=10, m2=100, m3=1000, m4=10000, m5=100000 去算p，以下是程式執行的結果：
><p>
><p>
>(m1=10)     p1=0.6,     p2=0.6,     p3=0.6,     p4=0.2,     p5=0.7 <p>
(m2=100)    p1=0.55,    p2=0.42,    p3=0.45,    p4=0.45,    p5=0.33 <p>
(m3=1000)   p1=0.444,   p2=0.483,   p3=0.481,   p4=0.451,   p5=0.477 <p>
(m4=10000)  p1=0.4692,  p2=0.4736,  p3=0.4772,  p4=0.4773,  p5=0.4801 <p>
(m5=100000) p1=0.47184, p2=0.47498, p3=0.47237, p4=0.47213, p5=0.4725 <p>
<p>
<p>
<p>
<p>
<p>
