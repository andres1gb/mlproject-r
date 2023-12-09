dimensions = 20 # use this number of variables to train the model
layers = 8 # hidden layers in the neural network
activation_function = "logistic" # use logistic, tanh or custom function
max_steps = 100000 # max iterations to optimize the neural network
model_threshold = 0.05 # stop iterating when improvement under this value
train_size = 0.8 # 80% of the data will be used for training, 20% for testing
plot = FALSE # set TRUE to plot the neural network