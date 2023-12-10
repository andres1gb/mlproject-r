last_dimension = svm_dimensions+3
names <- colnames(testset)
names <- names[3:last_dimension] # get all column names except day and price (predicted value)
formula <- as.formula(paste('price ~ ' ,paste(names,collapse='+'))) # create the formula string

m <- svm(formula, data=trainset, kernel=svm_kernel, cost=svm_cost, type=svm_type)
p <- predict(m, testset, type="response")

# build dataframe with results information
svm_results <- data.frame(actual = testset$price, prediction = p)
svm_results$day = testset$day
svm_results$actual_denorm = denormalize(svm_results$actual, min_price, max_price)
svm_results$prediction_denorm = denormalize(svm_results$prediction, min_price, max_price)
svm_results$error = svm_results$prediction - svm_results$actual
svm_results$abs_error = abs(svm_results$error)
svm_results$error2 = svm_results$error*svm_results$error
n = nrow(testset)
k = last_dimension - 2

evaluate("Support vector machine evaluation", svm_results, n, k)
print(distplot("SVM distances", svm_results))
