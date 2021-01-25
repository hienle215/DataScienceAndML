# CSV Files
# Creating the CSV files
write.csv(mtcars, files = "mysample.csv")

#Reading the CSV files
ex <- read.csv("example.csv")
head(mtcars)

#Writing
write.csv(ex,file = "my_new_example.csv")
read.csv("myexample.csv")

help("read.csv")

sessionInfo()
