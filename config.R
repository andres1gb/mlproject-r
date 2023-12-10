# general configuration
exclude_gas_cap_dates = FALSE # gas_prices already using price cap
train_size = 0.8 # 80% of the data will be used for training, 20% for testing

# neural network configuration
nn_dimensions = 20 # use this number of variables to train the model
nn_layers = 8 # hidden layers in the neural network
nn_activation_function = "logistic" # use logistic, tanh or custom function
nn_max_steps = 100000 # max iterations to optimize the neural network
nn_threshold = 0.05 # stop iterating when improvement under this value
nn_plot = FALSE # set TRUE to plot the neural network

# SVM configuration
svm_dimensions = 50 # use this number of variables to train the model
svm_cost = 5 # cost for distance applied
svm_kernel = "linear" # linear or radial calculation
svm_type = "eps-regression" # eps-regression or nu-regression, other methods are classifiers
