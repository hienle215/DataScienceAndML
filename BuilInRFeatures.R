# Buil in R features
# Seq() create a sequences
# Sort () sort a vector
# rev() reverse elements in objects
# str() reverse elements in object
#append() merge objects together (works on vectors and lists)

seq(0, 10, by = 2)
0:10
seq(0, 100, by = 10)
seq(0, 24, by = 2)
help("seq")


v <- c(1,4,7,2,13,3,11)
v
sort(v)
sort(v, decreasing = T)
cv <- c("b","d","a")
sort(cv)
cv <- c("b","d","a", "C")
sort(cv)


v <- 1:10
v
rev(v)

str(v)
str(mtcars)
summary(mtcars)

v <- 1:10
v2 <- 35:40
v
v2
append(v,v2)

# Checking data type
v <- c(1,2,3)
is.vector(v)

#as.
v
as.list(v)
as.matrix(v)

#converting the data type
