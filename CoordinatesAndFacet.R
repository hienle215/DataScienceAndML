# Coordinates and faceting

library(ggplot2)
pl <- ggplot(mpg, aes(x=displ,y=hwy)) + geom_point()
print(pl)

pl2 <- pl + coord_cartesian(xlim=c(1,4),ylim=c(15,30))
print(pl2)

pl3 <- pl + coord_fixed(ratio=1/3)
print(pl3)

#facet_grid
print(pl)
print(pl + facet_grid(. ~ cyl))
head(mpg)
#facet function will support to create the different graph of each sample
print(pl + facet_grid(drv ~ .))
print(pl + facet_grid(drv ~ cyl))
