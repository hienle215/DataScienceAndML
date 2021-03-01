#Tree method
# To improve performance, we can use many trees with a random sample of features chosen as the split. 
# a new random sample of features is chosen for every single tree at every single split
# For classification, m is typically chosen to be the square root of p

### what is the point?
# suppose there is one very strong features in the data set. When using "bagged" trees, mots of the trees will use that features as the top split, resulting in an ensemble of similar trees that are highly correlated.

install.packages("rpart")

library(rpart)
help("rpart")
str(kyphosis)
head(kyphosis)

tree <- rpart(Kyphosis ~ ., method = "class", data=kyphosis)
printcp(tree)
plot(tree, uniform=T, main="Kyphosis Tree")
text(tree, use.n=T,all=T)
    
install.packages("rpart.plot")
library(rpart.plot)
prp(tree)

install.packages("randomForest")
library(randomForest)
rf.model <- randomForest(Kyphosis ~ ., data=kyphosis)
print(rf.model)
rf.model$predicted
rf.model$ntree
rf.model$confusion
