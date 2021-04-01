
### K CLUSTER SOLUTION

### read.csv file
df1 <- read.csv('winequality-red.csv',sep=';')
df2 <- read.csv('winequality-white.csv',sep=';')


### Label data
df1$label <- sapply(df1$pH, function(x){"red"})
head(df1)

df2$label <- sapply(df2$pH, function(x){"white"})
head(df2)

## Combine function
wine <- rbind(df1,df2)

### DATA ANALYSIS
library(ggplo2)
pl <- ggplot(wine, aes(residual.sugar)) + geom_histogram(aes(fill=label), color="black", bins=50)
pl <- pl + scale_fill_manual(values =c("green","yellow")) + theme_bw()
print(pl)

library(ggplo2)
pl <- ggplot(wine, aes(citric.acid)) + geom_histogram(aes(fill=label), color="black", bins=50)
pl <- pl + scale_fill_manual(values =c("green","yellow")) + theme_bw()
print(pl)

### HISTOGRAM
pl <- ggplot(wine, aes(alcohol)) + geom_histogram(aes(fill=label), color="black", bins=50)
pl + scale_fill_manual(values=c("red", "yellow")) + theme_bw()


###
pl <- ggplot(wine, aes(citric.acid, residual.sugar)) + geom_point(aes(color=label), alpha=0.2)
pl + scale_color_manual(values=c("red", "white")) + theme_dark()

pl <- ggplot(wine, aes(volatile.acidity, residual.sugar)) + geom_point(aes(color=label), alpha=0.2)
pl + scale_color_manual(values=c("red", "white")) + theme_dark()

clus.data <- wine[,1:12]
head(clus.data)
wine.cluster <- kmeans(clus.data,2)
print(wine.cluster$centers)
table(wine$label,wine.cluster$cluster)
