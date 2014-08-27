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


# QUESTION! 
# Plot a histogram of some simulated normal data.
# Make sure it plots the density.



# QUESTION!
# Can you overlay the expected density (the pdf of the normal distribution)?
# Hint: Remember some of the extra functions we saw when we looked at rnorm?

