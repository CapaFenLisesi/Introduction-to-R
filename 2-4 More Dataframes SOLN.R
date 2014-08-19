# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MORE DATA.FRAMES

# Let's make our own data frame.
# Remember, a data frame is basically just a container for a bunch of vectors that have the same length

practiceFrame = data.frame(index = 1:12, random = rnorm(12, 5, 3))

dim(practiceFrame)
names(practiceFrame)
practiceFrame

# Let's add a factor variable.
stringVec = rep(c("A", "B", "C"), each=4)
stringVec
class(stringVec)
stringVec = as.factor(stringVec)
stringVec
class(stringVec)

practiceFrame$factor = stringVec
dim(practiceFrame)
names(practiceFrame)
practiceFrame

# QUESTION!
# Make a data frame that contains:
# A column called "evens" that has the even numbers between 2 and 200
#	A column called "trial" that contains a factor with levels A, B, ... E
#		where each level is repeated 20 times (e.g. A A A ... A B B B ... etc)
#	Two columns called "norm1" and "norm2" that contain simulated N(0,1) numbers
#	A column called "pois" that contains simulated Poisson numbers, where the mean is
#		5 for trial A, 10 for trial B, ... , 25 for trial E
#	A column called "precip" that contains values sampled without replacement from the BoulderDaily$precip vector

# Save this dataframe to a file called exFrame.csv.
# Read the dataframe from the file.  Do you get the same thing you originally made?  If not,
# figure out what you did wrong (maybe ?write.csv will help).

exFrame = data.frame(evens = seq(2, 200, by=2), 
	trial = as.factor(rep(c("A", "B", "C", "D", "E"), each=20)),
	norm1 = rnorm(100),
	norm2 = rnorm(100),
	pois = rpois(100, rep(seq(5,25,by=5), each=20)),
	precip = sample(BoulderDaily$precip, 100)
)

dim(exFrame)
class(exFrame$trial)
head(exFrame)
tail(exFrame)
exFrame

# # # 

# Now let's say we want to save this data frame, instead of re-running this code every time
# There are two ways:

# We can save it in R by using a workspace
# Save workspace
# Remove all objects
# Load and list
# Show it's the same

# We can also output it to a file

write.csv(exFrame, "exFrame.csv")

# Now let's read in the frame again
rm(list=ls())
ls()

exFrame = read.csv("exFrame.csv")

# Notice that it outputted the row names too
# When we read it back in, the column is just called 'X'

# Let's delete this column:

exFrame = exFrame[,-1]

# Now, write it out without the row names

write.csv(exFrame, "exFrame.csv", row.names=F)
