# camazotz
> "But that's exactly what we have on Camazotz. Complete equality. Everybody exactly alike."

### standards

The print out of a tibble is a good example of readable output,
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

Below is the generic description and format of readable output,

```
# A <class>: <dimensions in the form "{depth/rows} x {width/columns}" or length in the form "{length}">
<enumeration> <data>
```

If `<data>` are truncated add,

```
# ... with {number of remaining data}
```

### tradeoffs

Simple data looks grossly over represend in readable format. Take a numeric
vector for example.

```R
v <- 1:5
readable(v)
```

```
# 
```

