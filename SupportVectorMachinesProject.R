#### DATA
### Open the loan_data.csv file and save it as dataframe called loans
loans <- read.csv("loan_data.csv")
### Check the summary and structure of loans
summary(loans)
str(loans)


### Convert the following columns to categorical data using factor()
loans$credit.polyci <- factor(loans$credit.policy)
loans$inq.last.6mths <- factor(loans$inq.last.6mths)
loans$pub.rec <- factor(loans$pub.rec)
loans$not.fully.paid <- factor(loans$not.fully.paid)

### EDA
### creat the histogram for fico scorse colored by not.fully.paid
library(ggplot2)
pl <- ggplot(loans, aes(x=fico))
pl <- pl + geom_histogram(aes(fill=not.fully.paid), color="black", bins= 20)
pl + scale_fill_manual(values=c("green", "red")) + theme_bw()


pl <- ggplot(loans,aes(x=fico)) 
pl <- pl + geom_histogram(aes(fill=not.fully.paid),color='black',bins=40,alpha=0.5)
pl + scale_fill_manual(values = c('green','red')) + theme_bw()

### Creat a barplot pf purpose counts, colored by not.full.pai, use position = dodge in the geom_bar argument
pl <- ggplot(loans, aes(x=factor(purpose)))
pl <- pl + geom_bar(aes(fill=not.fully.paid), position = "dodge")
pl + theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1))


### Create a scatterplot of fico score versus int.rate. Does the trend make sense? Play around with the color scheme if you want
pl <- ggplot(loans, aes(fico, int.rate))
pl <- pl + geom_point() + theme_bw()
pl

pl <- ggplot(loans, aes(int.rate, fico))
pl <- pl + geom_point() + theme_bw()
pl

pl <- ggplot(loans, aes(int.rate, fico)) + geom_point(aes(color=not.fully.paid)) + theme_bw()
pl


### Building the model
# train and test sets
#Split your data into training and test set using the caTool library
library(caTools)
class(loans)
set.seed(101)
sample <- sample.split(loans$not.fully.paid, SplitRatio = 0.70)
train <- subset(loans, sample == TRUE)
test <- subset(loans, sample == FALSE)

### call the e1071 library as shown in the lecture
library(e1071)

### now use the svm() function to train a model on your training set
model <- svm(not.fully.paid ~., data=train)

### get a summary of the model
summary(model)


### use predict to predict new values from the test set using your model.Refer to the lecture on how to do this.
predicted.values <- predict(model,test[1:13])
table(predicted.values,test$not.fully.paid)

tuned.results <- tune(svm, train.x=not.fully.paid ~., data=train, kernel="radial", ranges=list(cost=c(100,200), gamma=c(0.1)))
summary(tuned.results)

tuned.model <- svm(not.fully.paid~., data=train, cost=100, gamma=0.1)
tuned.prediction <- predict(tuned.model, test[1:13])
table(tuned.prediction, test$not.fully.paid)
