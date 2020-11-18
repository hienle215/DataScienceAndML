### List basics

v <- c(1,2,3)
m <- matrix(1:10, nrow = 2)
df <- mtcars
class(v)
class(df)
my.list <- list(v,m,df)
my.list
my.names.list <- list(sample_vec = v, my.matrix = m, sample.df = df)
my.names.list

my.names.list$sample.df

# Selecting the objects from the lists
 my.list[1]
my.names.list[1] 
my.names.list["sample_vec"]
class(my.names.list["sample_vec"])
my.names.list[["sample_vec"]]
double.list <- c(my.names.list,my.names.list)
double.list

str(my.names.list)
