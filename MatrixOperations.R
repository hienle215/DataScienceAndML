# Matrix Operations
1:10
v <- 1:10
matrix(v)
v
matrix(v, nrow = 2)
matrix(1:12, byrow = FALSE, nrow = 4)
matrix(1:12, byrow = TRUE, nrow = 4)

googe <- c(450, 451, 452, 445, 468)
msft <- c(230, 231, 232, 233, 220)

stocks <- c(googe, msft)
stocks

print(stocks)

stocks.matrix <- matrix(stocks,byrow = T, nrow = 2)
stocks.matrix

days <- c("Mon", "Tue", "Wed", "Thu", "Fri")
st.names <- c("GOOG", "MSFT")

colnames(stocks.matrix) <- days
rownames(stocks.matrix) <- st.names
print(stocks.matrix)

colSums(stocks.matrix)
rowSums(stocks.matrix)
rowMeans(stocks.matrix)
colMeans(stocks.matrix)

FB <- c(111,112,113,120,145)
tech.stocks <- rbind(stocks.matrix, FB)
tech.stocks
avg <- rowMeans(tech.stocks)
avg
tech.stocks <- cbind(tech.stocks, avg)
tech.stocks
