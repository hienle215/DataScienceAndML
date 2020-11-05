# Matrix training exercise
#Ex1 Creating the vector
A <- c(1,2,3)
B <- c(4,5,6)
#Ex2: binding two vectors

C <- cbind(A,B)
C
D <- rbind(A,B)
D
#Ex3: Adding the new vector to create the matrix
E <- c(7,8,9)
newD <- rbind(D, E)
newD
is.matrix(newD)

#Ex4 creat the new matrix
A <- matrix(1:25, byrow = 1, nrow = 5)
A

# Ex5: using indexing notation
A[2:3, 1:2]
A[2:3, 2:3]

#Ex6: Using indexing notation
A[4:5, 4:5]
mat2 <- A[4:5, 4:5]
mat2
sum(A)

#Ex7: Creating the new matrix with radom numbers
runif(20)
runif(20, min = 0, max = 100)
matrix(runif(20), nrow = 4)
