# Overview of Data Fame 

#Creating Data frame
empty <- data.frame()
letters
c2 <- letters[1:10]
c1
c2
df <- data.frame(col.name.1 = c1, col.name.2 = c2)
df
d2 <- read.csv("some_file.csv")
write.csv(df, file = "saved_df.csv")
df2 <- read.csv("saved_df.csv")
df2
df
nrow(df)
ncol(df)
colnames(df)
rownames(df)
str(df)
summary(df)
df
df[[5,2]]
df[[5,"col.name.2"]]
df[[2,"col.name.1"]] <- 9999
df

#referencing row
df[1,]
mtcars
head(mtcars)
mtcars$mpg
mtcars[,"mpg"]
mtcars[,1]
mtcars[["mpg"]]
mtcars["mpg"]
head(mtcars[c("mpg","cyl")])
