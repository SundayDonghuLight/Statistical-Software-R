Rglpk 線性規劃套件
================

(R interface to the GNU Linear Programming Kit)
===============================================

線性規劃簡介-標準型問題
-----------------------

#### 所有的線性規劃問題都可以轉換成下列標準型：

　min　　　　　　*c*<sub>1</sub>*x*<sub>1</sub> + *c*<sub>2</sub>*x*<sub>2</sub> + ......+*c*<sub>*n*</sub>*x*<sub>*n*</sub><p>
　subject　to　　*a*<sub>11</sub>*x*<sub>1</sub> + *a*<sub>12</sub>*x*<sub>2</sub> + ......+*a*<sub>1*n*</sub>*x*<sub>*n*</sub>　=*b*<sub>1</sub><p>
　　　　　　　　*a*<sub>21</sub>*x*<sub>1</sub> + *a*<sub>22</sub>*x*<sub>2</sub> + ......+*a*<sub>2*n*</sub>*x*<sub>*n*</sub>　=*b*<sub>2</sub><p>
　　　　　　　　　⋮　　　　　　　　　　　⋮<p>
　　　　　　　　*a*<sub>*m*1</sub>*x*<sub>1</sub> + *a*<sub>*m*2</sub>*x*<sub>2</sub> + ......+*a*<sub>*mn*</sub>*x*<sub>*n*</sub> = *b*<sub>*m*</sub><p>
　　　　　　　　*x*<sub>1</sub> ≥ 0, *x*<sub>2</sub> ≥ 0, ......,*x*<sub>*n*</sub> ≥ 0

#### 實際應用範例-排班問題(flight schedule assignment problem)

某航空公司新添購了數架客機以應付市場上所增加的需求量，因此該公司同時必須增聘一批空服員以因應航班次數的增加。公司的總經理便請人事部門研究「如何花費最少的人事費用而能滿足增加的空服需求」。
該公司根據航班時刻表將一天24小時分成十個時段，並由空服部計算出每一時段所需要增加的空服員數。

| 時段          | 空服員數 |
|---------------|----------|
| 　6 AM~8 AM   | 48       |
| 　8 AM~10 AM  | 79       |
| 　10 AM~12 AM | 65       |
| 　12 AM~2 PM  | 87       |
| 　2 PM~4 PM   | 64       |
| 　4 PM~6 PM   | 73       |
| 　6 PM~8 PM   | 82       |
| 　8 PM~10 PM  | 43       |
| 　10 PM~12 PM | 52       |
| 　12 PM~6 AM  | 15       |

另外，人事部門將一天24小時分成五個班，每班的時刻與日薪為

| 班別                 | 日薪 |
|----------------------|------|
| 　第一班：6 AM~2 PM  | 3400 |
| 　第二班：8 AM~4 PM  | 3200 |
| 　第三班：12 AM~8 PM | 3500 |
| 　第四班：4 PM~12 PM | 3600 |
| 　第五班：10 PM~6 AM | 3900 |

問題：每班各需增聘多少空服員可以滿足空服需求，並且使得人事費用最少<p>
　<p>
　<p>
**Solution：**<p>
　　目標函數：*Z* = 3400*X*<sub>1</sub> + 3200*X*<sub>2</sub> + 3500*X*<sub>3</sub> + 3600*X*<sub>4</sub> + 3900*X*<sub>5</sub><p>
　　約束條件：*X*<sub>1</sub>　　　　　　 　 ≥48　　(6 A.M.~8 A.M.)<p>
　　　　　　　*X*<sub>1</sub>＋*X*<sub>2</sub>　　　　　≥79　　(8 A.M.~10 A.M.)<p>
　　　　　　　*X*<sub>1</sub>＋*X*<sub>2</sub>　　　　　≥65　　(10 A.M.~12 A.M.)<p>
　　　　　　　*X*<sub>1</sub>＋*X*<sub>2</sub>＋*X*<sub>3</sub>　 　 ≥87　　(12 A.M.~2 P.M.)<p>
　　　　　　　*X*<sub>2</sub>＋*X*<sub>3</sub>　　　　　≥64　　(2 P.M.~4 P.M.)<p>
　　　　　　　*X*<sub>3</sub>＋*X*<sub>4</sub>　　　　　≥73　　(4 P.M.~6 P.M.)<p>
　　　　　　　*X*<sub>3</sub>＋*X*<sub>4</sub>　　　　　≥82　　(6 P.M.~8 P.M.)<p>
　　　　　　　*X*<sub>4</sub>　　　　　　 　 ≥43　　(8 P.M.~10 P.M.)<p>
　　　　　　　*X*<sub>4</sub>＋*X*<sub>5</sub>　　　　　≥52　　(10 P.M.~12 P.M.)<p>
　　　　　　　*X*<sub>5</sub>　　　　　　 　 ≥15　　(12 P.M.~6 A.M.)<p>
　
　
　

Rglpk包介紹：
-------------

### 主要函數

　　`Rglpk_solve_LP((obj, mat, dir, rhs, bounds = NULL, types = NULL, max = FALSE,control = list(), ...))`

| 參數    | 作用                                                                    |
|---------|-------------------------------------------------------------------------|
| obj     | 規劃目標係數                                                            |
| mat     | 約束條件係數矩陣                                                        |
| dir     | 約束條件方向向量，由’&gt;’、’&lt;’、’=’構成                             |
| rhs     | 約束值                                                                  |
| bounds  | 上下限的約束，默認值0到INF                                              |
| types   | 限定目標變量的類型，’B’指的是0-1規劃,’C’代表連續,’I’代表整數，默認是’C’ |
| max     | 線性規劃目的是否為最大化目標函數，預設為 FALSE                          |
| control | 包含四個變數verbose、presolve、tm\_limit、canonicalize\_status。        |

### 安裝與載入Package "Rglpk"

``` r
if(!require(weatherData)) install.packages("Rglpk",repos = "http://cran.us.r-project.org")
require(Rglpk)
```

### Example 1

maximize: 2 × *x*<sub>1</sub> + 4 × *x*<sub>2</sub> + 3 × *x*<sub>3</sub><p>
subject to: 3 × *x*<sub>1</sub> + 4 × *x*<sub>2</sub> + 2 × *x*<sub>3</sub> ≤ 60<p>
　　　　　2 × *x*<sub>1</sub> + 1 × *x*<sub>2</sub> + 2 × *x*<sub>3</sub> ≤ 40<p>
　　　　　1 × *x*<sub>1</sub> + 3 × *x*<sub>2</sub> + 2 × *x*<sub>3</sub> ≤ 80<p>
　　　　　*x*<sub>1</sub> ≥ 0, *x*<sub>2</sub> ≥ 0, *x*<sub>3</sub> ≥ 0<p>

``` r
## Simple linear program.
## maximize: 2 x_1 + 4 x_2 + 3 x_3
## subject to: 3 x_1 + 4 x_2 + 2 x_3 <= 60
## 2 x_1 + x_2 + 2 x_3 <= 40
## x_1 + 3 x_2 + 2 x_3 <= 80
## x_1, x_2, x_3 are non-negative real numbers
obj <- c(2, 4, 3)
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(60, 40, 80)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)
```

    ## $optimum
    ## [1] 76.66667
    ## 
    ## $solution
    ## [1]  0.000000  6.666667 16.666667
    ## 
    ## $status
    ## [1] 0
    ## 
    ## $solution_dual
    ## [1] -1.833333  0.000000  0.000000
    ## 
    ## $auxiliary
    ## $auxiliary$primal
    ## [1] 60.00000 40.00000 53.33333
    ## 
    ## $auxiliary$dual
    ## [1] 0.8333333 0.6666667 0.0000000

### Example 2

承接前面介紹的應用題
minimize: 3400 × *X*<sub>1</sub> + 3200 × *X*<sub>2</sub> + 3500 × *X*<sub>3</sub> + 3600 × *X*<sub>4</sub> + 3900 × *X*<sub>5</sub>
subject to(coefficient matrix):

``` r
obj <- c(3400, 3200, 3500, 3600 ,3900)
mat <- matrix(c(1,1,1,1,0,0,0,0,0,0, 0,1,1,1,1,0,0,0,0,0, 0,0,0,1,1,1,1,0,0,0, 0,0,0,0,0,1,1,1,1,0, 0,0,0,0,0,0,0,0,1,1), nrow = 10)
dir <- c(">=", ">=", ">=", ">=", ">=", ">=", ">=", ">=", ">=", ">=")
rhs <- c(48, 79, 65, 87, 64, 73, 82, 43, 52, 15)
types <- c("I", "I", "I", "I", "I", "I", "I", "I", "I", "I")
Rglpk_solve_LP(obj, mat, dir, rhs, types = types)
```

    ## $optimum
    ## [1] 612200
    ## 
    ## $solution
    ## [1] 48 31 39 43 15
    ## 
    ## $status
    ## [1] 0
    ## 
    ## $solution_dual
    ## [1] NA
    ## 
    ## $auxiliary
    ## $auxiliary$primal
    ##  [1]  48  79  79 118  70  82  82  43  58  15
    ## 
    ## $auxiliary$dual
    ## [1] NA

求得該問題的最佳解(*X*<sub>1</sub>, *X*<sub>2</sub>, *X*<sub>3</sub>, *X*<sub>4</sub>, *X*<sub>5</sub>)=(48, 31, 39, 43, 15)<p>
output中`$optimum`為**目標函數的最小值**，即每一工作日需要增加的人事費用最少為**612200元**<p>
`auxiliary$primal`　　(48, 79, 79, 118, 70, 82, 82, 43, 58, 15)在這邊的意義是代表著各時段值班的空服員數<p>
可以觀察到有滿足限制條件(48, 79, 65, 87, 64, 73, 82, 43, 52, 15) 　　<p>
　　 　　<p>
數學背景知識介紹<p>
<https://ccjou.wordpress.com/?s=%E7%B7%9A%E6%80%A7%E8%A6%8F%E5%8A%83><p>
　　<p>
線性規劃一：標準型問題<p>
<https://ccjou.wordpress.com/2013/04/29/%E7%B7%9A%E6%80%A7%E8%A6%8F%E5%8A%83-%E4%B8%80%EF%BC%9A%E6%A8%99%E6%BA%96%E5%9E%8B%E5%95%8F%E9%A1%8C/><p>
　　<p>
維基百科:單純型法<p>
<https://en.wikipedia.org/wiki/Simplex_algorithm><p>
