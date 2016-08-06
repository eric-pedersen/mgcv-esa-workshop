#This code is modified for D.L. Miller's dsm package for distance sampling, from
#the rqgam.check function. The code is designed to extract randomized quantile 
#residuals from GAMs, using the family definitions in mgcv. Note statmod only
#supports RQ residuals for the following families: Tweedie, Poisson, Gaussian,  Any errors are due to Eric Pedersen
library(statmod) #This has functions for randomized quantile residuals
rqresiduals = function (gam.obj) {
  if(!"gam" %in% attr(gam.obj,"class")){
    stop('"gam.obj has to be of class "gam"')
  }
  if (!grepl("^Tweedie|^Negative Binomial|^poisson|^binomial|^gaussian|^Gamma|^inverse.gaussian",
             gam.obj$family$family)){
    stop(paste("family " , gam.obj$family$family, 
                " is not currently supported by the statmod library, 
                 and any randomized quantile residuals would be inaccurate.",
               sep=""))
  }
  if (grepl("^Tweedie", gam.obj$family$family)) {
    if (is.null(environment(gam.obj$family$variance)$p)) {
      p.val <- gam.obj$family$getTheta(TRUE)
      environment(gam.obj$family$variance)$p <- p.val
    }
    qres <- qres.tweedie(gam.obj)
  }
  else if (grepl("^Negative Binomial", gam.obj$family$family)) {
    if ("extended.family" %in% class(gam.obj$family)) {
      gam.obj$theta <- gam.obj$family$getTheta(TRUE)
    }
    else {
      gam.obj$theta <- gam.obj$family$getTheta()
    }
    qres <- qres.nbinom(gam.obj)
  }
  else {
    qres <- qresid(gam.obj)
  }
  return(qres)
}