evaluate <- function(text, results, n, k) {
  # n: number of rows
  # k: number of dimensions
  r2 = R2(results$prediction, results$actual, na.rm = TRUE)
  r2adj = 1-((1-r2)*(n-1)/(n-k-1))
  rmse = RMSE(results$prediction, results$actual, na.rm = TRUE)
  
  title(text)
  print(describe(results[-3]))
  cat("\nR2:", r2, "\n", sep="")
  cat("R2 adjusted:", r2adj, "\n", sep="")
  cat("RMSE:", rmse, "\n", sep="")
}

distplot <- function(text, results, max_error=1.0) {
  if (max_error<1.0) {
    text = paste(text, "(error <", max_error, ", outliers missing)")
    
  }
  ggplot(aes(x=actual,y=error),data=results)+geom_point()+ggtitle(text)+ylim(-max_error,max_error)
}
