#Neural networks are modeled after biological neural networks and attempt to allow computers to learn in a similar manner to human-reinforcement learning 
#use cases: pattern recognition, time series predictions, signal processing, anomaly detection, and control

#Why set up the neural networks in R?
#there a problems that are difficult for humans but easy for computer in calculating large arithmetic problems
#Then there are problems easy for humans, but difficult for computer in recognizing a picture of a person from the side

### NEURAL NETWORKS
### INSTALL.packages("MASS")

library(MASS)
head(Boston)
str(Boston)
any(is.na(Boston)) #Checking the missing information
data <- Boston

#Normalize our data
maxs <- apply(data,2,max)
maxs
mins <- apply(data, 2,min)
mins

help("scale")
scaled.data <- scale(data, center=mins, scale=maxs-mins)
scaled <- as.data.frame(scaled.data)
head(scaled)
head(Boston) #Checking the differences between 2 matrixes
library(caTools)
split <- sample.split(scaled$medv, SplitRatio=0.7)
train <- subset(scaled,split==T)
test <- subset(scaled,split==F)

install.packages("neuralnet")
library(neuralnet)
n <- names(train)
n
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse =" + ")))
f
nn <- neuralnet(f,data=train,hidden=c(5,3),linear.output=TRUE)
neuralnet?
plot(nn)

# Compute Predictions off Test Set
predicted.nn.values <- compute(nn,test[1:13])
str(predicted.nn.values)
true.predictions <- predicted.nn.values$net.result * (max(data$medv)-min(data$medv))+min(data$medv)
#Conver the test data
test.r <- (test$medv)*(max(data$medv)-min(data$medv))+min(data$medv)
MSE.nn <- sum((test.r-true.predictions)^2)/nrow(test)
MSE.nn

error.df <- data.frame(test.r, true.predictions)
head(error.df)

library(ggplot2)
pl <- ggplot(error.df, aes(x=test, y=true.predictions)) + geom_point() +stat_smooth()
print(pl)
