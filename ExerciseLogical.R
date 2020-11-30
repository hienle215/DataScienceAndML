# Conditional statement exercise

#Example: Write a script that prints "Hello" if the variable x is equal to 1
x <- 1
if (x == 1){
  print("Hello")
}

#Ex 1: Write a script that will print "Even Number" if the variable x is an even number, otherwise print "Not Even":
x <- 3
if (x%%2 == 0){
  print("Even number")
}else{
  print("Not even")
}

#Ex 2: Write a script that will print 'Is a Matrix' if the variable x is a matrix, otherwise print "Not a Matrix". Hint: You may want to check out help(is.matrix)
x <- matrix(1:25,5)
x
if (is.matrix(x)){
  print("x is matrix")
}else{
  print("x is not a matrix")
}

#Ex3: Creating a vector and printe out the element in order from high to low
x <- c(3,7,1)
x
if(x[1] > x[2]){
  fir <- x[1]
  sec <- x[2]
}else{
  fir <- x[2]
  sec <- x[1]
}
if ( x[3] > fir& x[3] > sec){
  thi <- sec
  sec <- fir
  fir <- x[3]
}else if(x[3] < fir & x[3] < sec){
  thi <- x[3]
}else{
  thi <- sec
  sec <- x[3]
}
print(paste(fir,sec,thi))

### Ex 4: Write a script that uses if,else if, and else statements to print the max element in a numeric vector with 3 elements.
x <- c(20,10,1)
x
if ( x[1] > x[2]){
  max <- x[1]
  min1 <- x[2]
}else{
  max <- x[2]
  min1 <- x[1]
}
if ( x[3] > max & x[3] > min1){
  min2 <- min1
  min1 <- max
  max <- x[3]
}else if(x[3] < max & x[3] < min1){
  min2 <- x[3]
}else{
  min2 <- min1
  min1 <- x[3]
}
print(paste(max))
