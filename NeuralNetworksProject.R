### NEURAL NET PROJECT
#Get the data

# Use read.csv to read the bank_note_data.csv file.
df <- read.csv("bank_note_data.csv")

# Check the head of the data frame and its structure.
head(df)

library(MASS)
str(df)

### EDA
# Create whatever visualizations you are interested in. We'll skip this step for the solutions notebook/video because the data isn't easily interpretable since its just statistical info on images.
### TRAIN TEST SPLIT
# Use the caTools library to split the data into training and testing sets
library(caTools)
set.seed(101)
split <- sample.split(df$Class, SplitRatio = 0.7)
train <- subset(df, split == TRUE)
test <- subset(df, split == FALSE)

### Check the structure of the train data and note that Class is still an int data type. We won't convert it to a factor for now because the neural net requires all numeric information.

str(train)

### BUILDING THE NEURAL NET
library(neuralnet)

# browse throguh the documentation of neuralnet
# help(neuralnet)
# use the nuralnet function to train a neural set, set linear.output=FALSE and choose 10 hiddden neurons (hidden=10)
nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy,data=train,hidden=10,linear.output=FALSE)

### PREDICTION
# use compute() to grab prediction using your nn model on the test set.
predicted.nn.values <- compute(nn,test[,1:4])

## check the head of the predicted values. 
head(predicted.nn.values)

### Apply the round function to the predicted values so you only 0s and 1s as your predicted class
prediction <- sapply(predicted.nn.values$net.result, round)
head(prediction)

## Use table to creat a confusion matrix of your predictions versus the real values
table(prediction, test$Class)

### COMPARING MODELS
## call the randomForest library
library(randomForest)
### Run the Code below to set the Class column of the data as a factor (randomForest needs it to be a factor, not an int like neural nets did. Then re-do the train/test split
df$Class <- factor(df$Class)
library(caTools)
set.seed(101)
split = sample.split(df$Class, SplitRatio = 0.70)

train = subset(df, split == TRUE)
test = subset(df, split == FALSE)

# creat a randomForest model with the new adjusted training data
model <- randomForest(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy,data=train)

# use predict() to get the predicted values from your rf model
rf.pred <- predict(model, test)

# use table to create the confusion matrix
table(rf.pred, test$Class)

