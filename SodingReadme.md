1# variable identification.
we can identify all variables of dataset for statistical operation
just type colnames(dataset) function.

2#: Univariate analysis:
    is the analysis which we perform on a single variable of a dataset

3#: Bivariate analysis:
    the analysis which we perform on more than two variable of a dataset in order to analyse the relationship.

4#: Missing value Imputation:
    In order to get the missing value detail of a varible we can use aggr() function of VIM package. that show us all the percentage of missing value for each variable. then add whatever value to the missing index.

5#: outlier treatment:
    Outliers in data can distort predictions and affect the accuracy so we should to remove the outlier value

6#: Variable Creation: 
    In dataset we can create a variable directly or  based on some one condition by using which() function.

7#: Test set & Cross validation:
    before going toward test set let me explain train data. is  a process by getting random sample from a dataset.e.g we have  dataset then  getting 80% random sample from data is a test set and the remaining 20%  data  is test data. we can used train data for train set and test data fot test set. while In cross data we split train data into k-fold
    random chunks for accurate analysis.

8#: Classifier:
    i used logistic regression model  for roc curve because Logistic regression is a method for fitting a regression curve, y = f(x), when y is a categorical variable. The typical use of this model is predicting y given a set of predictors x. The predictors can be continuous, categorical or a mix of both.  

9# Confusion matrix: is a matric of a model where we analyze the model i mean that checking of model.Is the prediction is true or not. what model says and what is actual  behind the model.             