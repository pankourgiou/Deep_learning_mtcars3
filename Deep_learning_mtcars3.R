# Deep learning in R
# Loading packages in R
#Apply nn.train() function under the deepnet package in order to model the neural network.
library(mlbench)
library(deepnet)
data("mtcars")
  
# Clean off rows with missing data
mtcars = mtcars[which(complete.cases(mtcars)
                                  == TRUE),]
  
head(mtcars)
names(mtcars)
y = as.matrix(mtcars[, 11])
y[which(y == "mpg")] = 0
y[which(y == "cyl")] = 1
y = as.numeric(y)
x = as.numeric(as.matrix(mtcars[, 2:10]))
x = matrix(as.numeric(x), ncol = 9)
  
# Applying nn.train() function
nn <- nn.train(x, y, hidden = c(5))
yy = nn.predict(nn, x)
print(head(yy))
