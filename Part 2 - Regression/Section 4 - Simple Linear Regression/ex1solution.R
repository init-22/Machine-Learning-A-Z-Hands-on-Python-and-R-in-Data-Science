# Importing the dataset
dataset = read.table("ex1data1.txt", 
               sep=",", 
               col.names=c("Population", "Profit"), 
               fill=FALSE, 
               strip.white=TRUE)

# Splitting the dataset into the Training set and Test set
#install.packages('caTools')
install.packages('ggplot2')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Profit ~ Population,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$Population, y = training_set$Profit),
             colour = 'red') +
  geom_line(aes(x = training_set$Population, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Population V/S Profit') +
  xlab('Population in 10,000') +
  ylab('Profit')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$Population, y = test_set$Profit),
             colour = 'red') +
  geom_line(aes(x = test_set$Population, y = predict(regressor, newdata = test_set)),
            colour = 'blue') +
  ggtitle('Population V/S Profit') +
  xlab('Population in 10,000') +
  ylab('Profit')