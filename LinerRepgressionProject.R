# Get data

# read in bikeshare.csv file and set it to a datafames called bike

bike <- read.csv("bikeshare.csv")
head(bike)

summary(bike)

#Can you figure out waht is the target we are trying to predict? Checked the Kaggle link above if you are confused on this
# Count is waht we were trying to predict

# Creat a scatter plot of count and temp, set a good alpha value
library(ggplot2)
ggplot(bike,aes(temp,count)) + geom_point()
ggplot(bike,aes(temp,count)) + geom_point(alpha=0.3, aes(color=temp)) + theme_bw()
ggplot(bike,aes(temp,count)) + geom_point(alpha=0.2, aes(color=temp)) + theme_bw()

#PLot count versus datetime as a scatterplot with a color gradient based on temperature. You will need to convert the datetime column into POSIXct before plotting
bike$datetime <- as.POSIXct(bike$datetime)
ggplot(bike,aes(datetime,count)) + geom_point(aes(color=temp),alpha=0.5) + scale_color_continuous(low="lightblue",high="orange")

### solution 2
# Conver to posixct()
bike$datetime <- as.POSIXct(bike$datetime)
pl <- ggplot(bike,aes(datetime,count)) + geom_point(aes(color=temp),alpha=0.5)
print(pl)
pl + scale_color_continuous(low="blue", high="orange") + theme_bw()

bike$datetime <- as.POSIXct(bike$datetime)
ggplot(bike,aes(datetime,count)) + geom_point(aes(color=temp), alpha=0.5)
ggplot(bike,aes(factor(season),count)) + geom_boxplot(aes(color=factor(season))) + theme_bw()

#what is the correlation between temp and count
cor(bike[,c("temp","count")])

#lets explore the season data. Create a boxplot, with y axis indicating count and the x axis begin a box for each season
ggplot(bike,aes(factor(season),count)) + geom_boxplot(aes(color=factor(season))) + theme_bw()

# Creat an hour column that takes the hour from the date time column. You will probably need to apply some function to the entire datetime column ans reassign it. 
bike$hour <- sapply(bike$datetime, function(x){format(x,"%H")})
head(bike)

### Now create a scatterplot of count versus hour, with color scale based on temp. Only use bike data where workingday==1.

#Optional Additions:
  
# Use the additional layer: scale_color_gradientn(colors=c('color1',color2,etc..)) where the colors argument is a vector gradient of colors you choose, not just high and low.
# Use position=position_jitter(w=1, h=0) inside of geom_point() and check out what it does.
library(dplyr)
pl <- ggplot(filter(bike,workingday==1),aes(hour,count))
pl <- pl + geom_point(position=position_jitter(w=1, h=0),aes(color=temp),alpha=0.5)
pl <- pl + scale_color_gradientn(colors = c("darkblue","blue","green","yellow","orange","red"))
pl + theme_bw()

#Now create the same plot for non working days
pl <- ggplot(filter(bike,workingday==0),aes(hour,count))
pl <- pl + geom_point(position=position_jitter(w=1, h=0), aes(color=temp), alpha=0.5)
pl <- pl + scale_color_gradientn(colors = c("darkblue","blue","green","yellow","orange","red"))
pl + theme_bw()

#scaterplot for working day
pl <- ggplot(filter(bike,workingday==1),aes(hour, count))
pl <- pl + geom_point(position=position_jitter(w=1, h=0), aes(color=temp), alpha=0.5)
pl <- pl + scale_color_gradientn(colors = c("darkblue","blue","green","yellow","orange","red"))
pl + theme_bw()
print(pl)

#Building the model
#Use lm()to bild a model that predicts count based solely on the tem feature, name it temp.model
temp.model <- lm(count~temp,bike)

#get summary of the temp.model
summary(temp.model)

#How many bike rentals would we predict if the temperature was 25 degrees celsius? Calculate this two way
# 1 using the values we just got above
# 2 using the predict() function
temp.test <- data.frame(temp=c(25))
summary(temp.test)
Rental.prediction <- predict(temp.model,temp.test)
print(Rental.prediction)

6.0462 + 9.1705*25

temp.test <- data.frame(temp=c(25))
temp.test
predict(temp.model,temp.test)

# Use sapply() and as.numeric to change the hour column to a column of numeric values
bike$hour <- sapply(bike$hour, as.numeric)
summary(bike$hour)

# Finally build a model that attempts to predict count based off of the following features. Figure out if theres a way to not have to pass/write all these variables into the lm() function. Hint: StackOverflow or Google may be quicker than the documentation.
model <- lm(count~. -casual - registered - datetime - atemp, bike)
summary(model)
