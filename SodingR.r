library(ggplot2)
library(VIM)
library(plotly)
library(class)
ps <- read.csv("C:\\Users\\Orbit\\Desktop\\markDown\\passenger.csv", stringsAsFactors=FALSE)
p1 <- plot_ly(x=ps$Fare,type = "histogram")
p1

######################  @2

p2 <- plot_ly(y = ps$PassengerId,x = ps$Name,
            type='scatter',
            mode='markers')
p2
 
##################### @3
# missing value imputaion
t <- aggr(ps,numbers=TRUE, sortVars=TRUE, labels=names(ps))
p<-plot.aggr(t)
p
 
####################  @4
 
 cars1 <- cars[1:30, ]  # original data
 cars_outliers <- data.frame(speed=c(19,19,20,20,20), dist=c(190, 186, 210, 220, 218))  # introduce outliers.
 cars2 <- rbind(cars1, cars_outliers)  # data with outliers.

 par(mfrow=c(1, 2))
 plot(cars2$speed, cars2$dist, xlim=c(0, 28), ylim=c(0, 230), main="With Outliers", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
 abline(lm(dist ~ speed, data=cars2), col="blue", lwd=3, lty=2)

 plot(cars1$speed, cars1$dist, xlim=c(0, 28), ylim=c(0, 230), main="Outliers removed \n A much better fit!", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
 abline(lm(dist ~ speed, data=cars1), col="blue", lwd=3, lty=2)
 
 ################### @5
 things <- data.frame(ingredient =  c("grape", "green bean" , "nuts" , "organge"),
                      sweetness = c(8,3,3,7),
                      crunchiness = c(5,7,6,3),
                      class = c("fruit", "vegetable", "protein", "fruit"))
 things
 tomato <- data.frame(ingredient =  "tomato",
                      sweetness = 6,
                      crunchiness = 4)
 tomato
 library(class) #contains knn function
 library(dplyr)
 pred <- knn(select(things, sweetness, crunchiness), 
             select(tomato,sweetness, crunchiness), things$class, k=1)
 pred
 #######################
 ## for cross Validatation
 library(caret)
 library(e1071)
 
 data(iris)
 TrainData <- iris[,1:4]
 TrainClasses <- iris[,5]
 
 knnFit1 <- train(TrainData, TrainClasses,
                  method = "knn",
                  preProcess = c("center", "scale"),
                  tuneLength = 10,
                  trControl = trainControl(method = "cv"))
 knnFit1
 #########################
 # Read Data File
 
 binary <- read.csv("C:\\Users\\Orbit\\Desktop\\markDown\\binary.csv", header = TRUE)
 
 
 # Logistic Regression Model
 library(nnet)
 mymodel <- multinom(admit~., data = binary)
 mymodel
 # Misclassification Rate
 p <- predict(mymodel, binary)
 p
 tab <- table(p, binary$admit)
 tab
 
 1-sum(diag(tab))/sum(tab)
 
 table(binary$admit)
 
 # Model Performance Evaluation
 library(ROCR)
 pred <- predict(mymodel, binary, type = 'prob')
 
 pred <- prediction(pred, binary$admit)

 eval <- performance(pred, "acc")
 plot(eval)
 abline(h=0.71, v=0.45)
 
 # Identify Best Values
 max <- which.max(slot(eval, "y.values")[[1]])
 acc <- slot(eval, "y.values")[[1]][max]
 cut <- slot(eval, "x.values")[[1]][max]
 print(c(Accuracy=acc, Cutoff = cut))
 
 # Reciever Operating Charateristic (ROC) Curve
 roc <- performance(pred, "tpr", "fpr")
 plot(roc,
      colorize=T,
      main = "ROC Curve",
      ylab = "Sensitivity",
      xlab = "1-Specificity")
 abline(a=0, b=1)
 
 # Area Under Curve (AUC)
 auc <- performance(pred, "auc")
 auc <- unlist(slot(auc, "y.values"))
 auc <- round(auc, 4)
 legend(.6, .2, auc, title = "AUC", cex = 1.2)
 ############################################

       

 
 