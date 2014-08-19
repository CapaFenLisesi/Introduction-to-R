# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# HISTOGRAMS

# We can make histograms with the hist() command
# Let's make a histogram of our poisson data

bd = read.csv("BoulderDaily.csv")

hist(bd$tmin)

# What if we want more bars?

hist(bd$tmin, breaks=100)

#Or, manually specify them:

hist(bd$tmin, breaks=c(-100,-30,0,10,15,25,50,60,70,90,200) )

# We can change it so the y axis contains density instead of frequency
hist(bd$tmin, freq=F)

# We can change the title, axes labels, etc using the normal plot commands

library(scales)

months = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

par(mfrow=c(3,4)) #Use a 3x4 grid
for(i in 1:12){
  temp = bd[bd$month==i,]
  hist(temp$tmin, breaks="Sturges", freq=F
    ,main=months[i]
    ,xlab="Minimum Temperature (degrees F)"
    ,xlim=c(-30,90) )
}

# This plot is interesting.  We can see that temperature is higher in summer months (which
# should be obvious) but we also see tighter histograms in the summer.  So, winter months
# have more variability in their minimum temperatures.


# EXAMPLE: 
# Plot a histogram of the some simulated normal data.
# Make sure it plots the density.
par(mfrow=c(1,1))
data = rnorm(2000)
hist(data, breaks=25, freq=F)

# Remember that this data is simulated Normal(0,1) data.
# Can you overlay the expected density (the pdf of the normal distribution)?
# Hint: Remember all the extra functions when we looked at rnorm?
?rnorm
x = seq(min(data), max(data), length=1000)
lines(x, dnorm(x, 0, 1), col="red", lty=2)
