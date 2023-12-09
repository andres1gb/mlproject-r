print(describe(results[-3]))
print("R2:")
r2 = R2(results$prediction, results$actual, na.rm = TRUE)
print(r2)
print("R2 adjusted:")
n = nrow(testset)
k = last_dimension - 2
r2corr = 1-((1-r2)*(n-1)/(n-k-1))
print(r2corr)
print("RMSE:")
print(RMSE(results$prediction, results$actual, na.rm = TRUE))
View(results)
if (plot) {
  plot(nn)
}