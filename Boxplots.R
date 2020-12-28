#boxplots
library(ggplot2)
df <- mtcars
head(df)

ggplot(df,aes(x=cyl,y=mpg))
pl <- ggplot(df,aes(x=cyl,y=mpg))
print(pl + geom_boxplot())

# barplots must have x value and y value for dividing the samples
pl <- ggplot(df,aes(x=factor(cyl),y=mpg))
print(pl + geom_boxplot())

#barplot: present the medium value, the standard devision, the upper data
pl <- ggplot(df,aes(x=factor(cyl),y=mpg))
print(pl + geom_boxplot() + coord_flip())

#fill the boxplots
pl <- ggplot(df,aes(x=factor(cyl),y=mpg))
print(pl + geom_boxplot(aes(fill=factor(cyl))))
print(pl + geom_boxplot(aes(fill=factor(cyl))) + theme_bw())


#Checking on the internet, we can have more information to design the boxplot