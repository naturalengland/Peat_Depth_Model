# parallel krige.cv.spatial for sp objects


krige.cv.spatial.par = function (formula, locations, model = NULL, ..., beta = NULL,
                             nmax = Inf, nmin = 0, maxdist = Inf, nfold = nrow(locations), verbose = interactive(),
                             debug.level = 0) {
  
  # data = locations 
  gstat.cv.par(gstat(g = NULL, id = "var1", formula = formula,
                     data = locations, model = model, beta =
                       beta, nmax = nmax, nmin = nmin, maxdist = maxdist,
                     ...), nfold = nfold, verbose = verbose, debug.level = debug.level) 
}
