### Tree methods project

# GET THE DATA
# Call the ISLR library and check the head of College. Then reassign College to a data frame called df

library(ISLR)
head(College)
df <- data.frame(College)
head(df)
summary(df)


###EDA
#Create a scatterplot of Grad.Rafe verus Room.Borad, colored by the Private column
library(ggplot2)
ggplot(df,aes(Room.Board, Grad.Rate)) + geom_point(aes(color=Private))

# Create a histogram of full time undergrad student, color by Private
ggplot(df, aes(F.Undergrad)) + geom_histogram(aes(fill=Private, color="black"))

#Creat a histograme of Grad.Rate colored by Private. 
ggplot(df, aes(Grad.Rate)) + geom_histogram(aes(fill=Private), color ="black", bins = 50)

#What college had a Graduation rate of above 100%
subset(df, Grad.Rate > 100)

#Change that colloge's grad rate to 100%
df["Cazenovia College", "Grad.Rate"] <- 100

#### TRAIN TEST SPLOT
#Split your data into training and testing set 70/30. Use the Catools library to do this

library(caTools)
set.seed(101)
sample <- sample.split(df$Private, SplitRatio = 0.7)
train <- subset(df, sample == TRUE)
test <- subset(df,sample == FALSE)

### DECISION TREE
#Use the rpart library to build a decision tree to predict whether or not a scholld is private. Remember to only build your tree off the training data
library(rpart)
tree <- rpart(Private ~., method="class", data=train)

#Use predict() to predict the private label on the test data
tree.preds <- predict(tree, test)
#Check the head of the predicted values. 
head(tree.preds)


# Turns these two columns into one column to match the original Yes/No label for a private column
tree.preds <- as.data.frame(tree.preds)
joiner <- function(x){
  if(x >= 0.5){
    return("Yes")
  }else{
    return("No")
  }
}
tree.preds$Private <- sapply(tree.preds$Yes, joiner)
head(tree.preds)

#Now ues table() to creat a confustion matrix of your tree model
table(tree.preds$Private, test$Private)

#Use the rpart.plot library and the prp() function to plot your tree model
library(rpart.plot)
prp(tree)


### RANDO FOREST
# Call the randomForest package libray
library(randomForest)
#Use randomForest() to build out a model to predi t Private class. Add important=TRUE asa paramater in the model
rf.model <- randomForest(Private~., data=train, importance=TRUE)
#waht was your model is confuse matrai on its own traiing set? 
rf.model$confusion
#grab the features importance with model$importane.Refer to the reading for more inform 
rf.model$importance


### PREDICTION
#use randome forest model to predict on your test set
p <- predict(rf.model, test)
table(p,test$Private)
