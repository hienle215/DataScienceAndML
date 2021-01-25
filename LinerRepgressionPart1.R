# Get the data
# https://archive.ics.uci.edu/ml/datasets/student+Performance
# Student performance data set

df <- read.csv("student-mat.csv")
head(df)

df <- read.csv("student-mat.csv", sep=";")
head(df)

any(is.na(df)) #it means no na values

str(df) # checking structure of data fames
# analyse by ggplot 2

library(ggplot2)
library(ggthemes)
install.packages("dplyr")
library(dplyr)

#Number only for presenting the data
num.cols <- sapply(df, is.numeric)

#filter
cor.data <- cor(df[,num.cols])
# Print out the column data
print(cor.data)

#Install
install.packages("corrgram")
install.packages("corrplot")
library(corrgram)
library(corrplot)
# the pakages will make the regulation data 
print(corrplot(cor.data,method="color"))
corrgram(df)
help("corrgram")
corrgram(df,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)
library(ggplot2)
ggplot(df,aes(x=G3)) + geom_histogram(bins=20,alpha=0.5,fill="blue")
