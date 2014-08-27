################################################################################################
# DON'T WRITE LOOPS
# R is a vector based language, and so accessing individual elements can be slow.  It's often
# faster to operate on an entire vector at once instead of looping over all the elements.
# But, it's often harder to do this "vectorization" of your code.  So, don't worry about it
# unless your code is running too slowly or if you're working with big data.
# Google can be very helpful.

# Let's say we have a vector and we want to add one to each element:

x = rnorm(10000)

# Option 1
y = x
for(i in 1:length(x))
  y[i] = x[i] + 1

# Option 2
y = x + 1

# Which is faster?

install.packages("rbenchmark")
library(rbenchmark)
?benchmark

benchmark(
  {y = x
  for(i in 1:length(x))
    y[i] = x[i] + 1}
  ,{y=x+1} )
# It ran the code 100 times, and the vectorized version (option 2) took less than .005 seconds.
# Option 1 took 2.16 seconds (but you may get different times).  Does this difference matter?
# Yeah, it matters a ton if you have to do this task 1000 times.  Or, if x is much bigger.

# Alot of functions accept vector arguments and thus have vectorization built in already.
# Suppose we want to generate 1000 random normal observations.

means = 1:1000
sd = 1:1000

benchmark(
  #Option 1: for loop
  {y=rep(0,1000)
   for(i in 1:length(y))
     y[i] = rnorm(1, mean=means[i], sd=sd[i])}
  #Option 2: vectorized rnorm
  ,{rnorm(1000, mean=means, sd=sd)} )

# Again, vectorized version is much faster.

# Sometimes apply can be helpful

M = matrix( rnorm(5000), ncol=5 )

benchmark(
  {sums = rep(0,5)
   for(j in 1:5){
    for(i in 1:1000){
      sums[j] = sums[j] + M[i,j]
    }
   } }
  ,{apply(M,2,sum)} )

# apply (and other similar functions: sapply, tapply, mapply, by, aggregate, vectorize, etc.)
# can help you to vectorize a function instead of using a loop.

# What if you can't vectorize the function?  This happens if the output from the first
# execution of the function is used as an input to the second execution, and so on.

accumErrorR = function(n){
  errors = rep(0,n)
  errors[1] = runif(1,0,1)
  for(i in 2:n)
    errors[i] = runif(1,0,errors[i-1]*3)
  return(errors)
}

# For something like this, you can't vectorize in R.  If you really need to speed up this
# function, you'll likely need to implement it in C++

################################################################################################
# plyr

install.packages("plyr")
library(plyr)

# Let's look at the baseball dataset in the plyr package

?baseball
summary(baseball)
dim(baseball)
head(baseball)
length(unique(baseball$id)) #How many unique id's do we have?

# Only 1228 unique ids, but 21699 rows.  How many rows correspond to each id?

?ddply
ddply( .data=baseball, .variables="id", .fun=nrow )
# .data specifies the dataset.  .variables tells ddply which variable(s) I want to group my
# data by.  .fun tells ddply what function I want to apply to that group of variables.

# You can also write your own functions to be applied to the groups of data

ddply( .data=baseball, .variables="id", .fun=function(df){
  max(df$g)} )


################################################################################################
# ggplot2

# This is my favorite plotting package.  The learning curve can be a bit rough, but it lets
# you create some beautiful graphs with relative ease.  Hadley Wickham, the package author,
# even wrote a tutorial book about the package:
# http://www.amazon.com/ggplot2-Elegant-Graphics-Data-Analysis/dp/0387981403#

install.packages("ggplot2")
install.packages("scales")
library(ggplot2)
library(scales)

?diamonds
head(diamonds)
summary(diamonds)

# I want to understand how price and carat relate:

ggplot( diamonds, aes(x=carat, y=price) ) + geom_point()

# Price should probably be in dollars

ggplot( diamonds, aes(x=carat, y=price) ) + geom_point() +
  scale_y_continuous(labels=dollar)

# Let's add some color

ggplot( diamonds, aes(x=carat, y=price, color=clarity) ) + geom_point() +
  scale_y_continuous(labels=dollar)
# Legends get added automatically!

# Maybe we want to understand how this relationship varies by cut

ggplot( diamonds, aes(x=carat, y=price, color=clarity) ) + geom_point() +
  scale_y_continuous(labels=dollar) + facet_wrap( ~ cut )

# Or we could map cut to a point shape instead

ggplot( diamonds, aes(x=carat, y=price, color=clarity, shape=cut) ) + geom_point() +
  scale_y_continuous(labels=dollar)
# Maybe not the best choice for this plot...

# Fitting trends to graphs is very easy:

data = data.frame( x=runif(100,-3,3) )
data$y = data$x^2 + rnorm(100)

ggplot( data, aes(x=x, y=y) ) + geom_point()

# Add a best fit line (with confidence bands!):

ggplot( data, aes(x=x, y=y) ) + geom_point() + geom_smooth(method="lm")

# Well, maybe relationship isn't linear:

ggplot( data, aes(x=x, y=y) ) + geom_point() + geom_smooth(method="lm", formula=y ~ I(x^2) + x)

# Or, maybe it's some arbitrary smooth function

ggplot( data, aes(x=x, y=y) ) + geom_point() + geom_smooth(method="loess") 
# Not a quadratic, but a "locally weighted scatterplot smoother"

# What if we have some really large values in our data?

data$y = exp(data$y)
ggplot( data, aes(x=x, y=y) ) + geom_point()

# Use a log scale on the y-axis:

ggplot( data, aes(x=x, y=y) ) + geom_point() + scale_y_log10()

# Don't have to worry about transforming the data and updating labels, ggplot does it all!

# We can generate many other plot types

ggplot( diamonds, aes(x=price) ) + geom_bar()
ggplot(economics, aes(x = date, y = unemploy)) + geom_line() #Look at how nicely date's are plotted!
ggplot( diamonds, aes(x=price, color=cut) ) + geom_density() #Estimates the density functions
ggplot( diamonds, aes(y=price, x=clarity) ) + geom_boxplot() #Estimates the density functions
d = data.frame( x=rnorm(1000), y=rnorm(1000) )
ggplot(d, aes(x=x, y=y) ) + geom_density2d() #Contour plot of the bivariate density

# In summary, ggplot2 is a very flexible and powerful package.  It can be difficult to learn
# the syntax, but once you're comfortable with it you can do some pretty cool things.
# Also, once you're comfortable, generating plots can be much easier, as you don't have to
# fiddle with axis labels, legends, etc.

################################################################################################
# bigmemory
# I'm not going to give examples of how to use this package, but it's very useful if you're
# working with very large datasets.  Usually, R is limited by your RAM.  So, if you have 4GB
# of RAM, R can't deal with datasets larger than 4GB.  However, the bigmemory package
# allows you to store data on your harddisk instead, and thus you are only limited by your
# harddrive size.  Doing this generally makes it more difficult to write code to process the
# data, but sometimes this is your only option for huge datasets.  Check out the bigmemory and
# biglm packages if interested.

################################################################################################
# Rcpp
# Writing code in C++ can dramatically speed up computation time for some problems.  Typically,
# it's useful when you can't vectorize a function.  Most functions in R are already vectorized
# so this usually isn't an issue.  But, when it is, Rcpp can be a HUGE help.

install.packages("Rcpp")
install.packages("RcppArmadillo")
install.packages("inline")
library(Rcpp)
library(inline)
library(RcppArmadillo)
#RcppArmadillo can also be useful if you're using matrices and the Armadillo C++ library

accumErrorR = function(n){
  errors = rep(0,n)
  errors[1] = runif(1,0,1)
  for(i in 2:n)
    errors[i] = runif(1,0,errors[i-1]*3)
  return(errors)
}

?cxxfunction
accumErrorCpp = cxxfunction( signature(nR="numeric"), body="
  int n = as<int>(nR);
  double runif = rand() % 10000;
  arma::vec ans(n);
  ans[0] = runif/10000;

  for(int i=1; i<n; i++)
  {
    runif = rand() % 10000;
    ans[i] = runif/10000*ans[i-1]; //U(0,1)*k ~ U(0,k)
  }

  return(wrap(ans));"
  ,plugin="RcppArmadillo")

benchmark( accumErrorR(10000), accumErrorCpp(10000))
# C++ code runs about 1000x faster (at least on my machine)!

# Another example, courtesy of Dirk Eddelbuettel (author of Rcpp).  See http://dirk.eddelbuettel.com/code/rcpp/html/Misc_2fibonacci_8r-example.html
# Computing the fibonacci numbers can be computationally intensive for large k:
# f_k = f_{k-1} + f_{k-2}
# A simple implementation uses recursive program calls, and this can be REALLY slow in R

# A C++ version for computing the fibonacci numbers

fibRcpp <- cppFunction( '
  int fibonacci(const int x) {
  if (x == 0) return(0);
  if (x == 1) return(1);
  return (fibonacci(x - 1)) + fibonacci(x - 2);
}' )

# The R version

fibR <- function(seq) {
  if (seq == 0) return(0);
  if (seq == 1) return(1);
  return (fibR(seq - 1) + fibR(seq - 2));
}

# Same answers:

fibR(10)
fibRcpp(10)

benchmark( fibR(5), fibRcpp(5), replications=10000 ) #~8x faster
benchmark( fibR(10), fibRcpp(10), replications=10000 ) #~60x faster
benchmark( fibR(20), fibRcpp(20), replications=100 ) #At least 600x faster
benchmark( fibR(30), fibRcpp(30), replications=1 ) #Much faster

# Rcpp Summary:
# - Harder to write code and debug errors (typically) 
# - Incorrect C++ code can crash R without warning
# - Compiling functions takes much longer
# - I've had issues with C++ integration for older versions of R
# + Huge speed-up when used in certain scenarios

################################################################################################
# shiny
# The shiny package gives a relatively easy way for R programmers to build interactive web apps.  You can
# implement any kind of R analysis, and then write a bit of R code around it (using shiny) to turn your
# analysis into something that a non-programmer can interact with and understand.  I'm sure there's tons
# of examples if you just google it, but here's one I put together:
# http://glimmer.rstudio.com/rockclimber/Example/
# Note: RStudio (a company) hosts shiny apps, so you can sign up for a free account, upload your shiny code
# and you'll have an interactive app anyone can view with an internet connection.

################################################################################################
# Sweave/knitr
# Sweave, sometimes pronounced "S weave" (the old, non-open source version of R was S) is a package which enables
# you to weave R code within LaTeX code.  It can be very useful for putting together documents when you want to
# show what R code you ran and what results it gave you.  Do a google image search for "Sweave example" and you'll
# see what you can do with this package.
# knitr, pronounced "knit-er" works similarly, but it creates a html file instead of a pdf file.
# If you're going to be using these packages, I highly recommend using RStudio.  Check it out!

################################################################################################
# Setting defaults
# You may want to set a few things each time you open R.  For example, when you run install.packages(),
# R prompts you for the mirror you'd like to use.  You can use the following code to set your default
# repository:
options("repos" = c(CRAN = "http://cran.rstudio.com/"))
# However, it's going to be a pain to remember to put this at the top of each of your code files.
# Instead, you can create a .rprofile file, and put it in your home directory.  To figure out what
# your home directory is, run:
setwd("~")
getwd()
# Place the .rprofile file here, and in that text file you can put anything that you want R to run
# each time a new R session starts.  However, be careful with this!  If you're ever going to be
# sharing code with other people, you'll want to either make sure that they have your .rprofile or
# that your .rprofile doesn't do anything that will affect their R user experience.  Here's what I
# have in mine:

## Don't ask me for my CRAN mirror every time
options("repos" = c(CRAN = "http://cran.rstudio.com/"))

## Penalize scientific notation:
options(scipen=10)

## Store the jar file for OJDBC connects
jarfile = "C:/sqldeveloper/jdbc/lib/ojdbc6.jar"

source_github <- function(u) {
  # load package
  library(RCurl)

  # read script lines from website and evaluate
  script <- getURL(u, followlocation=TRUE, ssl.verifypeer=F)
  eval(parse(text = script), envir=.GlobalEnv)
}

# The first line sets my default package.  The next sets the scientific notation penalty (i.e. R
# will switch to scientific notation only when there are at least 10 0's).  The third line
# stores a directory that I always seem to forget (but I never use the jarfile variable directly
# in my code, I just call it in the console to remind myself).  The last function is a bit special:
# it allows me to load code from a url.  In particular, in github, you can store files with functions.
# This function allows me to load all the code from these files by passing the url to source_github.
# For example, try
source_github("https://raw.githubusercontent.com/rockclimber112358/Introduction-to-R/master/1-3%20Assigning%20Variables.R")
# You should get an error (remember in that code how we attempt -1 <-2?) but then see that x and y are
# defined to 12 and 5, respectively.  Granted, you would never want to source this file in this way,
# but I've used this a ton for writing functions.  You store and update code on github, and then
# you can use the source_github function to load these functions on any computer with an internet
# connection.
