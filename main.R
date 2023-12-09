# include used libraries
library(readr)
library(caret)
library(neuralnet)
library(psych)

# clear all environment variables
rm(list=ls()) 

# include functions and constants
source("utils.R")
source("config.R")

# load and normaize dataset
source("load.R")
# create model and calculate predictions for test set
source("neural.R")

# show information for results and plot the neural network
print(describe(results[-3]))
print(R2(results$prediction, results$actual, na.rm = TRUE))
print(RMSE(results$prediction, results$actual, na.rm = TRUE))
View(results)
plot(nn)
