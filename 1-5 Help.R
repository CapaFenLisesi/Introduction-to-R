# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# HELP!

?ls

# Typing the question mark before a command will pull up a help window to
# tell you what that function does.  But, what if you don't know the name
# of the function?
help.search("remove")
# Ah, we want the "rm" function.

# Can even get help on some of the other operators:
?"["
?"+"

# Check out the examples!  Running that code can be very helpful in showing
# what a function does.  Sidenote: you can highlight portions of the code
# and press CTRL + R to run just that piece.  That can be useful for 
# examining what a particular piece of code does.

# Example from +:
x <- -1:12
x + 1
2 * x + 3
x %% 2 #-- is periodic
x %/% 5
