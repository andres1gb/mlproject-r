# include used libraries
library(readr)
library(caret)
library(neuralnet)
library(psych)
library(e1071)

# clear all environment variables
rm(list=ls()) 

# include functions and constants
source("utils.R")
source("config.R")
source("evaluate.R")

# load and normalize dataset
source("load.R")
# create model and calculate predictions for test set
source("neural.R")
source("svm.R")



