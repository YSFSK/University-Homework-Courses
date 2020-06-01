install.packages("tidyverse")
install.packages("caret")
# Importing libraries
library(tidyverse)
library(lattice)
library(caret)
# Load the dataset
data("swiss")
# Inspect the data
swiss
sample_n(swiss, 3)
set.seed(123)
#The Validation set Approach
# Split the data into training and test set
training.samples = swiss$Fertility %>% createDataPartition(p = 0.8, list = FALSE)
training.samples
train.data  = swiss[training.samples, ]
train.data
test.data = swiss[-training.samples, ]
test.data
# Build the model
?lm
model = lm(Fertility ~., data = train.data)
model
plot(model)
# Make predictions and compute the R-squared (R2), Root Mean Squared Error (RMSE) 
#and Mean Absolute Error (MAE)
predictions = model %>% predict(test.data)
data.frame( R2 = R2(predictions, test.data$Fertility),RMSE = RMSE(predictions, test.data$Fertility),MAE = MAE(predictions, test.data$Fertility))

#Leave one out cross validation - LOOCV
# Define training control
train.control = trainControl(method = "LOOCV")
# Train the model
model = train(Fertility ~., data = swiss, method = "lm",trControl = train.control)
# Summarize the results
print(model)


#K-fold cross-validation
# Define training control
set.seed(123) 
train.control = trainControl(method = "cv", number = 10)
# Train the model
model = train(Fertility ~., data = swiss, method = "lm",trControl = train.control)
# Summarize the results
print(model)

#Repeated K-fold cross-validation
# Define training control
set.seed(123)
train.control = trainControl(method = "repeatedcv", number = 10, repeats = 3)
# Train the model
model = train(Fertility ~., data = swiss, method = "lm", trControl = train.control)
# Summarize the results
print(model)

install.packages('randomForest')
install.packages('party')
install.packages('ggplot2')
install.packages('xgboost')
install.packages('DiagrammeR')
install.packages('boot')
install.packages('rpart')
install.packages('adabag')
install.packages('JOUSBoost')
install.packages('bootstrap')
install.packages('foreach')
install.packages('doParallel')
install.packages('iterators')
install.packages('parallel')
