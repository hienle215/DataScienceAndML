# EXAMPLE 1: Create a function that takes in a name as a string argument, and prints out "Hello name"
hello_you <- function(name){
  print(paste("Hello", name))
}
hello_you("Sam")


#EXAMPLE 2: Create a function that takes in a name as a string argument and returns a string of the form - "Hello name"
hello_you2 <- function(name){
  return(paste("Hello", name))
}
print(hello_you2("Sam"))

#Ex 1: Create a function that will return the product of two integers
prod <- function(a,b){
  result <- a*b
  print(result)
}
prod(3,4)

#Ex 2: Create a function that accepts two arguments, an integer and a vector of integers. It returns TRUE if the integer is present in the vector, otherwise it returns FALSE. Make sure you pay careful attention to your placement of the return(FALSE) line in your function!
num_check <- function(num, v){
  for(item in v){
    if (item == num){
      return(TRUE)
    }
  }
  return(FALSE)
}
num_check(2, c(1,2,3))
num_check(2, c(1,4,5))

#Ex 3: Create a function that accepts two arguments, an integer and a vector of integers. It returns the count of the number of occurences of the integer in the input vector.
num_count <- function(num,v){
  count = 0
  for (x in v){
    if(x == num){
      count = count + 1
    }
  }
  return(count)
}
num_count(2,c(1,1,2,2,3,3))
num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3))

# We want to ship bars of aluminum. We will create a function that accepts an integer representing the requested kilograms of aluminum for the package to be shipped. To fullfill these order, we have small bars (1 kilogram each) and big bars (5 kilograms each). Return the least number of bars needed.
bar_count <- function(x){
  result1 <- x %% 5
  result2 <- (x - x%%5)/5
  a <- result1 + result2
  print(a)
}
bar_count(6)
bar_count(17)

#Ex 5: Create a function that accepts 3 integer values and returns their sum. However, if an integer value is evenly divisible by 3, then it does not count towards the sum. Return zero if all numbers are evenly divisible by 3. Hint: You may want to use the append() function.
summer <- function(a,b,c){
  out <- c(0)
  if (a %% 3 != 0){
    out <- append(a,out)
  }
  if (b %% 3 != 0){
    out <- append(b,out)
  }
  if (c %% 3 != 0){
    out <- append(c,out)
  }
  return(sum(out))
}
summer(7,2,3)
summer(3,6,9)
summer(9,11,12)

#Ex 6: Create a function that will return TRUE if an input integer is prime. Otherwise, return FALSE. You may want to look into the any() function. There are many possible solutions to this problem.
prim_check <- function(x){
  if (x %% 2 = 0){
    print(TRUE)
  } else print(FALSE)
}
prim_check(2)
prim_check(5)
prim_check(4)
prim_check(237)
prim_check(131)
