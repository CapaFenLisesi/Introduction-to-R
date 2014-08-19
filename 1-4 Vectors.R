# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# VECTORS!

# Notice the little [1] that's being printed out next to all of our commands.

1 + 1

1:100 #Don't worry about the colon yet, just notice the []'s.  They are indices of the vector

vec = c(1, 2, 3, 4)
class(vec)

# Can do doubles too

vec = c(1, 2.5, 9)
class(vec)
vec

# can do other variable types

charVec = c("a", "b", "c")
class(charVec)

stringVec = c("hello", "hi")
class(stringVec)

# what happens if we do this?

mixedVec = c(1, 5, "s", 99)
class(mixedVec)
mixedVec

complexVec = c(1+2i, 3i, 9-5i, 4)
class(complexVec)
complexVec

# CALCULATIONS WITH VECTORS

a = c(1, 3, 5, 7)
b = c(0, 2, 4, 6)


add = a + b
add

subtract = a - b
subtract

#Multiplication is component-wise, not vector multiplication!

multiply = a*b
multiply

#Vector/Matrix multiplication uses %*%
a%*%b

divide = a/b
divide

#Access elements with the brackets
divide[1]
divide[3]

#Shorthand for a sequence from 1 to 3
1:3

#What if we put a vector as the indices?
2:4
divide[2:4]
#We get the second through fourth elements, as we'd want

actualNumbers = divide[2:4]
actualNumbers

#Or, we can use negative subscripts to delete elements

actualNumbers = divide[-1]
actualNumbers

# now we have all these variables floating around in our workspace
ls()

rm("complexVec")
ls()

rm("mixedVec", "stringVec")
ls()


rm(list=ls())
ls()

#QUESTION!  What would happen if you try to add vectors of unequal length?  Try it out!


