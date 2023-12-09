sample <- sample(c(TRUE, FALSE), nrow(data), replace=TRUE, prob=c(train_size,1-train_size))
trainset  <- data[sample, ]
testset   <- data[!sample, ]

last_dimension = dimensions+3
names <- colnames(testset)
names <- names[3:last_dimension] # get all column names except day and price (predicted value)
formula <- as.formula(paste('price ~ ' ,paste(names,collapse='+'))) # create the formula string

# train model and predict results for the test set
nn <- neuralnet(formula, trainset, hidden=layers, threshold=model_threshold, stepmax=max_steps, act.fct = activation_function)
nn$result.matrix
nn.results <- predict(nn, testset)

# build dataframe with results information
results <- data.frame(actual = testset$price, prediction = nn.results)
results$day = testset$day
results$actual_denorm = denormalize(results$actual, min_price, max_price)
results$prediction_denorm = denormalize(results$prediction, min_price, max_price)
results$error = results$prediction - results$actual
results$abs_error = abs(results$error)
results$error2 = results$error*results$error

