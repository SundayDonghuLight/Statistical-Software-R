Final Project
================
410411325 林皓翔，410511303 陳曼琳，410511331 李阜舫
2018年6月29日

1. Categorical Data: Ch09 (IPS6e) Exercises:(42-43: GOF to normal data) and Ch15 (STBE17e): Exercise 62 (data given in week 12)
-------------------------------------------------------------------------------------------------------------------------------

``` r
twins <- read.table("twins.dat.txt", header=T, sep=",", na.strings=".")
```

### 3.4 (Categorizing ages in the twins dataset). The variable AGE gives the age (in years) of twin 1.

#### a. Use the cut function on AGE with the breakpoints 30, 40, and 50 to create a categorized version of the twin’s age.

``` r
obser. <- 1:183
age <- twins$AGE
twins.age <- data.frame(obser., age)
twins.age$age_category <- cut(age, breaks=c(0, 30, 40, 50, Inf), labels=c("age < 30", "30 < age < 40", "40 < age < 50", "50 < age"))
head(twins.age)
```

    ##   obser.      age  age_category
    ## 1      1 33.25120 30 < age < 40
    ## 2      2 54.05339      50 < age
    ## 3      3 43.57016 40 < age < 50
    ## 4      4 30.96783 30 < age < 40
    ## 5      5 34.63381 30 < age < 40
    ## 6      6 71.60301      50 < age

``` r
tail(twins.age)
```

    ##     obser.      age  age_category
    ## 178    178 38.77070 30 < age < 40
    ## 179    179 45.55510 40 < age < 50
    ## 180    180 26.37645      age < 30
    ## 181    181 40.31211 40 < age < 50
    ## 182    182 28.41342      age < 30
    ## 183    183 28.41342      age < 30

#### b. Use the table function to find the frequencies in the four age categories.

``` r
table(twins.age$age_category)
```

    ## 
    ##      age < 30 30 < age < 40 40 < age < 50      50 < age 
    ##            51            63            32            37

#### c. Construct a graph of the proportions in the four age categories.

``` r
prop.ages <- table(twins.age$age_category)/length(twins.age$age_category)
barplot(prop.ages, ylim=c(0, 0.4))
box(bty="o")
```

![](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Final%20Project/figure-markdown_github/unnamed-chunk-4-1.png)

### 3.5 (Relating age and wage in the twins dataset). The variables AGE and HRWAGEL contain the age (in years) and hourly wage (in dollars) of twin 1.

#### a. Using two applications of the cut function, create a categorized version of AGE using the breakpoints 30, 40, and 50, and a categorized version of HRWAGEL using the same breakpoints as in Section 3.3.

``` r
obser. <- 1:183

age <- twins$AGE
twins.age <- data.frame(obser., age)
twins.age$age_category <- cut(age, breaks=c(0, 30, 40, 50, Inf), labels=c("age < 30", "30 < age < 40", "40 < age < 50", "50 < age"))
head(twins.age)
```

    ##   obser.      age  age_category
    ## 1      1 33.25120 30 < age < 40
    ## 2      2 54.05339      50 < age
    ## 3      3 43.57016 40 < age < 50
    ## 4      4 30.96783 30 < age < 40
    ## 5      5 34.63381 30 < age < 40
    ## 6      6 71.60301      50 < age

``` r
wage <- twins$HRWAGEH
twins.wage <- data.frame(obser., wage)
twins.wage$wage_category <- cut(wage, breaks=c(0, 7, 13, 20, 150), labels=c("wage < 7", "7 < wage < 13", "13 < wage < 20", "20 < wage < 150"))
head(twins.wage)
```

    ##   obser.    wage  wage_category
    ## 1      1 11.2500  7 < wage < 13
    ## 2      2      NA           <NA>
    ## 3      3 18.0000 13 < wage < 20
    ## 4      4 16.5000 13 < wage < 20
    ## 5      5  9.6154  7 < wage < 13
    ## 6      6      NA           <NA>

#### b. Using the categorized versions of AGE and HRWAGEL, construct a contingency table of the two variables using the function table.

``` r
(age_wage <- table(twins.age$age_category, twins.wage$wage_category))
```

    ##                
    ##                 wage < 7 7 < wage < 13 13 < wage < 20 20 < wage < 150
    ##   age < 30            19            18              5               5
    ##   30 < age < 40       13            26             14               6
    ##   40 < age < 50        4            10              9               8
    ##   50 < age             4             7              7               6

#### c. Use the prop.table function to find the proportions of twins in each age class that have the different wage groups.

``` r
(prob <- prop.table(age_wage, margin=1))
```

    ##                
    ##                  wage < 7 7 < wage < 13 13 < wage < 20 20 < wage < 150
    ##   age < 30      0.4042553     0.3829787      0.1063830       0.1063830
    ##   30 < age < 40 0.2203390     0.4406780      0.2372881       0.1016949
    ##   40 < age < 50 0.1290323     0.3225806      0.2903226       0.2580645
    ##   50 < age      0.1666667     0.2916667      0.2916667       0.2500000

#### d. Construct a suitable graph to show how the wage distribution depends on the age of the twin.

``` r
c.wage <- twins.wage$wage_category
barplot(t(prob), ylab="proportion", ylim=c(0, 1.2), legend.text=dimnames(prob)$c.age)
```

![](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Final%20Project/figure-markdown_github/unnamed-chunk-8-1.png)

#### e. Use the conditional proportions in part (c) and the graph in part (d) to explain the relationship between age and wage of the twins.

> 觀察：
> <p>
> (c)表格：年紀小於40歲的人，時薪大多小於13美元；年紀大於40歲的人，時薪大於13美元的比例較多。
> <p>
> (d)圖：年紀小於30歲的人，時薪分布在小於7美元這個範圍的比例是最多的；反之，年紀大於50歲的人，雖然無法明顯看出與其他薪資分布比例差異，但跟其他歲數區間相比，時間大於20美元的比例的確比較高。
> <p>
> <p>
> 結論：
> <p>
> 隨著年紀增長，所賺取的時薪也會越來越多。
> <p>

### 3.6 (Relating age and wage in the twins dataset, continued).

### a. Using the contingency table of the categorized version of AGE and HRWAGEL and the function chisq.test, perform a test of independence of age and wage. Based on this test, is there significant evidence to conclude that age and wage are dependent?

> Assume that H: Age and wage are independent.

``` r
(S <- chisq.test(age_wage))
```

    ## Warning in chisq.test(age_wage): Chi-squared approximation may be incorrect

    ## 
    ##  Pearson's Chi-squared test
    ## 
    ## data:  age_wage
    ## X-squared = 17.993, df = 9, p-value = 0.03525

> Now, check the value of X-squared.

``` r
sum((age_wage-S$expected)^2/S$expected)
```

    ## [1] 17.99303

> The answer is 17.99303, which agrees with the displayed value of X-squared from the chisq.test output.
> <p>
> Then, check the computation of the p-value.

``` r
1-pchisq(17.993, df=9) 
```

    ## [1] 0.03525484

> This also agrees with the p-value given in the chisq.test output. This p-value is very small, so the hypothesis of independence of age and wage is rejected. So age and wage are dependent. \#\#\#b. Compute and display the Pearson residuals from the test of independence. Find the residuals that exceed 2 in absolute value.

``` r
S$residuals
```

    ##                
    ##                    wage < 7 7 < wage < 13 13 < wage < 20 20 < wage < 150
    ##   age < 30       2.14299887    0.04562837    -1.63223767     -0.85068711
    ##   30 < age < 40 -0.43315399    0.77114179     0.32778482     -1.04450094
    ##   40 < age < 50 -1.33389756   -0.50926944     0.87091060      1.45229077
    ##   50 < age      -0.80378247   -0.69413897     0.78042166      1.17758570

``` r
abs(S$residuals)>=2
```

    ##                
    ##                 wage < 7 7 < wage < 13 13 < wage < 20 20 < wage < 150
    ##   age < 30          TRUE         FALSE          FALSE           FALSE
    ##   30 < age < 40    FALSE         FALSE          FALSE           FALSE
    ##   40 < age < 50    FALSE         FALSE          FALSE           FALSE
    ##   50 < age         FALSE         FALSE          FALSE           FALSE

#### c. Use the function mosaicplot with the argument shade=TRUE to construct a mosaic plot of the table counts showing the extreme residuals.

``` r
mosaicplot(age_wage, shade=T, main="Age & Wage")
```

![](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Final%20Project/figure-markdown_github/unnamed-chunk-13-1.png)

#### d. Use the numerical and graphical work from parts (b) and (c) to explain how the table of age and wages differs from an independence structure.

> 觀察:
> <p>
> (b)表格：只有年紀小於30歲、時薪小於7美元的人的殘差絕對值小於2。
> <p>
> (c)圖：明顯地，所有區塊裡只有年紀小於30歲、時薪小於7美元的人被著色，而其顏色代表的是符合此條件的residual落在\[2,4\]。
> <p>
> <p>
> 結論：
> <p>
> 根據定義，任何絕對值大於2的residual的含意是偏離獨立的情況是顯著的，所以可以推論一個不到30歲的人，時薪極有可能小於７美元。

2. Basic Inference: Ch06 (Text) Exercises: (4, 5)
-------------------------------------------------

### 6.4 An experiment was performed in an introductory statistics class to illustrate the concept of measurement bias. The instructor held up a string in front of the class and each student guessed at the string’s length. The following are the measurements from the 24 students (in inches).

### 22 18 27 23 24 15 26 22 24 25 24 18

### 18 26 20 24 27 16 30 22 17 18 22 26

#### a. Use the scan function to enter these measurements into R.

``` r
measurements = scan(text = "22 18 27 23 24 15 26 22 24 25 24 18 18 26 20 24 27 16 30 22 17 18 22 26")
```

#### b. The true length of the string was 26 inches. Assuming that this sample of measurements represents a random sample from a population of student measurements, use the t.test function to test the hypothesis that the mean measurement μ is different from 26 inches.

*H*<sub>0</sub>:*μ*=26
<p>
*H*<sub>*a*</sub>:*μ*≠ 26

``` r
t.test(measurements, alternative = c("two.sided"), mu=26)
```

    ## 
    ##  One Sample t-test
    ## 
    ## data:  measurements
    ## t = -4.6148, df = 23, p-value = 0.0001216
    ## alternative hypothesis: true mean is not equal to 26
    ## 95 percent confidence interval:
    ##  20.569 23.931
    ## sample estimates:
    ## mean of x 
    ##     22.25

> 因為P-value小於0.05，拒絕虛無假說，所以我們有信心說不等於26。

#### c. Use the t.test function to find a 90% confidence interval for the population mean μ.

> 為了找出90%的信賴區間，所以我們將信心水準訂為90%。

``` r
t.test(measurements, conf.level = 0.90)
```

    ## 
    ##  One Sample t-test
    ## 
    ## data:  measurements
    ## t = 27.381, df = 23, p-value < 2.2e-16
    ## alternative hypothesis: true mean is not equal to 0
    ## 90 percent confidence interval:
    ##  20.8573 23.6427
    ## sample estimates:
    ## mean of x 
    ##     22.25

> 我們利用t.test作出90%的信賴區，且信賴區間為\[20.8573, 23.6427\]，

#### d. The t-test procedure assumes the sample is from a population that is normally distributed. Construct a normal probability plot of the measurements and decide if the assumption of normality is reasonable.

``` r
qqnorm(measurements, main = "measurements", ylab = "length")
qqline(measurements, col="red")
```

![](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Final%20Project/figure-markdown_github/unnamed-chunk-17-1.png)

> 我們利用normal quantile-quantile plot，我們可看出母體是近似常態分配，滿足我們的假設。

### 6.5 The datafile “buffalo.cleveland.snowfall.txt” contains the total snowfall in inches for the cities Buffalo and Cleveland for the seasons 1968-69 through 2008-09.

#### a. Compute the differences between the Buffalo snowfall and the Cleveland snowfall for all seasons.

``` r
snowfall = read.table("buffalo.cleveland.snowfall.txt", header=TRUE)
snowfalls=snowfall[,-1]
boxplot(snowfalls, horizontal=TRUE,xlab="snowfall")
```

![](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Final%20Project/figure-markdown_github/unnamed-chunk-18-1.png)

> 利用boxplot可以看出Buffalo的降雪量明顯比Cleveland多，不論平均數或是四分位距都是在Cleveland的右邊。

#### b. Using the t.test function with the difference data, test the hypothesis that Buffalo and Cleveland get, on average, the same total snowfall in a season.

``` r
Cleveland=snowfall$Cleveland
Buffalo=snowfall$Buffalo
(A=t.test(Buffalo,Cleveland,paired=TRUE))
```

    ## 
    ##  Paired t-test
    ## 
    ## data:  Buffalo and Cleveland
    ## t = 7.5692, df = 40, p-value = 3.061e-09
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  24.56221 42.45731
    ## sample estimates:
    ## mean of the differences 
    ##                33.50976

> 再來我們用統計方法去驗證兩邊的降雪量平均是否不同，利用Welch Two Sample t-test 去檢驗，*H*<sub>0</sub>:*μ*<sub>1</sub>=*μ*<sub>2</sub> *H*<sub>*a*</sub>:*μ*<sub>1</sub>≠*μ*<sub>2</sub>，p-value非常的小遠小於0.05，所以我們拒絕這個虛無假說，因此我們有信心說兩個樣本數的平均數不相同。

#### c. Use the t.test function to construct a 95% confidence interval of the mean difference in seasonal snowfall.

``` r
cat("95% confidence interval of Buffalo and Cleveland=",A$conf.int)
```

    ## 95% confidence interval of Buffalo and Cleveland= 24.56221 42.45731

<p>
　　
</p>
<p>
　　
</p>
3. One-Way ANOVA: Ch08 (Text) Exercises: (3-4: Iris data)
---------------------------------------------------------

### 8.3 (Differences in iris by species). The iris data has 50 observations of four measurements for each of three species of iris: setosa, versicolor, and virginica. We are interested in possible differences in the sepal length of iris among the three species. Perform a preliminary analysis as in Example 8.3. Write the effects model for a one-way ANOVA. What are the unknown parameters? Next fit a one-way ANOVA model for Sepal.Length by Species using lm. Display the ANOVA table. What are the parameter estimates?

> 我們感興趣的是鳶尾花(iris)的三種品種(setosa,versicolor,and virginica)間萼片長度是否存在差異性， 在統計上我們會從setosa，versicolor，virginica三個母體中進行抽樣並測量其萼片的長度作為我們的Sample data，再用這些數據進行統計推論，推測這些母體的平均值是否相同。 我們先假設這三個母體是服從互相獨立且有平均值*μ*<sub>1</sub>, *μ*<sub>2</sub>, *μ*<sub>3</sub>和共同的變異數*σ*<sup>2</sup>的常態分配，而在這樣的假設下，我們感興趣的問題即是一個單因子變異數分析(ANOVA)的問題。
> <p>
> 　　虛無假說 *H*<sub>0</sub>：*μ*<sub>1</sub> = *μ*<sub>2</sub> = *μ*<sub>3</sub>
> </p>
> <p>
> 　　對立假說 *H*<sub>1</sub>：至少有兩個平均值不相等
> </p>
> <p>
> One-way ANOVA model為：(means model)
> </p>
> <p>
> 　　　　　　　　*Y*<sub>*i**j*</sub> = *μ*<sub>*i*</sub> + *ϵ*<sub>*i**j*</sub>,　　*i* = 1, 2, 3,　*j* = 1, ..., 50
> </p>
> <p>
> 另一種One-way ANOVA model形式為：(effects model)
> </p>
> <p>
> 　　　　　　　　*Y*<sub>*i**j*</sub> = *μ* + *τ*<sub>*i*</sub> + *ϵ*<sub>*i**j*</sub>,　　*i* = 1, 2, 3,　*j* = 1, ..., 50
> </p>
> <p>
> 　　隨機變數*Y*<sub>*i**j*</sub>是代表從第*i*個樣本抽出的第*j*個觀察值。
> </p>
> <p>
> 　　*τ*<sub>*i*</sub>是與母體*i*相關的一個參數，稱為第*i*個處理的效應(treatment effect)，
> </p>
> <p>
> 　　參數 *μ* 與 *τ*<sub>*i*</sub> 滿足等式 *E*\[*Y*<sub>*i**j*</sub>\] = *μ* + *τ*<sub>*i*</sub>，
> </p>
> <p>
> 　　在一些書中 *μ* 為grand mean(所有*μ*<sub>*i*</sub>的總平均)，即 $\\mu=\\frac{1}{3}\\sum\_{i=1}^{3}\\mu\_{i}$，
> </p>
> <p>
> 　　但在R語言中進行變異數分析時似乎並不是把grand mean作為 *μ*。
> <p>
> 　　*ϵ*<sub>*i**j*</sub>為隨機誤差，代表第*i*個樣本的第*j*個觀察值與對應處理平均之間的偏差。
> </p>
> <p>
> 　　
> </p>
> <p>
> 在此模型下可將虛無假說與對立假說轉換為
> </p>
> <p>
> 　　*H*<sub>0</sub>：*τ*<sub>1</sub> = *τ*<sub>2</sub> = *τ*<sub>3</sub> = 0
> </p>
> <p>
> 　　*H*<sub>1</sub>：至少有一個*τ*<sub>*i*</sub>不等於0
> </p>
> <p>
> 　　
> </p>
> <p>
> Unknown parameters are *μ*, *τ*<sub>1</sub>, *τ*<sub>2</sub>, *τ*<sub>3</sub>, *σ*<sup>2</sup>
> </p>
> <p>
> 但在R by Example的課本中有提到，這樣未知的參數就比使用means model時多了一個，所以必須對其加些限制，將這5個參數轉換為其中4個參數的關係式。而在R中是讓*τ*<sub>1</sub> = 0，即讓*μ* = *μ*<sub>1</sub>，有點以treatment 1為基準，再衡量*τ*<sub>2</sub>, *τ*<sub>3</sub>，另外兩品種與品種1組間變異的味道。
> </p>
> <p>
> 所以未知的參數變成：*μ*, *τ*<sub>2</sub>, *τ*<sub>3</sub>, *σ*<sup>2</sup>
> </p>
> <p>
> 　　
> </p>
> <p>
> 　　
> </p>
> 現在，我們開始使用R統計軟體進行變異數分析，R預裝的datasets包裡就已經有了可以作為Sample data使用的iris資料集

``` r
str(iris)
```

    ## 'data.frame':    150 obs. of  5 variables:
    ##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
    ##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
    ##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
    ##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
    ##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

``` r
head(iris)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa
    ## 2          4.9         3.0          1.4         0.2  setosa
    ## 3          4.7         3.2          1.3         0.2  setosa
    ## 4          4.6         3.1          1.5         0.2  setosa
    ## 5          5.0         3.6          1.4         0.2  setosa
    ## 6          5.4         3.9          1.7         0.4  setosa

``` r
table(iris$Species)
```

    ## 
    ##     setosa versicolor  virginica 
    ##         50         50         50

> 該資料集有4個數值型變數，分別是Sepal.Length(萼片長)、Sepal.Width(萼片寬)、Petal.Length(花瓣長)、Petal.Width(花瓣寬)，1個類別型變數Species(品種)\[one factor/3 levels: setosa, versicolor, and virginica\]，每個變數都有150筆觀測值，其中每種品種各有50筆。
> <p>
> 　　
> </p>
> <p>
> 我們先用`lm()`函數去配適萼片長度基於基於其品種的模型，並把結果存放至變數L中，
> </p>
> <p>
> `lm(num ~ num)`當左右皆為數值型向量時，`lm`函數會配適一個線性回歸模型，
> </p>
> <p>
> `lm(num ~ factor)`而當右邊放的是因素向量時，就能配適我們現在需要的ANOVA模型，
> </p>
> <p>
> 再對`lm`產生的物件L使用`anova()`函數即可秀出ANOVA Table。
> </p>

``` r
L = lm(iris$Sepal.Length~iris$Species)
anova(L)
```

    ## Analysis of Variance Table
    ## 
    ## Response: iris$Sepal.Length
    ##               Df Sum Sq Mean Sq F value    Pr(>F)    
    ## iris$Species   2 63.212  31.606  119.26 < 2.2e-16 ***
    ## Residuals    147 38.956   0.265                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

> p-value小於0.05，拒絕虛無假說，我們有信心說三個品種的平均數並不相同。

``` r
L$coefficients
```

    ##            (Intercept) iris$Speciesversicolor  iris$Speciesvirginica 
    ##                  5.006                  0.930                  1.582

> 這三個係數分別是使用最小平方法所估出來的參數 *μ*, *τ*<sub>2</sub>, *τ*<sub>3</sub>
> <p>
> 而Residuals的MSE *0.265* 則是*σ*<sup>2</sup>的估計值
> </p>

``` r
(Means = tapply(iris$Sepal.Length,iris$Species,mean))
```

    ##     setosa versicolor  virginica 
    ##      5.006      5.936      6.588

> 計算出三個樣本的平均數後可以確認到參數 *μ* 確實是treatment 1的mean *μ*<sub>1</sub>

### 8.4 (Checking model assumptions). Refer to your results from Exercise 8.3. What are the assumptions required for inference? Analyze the residuals of the model to assess whether there is a serious departure from any of these assumptions. How can you check for normality of the error variable?

> 為了進行推論所需要的假設為3個母體是具有相同變異數的常態分配，我們現在藉著分析配適後的殘差(residuals)來檢查我們的母體是否真的有貼近這些假設。

``` r
par(mfrow=c(1,2))
plot(L$fit, L$res, main="Residuals vs Fitted", xlab="Fitted Values", ylab="Residuals")
abline(h=0, col="blue")

qqnorm(L$res, ylab="Sample Quantiles of Residuals")
qqline(L$res, col="blue")
```

![](https://raw.githubusercontent.com/SundayDonghuLight/Statistical-Software-R/master/2018_Statistical%20Software%20and%20Practical%20Application_Final%20Project/figure-markdown_github/unnamed-chunk-25-1.png)

> <p>
> 先畫出Fitted Values與Residuals的點散圖，這邊的Fitted Values即為使用最小平方法所預測出來的平均數，即$\\widehat{\\mu\_{1}},\\widehat{\\mu\_{2}},\\widehat{\\mu\_{3}}$，y座標則為Sample data與其對應的母體平均數估測值之間的殘差，從圖中可看出這三組樣本的離散程度是有所差異的，與我們假設的具有相同變異數有些不符合，不過差異的程度並不是很嚴重，對分析結果的影響大概還在可接受的範圍。
> <p>
> 再來檢查殘差是否符合常態性，也就是模型裡面的error項是否滿足為常態分配的假設，我們可以藉由normal quantile-quantile plot來看其與標準常態分配理論值的百分位數是否有差不多的分配。從圖中和qqline可看出確實符合常態性的假設。
> </p>
