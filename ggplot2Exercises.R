#ggplot2 Exercises

library(ggplot2)
library(ggthemes)
head(mpg)

#Histogram of hwy mpg values:
pl <- ggplot(mpg,aes(x=hwy))
print(pl + geom_histogram(binwith = 0.1, color="orange",fill="orange"))

#Barplot of car counts per manufacturer with color fill defined by cyl count
pl2 <- ggplot(mpg,aes(x=manufacturer))
print(pl2 + geom_bar(aes(fill=factor(cyl))) + theme_gdocs())

###Switch now to use the txhousing dataset that comes with ggplot2
head(txhousing)

#Create a scatterplot of volume versus sales. Afterwards play around with alpha and color arguments to clarify information.
pl3 <- ggplot(txhousing, aes(x=sales, y=volume))
print(pl3 + geom_point(alpha=0.5, fill="blue", color="blue"))

#Add a smooth fit line to the scatterplot from above. Hint: You may need to look up geom_smooth()
pl4 <- ggplot(txhousing, aes(x=sales, y=volume)) + geom_point(alpha=0.5, fill="blue", color="blue")
print(pl4 + geom_smooth(color="red"))
