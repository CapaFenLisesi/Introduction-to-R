# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SAVING AND LOADING

# Let's set up an example data.frame

d = data.frame( x=1:100
               ,y=rpois(100, lambda=10)
               ,z=sample(1:5,size=100,replace=T) )

#We've learned about write.csv and read.csv so far:

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

# write.csv()/read.csv() vs. save()/load()
# - write.csv()/read.csv() allows you to load data with a new name.
# - If you're given data from someone in a .csv format, you have to use read.csv()
# - If you're giving data to someone who's using Excel/Matlab/etc. they'll need a .csv
# - save()/load() allows you to save multiple objects, or an entire workspace with save.image()