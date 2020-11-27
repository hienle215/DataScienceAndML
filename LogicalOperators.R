### Logical operators

# and
x <- 10
x > 20
x < 5
x < 20 & x > 5
(x < 20) & (x > 5)
(x < 20) & (x > 5) & (x= 10)
(x < 20) & (x > 5) & (x==9)
TRUE & TRUE
TRUE & FALSE
x == 100
x == 10
(x==10) | (x==100)
(x==100000) | (x==100)
(10 == 1)
!(10 == 1)
!!(10 == 1)
!!!!!(10 == 1)
df <- mtcars
head(df)
df[df$mpg > 20,]
subset(df, mpg > 20)
df[(df$mpg > 20) & (df$hp > 100),]
df[(df$mpg > 20) | (df$hp > 100),]
