# Regular expression
#grepl function: Checking the sample in side of groups
text <- "Hi there, do you who your are voting for?"
text
grepl("voting", text)
grepl("dog", text)


#grepl function in vector
v <- c("a", "b", "c","d","d")
v
grepl("b",v)

# grep function means index location
grep("b",v)
grep("d",v)

grepl("hello", "hello world")
grep("a", c("b","a"))
