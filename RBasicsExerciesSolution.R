#R basics exercies solution

#What is two to the power of five?
2**5

# Creat the vector
stock.prices <- c(23, 27, 23, 21, 34)

# Name of vector
names(stock.prices) <- c("Mon", "Tue", "Wed", "Thu", "Fri")
stock.prices

#mean of stock prices
mean(stock.prices)

# stock prices over 23
stock.prices > 23

# over 23
over.23 <- stock.prices > 23
over.23

#filter out the stock.prices vector
stock.prices
stock.prices[over.23]
stock.prices[stock.prices > 23]

#highest prices
max(stock.prices)
stock.prices[stock.prices == 34]

stock.prices[stock.prices == max(stock.prices)]
