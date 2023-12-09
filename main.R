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

# load and normalize dataset
source("load.R")
# create model and calculate predictions for test set
source("neural.R")

# show information for results and plot the neural network
source("evaluate.R")

