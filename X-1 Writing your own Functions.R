# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# WRITING YOUR OWN FUNCTIONS

# The syntax for writing your own functions is pretty easy
# Let's write a function called "triple" that adds two numbers and then
#  multiplies the sum by 3

triple = function(x,y) {
	return(3*(x+y))
}

triple(1,2)
triple(1:5, 2:6)

# Here's a function that adds a random Normal(0,1) value to its input

randomize = function(x) {
	randVals = rnorm(length(x))
	return(x+randVals)
}

randomize(7)
randomize(1:15)
