# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# BASIC LINEAR MODELS

# Let's load the RMelevation data again:

RM = read.csv("RMelevation.csv")

# Let's take a quick look at elevation

#install.packages("scales") #Only need to do this if you haven't yet

library(scales)
plot( RM$x, RM$z, col=alpha(colour="black", alpha=.1) )
plot( RM$y, RM$z, col=alpha(colour="black", alpha=.1) )

# We can try to estimate elevation using just longitude and latitude

model = lm(z ~ x + y, data = RM)
summary(model)

# Both variables are significant.  Maybe we want a quadratic term in x and no y

model = lm( z ~ x + I(x^2), data=RM )
summary(model)

# So what exactly is our model?

class(model)

# Models are their own class. However, it's basically a list
# A list is like a data frame except all the "columns" can be different lengths and data types

names(model)

# Let's plot elevation against longitude again and add our model fit.
plot( RM$x, RM$z, col=alpha(colour="black", alpha=.1), ylab="elevation", xlab="latitude" )

model$coeff
x = seq(-112, -100, length=1000)
z = model$coeff[1] + model$coeff[2]*x + model$coeff[3]*x^2
lines(x, z, col="red", lty=2)

# There's some default plotting functions for our model:

plot(model)

# We can also make predictions for new locations.

newLoc = data.frame( x=-108:-104, y=38 )
newLoc
predict(model, newdata=newLoc )

# Of course, there are sometimes better alternatives than linear regression:

install.packages("mgcv")
library(mgcv)
model = gam( z ~ s(x), data=RM ) #s() means we allow a "smoothed" function of x, instead of a linear function
plot(model) #shows the fit for each smoothed variable
predict(model, newdata=newLoc) #Also can generate predictions
