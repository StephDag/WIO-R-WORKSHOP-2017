#title: "Day1_5.1_Making Choices"
#Conditional statements


#**Questions**

 # + How do I make choices using 'if' and 'else' statements?
 # + How do I compare values?
  
#**Objectives**
 # + Write conditional statements with 'if' and 'else'.
 # + Correctly evaluate expressions containing '&' ('and') and '|' ('or').

#Our previous lessons have shown us how to manipulate data, define our own functions, and repeat things. However, the programs we have written so far always do the same things, regardless of what data they're given. We want programs to make choices based on the values they are manipulating.

## Conditionals

num <- 37
if (num > 100) {
  print("greater")
} else {
  print("not greater")
}

#The second line of this code uses an 'if' statement to
#tell R that we want to make a choice. 
#If the following test is true, the body of the 'if'
#(i.e., the lines in the curly braces underneath it) are executed. 
#If the test is false, the body of the 'else' is executed instead. 
#Only one or the other is ever executed:

num > 100

#And as you likely guessed, the opposite of 'FALSE' is 'TRUE'.

num < 100

#Conditional statements don't have to include an 'else. 
#If there isn't one, R simply does nothing if the test is false:

num <- 53
if (num > 100) {
  print("num is greater than 100")
}

#We can also chain several tests together when there are more than two options.
#This makes it simple to write a function that returns the sign of a number:

sign <- function(num) {
  if (num > 0) {
    return(1)
  } else if (num == 0) {
    return(0)
  } else {
    return(-1)
  }
}

sign(-3)

sign(0)

sign(2/3)

#Note that when combining 'else and 'if'' in an else if statement, 
#the 'if' portion still requires a direct input condition. 
#This is never the case for the else statement alone, 
#which is only executed if all other conditions go unsatisfied. 
#Note that the test for equality uses two equal signs, '=='.

### Other Comparisons

#Other tests include greater than or equal to ('>='), 
#less than or equal to ('<='), 
#and not equal to ('!=').

#We can also combine tests. 
#An ampersand, '&', symbolizes "and".
#A vertical bar, '|', symbolizes "or". '&' is only true if both parts are true:

if (1 > 0 & -1 > 0) {
    print("both parts are true")
} else {
  print("at least one part is not true")
}

#while '|' is true if either part is true:


if (1 > 0 | -1 > 0) {
    print("at least one part is true")
} else {
  print("neither part is true")
}


#In this case, "either" means "either or both", 
#not "either one or the other but not both".

##Exercise:
#create your own conditional function
