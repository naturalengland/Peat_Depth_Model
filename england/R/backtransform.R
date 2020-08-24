#function to backtransform data

backtransform <- function(x, tf = NULL) {
  if (tf == "cbrt") {x^3}
  else if (tf == "sqrt") {x^2}
  else {x}
}