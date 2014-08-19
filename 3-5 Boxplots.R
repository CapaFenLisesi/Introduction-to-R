# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# BOX PLOTS

bd = read.csv("BoulderDaily.csv")

# We can create a simple boxplot of the temperatures:

boxplot( bd$tmin )

# What if we wanted to look at seasonal trends again?  Can we use boxplots?

boxplot( tmin ~ month, data=bd, xlab="Month", ylab="Minimum Temperature (degrees F)" )

# That's pretty cool!  It shows us the seasonality we saw before, and it also shows the
# smaller variability in the summer months.

boxplot( tmax ~ month, data=bd, xlab="Month", ylab="Maximum Temperature (degrees F)" )


# QUESTION!
# Are there temperature trends over year?