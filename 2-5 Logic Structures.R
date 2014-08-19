# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# LOGIC STRUCTURES

# Let's say we want to test whether or not pois is even
# We want a variable in the data frame that's 1 if pois is even, 0 if it's odd

# Let's add an empty variable to the frame

# Hopefully you still have the exFrame.csv.  Otherwise you can download it from here:
# https://github.com/rockclimber112358/Introduction-to-R/blob/master/exFrame.csv

# If you need to read it in, use the code below:
# read.csv("exFrame.csv")

exFrame$poisIsEven = NA

head(exFrame)

# Now, we want exFrame$poisIsEven to be TRUE if pois is even and FALSE otherwise.
# We can use an if-else statement to implement that logic:

exFrame$pois[1]
exFrame$pois[1] %% 2
3 %% 2
190 %% 2
if(exFrame$pois[1] %% 2 == 0){
  exFrame$poisIsEven[1] = TRUE
} else {
  exFrame$poisIsEven[1] = FALSE  
}

# Now, all we have to do is copy and paste that 100 times and change all the 1's to 2's, 3's, etc.
# OR, maybe there's an easier way!

# We'll write a loop to step through the rows and check each pois variable
# This is a for loop

# The "i" in the for loop tells R which variable we are iterating over.
# The vector 1:nrow(exFrame) tells R which values i should take on.
# So, R first sets i=1 and then runs the code inside the {}'s.
# Then, R sets i=2 and runs the code inside the {}'s.
# R continues to repeat this process until i has taken on all the values from 1:nrow(exFrame)

for (i in 1:nrow(exFrame)) {
	if (exFrame$pois[i] %% 2 == 0){
		exFrame$poisIsEven[i] = TRUE
	} else {
		exFrame$poisIsEven[i] = FALSE
	}
}

#Let's check the data to see if we made what we thought:

exFrame$poisIsEven

head(exFrame)
tail(exFrame)

# Here's an even fancier implementation that does the same thing:

for (i in 1:nrow(exFrame)) {
  exFrame$poisIsEven[i] = (exFrame$pois[i] %% 2 == 0)
}


# QUESTION!
# Write a for loop / if statement combo to check if norm1 is positive.
# Add this variable to the data frame

# IFELSE

# We could have just used ifelse
?ifelse
exFrame$easyPoisIsEven = ifelse((exFrame$pois %% 2) == 0, TRUE, FALSE)

#Or, even fancier
exFrame$easiestPoisIsEven = ( exFrame$pois %% 2 == 0 )

head(exFrame)
tail(exFrame)

# We can test if these vectors are the same using sum or all
sum(exFrame$easyPoisIsEven != exFrame$poisIsEven)

?all
all(exFrame$easyPoisIsEven==exFrame$poisIsEven)
all(exFrame$easiestPoisIsEven==exFrame$poisIsEven)

# QUESTION!
# Use ifelse to check if norm1 is positive and add the resulting vector to the data frame
# Check to make sure it equals the output from your loop