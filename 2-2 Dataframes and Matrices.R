# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# DATA.FRAMES AND MATRICES

# Let's make a 4x4 matrix:

?matrix

matrix(1:16, nrow=4, ncol=4)


# If we want it by row instead:

matrix(1:16, nrow=4, byrow=T)

m = matrix(1:16, nrow=4, byrow=T)

# We can look at the dimensions of our matrix:

dim(m)

# We now have two subscripts:

m[1,1]
m[3,4]

# We can pull out a single row or column:

m[,1]
m[3,]

# NOT:

m[3]
m[7]

# Multiple rows or columns:

m[1:2,]

# Multiple entries:

m[1:2, 3:4]

# To transpose:

t(m)

# We can name rows/columns:

rownames(m)
colnames(m)

rownames(m) = c("First", "Second", "Third", "Fourth")
rownames(m)
m

# Now we can still call with subscripts:

m[1,]

# Or

m["First",]

# If we want multiple rows:

m[c("First", "Third"),]


# What about multiplying two matrices?

n = matrix(c(1,7,5,3), nrow=4, ncol=4, byrow=T)
n

m*n

# Notice that did entry-by-entry multiplication
# Correct syntax:

m %*% n

# Let's check out the diag command

?diag

# So we can get the diagonal by:

diag(m)

# Or we can make diagonal matrices:

diag(2:4)

# We can make the identity easily:

diag(4)

# Now what if we want to solve a linear system?
# 3x + y - 2z = 2; x - 2y + z = 3; 2x - y - 3z = 3

A = matrix(c(3, 1, -2, 
  	 1, -2, 1,
		 2, -1, -3),
	byrow = T, nrow=3
)
A

b = c(2, 3, 3)

solve(A, b)

# Actual answer is 1, -1, 0

x = c(1, -1, 0)

A*x # "*" is element-wise multiplication.  Probably not what we want here.

A %*% x

# And we get the right answer.

# Now what if we want A inverse?
# First of all, does A have an inverse?

det(A)  # Not zero, so yes

# To get inverse:

Ainv = solve(A)
Ainv

A*Ainv #Hmm... that doesn't look right.

A %*% Ainv
round(A %*% Ainv, digits=8)
round(Ainv %*% A, digits=8)

# Let's say our matrix contains some data that we want to summarize
# Can we get the column/row sums or means?

m
colSums(m)
rowMeans(m)

# Let's add these to the matrix, with names

m = rbind(m, colSums(m)); m
rownames(m)[5] = "Sum"; m

m = cbind(m, rowMeans(m))
colnames(m)[5] = "Mean"
m

# Can we store other values in matrices?

mx = matrix( c(c("a", "b"), c("c", "d")), nrow=2 )

# What about numeric values and character values?

mx = matrix( c(c(1, 2), c("c", "d")), nrow=2 )
mx

# Nope!  Matrices can only handle one type of data for the whole matrix.

df = data.frame( values=c(1, 2), labels=c("c", "d") )

# The data.frame is similar to a matrix but can store different types in each column.
# Also, data.frames allow you to refer to columns by name

colnames(df)
df$values
colnames(mx) #No column names are yet assigned to mx
colnames(mx) = c("values", "labels")
mx$values #Doesn't work for matrices!

# Matrix multiplication

A = matrix( c(1,1,2,2), nrow=2 )
B = data.frame( vals=c(1,1), vals2=c(2,2))
A %*% c(0,1)
B %*% c(0,1) #Doesn't work for data.frames

# Data.frames and matrices, which should I use?
# - data.frames allow mixed column types
# - data.frames allow referencing columns by name
# - matrices are better for multiplying matrices

# Conversion from matrix to data.frame and back

A = matrix( c(1,1,2,2), nrow=2 )
A
is(A)
A = data.frame(A)
A #Notice the default column names: "X1" and "X2"
is(A)
A = as.matrix(A)
A #Column names are still here!
is(A)

# QUESTIONS!
# Make a 6x6 identity matrix, and verify that it's inverse is also the identity.



# Remove the last column of the matrix you made above.  What happens if you try to find
# it's inverse now?



# Create a 15x15 upper triangular matrix with 1's on the diagonal and non-zero entries on the
# upper triangle.  Does this matrix have an inverse?  What is it's determinant?

