# DPLYR
install.packages("dplyr")
install.packages("nycflights13")
library(dplyr)
library(nycflights13)
head(flights)
summary(flights)
#Filter from data frame
head(filter(flights,month==11,day==3,carrier=="AA"))

head(flights[flights$month == 1 & flights$day == 3 & flights$carrier == "AA",])

#slice (return to the position)
slice(flights, 1:10)

#arrange
head(arrange(flights,year,month,day,air_time))
head(arrange(flights,year,month,day,arr_time))
head(arrange(flights,year,month,day,desc(arr_time)))

#Select function from data fames
head(select(flights,carrier))
head(select(flights,carrier, arr_time,month))

#rename function
head(rename(flights,airline_carrier = carrier))

#Distinct
distinct(select(flights,carrier))

head(mutate(flights, new_col = arr_delay-dep_delay))
head(transmute(flights, new_col = arr_delay*dep_delay))
summarise(flights, avg_air_times=mean(air_time,na.rm = TRUE))
summarise(flights, total_time=sum(air_time,na.rm = TRUE))

#Sample_n
sample_n(flights,10)
sample_frac(flights,0.1)
