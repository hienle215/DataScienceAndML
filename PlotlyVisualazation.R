#Data visualization project walkthrough
#corruption and human development presents x = corruption perceptopn index and y = human development index
library(ggplot2)
install.packages("plotly")
library(plotly)

pl <- ggplot(mtcars,aes(mpg,wt)) + geom_point()
print(pl)

gpl <- ggplotly(pl)
print(gpl)

#with plotly library, we can select the data from graph with more details than only ggplot2. Therefore, ggplot2 should go together with plotly
#from the plotly website, we can check the code for creating the different graphs.

library(plotly)
dat <- data.frame(xx=c(runif(100,20,50),runif(100,40,80),runif(100,0,30)),yy=rep(letters[1:3],each=100))
ggplot(dat,aes(x=xx)) + 
  geom_histogram(data=subset(dat,yy=="a"),fill="red",alpha=0.2) +
  geom_histogram(data=subset(dat,yy=="b"),fill="blue",alpha=0.2) +
  geom_histogram(data=subset(dat,yy=="c"),fill="green",alpha=0.2)
ggplotly()
