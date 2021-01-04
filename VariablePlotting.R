library(ggplot2)
library(ggplot2movies)

pl <- ggplot(movies,aes(x=year,y=rating))

print(pl + geom_bin2d())

pl2 <- pl + geom_bin2d()
print(pl2 + scale_fill_gradient(high="red", low="green"))


pl3 <- pl + geom_bin2d(binwidth=c(3,1))
print(pl3 + scale_fill_gradient(high="red", low="blue"))

pl4 <- pl + geom_hex()
install.packages("hexbin")
print(pl4 + scale_fill_gradient(high="red", low="blue"))

pl5 <- pl + geom_density2d()
print(pl5)
