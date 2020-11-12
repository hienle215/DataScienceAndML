#Some made up weather data
days <- c("Mon", "Tue", "Wed", "Thu", "Fri")
temp <- c(22.2,21,23,24.3,25)
rain <- c(T, T, F, F, T)

# pass in the vector
df <- data.frame(days,temp,rain)
df
df[1,]
df[,1]
df[,"rain"]
df[1:5,c("days","temp")]
df$days
df$temp
df["days"]
subset(df,subset = rain==TRUE)
subset(df,subset = temp>23)
sorted.temp <- order(df["temp"])
sorted.temp
df[sorted.temp,]
desc.temp_1 <- order(-df["temp"])
desc.temp_1
df[desc.temp_1,]
desc.temp <- order(df$temp)
df[desc.temp,]
