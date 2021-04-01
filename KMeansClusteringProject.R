### K MEANS CLUSTERING PROJECT

### usually when dealing with an unsupervised learning problem. Its difficult to get a good measure of how well the model performed.
### for this project, we will use data from the UCI archive based off of read and white wines
### we will then add a label the combined date set. We will bring this label back later to see how well we can cluster the wine into groups

###Use read.csv to open both data sets and set them as df1 and df2. Pay attention to what the separator (sep) is
df1 <- read.csv('winequality-red.csv',sep=';')
df2 <- read.csv('winequality-white.csv',sep=';')

### Now add a label column to both df1 and df2 indicating a label "red" or "white"
df1$label <- sapply(df1$pH,function(x){'red'})
df2$label <- sapply(df2$pH,function(x){'white'})

### Check the head of df1 and df2
head(df1)
head(df2)

### Combine df1 and df2 into a single data frame called wine
wine <- rbind(df1,df2)
str(wine)

### EDA
### Lest'2 explore the data a bit and practive our ggplot2 skills!
### Create HISTOGRAM of residual sugar from the wine data. Color by red and white wines
library(ggplot2)
pl <- ggplot(wine, aes(residual.sugar)) + geom_histogram(aes(fill = label), color = "black", bins = 40)
pl <- pl + theme_bw()
print(pl)

### Creat a histogram of critic.acid from the wine data. Color by red and white wines
pl1 <- ggplot(wine, aes(citric.acid)) + geom_histogram(aes(fill=label), color = "black", bins = 50)
pl1 <- pl1 + theme_bw()
print(pl1)

### solution
pl <- ggplot(wine,aes(x=citric.acid)) + geom_histogram(aes(fill=label),color='black',bins=50)
# Optional adding of fill colors
pl + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()

### Create a histogram of alcohol from the wine data. Color by red and white wines
pl2 <- ggplot(wine, aes(alcohol)) + geom_histogram(aes(fill=label), color ="black", bins = 40)
pl2 <- pl2 + theme_bw()
print(pl2)

### Create a scatterplot of residual.sugra versus citric.acid, color by red and white wine
pl3 <- ggplot(wine, aes(citric.acid, residual.sugar)) + geom_point(aes(fill=label), color ="black", alpha = 0.2)
pl3 <- pl3 + scale_color_manual(values = c("red","grey")) + theme_dark()
print(pl3)

### Create a scatter plot of volatile.acidity versus residual.sugar, color by red and white wine
pl4 <- ggplot(wine, aes(volatile.acidity, residual.sugar)) + geom_point(aes(fill=label), alpha = 0.2)
pl4 <- pl4 + scale_color_manual(values = c('#ae4554','#faf7ea')) + theme_dark()
print(pl4)

### GRAB THE WINE DATA WITHOUT THE LABEL AND CALL IT CLUS.DATA
clus.data <- wine[,1:12]

### Check the head of clus.data
head(clus.data)

### BUILDING THE CLUSTERS
# Call the kmeans function on clus.data and assign the results to wine.cluster
wine.cluster <- kmeans(wine[1:12],2)

# Print out the wine.cluster Cluster Means and explore the information
print(wine.cluster$centers)


### EVALUATING THE CLUSTER
# Use the table() function to compare your cluster reults to the real results. Which is easier to correctly groups, red or white wines?
table(wine$label,wine.cluster$cluster)
