iris <- read.table(file.choose(), sep=',') 
View(iris)

str(iris)
#install.packages("ggvis") 
library(ggvis)
iris %>% ggvis(~V1, ~V2, fill = ~V5) %>% layer_points()

table(iris$V5)

round(prop.table(table(iris$V5)) * 100,digits = 1)

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]
dim(trainData)
dim(testData)

trainData1 <- trainData[-5]
testData1 <- testData[-5]
dim(trainData1)
dim(testData1)


iris_train_labels <- trainData$V5 
dim(iris_train_labels)
class(iris_train_labels)

iris_test_labels <- testData$V5
dim(iris_test_labels)
class(iris_test_labels)


#install.packages("class") 
library(class)
iris_test_pred1 <- knn(train = trainData1, test = testData1, cl= iris_train_labels,k = 3) 


#install.packages("gmodels")
library(gmodels)
require(gmodels)
CrossTable(x = iris_test_labels, y = iris_test_pred1) 