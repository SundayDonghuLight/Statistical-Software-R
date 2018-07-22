中級程式設計期中作業
================

**備貨量與最佳利潤**
--------------------

### 參考" A First Course in Probability Sheldon Ross Ninth Edition "P134 Example 4b

> A product that is sold seasonally yields a net profit of b dollars for each unit sold and a net loss of l dollars for each unit left unsold when the season ends. The number of unit of the product that are ordered at a specific department store during any season is a random variable having probability mass function p(i),i&gt;=0. If the store must stock this product in advance, determine the number of units the store should stock so as to maximize its expected profit.
>
> ### *Solution*
>
> Let **X** denote the number of units ordered. If *s* units are stocked,then the profit - call it P(*s*) - can be expressed as
> <center>
> *P*(*s*) = *b***X** − (*s*−**X**)*l*　　**i****f**　　**X**≤ *s*
> </center>
> <center>
> 　　　=*s**b*　　　　　　　　　**i****f**　　**X**&gt; *s*
> </center>
> Hence,the expected profit equals
> <center>
> $E\\left \[ P\\left ( s \\right ) \\right \]= \\sum\_{i= 0}^{s}\\left \[ bi- \\left ( s-i \\right )l\\right \]p\\left ( i \\right )+\\sum\_{i=s+1}^{\\infty }sbp\\left ( i \\right )$
> </center>
> 　 　 　

### 實際化後的欲解題目

> handsome-dogs冰淇淋批發商每桶進貨的價格為1000元，售價訂為4000元。假設必須在每季開始前就預先備好庫存，且於當該季結束時還沒賣掉的冰淇淋就得淘汰掉不能留到下一季。即每桶售出淨利潤為3000元，每留下一桶的淨虧損為1000元。今天根據經驗，每季訂單量可能的範圍在100~800桶，且其發生的可能性均相等，則該批發商應該要進幾桶的handsome-dogs冰淇淋才能預期得到最大的利潤呢?

### 訂單p.m.f.

<p>
設定一個function用來產生每筆訂單數量所對應的機率值，並合併成一dataframe回傳
<p>
訂單的所有可能值用 `seq()` 函數產生1~800間隔為1的向量並存在變數"x"中，變數"n"儲存向量的長度
<p>
將函數回傳的訂單機率p.m.f.dataframe存在變數"order"中
<p>
``` r
rm(list=ls())

order_prob <- function(x){
  n <- length(x)
  y <- rep(1/n,n)
  order <- data.frame(x,y)
  return(order)
}

x <- seq(100,800,1)
n <-length(x)
order <- order_prob(x)
```

### 利潤期望值

<p>
設定一個用來算給定備貨量下利潤期望值的function
<p>
4個傳入值分別為stock(備貨量)、order(訂單的p.m.f.)、benifit(售出淨利潤)、loss(滯銷淨虧損)
<p>
因備貨量小於訂單最小可能數和大於訂單最大可能數時期望值一定不是最大的，所以我們只需考慮在訂單可能範圍之間的情形
<p>
用迴圈把訂單數小於等於備貨量時的利潤乘上該訂單量的機率加總存進變數"enough.sum"
<p>
同樣把訂單數大於備貨量時的利潤乘上該訂單量的機率加總存進變數"notenough.sum"
<p>
並把這兩個變數相加即是給定備貨量時在各訂單數量下的利潤乘上其機率的加總，正是期望值的定義
<p>
``` r
E <- function(stock,order,benifit,loss){
  enough.sum <- 0
  notenough.sum <- 0
  n <- length(order[[1]])
  for(i in order[1,1]:stock){ 
    enough <- ( ( benifit*i - (stock-i)*loss ) * order[(i-order[1,1]+1),2] )
    enough.sum <- enough.sum + enough
  }
  for(j in (stock+1):order[n,1]){
    notenough <- ( stock*benifit*order[(j-order[1,1]+1),2] )
    notenough.sum <- notenough.sum + notenough
  }   
  expected.profit <- enough.sum + notenough.sum
  return(expected.profit)
}
```

### 最佳備貨量

<p>
定義4個變數:
<p>
　max.expected.value(存放當前最大的期望值)
<p>
　best.stock(最佳的備貨量)
<p>
　stock.num(用向量儲存逐一累加的備貨量)
<p>
　stock.profit(用向量儲存備貨量所對應的利潤期望值)
<p>
並用迴圈將備貨量從訂單最小可能值逐一累加去計算該備貨量下的期望值
<p>
將代表備貨量的"k"值及算出的期望值以向量方式儲存以便之後繪圖
<p>
用 `if()` 函數判斷如果大於目前儲存的最大期望值則重新給定最大期望值，並把當前"k"值存入最佳備貨量
<p>
經過電腦運算後show出最佳的備貨量及該備貨量下的利潤
<p>
``` r
max.expected.value <- 0
best.stock <- 0
stock.num <- NULL
stock.profit <- NULL

for(k in order[1,1]:order[n-1,1]){
  expected.profit <- E(k,order,3000,1000)
  stock.num[k] <- k
  stock.profit[k] <- expected.profit
  if(expected.profit > max.expected.value){
    max.expected.value <- expected.profit
    best.stock <- k
  }
}

cat("The best number of stock is ",best.stock); cat("and profit is ",max.expected.value," NT dollars")
```

    ## The best number of stock is  625

    ## and profit is  1087126  NT dollars

繪出備貨量與利潤的散點圖，可看出整體的關係與趨勢

``` r
plot(stock.num, stock.profit, main="Scatter plot of stock and profit", type='l')
```

![](README_files/figure-markdown_github/unnamed-chunk-4-1.png)
