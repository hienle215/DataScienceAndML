#Ex 1: Recreate the following dataframe by creating vectors and using the data.frame function

Age <- c(22, 25, 26)
Weight <- c(155,165,120)
Sex <- c("M", "M","F")
df<- data.frame(Age, Weight, Sex)
df <- row.names("Sam","frank","Amy")
row.names(df) <- c("Sam", "Frank", "Amy")
df

#Ex 2: Check if mtcars is a dataframe using is.data.frame()
is.data.frame(df)

#Ex 3: Use as.data.frame() to convert a matrix into a dataframe
mat <- matrix(1:25, nrow = 5)
mat
as.data.frame(mat)

#Ex 4: Set the built-in data frame mtcars as a variable df. We'll use this df variable for the rest of the exercises
df2 <- mtcars
df2

#Ex 5: Display the first 6 rows of df
df2[1:6,]

#Ex 6: What is the average mpg value for all the cars?
mean(df2$mpg)

#Ex 7: Select the rows where all cars have 6 cylinders (cyl column)
df2[df2$cyl == 6,]

#Ex 8: Select the columns am,gear, and carb.
df2[, c("am","gear","carb")]

#Ex 9: Create a new column called performance, which is calculated by hp/wt.
df2$performane <- df2$hp/df2$wt
df2

#Ex 10: Your performance column will have several decimal place precision. Figure out how to use round() (check help(round)) to reduce this accuracy to only 2 decimal places.

df2$performane <- round(df2$performane,2)
head(df2)

#Ex 11: What is the average mpg for cars that have more than 100 hp AND a wt value of more than 2.5.
mean(subset(df2,hp>100 & wt>2.5)$mpg)

#Ex12  What is the mpg of the Hornet Sportabout?
df2["Hornet Sportabout",]$mpg
