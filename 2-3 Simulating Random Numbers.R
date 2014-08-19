# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SIMULATING RANDOM NUMBERS

# R is statistical software, so you can easily simulate from a ton of different distributions

# Basic:

?runif
runif(3, 1, 10)

# Normal distribution:

?rnorm # Same type of functions (d*, p*, q*, r*) as unif.
rnorm(5)


# EXAMPLE:
# Fill a 5x5 matrix with numbers simulated from a Poisson(4) distribution.

?rpois
poisMat = matrix(rpois(25, 4), nrow=5)
poisMat

# Is this matrix invertible?
det(poisMat)

# If so, calculate the inverse. Check it by mutliplying it with the original.

poisMatInv = solve(poisMat)
poisMatInv

round(poisMatInv %*% poisMat, 8)
round(poisMat %*% poisMatInv, 8)

# Calculate the row means and column means. Are they similar to the distribution mean (4)?

rowMeans(poisMat)
colMeans(poisMat)

# Calculate the row and column variances. Are they similar to the distribution variance (4)?
# Hint: check out the apply() function

?apply
apply(X=poisMat, MARGIN=1, FUN=var)
apply(X=poisMat, MARGIN=2, FUN=var)

# We can calculate random numbers with different parameters

means = seq(0, 250, by=50)
round(rnorm(length(means), means),2)


# Remember our BoulderDaily data set? Let's play with that again.
# What if we want to randomly sample 10 times from this data set?

# Reload if you need to.  Make sure you have the right working directory!
BoulderDaily = read.csv("BoulderDaily.csv")
?sample

# Sample returns a random subset of values from a vector you put into it
# Can do it without replacement:

sample(1:12, 9)

# Or with replacement:

sample(1:12, 9, replace=T)

# To sample rows from a data frame, we can use sample on the indices

BoulderDaily[sample(1:nrow(BoulderDaily), 10),]

# Note: If your results need to be replicable, set a seed
# set.seed(17) for example

?set.seed
set.seed(17) # Can choose any number you want for the seed.
BoulderDaily[sample(1:nrow(BoulderDaily), 3),]
BoulderDaily[sample(1:nrow(BoulderDaily), 3),]

set.seed(17)
BoulderDaily[sample(1:nrow(BoulderDaily), 3),]
BoulderDaily[sample(1:nrow(BoulderDaily), 3),]

set.seed(18)
BoulderDaily[sample(1:nrow(BoulderDaily), 3),] #Completely different results for different seeds
BoulderDaily[sample(1:nrow(BoulderDaily), 3),]
