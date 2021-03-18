# We can expand this idea to non-linearly separabel data through the "kernel trick".
library(ISLR)
print(head(iris))
install.packages("e1071")
library(e1071)
help("svm")
model <- svm(Species ~., data = iris)
summary(model)

pred.values <- predict(model, iris[1:4])
table(pred.values, iris[,5])

tune.results <- tune(svm, train.x = iris[1:4], train.y = iris [,5], kernel = "radial", ranges = list(cost=c(0.1,1,10)), gamma=c(0.5,1,2))
summary(tune.results)
head(tune.results)

tune.results1 <- tune(svm, train.x = iris[1:4], train.y = iris [,5], kernel = "radial", ranges = list(cost=c(0.1,1,1.5)), gamma=c(0.1, 0.5,0.7))
summary(tune.results1)

#cost = 1.5
#gamma = 0.1
tuned.svm <- svm(Species ~., data= iris, kernel = "radial", cost = 1.5, gamma = 0.1)
summary(tuned.svm)
