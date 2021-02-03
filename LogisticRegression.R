# accuracy is overal, how oftern is it correct in the prediction data.
# misclassification rate (error rate) overal, how oftern is it wrong? have 2 types : type I error in false positive, and type II error in false negative

df.train <- read.csv("titanic_train.csv")
print(head(df.train))
print(" ")
print(str(df.train))

install.packages("Amelia")
library(Amelia)
help("missmap")
# missmap shows the missingness accours in the datasheet
missmap(df.train, main="Missing Map", col = c("yellow", "black"), legent = FALSE)
# missing 20% from the datasheet

library(ggplot2)
ggplot(df.train, aes(Survived)) + geom_bar()
ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

ggplot(df.train,aes(Age)) + geom_histogram(bins=20, alpha=0.5, fill="blue")
ggplot(df.train,aes(SibSp)) + geom_bar()
ggplot(df.train, aes(Fare)) + geom_histogram(fill="green", color="black", alpha=0.5)
#fromt the graph, most people paid the lowere price fees for entering the train. It is suitable that less rich people paid the business class prices

pl <- ggplot(df.train, aes(Pclass, Age))
pl <- pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass), alpha=0.4))
pl + scale_y_continuous(breaks = seq(min(0),max(80), by=2)) + theme_bw()
#missing 20% of data about people, tickets, or class passengers. We sill draw the data and predict the missing by MissingMap function

###IMPUTATION OF AGE BASED ON CLASS
impute_age <- function(age, class){
  out <- age
  for (i in 1:length(age)){
   
     if(is.na(age[i])){
     
        if(class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] ==2){
        out[i] <- 29
     
         }else{
        out[i] <- 24
      }
    }else{
      out[i] <- age[i]
    }
  }return(out)
}
fixed.ages <- impute_age(df.train$Age,df.train$Pclass)
