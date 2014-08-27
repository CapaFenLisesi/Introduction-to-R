# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# GRAPHING FUNCTIONS

# What if we want to graph a nonlinear function?
# We basically fake it by graphing lots of tiny little line segments

# Let's graph x^2 over the interval (-3,3)
# First we calculate a ton of tiny little x-intervals

x = seq(-3, 3, length=1000)

# Now we calculate x^2 for all those points

y = x^2

plot( x, y )

# The points make the line look a bit thick.  We could adjust the points:

plot( x, y, pch=16 )
plot( x, y, pch=16, cex=0.1 )
plot( x[1], y[1], cex=10 ) #cex controls the size of the points

# Or, we could just use R's line plotting:

plot( x, y, type="l")

# What happens if we use fewer points?

x = seq(-3, 3, length=10)
y = x^2
plot( x, y, type="l")
plot( x, y, type="b") #b=both (i.e. for points and lines)
plot( x, y, type="p")

# We can add lines and points to current plots

plot( x, y, type="p")
lines( x, y )
plot( x, y, type="l")
points( x, y )
points( 0, 5 ) #can add points anywhere
points( -3, 0, pch=16, cex=3, col="blue" )
lines( c(-3,3), c(5,5), col="red", lty=2 )

# Sometimes it's useful to set up a blank grid and add points/lines to it.  This way, you can
# control the axes sizes manually.
plot(c(-5,5), c(0, 5), type="n", xlab="x", ylab="y") #type="n" means nothing (i.e. don't plot anything)


# QUESTION!  Make graphs of the functions:
#  x^3 - 4x + 1 and
#	7sin(x)
# over the interval (-2,2)
# Plot them on the same graph in different colors
# Make sure to add a legend (see ?legend) and label your axes.