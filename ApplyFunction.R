# Apply function
sample(x = 1:10, 1)
print(sample(x = 1:10, 1))
print(sample(x = 1:100, 1))

v <- c(1,2,3,4,5)
addrand <- function(x){
  ran <- sample(1:100, 1)
  return(x+ran)
}
print(addrand(10))
result <- lapply(v, addrand)
print(result)
result <- sapply(v, addrand)
print(result)

v <- 1:5
times2 <- function(num){
  return(num*2)
}
print(v)
result <- sapply(v, times2)
print(result)

help(sapply)

#Anonymous Functions
addrand <- function(){
  #code
}

v <- 1:5
result <- sapply(v,function(num){num*2})
print(result)


times2 <- function(num){
  return(num*2)
}

# Applying with multiple inputs

v <- 1:5
add_choice <- function(num, choice){
  return(num+choice)
}
print(add_choice(2,10))
sapply(v, add_choice)
