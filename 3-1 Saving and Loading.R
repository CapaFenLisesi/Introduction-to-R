# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SAVING AND LOADING

# Let's set up an example data.frame

d = data.frame( x=1:100
               ,y=rpois(100, lambda=10)
               ,z=sample(1:5,size=100,replace=T) )

#We've learned about read.csv so far.  There's also write.csv:

write.csv(d, file="temp.csv", row.names=F)
d2 = read.csv("temp.csv")
head(d)
head(d2)
all(d==d2)

# Another alternative is the save() function

?save
save(d, file="temp.RData")
d3 = load("temp.RData")
d3 #Huh?  What happened?

rm(d)
load("temp.RData")

# save() creates a ".RData" file which contains the R objects you want to keep.  When you load
# it, those objects come into your workspace with the names they were saved with.

rm(list=ls())
a = 1
b = 2
c = 3

save(a, b, c, file="temp2.RData")
rm(list=ls())
ls()
load("temp2.RData")
ls()

# R also has functions for reading in data in other formats.

d = read.csv("forcing.txt")
head(d)
summary(d)
is(d)
dim(d)
# This doesn't look right...  Let's see what forcing.txt looks like.

# Ok, data isn't separated with commas but with tabs.  What do we do?
# read.table is used for data with whitespace as the separators.

?read.table
input=read.table("forcing.txt") #What's happening here?
input=read.table("forcing.txt", skip=1)
head(input)
summary(input)
is(input)
dim(input)

scan("forcing.txt")
scan("forcing.txt", skip=1)
input=matrix(scan("forcing.txt", skip=1), ncol=3, byrow=T) 

# read.table and read.csv are actually very similar

input=read.csv("forcing.txt", sep="\t")
head(input)
summary(input)
is(input)
dim(input)
input2=read.table("forcing.txt", sep="\t", header=T)
all(input==input2)

# write.csv()/read.csv()/read.table()/scan()/etc. vs. save()/load()
# - write.csv()/read.csv() allows you to load data with a new name.
# - If you're given a data file, you'll probably have to use read.csv() or something similar
# - If you're giving data to someone who's using Excel/Matlab/etc. they'll need a .csv
# - save()/load() allows you to save multiple objects, or an entire workspace with save.image()