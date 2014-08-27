# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SORTING

#Let's load the elevation data

RMelevation = read.csv("RMelevation.csv")
head(RMelevation)

#Using head() is nice, but maybe we want to know the top 10 highest elevations.  Use sort()

?sort
head( sort(RMelevation$z, decreasing=TRUE), n=10)

#Note the two different arguments above.  decreasing=TRUE is an argument to sort(), and it
#tells R that we want the data sorted in decreasing order.  n=10 is an argument to head, and
#it tells R that we want the top 10 values.

# That was helpful, but maybe we want the locations of those high elevations.  Use order()

?order
sort( c(3,4,2,1,5) ) #Sorts the data
order( c(3,4,2,1,5) ) #Returns indices for sorting the data
indices = order( c(3,4,2,1,5) )
c(3,4,2,1,5)[indices]

#QUESTION!  How can we get the locations of the 10 highest elevations?

RMelevation = RMelevation[order(RMelevation$z, decreasing=TRUE),]
head( RMelevation, n=10 )
