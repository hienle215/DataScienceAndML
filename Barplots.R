# Barplots
library(ggplot2)
df <- mpg
head(mpg)

pl <- ggplot(df, aes(x=class))
print(pl + geom_bar())

print(pl + geom_bar(fill="blue"))

print(pl + geom_bar(aes(fill=drv)))

print(pl + geom_bar(aes(fill=drv), position ="dodge"))

print(pl + geom_bar(aes(fill=drv), position ="fill"))

print(pl + geom_bar(aes(fill=drv)))
