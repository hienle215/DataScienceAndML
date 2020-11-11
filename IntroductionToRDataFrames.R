#Introduction to R data frames
state.x77
USPersonalExpenditure
women
data()
WorldPhones
state.x77
head(state.x77)
tail(state.x77)
str(state.x77)
summary(state.x77)
days <- c("Mon", "Tue", "Wed","Thu", "Fri")
temq <- c(22.2,21,23,24.4,25)
rain <- c(T, T, F, F, T)
data.frame(days, temq, rain)
data.frame(days,temq,rain)
df <- data.frame(days,temq,rain)
df
str(df)
summary(df)
