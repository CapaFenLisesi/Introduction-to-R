# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SEQUENCES & REPEATS

# We already know how to do simple sequences, like

1:10
100:85

# EXAMPLE
# Examine the seq & rep commands

?seq
?rep

# Can you get a vector of every even number from 0 to 50?

seq(0, 50, by=2)

# What about the first 93 multiples of 7?

seq(7, length=93, by=7)

# 32 zeros

rep(0, 32)

# The sequence "3, 6, 9" repeated 15 times

rep(seq(3, 9, by=3), 15)

# The sequence 1 1 1 2 2 2 3 3 3 ... 20 20 20

rep(1:20, each=3)

# The sequence 2 2 4 4 6 6 2 2 4 4 6 6 2 2 4 4 6 6

rep(seq(2, 6, by=2), 3, each=2)