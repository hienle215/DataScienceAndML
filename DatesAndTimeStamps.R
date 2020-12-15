# Dates

Sys.Date()
today <- Sys.Date()
class(today)
c<- "1990-01-01"
class(c)
my.date <- as.Date(c)
class(my.date)
as.Date("Nov-03-1990")
as.Date(05-21-1991)

my.date <- as.Date("Nov-03-90",format ="%b-%d-%y")
my.date

# %d Day of the month (decimal number)
# %m month(decimal number)
# %b month(abbreviated)
# %B month(full name)
# %y year(2 digit)
# %Y year(4 digit)

as.Date("June,01,2002",format="%B,%d,%Y")
