
#title:"1.2. Writing functions"
#Author:modified from 'nice-r-code': maina & Steph
#date: "27 October 2017"

#At some point, you will want to write a function, and it will probably be sooner than you think. 
#Functions are core to the way that R works, and the sooner that you get comfortable writing them, 
#the sooner you'll be able to leverage R's power, and start having fun with it.

#The first function many people seem to need to write is to compute the
#standard error of the mean for some variable, 
#because curiusly this function does not come with R's base package. 
#This is defined as sqrt(x)/n 
#(that is the square root of the variance divided by the sample size.

#Start by reloading our data set again.

data <- read.csv("seed_root_herbivores.csv")

#Explore the R data object:
summary(data)

#We can already easily compute the mean:

mean(data$Height)

#and the variance:

var(data$Height)

#and the sample size

length(data$Height)

#so it seems easy to compute the standard error:

sqrt(var(data$Weight)/length(data$Weight))

#This is basically identical to the height case above. 
#We've copied and pasted the definition and replaced the variable that we are interested in. 
#This sort of substitution is tedious and error prone, 
#and the sort of things that computers are a lot better at doing reliably than humans are.

#It is also just not that clear from what is written what the point of these lines is. 
#Later on, you'll be wondering what those lines are doing.

#Look more carefully at the two statements and see the similarity in form, 
#and what is changing between them. This pattern is the key to writing functions.


sqrt(var(data$Height)/length(data$Height))
sqrt(var(data$Weight)/length(data$Weight))


#Here is the syntax for defining a function, 
#used to make a standard error function:

standart.error <- function(x) {
  sqrt(var(x)/length(x))
}

#Takes one argument x
#Note indenting - to keep the code tydy
#Option to use return

#The result of the last line is "returned" from the function.

#We can call it like this:

standart.error(data$Height)

standart.error(data$Weight)

#Note that 'x' has a special meaning within the curly braces. If we do this:


x <- 1:100
standart.error(data$Height)

#we get the same answer. Because 'x' appears in the "argument list", 
#it will be treated specially. 
#Note also that it is completely unrelated to the name of what is provided as value to the function.

#You can define variables within functions:

standard.error <- function(x) {
  v <- var(x)
  n <- length(x)
  sqrt(v/n)
}

#This can often help you structure your function and your thoughts.
#These are also treated specially - they do not affect the main workspace (the "global environment") and are destroyed when the function ends. 
#If you had some value 'v' in the global environment, 
#it would be ignored in this function as soon as the local 'v' was defined, 
#with the local definition used instead.

v <- 1000
standard.error(data$Height)


##Example 2

#We used the variance function above, but let's rewrite it. 
#The sample variance is defined as

#This case is more compliated, so we'll do it in pieces.

#We're going to use 'x' for the argument, 
#so name our first input data 'x' so we can use it.


x <- data$Height

#The first term is easy:

n <- length(x)
(1/(n-1))

#The second term is harder. 
#We want the difference between all the 'x' values and the mean.

m <- mean(x)
x - m

#Then we want to square those differences:

(x-m)^2


#and compute the sum and square:

sum((x-m)^2)


#Watch that you don't do this, which is quite different

sum(x-m)^2


#(this follows from the definition of the mean)

#Putting both halves together, the variance is


(1/(n-1))*sum((x-m)^2)


#Which agrees with R's variance function

var(x)


#The 'rm' function cleans up:

rm(n,x,m)


#We can then define our function, using the pieces that we wrote above.

variance <- function(x) {
  n <- length(x)
  m <- mean(x)
  (1/(n-1))*sum((x-m)^2)
}


#And test it:
variance(data$Height)
var(data$Height)

variance(data$Weight)
var(data$Weight)


## An aside on floating point comparisons:

#Our function does not exactly agree with R's function

variance(data$Height) == var(data$Height)


#This is not because one is more accurate than the other, 
#it is because "machine precision" is finite (that is, the number of decimal places being kept).

variance(data$Height) - var(data$Height)


#This affects all sorts of things:


sqrt(2)*sqrt(2)

sqrt(2)*sqrt(2) - 2
sqrt(2)*sqrt(2) - sqrt(2)*sqrt(2)

#So be careful with '==' for floating point comparisons. 


## Exercise: Often we are required to center amnd standardize data before we run analyses
## centerring means subtracting values from the mean
##standardizing is subrtacting values from the standard deviation
##we are going to define a function that standardizes data 
##and applies it to Height and Weight columns

#solution

scaleMyData<-function(x){
  (x - mean(x)) / sd(x)
  }

data.std<-sapply(data[c("Weight","Height")], scaleMyData)

#Compare this with the base function scale

