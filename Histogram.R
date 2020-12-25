installed.packages("ggplot2")
installed.packages("ggplot2movies")
library(ggplot2)
library(ggplot2movies)
colnames(movies)
head(movies)

#DATA AESTHETICS
pl <- ggplot(movies,aes(x=rating))

#Geometry
print(pl + geom_histogram())

print(pl + geom_histogram(binwidth = 0.1))
print(pl + geom_histogram(binwidth = 0.1, color="red"))
print(pl + geom_histogram(binwidth = 0.1, color="red", fill="Pink"))
print(pl + geom_histogram(binwidth = 0.1, color="red", fill="Pink",alpha=0))
print(pl + geom_histogram(binwidth = 0.1, color="red", fill="Pink",alpha=1))
print(pl + geom_histogram(binwidth = 0.1, color="red", fill="Pink",alpha=0.4))

#adding the labels
pl2 <- pl + geom_histogram(binwidth = 0.1, color="red", fill="Pink",alpha=0.4)
pl3 <- (pl2 + xlab("Movie Rating") + ylab("Count"))
print(pl3)

pl4 <- (pl2 + xlab("Movie Rating") + ylab("My Count"))
print(pl4)

#adding the title
pl2 <- pl + geom_histogram(binwidth = 0.1, color="red", fill="Pink",alpha=0.4)
pl3 <- (pl2 + xlab("Movie Rating") + ylab("Count"))
print(pl3 + ggtitle("My title"))

#Would like to save the histogram = click "export" + "save as Image/Pdf"

#fill with the range of the color
pl2 <- pl + geom_histogram(binwidth = 0.1, aes(fill=..count..))
pl3 <- (pl2 + xlab("Movie Rating") + ylab("Count"))
print(pl3 + ggtitle("My title"))
