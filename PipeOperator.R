#pipe operator
library(dplyr)
df <- mtcars

#Nesting
filter(df, mpg >20)
result <- arrange(sample_n(filter(df, mpg >20), size=5),desc(mpg))
print(result)

#Multiple assignments
a <- filter(df,mpg>20)
b <- sample_n(a,size=5)
resutl <- arrange(b, desc(mpg))
print(result)

#pipe operator

#Data %>% op1 %>% op2 %>% op3
results <- df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))
print(result)
