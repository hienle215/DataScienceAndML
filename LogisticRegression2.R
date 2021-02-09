# logistic regression with R part 2

impute_age <- function(age,class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}
library(dplyr)
df.train <- select(df.train,-PassengerId, - Name, -Ticket,-Cabin)
head(df.train,3)
str(df.train)
df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)
str(df.train)
 
log.model <-glm(Survived ~ ., family=binomial(link="logit"),data = df.train)
summary(log.model)


#prediction the data
library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived,SplitRatio = 0.7)

final.train <- subset(df.train,split == TRUE)
final.test <- subset(df.train,split == FALSE)

final.log.model <- glm(Survived ~., family = binomial(link="logit"),data = final.train)
summary(final.log.model)

library(Amelia)
library(ggplot2)
fitted.probabilities <- predict(final.log.model,final.test,type='response')
fitted.results <- ifelse(fitted.probabilities > 0.5,1,0)

misClasificError <- mean(fitted.results != final.test$Survived)
print(paste('Accuracy',1-misClasificError))

table(final.test$Survived, fitted.probabilities > 0.5)
