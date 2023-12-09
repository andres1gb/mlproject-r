getMin <- function(x, na.rm=TRUE) {
  return(min(x))
}

getMax <- function(x, na.rm=TRUE) {
  return(max(x))
}

normalize <- function(x, na.rm = TRUE) {
  return((x- min(x)) /(max(x)-min(x)))
}

denormalize <- function(x, min_val, max_val, na.rm=TRUE) {
  return(min_val+x*(max_val-min_val))
}
