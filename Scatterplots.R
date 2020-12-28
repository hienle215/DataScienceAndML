#Scatterplot
library(ggplot2)
df <- mtcars
head(mtcars)
# DATA and aesthetics
pl <- ggplot(data = df, aes(x=wt,y=mpg)) 

#GEOMETRY
print(pl + geom_point())
print(pl + geom_point(size=5))
print(pl + geom_point(alpha=0.5, size=5))
print(pl + geom_point(aes(size=hp)))
print(pl + geom_point(aes(size=cyl))
print(pl + geom_point(aes(size=factor(cyl))))
print(pl + geom_point(aes(shape=factor(cyl))))      
print(pl + geom_point(aes(shape=factor(cyl)), size=5))       
print(pl + geom_point(aes(shape=factor(cyl), color=factor(cyl)), size=5))


pl2 <- pl + geom_point(size=5, color="blue")
print(pl2)

pl2 <- pl + geom_point(size=5, color="purple")


# Search hex color picker by searching on google and you can see the website for hex color code.
pl2 <- pl + geom_point(size=5, color="#56ea29")
print(pl2)

# Change the color following to the trend
pl2 <- pl + geom_point(aes(color=hp), size=5)
print(pl2)

# Make the clear significant color of samples by choosing the trend
pl2 <- pl + geom_point(aes(color=hp), size=5)
pl3 <- pl2 + scale_color_gradient(low="blue",high="red")
print(pl3)

pl2 <- pl + geom_point(aes(color=hp), size=5)
pl3 <- pl2 + scale_color_gradient(low="#56ea29",high="red")
print(pl3)
