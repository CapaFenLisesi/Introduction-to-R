############################################################################################
# Installing R Packages- Errors with unwritable directories
#
# If you try install.packages("scales") (or any other package)
# you may get a popup telling you something along the lines
# of an unwritable directory.  To fix this, you need to change
# your default path to your library.

.libPaths()

# Your default path (on a Windows machine, at least), should be
# something like "C:/Program Files/R/R-3.1.0/library.  You may
# not have write permissions in this directory.  If so, you
# need to make a new directory where you want to store all of
# your R packages.  You can use any path you have access to,
# but for this tutorial I'll call it "/my/library/path". Now,
# we need to add this new path to our "library paths":

.libPaths("/my/library/path")
# Note: the path is quoted, slashes are like "/", and there is no trailing "/"!

# Check that it was loaded:

.libPaths()

# If the path name was invalid, then .libPaths may not be any
# different.  Make sure that your new library path shows up
# when you run .libPaths()

install.packages("Bergm")
library(Bergm)

# Navigate to the .libPaths() that you set, and verify that a
# new folder is created there with the package you just tried
# to install.  You may see some other packages as well, which
# are packages that your desired package depends on.

# You may see some warnings saying "package ... was built under R version ..."
# This is generally safe to ignore, it just means that your current
# R version isn't up to the most current.  If you experience problems
# with your packages, though, then it may be time to update R.

# Now, every time you open R, you'll need to run this:

.libPaths("/my/library/path")

# Sounds annoying, right?  If you want to avoid this, do the following:

setwd("~") # You should see your home directory printed on the screen.
fileConn<-file(".rprofile")
writeLines('.libPaths("/my/library/path")', fileConn) #Replace /my/library/path with your path
close(fileConn)

# You should now see a file called .rprofile in your home directory (probably
# "C:/Users/your-name/Documents", but you can check with getwd()).  This
# file is ran every time R is initialized, and so .libPaths() should be
# set appropriately each time.  To verify this, restart R and run

.libPaths()

# to check that your library paths were correctly set.