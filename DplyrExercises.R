# Dplyr exercises
# Perform the following operations using only the dplyr library. We will be reviewing the following operations:

filter() (and slice())
arrange()
select() (and rename())
distinct()
mutate() (and transmute())
summarise()
sample_n() and sample_frac()

library(dplyr)
head(mtcars)
#Return rows of cars that have an mpg value greater than 20 and 6 cylinders.
filter(mtcars, mpg>20,cyl==6)

#Reorder the Data Frame by cyl first, then by descending wt.
head(arrange(mtcars,cyl,desc(wt)))

#Select the columns mpg and hp
select(mtcars,mpg,hp)

#Select the distinct values of the gear column.
distinct(mtcars,gear)

#Create a new column called "Performance" which is calculated by hp divided by wt.
performance <- mtcars$hp/mtcars$wt
head(mutate(mtcars,performance))

#Find the mean mpg value using dplyr.
mean(mtcars$mpg)

#Use pipe operators to get the mean hp value for cars with 6 cylinders.
mtcars %>% filter(cyl==6) %>% summarise(avg_hp = mean(hp))
