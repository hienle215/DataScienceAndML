# Vector indexing and slicing
v1 <- c(100, 200, 300)
v2 <- c("a", "b", "c")
v1
v2
v1[2]
v2[3]
v1[c(1, 2)]
v2[c(1, 3)]
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
v
v[2:4]
v[7:19]
v <- c(1, 2, 3, 4)
v
names(v) <- c("a", "b", "c", "d")
v
v[2]
v["b"]
v[c("c", "d", "a")]
v
v[v<2]
v[v > 2]
v>2
my.filter <- v>2
my.filter
v[my.filter]

