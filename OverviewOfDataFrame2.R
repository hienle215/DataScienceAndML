# Introduction to Data frame in R part 2

# Adding rows
df2 <- data.frame(col.name.1 = 2000, col.name.2 = "new")
df2

#Data frame in part 1
empty <- data.frame()
letters
c2 <- letters[1:10]
c1 <- 1:10
c1
df <- data.frame(col.name.1 = c1, col.name.2 = c2)
df
df[[2,"col.name.1"]] <- 9999
df

dfnew <- rbind(df,df2)
dfnew

#Adding columns
df$newcol <- 2*df$col.name.1
df

#Copy
df$newcol.copy <- df$newcol
df$newcol.copy

df[,"newcol.copy2"] <- df$newcol
head(df)

colnames(df)
colnames(df) <- c("1", "2", "3", "4", "5")
head(df)

colnames(df)[1] <- "NEW COL NAME"
head(df)

# Selecting the multiple rows
df[1:10, ]
df[1:3,]
head(df)
head(df, 7)

df[-2,]

head(mtcars)
mtcars[ mtcars$mpg > 20, ]

mtcars[ mtcars$mpg > 20 & mtcars$cyl == 6,]
mtcars[ mtcars$mpg > 20 & mtcars$cyl == 6, c("mpg","cyl","hp")]

subset(mtcars, mpg >20 & cyl == 6)

# Selecting the multiple columns
mtcars[, c(1,2,3)]
mtcars[, c("mpg", "cyl")]

#Dealing with Missing Data
is.na(mtcars)
is.na(df)
any(is.na(df))

df[is.na(df)] <- 0
mtcars$mpg[is.na(mtcars$mpg)] <- mean(mtcars$mpg)
