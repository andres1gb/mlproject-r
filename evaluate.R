print(describe(results[-3]))
print("R2:")
print(R2(results$prediction, results$actual, na.rm = TRUE))
print("RMSE:")
print(RMSE(results$prediction, results$actual, na.rm = TRUE))
View(results)
if (plot) {
  plot(nn)
}