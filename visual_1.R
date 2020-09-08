#load the dataset
library(dslabs)
data(heights)

# make a table of category proportions
prop.table(table(heights$sex))
data(my_data)

a <- seq(min(my_data), max(my_data), length = 100)    # define range of values spanning the dataset
cdf_function <- function(x) {    # computes prob. for a single value
  mean(my_data <= x)
}
cdf_values <- sapply(a, cdf_function)
plot(a, cdf_values)


average <- sum(x)/length(x)
SD <- sqrt(sum((x - average)^2)/length(x))

