# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MORE VECTORS- REAL DATA

# NOTE: CODE BELOW WILL CAUSE AN ERROR!  Make sure to change the directory to your directory!!!

rainfall = read.csv("C:/Users/rockc_000/Documents/Professional Files/Mines/Introduction to R course/My Course Files/rainfall.csv")
class(rainfall)

# Or, if you want to pull in multiple files, it might be easier to use setwd()

?setwd

# NOTE: CODE BELOW WILL CAUSE AN ERROR!  Make sure to change the directory to your directory!!!

setwd("C:/Users/rockc_000/Documents/Professional Files/Mines/Introduction to R course/My Course Files")
rainfall = read.csv("rainfall.csv")

# If you're not sure of a file name, try typing the start of it on the command line and 
# pressing tab.  R will fill in filenames when there's only one possibility.  Also works for
# R functions!

# This is a data frame
# Basically just allows you to put vectors in a table
# Can get the columns of faithful separately

names(rainfall)
rainfall$longitude
class(rainfall$longitude)
class(rainfall$precip)

#Or, we can use indices to extract columns:

rainfall[,1]
rainfall[,2]

#Four useful functions for the dataframe:

?summary
summary(rainfall)
?head
head(rainfall)
?tail
tail(rainfall)
?dim
dim(rainfall)

length(rainfall$precip)

# which helps us to filter our data
which(rainfall$precip > 7000)

# Where was the largest precipitation

max(rainfall$precip)
which(rainfall$precip==7133.66) #Uh-oh, rounding issue
which(round(rainfall$precip)==7134) #Uh-oh, rounding issue

# Or, even fancier

which(rainfall$precip == max(rainfall$precip))
which.max(rainfall$precip)
rainfall[1593]

# Uh-oh!  Why can't we do that?

rainfall[1593,]

# rainfall has two dimensions.  The first number tells R which row(s) and
# the second which columns.  Leaving something blank returns all columns/rows.

rainfall[1:10,1]
rainfall[30,1:2]
rainfall[30,]

# Where did this large rainfall occur?
rainfall$longitude[1593]
rainfall$latitude[1593]

# This is down in Florida, so high rainfall seems reasonable

# are there any other locations with rainfall higher than 6000?
rainfall[rainfall$precip >= 6000,]

# What if we want to add a new variable to rainfall?

?nrow
id = 1:nrow(rainfall)
rainfall = cbind( rainfall, id )
head(rainfall)

# Or, with dataframes, we can use "$" too

id2 = nrow(rainfall):1
rainfall$id2 = id2
head(rainfall)

# What if we don't want two ratios?

rainfall$id = NULL
head(rainfall)

# Be careful when deleting columns!  You can't always recover them easily, so make
# sure you really want to delete them!

# What if we want to save our data.frame with this new column?  We can store it in a .csv:

?write.csv
write.csv( rainfall, file="rainfall_2.csv", row.names=F )

# Two comments:
# The file will be stored in your working directory unless you specify a different path.
# Data.frames have row names that are usually 1:nrow of the data.frame.  Usually, you don't
# want to write these out to your file, so using row.names=F prevents this.

# QUESTIONS!

# Read in the RMelevation.csv file.  This file contains three columns: x (longitude),
# y (latitude), z (elevation).



# Do you think z is in meters or feet (or something else)?



# What is the highest elevation?  Where does this point occur? (just long. and lat. is fine)



# What about the lowest elevation?



# What percent of the locations have altitudes higher than the mean?  What percent have
# altitudes higher than the median?

?mean
?median

# Harder Questions (Optional): What are the 10, 20, ..., 90th percentiles of elevation?
# What are the averages of the longitudes and latitudes for locations in the 0-10 percentile?
# The 10-20 percentile? Etc?  Do these averages tell us anything meaningful?


