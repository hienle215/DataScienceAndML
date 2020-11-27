# If, else, and else if
if (x==10){
  #code
  print("X is equal to 10!")
}

if (x==10){
  #code
  print("X is equal to 10!")
} else if(x==12)[
  print("X is equal to 12")
]else{
  print("X is not equal to 10 or 12")
}

hot <- FALSE
temp <- 60
if (temp > 80){
  #Execute if condition was true
  print("temp is greater than 80!")
}

hot <- FALSE
temp <- 100
if (temp > 80){
  #Execute if condition was true
  print("temp is greater than 80!")
}

hot <- FALSE
temp <- 100
if (temp > 80){
  #Execute if condition was true
  hot <- TRUE
}
print(hot)

hot <- FALSE
temp <- 10
if (temp > 80){
  #Execute if condition was true
  hot <- TRUE
}
print(hot)

temp <- 30
if (temp > 80){
  #Execute if condition was true
  print("Hot outside")
}else{
  print("Temp is not greater than 80")
}

temp <- 30
if (temp > 80){
  #Execute if condition was true
  print("Hot outside")
}else if (temp <= 80 & temp >= 50){
  print("NIce outside")
}else{
  print("It is less than 50 degrees outside!")
}

temp <- 100
if (temp > 80){
  #Execute if condition was true
  print("Hot outside")
}else if (temp <= 80 & temp >= 50){
  print("NIce outside")
}else{
  print("It is less than 50 degrees outside!")
}

temp <- 60
if (temp > 80){
  #Execute if condition was true
  print("Hot outside")
}else if (temp <= 80 & temp >= 50){
  print("NIce outside")
}else{
  print("It is less than 50 degrees outside!")
}

temp <- 45
if (temp > 80){
  #Execute if condition was true
  print("Hot outside")
}else if (temp <= 80 & temp >= 50){
  print("NIce outside")
}else if(temp==45){
  print("Exactly 45 degrees outside")
}else{
  print("It is less than 50 degress outside and it is not exactly 45 degrees")
}

ham <- 10
cheese <- 10
report <- "blank"

if (ham >= 10 & cheese >= 10){
  report <- "strong sales of both ham and cheese"
}else if (ham == 0 & cheese == 0){
  report <- "No sales today!"
}else{
  report <- "We sold something today!"
}
print(report)


ham <- 0
cheese <- 5
report <- "blank"

if (ham >= 10 & cheese >= 10){
  report <- "strong sales of both ham and cheese"
}else if (ham == 0 & cheese == 0){
  report <- "No sales today!"
}else{
  report <- "We sold something today!"
}
print(report)