# Calculates confidence interval for orange trees mean age using bootstrap method
# A good tutorial can be found here: http://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading24.pdf
data("Orange")

ages <- Orange$age
age.mean = mean(ages)

# 20 samples
bootstrap.n = 20

# get bootstrap samples and convert them to matrix form
bootstrap.data = sample(ages, length(ages) * bootstrap.n, replace = TRUE)
bootstrap.samples = matrix(bootstrap.data, ncol = bootstrap.n, nrow = length(ages))

# calculate means of samples
bootstrap.means = colMeans(bootstrap.samples)

# calculate variance for each sample
deltastar = sort(bootstrap.means - age.mean)

hist(deltastar)
deltastar

# get 95% confidence interval for the data
c1 = quantile(deltastar, 0.95)
c2 = quantile(deltastar, 0.05)

sprintf("95% Confidence interval is - [%f, %f]", age.mean - c1, age.mean - c2)
