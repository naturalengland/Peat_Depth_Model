# r squared and adjusted r squared

rsq <- function(observed, predicted) {
  stats::cor(observed, predicted)^2
}

rsq.adj <- function(observed, predicted, n.predictors, df.int = 0) {
    1 - 
    (1 - rsq(observed, predicted)) * 
    ((length(observed) - df.int)/(length(observed)-n.predictors-1))
}

rmse <- function(observed, predicted) {
  sqrt(mean((predicted - observed)^2))
}


model_equation <- function(model, ...) {
  format_args <- list(...)
  
  model_coeff <- model$coefficients
  format_args$x <- abs(model$coefficients)
  model_coeff_sign <- sign(model_coeff)
  model_coeff_prefix <- case_when(model_coeff_sign == -1 ~ " - ",
                                  model_coeff_sign == 1 ~ " + ",
                                  model_coeff_sign == 0 ~ " + ")
  model_eqn <- paste(strsplit(as.character(model$call$formula), "~")[[2]], # 'y'
                     "=",
                     paste(if_else(model_coeff[1]<0, "- ", ""),
                           do.call(format, format_args)[1],
                           paste(model_coeff_prefix[-1],
                                 do.call(format, format_args)[-1],
                                 " * ",
                                 names(model_coeff[-1]),
                                 sep = "", collapse = ""),
                           sep = ""))
  return(model_eqn)
}



