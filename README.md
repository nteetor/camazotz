# camazotz
> "But that's exactly what we have on Camazotz. Complete equality. Everybody exactly alike." For a moment her brain reeled with confusion. Then came a moment of blazing truth. "No!" she cried triumphantly. "Like and equal are not the same thing at all!"...Like and equal are two entirely different things.
>
> Madeleine L'Engle, *A Wrinkle in Time*

Uniform printing of R objects. 

### Motivation

Print statements are not uniform. Within the `base` package alone there are a variety of outputs,

#### Vectors
```R
x <- 1:10
x
# [1] 1 2 3 4 5 
```

```R
names(x) <- paste0('name', LETTERS[x])
x
# nameA nameB nameC nameD nameE nameF nameG nameH nameI nameJ 
#     1     2     3     4     5     6     7     8     9    10
```

```R
numeric(1)
# [1] 0
```

```R
numeric(0)
# numeric(0)
```

#### Lists
```R
l <- vector('list', 5)
l 
# [[1]]
# NULL
# 
# [[2]]
# NULL
# 
# [[3]]
# NULL
# 
# [[4]]
# NULL
# 
# [[5]]
# NULL
#
```

```R
list(first = 1, second = c(2, 2), third = list(3, 3, 3), 
     fourth = head(iris))
# $first
# [1] 1
# 
# $second
# [1] 2 2
# 
# $third
# $third[[1]]
# [1] 3
# 
# $third[[2]]
# [1] 3
# 
# $third[[3]]
# [1] 3
# 
# 
# $fourth
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa
# 
```

```R
list()
# list()
```

#### Data Frames

```R
mtcars[1:10, ]
#                    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
# Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```

```R
mtcars[1, ]
#                    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
```

```R
mtcars[0, ]
#  [1] mpg  cyl  disp hp   drat wt   qsec vs   am   gear carb
# <0 rows> (or 0-length row.names)
```


### Standardizing the Output

#### Object Components

What belongs in the printout of an object? (work in progress)

- class (the object's class)
- object data (the data the object's class interprets)
    - size (number of elements, number of rows x columns, number of dimensions, etc.)
    - class (the data or fields' classes)
    - output cutoff (a display limit for underlying data, e.g. tibbles cut off at 10 rows)
    - representation of truncated data (when data are truncated how does one meaningfully convey a summary of the remaining data)
- output format
    - one of,
        1. deep (?): the object contains lots of nested data
        2. wide (?): the object contains lots of fields with atomic values

##### Layout of components

The printout of a tibble is a good example of readable output,

```
# A tibble: 150 × 5
   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
          <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
1           5.1         3.5          1.4         0.2  setosa
2           4.9         3.0          1.4         0.2  setosa
3           4.7         3.2          1.3         0.2  setosa
4           4.6         3.1          1.5         0.2  setosa
5           5.0         3.6          1.4         0.2  setosa
6           5.4         3.9          1.7         0.4  setosa
7           4.6         3.4          1.4         0.3  setosa
8           5.0         3.4          1.5         0.2  setosa
9           4.4         2.9          1.4         0.2  setosa
10          4.9         3.1          1.5         0.1  setosa
# ... with 140 more rows
```

### Tradeoffs of uniformity

Simple data looks grossly over represend in readable format. Take a numeric
vector for example.

```R
v <- 1:5
readable(v)
```

```
# A numeric vector: 5
1 2 3 4 5
```

(subject to change as the project develops)

---

