#Vector basic in R

nvec <- c(1,2,3,4,5)
nvec
class(nvec)
cvec <- c("U", "S", "A")
class(cvec)
lvec <- c(T, F)
class(T)

v <- c(TRUE, 20, 40)
v
class(v)

v <- c("USA", 20, 31)
v
class(v)

temps <- c(72, 71, 68, 73, 69, 75, 76)
temps
names(temps) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
temps

days <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
days
names(temps) <- days
temps
