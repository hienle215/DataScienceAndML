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
levels(adult$country)
Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')
group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}
adult$country <- sapply(adult$country,group_country)

# use table() to confirm the groupings
table(adult$country)

#Check the str() of adult again. Make sure any of the columns we changed have factor levels with factor()
str(adult)

adult$type_employer <- factor(adult$type_employer)
str(adult)


### MISSING DATA
#Notice how we have data that is missing
#Amelia
#Install and load the Amelia package
install.packages("Amelia")
library(Amelia)

#Convert any cell with a '?' or a ' ?' value to a NA value. Hint: is.na() may be useful here or you can also use brackets with a conditional statement. Refer to the solutions if you can't figure this step out.
adult[adult == "?"] <- NA

adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)
adult$occupation <- sapply(adult$occupation,factor)

#Using table() on a column with NA values should now not display those NA values, instead you'll just see 0 for ?. Optional: Refactor these columns (may take awhile). For example:
table(adult$type_employer)

# Find the missing data through the map
missing(adult)
missmap(adult)

#You should have noticed that using missmap(adult) is bascially a heatmap pointing out missing values (NA). This gives you a quick glance at how much data is missing, in this case, not a whole lot (relatively speaking). You probably also noticed that there is a bunch of y labels, get rid of them by running the command below. What is col=c('yellow','black') doing?
missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))

#Use na.omit() to omit NA data from the adult data frame. Note, it really depends on the situation and your data to judge whether or not this is a good decision. You shouldn't always just drop NA values.
adult <- na.omit(adult)

#Use missmap() to check that all the NA values were in fact dropped.
missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))



###EDA
#Although we have cleaned the data, we still have explored it using visualization
#Check the str() of the data
str(adult)

#Use ggplot2 to create a histogram of ages, colored by income
library(ggplot2)
library(dplyr)
ggplot(adult, aes(age)) + geom_histogram(aes(fill=income), color="black",binwidth=1) + theme_bw()

#Plot the histogram of hourse worked per week
ggplot(adult, aes(hr_per_week)) + geom_histogram() + theme_bw()


#Rename the country column to region column to better reflect the factor levels
names(adult)[names(adult) =="country"] <- "region"
str(adult)

#Creat a barplot of region with fill color defined by income class. Optinal: figure out how rotate teh x axis test for readability
pl <- ggplot(adult,aes(region)) + geom_bar(aes(fill="income"), color="yellow") + theme_bw()
print(pl)
pl2 <- pl + theme(axis.text.x =element_text(angle = 90, hjust =1))
print(pl2)


#BUILDING A MODEL
#Now it is time to build a model to classify people into two groups: Above or below 50k in salary
####LOGISTIC REGRESSION
#ogistic Regression is a type of classification model. In classification models, we attempt to predict the outcome of categorical dependent variables, using one or more independent variables. The independent variables can be either categorical or numerical.
#take a quick look at the head of adult to make sure we have a good overview before going into building the model
head(adult)

###TRAIN TEST SPLIT
#Split the data in a train and test set using the caTools library as done in previous lectures. refrence previous solution motebooks if you need a refresher
library(caTools) #Import library
set.seed(101) # set a random see so your "random" results are the same as this notebook

#split up the sample, basically randomly assigns a booleans to a new column "sample" # SplitRation = percent of sample == TRUE
sample <- sample.split(adult$income, SplitRatio=0.07)
#training data
train = subset(adult, sample == TRUE)
#testing data
test = subset(adult, sample == FALSE)


## TRAINING THE MODEL
#Explore the glm() function with help(glm). Read through the documentation
help(glm)
#Use all the features to train a glm() model on the training data set, pass the argument family=binomial(logit) into the glm function.
log.model <- glm(income ~ ., family = binomial(link = "logit"), data = train) #Call:glm(formula = income ~ ., family = binomial(logit), data = train)


#Check the model summary
summary(model)
