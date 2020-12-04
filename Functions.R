## Functions
name_of_func <- function(input1,input2, input3=45){
  #code execute
  result <- input1 + input2
  return(result)
}

# details
# function can run more than one, it is used for the group. Save time and do not rewrite the function again and again
sum(c(1,23))
help(sum)

hello <- function(){
  print("Hello")
}
hello()

hello <- function(name){
  print(paste("Hello",name))
}
hello("Sammy")


hello <- function(name="Frank"){
  print(paste("Hello",name))
}
hello()
# Becare with default when using the function. 
add_sum <- function(num1, num2){
  return(num1 + num2)
}
add_sum(4,5)

# The meaning of return and print
add_sum <- function(num1, num2){
  my.sum <- num1 +num2
  return(my.sum)
}
result <- add_sum(4,5)
print(result)

# Scope in function. The scope is limited in the function and it is inside the function
times5 <- function(num){
  return(num*5)
}
print(times5(20))


times5 <- function(num){
  my.result <- num * 5
  return(my.result)
}
my.output <- times5(100)
print(my.output)

v <- "I am a global bariable"
stuff <- "I am global stuff"

fun <- function(stuff){
  print(v)
  stuff <- "Reassign stuff inside of this function fun"
  print(stuff)
}
fun(stuff)
print(stuff)
