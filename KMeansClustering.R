### K MEANS CLUSTERING

library(ISLR)
print(head(iris))

library(ggplot2)
ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))
pl <- ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))
print(pl + geom_point(size=4))

set.seed(101)
irisCluster <- kmeans(iris[,1:4],3,nstart = 20 )# calculate for 4 columns
print(irisCluster)

table(irisCluster$cluster,iris$Species)


library(cluster)
clusplot(iris, irisCluster$cluster, color = T, shade = T, labels = 0, lines = 0)

help("clusplot")
help("kmeans")
