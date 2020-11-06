#matrix exciereces and throughwalk solution
# Ex1: Creat 2 vectors A and B, where A is (1,2,3) and B(4,5,6)
A <- c(1,2,3)
B <- c(4,5,6)
cbind(A,B)
rbind(A,B)

#Ex2
1:9
c(1,2,3)
1:3
matrix(1:9, byrow = T, nrow = 3)
mat <- matrix(1:9, byrow = T, nrow = 3)
mat

#Ex3
is.matrix(mat)
is.array(mat)
is.data.frame(mat)

#Ex4
mat2 <- matrix(1:25, byrow = T, nrow = 5)
mat2

#Ex5
mat2[2:3, 2:3]

#Ex6
mat2[4:5, 4:5]
mat2[2:3, 2:5]

#Ex7
sum(mat2)
colSums(mat2)
rowSums(mat2)

#Ex8
help(runif)
runif(20)
runif(20, min = 0, max = 100)
matrix(runif(20), nrow = 4)
