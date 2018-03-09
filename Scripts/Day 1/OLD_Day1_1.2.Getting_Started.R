#set working directory
setwd("C:/Users/Maina/Dropbox/WIO R Workshop/Workshop Material/Github_WIO_R_WORKSHOP_2017/WIO-R-WORKSHOP-2017/data/")

# 1. Using R as a calculator
### 1.1. Doing arithmetic with R
#The simplest thing you could do with R is to arithmetic

1+100

#Here, we've added 1 and and 100 together to make 101. The [1] preceeding this we will explain in a minute. 
#For now, think of it as something that indicates output.
#of operations is same as in maths class (from highest to lowest precedence)

#+ Brackets
#+ Exponents
#+ Divide
#+ Multiply
#+ Add
#+ Subtract

#What will this evaluate to?

3+5*2

#The "caret" symbol (or "hat") is the exponent (to-the-power-of) operator (read `x ^ y` as "x to the power of y"). What will this evaluate to?

3+5*2^2

#Use brackets (actually parentheses) to group to force the order of evaluation if it differs from the default, or to set your own order.

(3+5)*2

##But this can get unweidly when not needed:

(3+(5*(2^2))) # hard to read

3+5*2^2 #easier to read, once you know some rules

3+5*(2^2) # if you forget some rules, this might help

#See ?Arithmetic for more information, and two more operators (you can also get there by `?"+"` (note the quotes)

?Arithmetic

##If R thinks that the statement is incomplete, it will change the prompt from `>` to `+` indicating that it is expecting more input. This is not an addition sign! 
#Try: 

3+5*(2^2

#Press `"Esc"` if you want to cancel this statement and return to the prompt.

### 1.2. Comparing objects with R
#The usual sort of comparison operators are available:

1 == 1 #equality (note two equals signs, read as "is equal to")

1 == 2

1 != 2 #inequality (read as "is not equal to")

1<2 # less than

1<=1 # less than or equal to"


1>0 # greater than


1>= -9 # greater than or equal to

#See `?Comparison` for more information (you can also get there by `help("==")`.

### 1.3. Scientific notation with R

##Really small numbers get a scientific notation:


2/10000

#which you can write in too:

2e-04

#Read `e-XX` as "multiplied by `10^XX"`, so `2e-4` is `2 * 10^(-4)`.

### 1.4. Mathematical functions with R

#R has many built in mathematical functions that will work as you would expect:

sin(1) # trigonometric functions

asin(1) # inverse sin (also for cos and tan)"

log(1) #natural logarithm

log10(100) # base-10 logarithm  

log2(100) # base-2 logarithm  

exp(0.5) #e^(1/2)


#Plus things like probability density functions for many common distributions, and other mathematical functions (e.g., Gamma, Beta, Bessel). If you need it, it's probably there

#2. Data objects in R

### 2.1. Variables and assignment
#You can assign values to variables using the assignment operator `<-`, like this:

x <-1/40

#and now the variable `x` contains the **value** `0.025`

x

#(note that it does not contain the fraction 1/40, it contains a decimal approximation of this fraction. This appears exact in this case, but it is not. These decimal approximations are called "floating point numbers" and at some point you will probably end up having to learn more about them than you'd like).
#Look up at the top right pane of RStudio, and you'll see that this has appeared in the "Workspace" pane.

#Our variable `x` can be used in place of a number in any calculation that expects a number.

log(x)

sin(x)

#The right hand side of the assignment can be any valid R expression.

#It is also possible to use the `=` operator for assignment:

x=1/40

#but this is much less common among R users. The most important thing is to be **consistent** with the operator you use. There are occasionally places where it is less confusing to use `<-` than `=`, and it is the most common symbol used in the community. So I'd recommend `<-`.

#Notice that assignment does not print a value.

x<-100

#Notice also that variables can be reassigned.
##`x`used to contain the value 0.025 and and now it has the value 100).

x

#Assignment values can contain the variable being assigned to: What will `x` contain after running this?

x<-x+1
x


# Clean up
rm(x)  # Remove an object from workspace

# Remove more than one
a<-5
b<-10
rm(a, b)  

# Clear entire workspace
rm(list = ls()) 


###2.2. Vectors

#R was designed for people who do data analysis. There is a reason why "data" is a more common term than "datum" - generally you have more than one piece of data (although the Guardian argues that this distinction is old fashioned). As a result in R all data types are actually vectors. 
#So the number '1' is actually a vector of numbers that happens to be of length 1.

1

length(1) # length(): get the length of a vector

### Build a specific vector
#To build a vector, use the c(). function (`c` stands for "concatenate")
 
x<- c(1,2,40,1234)
x

length(x)

#(notice how RStudio has updated its description of x. If you click it, you'll get an option to alter it, which is rarely what you want to do).
#This is a deep piece of engineering in the design; most of R thinks quite happily in terms of vectors. If you wanted to double all the values in the vector, just multiply it by 2:

2*x

#You can get the maximum value:

max(x)

#... the minimum value 

min(x)

##... the sum

sum(x)

#... the mean value

mean(x)

#and so on. There are huge numbers of functions that operate on vectors. It is more common that functions will than that they won't.

#Vectors can be summed together:

y<- c(0.1,0.2,0.3,0.4)
x+y

#and they can be concatenate together:

c(x,y)

#... and scalars can be added to them

x+0.1

#**Be careful** though: if you add/multiply together vectors that are of different lengths, but the lengths factor, R will silently "recycle" the length of the shorter one:

x

x*c(-2,2)

##The **first** and **third** element have been multiplied by **-2** while the **second** and **fourth** element are multiplied by *2*.

#If the length of the shorter vector is not a factor of the length of the longer vector, you will get a warning, but **the calculation will happen anyway**:

x*c(-2,0,2)

##This is almost never what you want. Pay attention to warnings. Note that Warnings are different to Errors. We just saw a warning, where what happened is (probably) undesirable but not fatal. You'll get Errors where what happened has been deemed unrecoverable. For example:

x+z

#Just as with the scalars, we can do comparisons. This returns a new vector of TRUE and FALSE indicating which elements are less than 10:

x<10

#You can do a vector-vector comparison too:

x<y

#And combined arithmetic operations with comparison operations. Both sides of the expression are fully evaluated before the comparison takes place:

x>1/Y

#Be careful with comparisons: This compares the first element with -20, the second with 20, the third with -20 and the fourth with 20.

x>=c(-20,20)

#This does nothing sensible, really, and warns you again:

x == c(-2,0,2)

#All the comparison operators work in fairly predictible ways:

x == 40

x != 2

#### Define a vector with a sequence

#Sequences are easy to make, and often useful. Integer sequences can be made with the colon operator:

3:10 # sequence 3,4,5,...,10

#Which also works backwards:

10:3

#Step in different sizes with `seq()`

seq(3,10,by=2)

seq(3,10,length=10)

#Now we will see the meaning of the [1] term - this indicates that you're looking at the first element of a vector. If you make a really long vector, you'll see new numbers:

seq(3,by=2,length=100)

#### Finding specific elements in a vector

#First, assign an element to x

x=seq(3,by=2,length=100) # x is assigned a vector of length 100, starting from 3, with an increment of 2
x

#Find the 1st element of x using `[]`

x[1] # 1st element

x[2] # 2nd element

x[100] # 100th element

###2.3. Matrix

#Define a matrix (assign to y) with 9 rows and 3 columns using the data in x
#**Note**: x has been used several time previously. If you wish to assign a new value to x, clean x first by removing it from the workspace.

x  
rm(x)
x # if an error meesage "object x not found", x has been removed succesfully

x=1:27
y <- matrix(data=x,nrow=9,ncol=3)
y


#Dimension of y with `dim()`
dim(y)

#Result provides a vector of 2. The first element is the number of lines (here 9) and the second element is the number of columns (here 3 columns).

#Extract a value from y with []

y[1,2] # The element at the crossroad between the line 1 and column 2

#Extract a line from y with []

y[1,] # line 1

#Extract a column from y with `[]`

y[,1] # column 1

#### Extract a vector from y using the numerical indices in x

y[x]  # referencing an object with another object

#### Define a 3-dimensional array (assign to z) with 3 rows, 3 columns and 3 layers, using the data in x

z <- array(data=x,dim=c(3,3,3))
z
z[x]
z[rev(x)] # What does the function rev() do? How can you find out?

#### Browse the datasets available in R, find Edgar Anderson's Iris data and load it as a dataframe 

data(iris)
head(iris)
dim(iris)
#view(iris)

#### Convert the iris dataset to a matrix and check the data types

iris2 <- as.matrix(iris)
head(iris2)
mode(iris2)

iris3 <- as.matrix(iris[,1:4])
head(iris3)
mode(iris3)

#### Using matrices instead of data frames 

#When data is all numbers (except for row and column names), I normally use matrices rather than dataframes
#If you have row names in your data file, and you want to convert to a matrix, you will need to specify which column has the row names (see the row.names argument in the read.table function)

