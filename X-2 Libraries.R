# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# LIBRARIES

# Plot a circle of radius 1 around (0,0)

# Hard way:
t = seq(0, 2*pi, length=1000)
x = cos(t)
y = sin(t)

plot(c(-2, 2), c(-2,2), type="n", xlab="", ylab="")
abline(h=0)
abline(v=0)

lines(x,y,lwd=3)

# EASY WAY:
# If you search on Google, a function draw.circle comes up
# On help page, it says it's in the plotrix library

library(plotrix)

# We get an error. We need to download & install the library

# R has functions that come in the base installation, but there are tons of other functions
# you can load and use.  These functions usually come in packages, and you have to install
# them and then load the functions using library().  Fortunately, there's a pretty
# straightforward way of loading everything.

install.packages("plotrix") #don't forget the quotes!
library(plotrix) #don't use the quotes here though!

# Now we can officially get help on the draw.circle command

?draw.circle

# So we can use it by:

plot(c(-2, 2), c(-2,2), type="n", xlab="", ylab="")
abline(h=0)
abline(v=0)

draw.circle(0,0,1, lwd=3)
