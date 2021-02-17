# Pros: very simple, training is trivial, works with any number of classes, easy to add more data, few parameters, k, distance metric
# cros: high prediction cost, worse for large data sets, not good with high dimensional data, categorical features do not work well

#GET THE DATA
install.packages("ISLR")
library(ISLR)
str(Caravan)
summary(Caravan$Purchase)
any(is.na(Caravan))
var(Caravan[,1])
var(Caravan[,2])

purchase <- Caravan[,86]

#Identify the datasheet
standardized.Caravan <- scale(Caravan[,-86])
print(var(standardized.Caravan[,1]))
print(var(standardized.Caravan[,2]))

#Train test split in the data
test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

#train data
train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]

#####
# KNN model
library(class)
set.seed(101)
predicted.purchase <- knn(train.data, test.data,train.purchase, k =1)
print(head(predicted.purchase))
misclass.error <- mean(test.purchase != predicted.purchase)
print(misclass.error)

#Choosing the k value
####
predicted.purchase <- knn(train.data, test.data,train.purchase, k =3)
print(head(predicted.purchase))
misclass.error <- mean(test.purchase != predicted.purchase)
print(misclass.error)

predicted.purchase <- knn(train.data, test.data,train.purchase, k =5)
print(head(predicted.purchase))
misclass.error <- mean(test.purchase != predicted.purchase)
print(misclass.error)

#how to chose the best K value
predicted.purchase <- NULL
error.rate <- NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase, k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}
print(error.rate)

### VISUALIZE K ELBOW METHOD
####
library(ggplot2)
predicted.purchase <- NULL
error.rate <- NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase, k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}
print(error.rate)
k.values <- 1:20
error.df <- data.frame(error.rate, k.values)
print(error.df)
ggplot(error.df,aes(k.values, error.rate)) + geom_point() + geom_line(lty="dotted", color="red")
