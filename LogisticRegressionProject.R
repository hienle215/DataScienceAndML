# Logistic regression project

#Get the Data¶
#Read in the adult_sal.csv file and set it to a data frame called adult.
adult <- read.csv("adult_sal.csv")

#Check the head of adult
head(adult)

#You should notice the index has been repeated. Drop this column.
library(dplyr)
adult <- select(adult,-X)

#Check the head,str, and summary of the data now.
head(adult)
str(adult)
summary(adult)


####Data cleaning
#Notice that we have a lot of columns that are cateogrical factors, however a lot of these columns have too many factors than may be necessary. In this data cleaning section we'll try to clean these columns up by reducing the number of factors.

#type-employr column
# use table() to check the frequency of the type_employer column
table(adult$type_employer)

#how many NUll values are there for type_employer? what are the two smallest group
#1836 null values
# two smalles groups are never worked and without pay

# Combine these two smallest groups into a single group called "Unemployed". There are lots of ways to do this, so feel free to get creative. Hint: It may be helpful to convert these objects into character data types (as.character() and then use sapply with a custom function)
unemp <- function(job){
  job <- as.character(job)
  if (job=='Never-worked' | job=='Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer,unemp)
table(adult$type_employer)

#What other columns are suitable for combining? Combine State and Local gov jobs into a category called SL-gov and combine self-employed jobs into a category called self-emp.
SL <- function(job){
  job <- as.character(job)
  if (job=='Local-gov' | job=='State-gov'){
    return('SL-gov')
  }else{
    return(job)
  }
}
Self <- function(job){
  job <- as.character(job)
  if (job=='Self-emp-inc' | job=='Self-emp-not-inc'){
    return('Self-emp')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer,SL)
adult$type_employer <- sapply(adult$type_employer,Self)
table(adult$type_employe)

#Marital Column
#Use table() to look at the marital column
table(adult$marital)

# reduce this to three groups: Married, noit married, never married
group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}
adult$marital <- sapply(adult$marital,group_marital)
table(adult$marital)

####Country column
# check the country column using table()
table(adult$country)

#Group these countries together however you see fit. You have flexibility here because there is no right/wrong way to do this, possibly group by continents. You should be able to reduce the number of groups here significantly though.
levels(adult$Country)

