# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# NA AND NULL

BoulderDaily = read.csv("BoulderDaily.csv")
summary(BoulderDaily)

# If we want to get the number of NAs without using summary:

sum(BoulderDaily$tmin==NA) #That's not what we want!

# This happens because:

T==NA
F==NA
sum(c(1,2,3,NA))

# Instead:
sum(is.na(BoulderDaily$tmin))

# So what's the mean ratio over our entire data set?
mean(BoulderDaily$tmin)

mean(BoulderDaily$tmin, na.rm=T)

# Alot of functions have the na.rm (remove NA's) option, but some don't.  You may have to
# filter your data or do something fancy.
