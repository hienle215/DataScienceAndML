##KNN project
### Since KNN is siuch a simple algorithm,we will use this project as a simple exercies to test your understanding of the implementation of KNN:
### Iris data sheet
### https://en.wikipedia.org/wiki/Iris_flower_data_set

### use the ISLR library to get the iris data set. Check the head of the iris data frame
library(ISLR)
head(iris)
str(iris)


#### STANDARDIZE DATA
# in this case, the iris data set has all its features in the same order of magnitude, but its good practice to standardize features in the data. 
# Lets go ahead and do this even through its not necessary for this data!

summary(iris)

#Use scale() to standardize the feature columns of the iris dataset. Set this standardized version of the data as a new variable
standard <- scale(iris[1:4])


#Check that the scaling worked by checking the variance of one of the new columns
var(standard)
var(standard[,1])

#Join the standardized data with the respnse/target/label column (the column with the species names)
find.data <- cbind(standard, iris[5])
head(find.data)


#### TRAIN AND TEST SPLITS
#use the caTools library to split your standardized data into train and test sets. Use a 70/30 split
library(caTools)
class(iris)
set.seed(101)
sample <- sample.split(find.data$Species, SplitRatio = .70)
train <- subset(find.data, sample == TRUE)
test <- subset(find.data, sample == FALSE)

### BUILD A KNN MODEL
# call the class library
library(class)

### use the KNN function to predict Species of the test set. Use K = 1
predicted.species <- knn(train[1:4], test[1:4], train$Species, k = 1)
predicted.species


### waht was your misclassification rate?
mean(test$Species != predicted.species)


### CHOOSING A K VALUE
#Although our data is quite small for us to really get a feel for choosing a good K values.
# Create a plot of the error (misclassification) rate for K values ranging from 1 to 10
library(ggplot2)
predicted.purchase <- NULL
error.rate <- NULL
for(i in 1:10){
  set.seed(101)
  predicted.species <- knn(train[1:4],test[1:4],train$Species,k=i)
  error.rate[i] <- mean(test$Species != predicted.species)
}
print(error.rate)
k.values <- 1:10
error.df <- data.frame(error.rate, k.values)
pl <- ggplot(error.df, aes(x=k.values, y=error.rate)) + geom_point()
pl + geom_line(lyt="dotted", color="red")
