df <- read.csv("student-mat.csv",sep=";")

#split data into train and test set
library(caTools)
#set A seed
set.seed(101)
#split up sample
sample <- sample.split(df$G3,SplitRatio=0.7)
train <- subset(df,sample==TRUE)
#70% of data <- train
test <- subset(df,sample==FALSE)

#Train and build model
model <- lm(G3 ~.,data = train)

#train the model in the test datasheet and predict the new data points in the datasheet

#PREDICTIONS
G3.predictions <- predict(model, test)

results <- cbind(G3.predictions,test$G3)
colnames(results) <- c("predicted","actual")
results <- as.data.frame(results)
print(head(results))
#take care of negative values
to_zero <- function(x){
  if ( x <0){
    return(0)
  }else{
    return(x)
  }
}

#apply zero function
min(results)
results$predicted <- sapply(results$predicted, to_zero)

## MEAN squared error of the prediction results
mse <- mean( (results$actual - results$predicted)^2)
print("MSE")
print(mse)

#RMSE
print("Squared root of MSE")
print(mse^0.5)

#####
SSE <- sum( (results$predicted - results$actual)^2)
SST <- sum( (mean(df$G3) - results$actual)^2)

R2 <- 1 - SSE/SST
print("R2")
print(R2)

## the results mean 80% of results belonged to the linear data