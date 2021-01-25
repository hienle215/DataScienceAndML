#testing the data
# liner modesl
# analysis the results of liner models
df <- read.csv("student-mat.csv",sep=";")

#split data into train and test set for presenting the liner data
install.packages("caTools")
library(caTools)
#Set A seed
set.seed(101) # set the same data for testing, or standard data
#split up samples
sample <- sample.split(df$G3,SplitRatio = 0.7)
# 70% of data will be done for training
train <- subset(df,sample == TRUE)
# 30% data will be tested
test <- subset(df,sample == FALSE)

# Train and build model
model <- lm(G3 ~ ., data = train)
# The general model of building a liner regression model in R
#looks like this

model <- lm(y ~ x1 + x2, data)

# run model


#interpret the model
print(summary(model))
# or to use all the features in your data

res <- residuals(model)
class(res)
res <- as.data.frame(res)
head(res)
ggplot(res,aes(res)) + geom_histogram(fill="blue",alpha=0.5)
