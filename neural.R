last_dimension = nn_dimensions+3
names <- colnames(testset)
names <- names[3:last_dimension] # get all column names except day and price (predicted value)
formula <- as.formula(paste('price ~ ' ,paste(names,collapse='+'))) # create the formula string

# train model and predict results for the test set
nn <- neuralnet(formula, trainset, hidden=nn_layers, threshold=nn_threshold, stepmax=nn_max_steps, act.fct = nn_activation_function)
if (nn_plot) {
  plot(nn)
}
nn$result.matrix
nn.results <- predict(nn, testset)

# build dataframe with results information
nn_results <- data.frame(actual = testset$price, prediction = nn.results)
nn_results$day = testset$day
nn_results$actual_denorm = denormalize(nn_results$actual, min_price, max_price)
nn_results$prediction_denorm = denormalize(nn_results$prediction, min_price, max_price)
nn_results$error = nn_results$prediction - nn_results$actual
nn_results$abs_error = abs(nn_results$error)
nn_results$error2 = nn_results$error*nn_results$error
n = nrow(testset)
k = last_dimension - 2

evaluate("Neural network evaluation", nn_results, n, k)
print(distplot("NN distances", nn_results))
print(distplot("NN distances", nn_results, 0.2))
