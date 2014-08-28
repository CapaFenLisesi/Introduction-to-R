# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# BOX PLOTS

bd = read.csv("BoulderDaily.csv")

# We can create a simple boxplot of the temperatures:

boxplot( bd$tmin )

# May need to reset graphics window:
# par( mfrow=c(1,1) )

boxplot( bd$tmin )

# What if we wanted to look at seasonal trends again?  Can we use boxplots?

boxplot( tmin ~ month, data=bd, xlab="Month", ylab="Minimum Temperature (degrees F)" )

# That's pretty cool!  It shows us the seasonality we saw before, and it also shows the
# smaller variability in the summer months.

boxplot( tmax ~ month, data=bd, xlab="Month", ylab="Maximum Temperature (degrees F)" )


# QUESTION!
# Are there temperature trends over year?

boxplot( tmax ~ year, data=bd, xlab="Year", ylab="Maximum Temperature (degrees F)" )
?round
?floor

#We could look at just 1900 to 1920:
bdSubset = bd[bd$year>=1900 & bd$year<=1920,]
boxplot( tmax ~ year, data=bdSubset, xlab="Year", ylab="Maximum Temperature (degrees F)")

#Or, we could add decade to our variables and plot against that:
bd$decade = floor(bd$year/10)*10
bd$decade = signif( bd$year, digits=3 )
boxplot( tmax ~ decade, data=bd, xlab="Year", ylab="Maximum Temperature (degrees F)")
