#' Calculate the corrected variance using the epistemic bootstrap.
#'
#' @description
#' `EpistemicCorrectedVariance` calculates the corrected estimator of the variance for the fuzzy sample using the epistemic bootstrap approach.
#'
#' @details
#' For the given initial sample, the function calculates the corrected estimator of the variance
#'  using the standard (if \code{bootstrapMethod} is set to
#' \code{"std"}) or the antithetic (when \code{bootstrapMethod="anti"}) epistemic bootstrap.
#' The initial sample should be given in the form of a list of numbers or a single number.
#' These values have to be the fuzzy numbers defined as in the \code{FuzzyNumbers} package.
#' The corrected estimator of the variance separates the within- and between-group variations.
#' For the details, see (Grzegorzewski, Romaniuk, 2022a).
#'
#'
#' @return
#' The output is given in the form of a real number (the estimator of the variance).
#'
#' @family epistemic estimators
#'
#' @seealso \code{\link{EpistemicMean}} for the epistemic estimator of the mean,
#' \code{\link{EpistemicEstimator}} for the general function concerning the epistemic estimator calculation
#'
#'
#' @param fuzzySample Sample of fuzzy numbers given in the form of a list or as a single number.
#'
#'
#' @param cutsNumber Number of cuts used in the epistemic bootstrap.
#'
#' @param bootstrapMethod The standard (\code{std}) or antithetic (\code{anti}) method used for the epistemic bootstrap.
#'
#' @examples
#'
#' # seed PRNG
#'
#' set.seed(1234)
#'
#' # generate an initial fuzzy sample
#'
#' list1<-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
#' increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
#' supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
#' supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#'
#'
#' # calculate the corrected variance using the standard epistemic bootstrap approach
#'
#' EpistemicCorrectedVariance(list1,cutsNumber = 30)
#'
#' # calculate the corrected variance using the antithetic epistemic bootstrap approach
#'
#' EpistemicCorrectedVariance(list1,cutsNumber = 30,bootstrapMethod="anti")
#'
#'
#'@references
#'
#'
#' Grzegorzewski, P., Romaniuk, M. (2022)
#' Bootstrap Methods for Epistemic Fuzzy Data.
#' International Journal of Applied Mathematics and Computer Science, 32(2)
#'
#' Grzegorzewski, P., Romaniuk, M. (2022)
#' Bootstrapped Kolmogorov-Smirnov Test for Epistemic Fuzzy Data.
#' Communications in Computer and Information Science, CCIS 1602, pp. 494-507, Springer
#'
#' Gagolewski, M., Caha, J. (2021) FuzzyNumbers Package: Tools to deal with fuzzy numbers in R.
#' R package version 0.4-7, https://cran.r-project.org/web/packages=FuzzyNumbers
#'
#'
#'
#'
#' @export





EpistemicCorrectedVariance <- function(fuzzySample, cutsNumber=1, bootstrapMethod="std")
{
  # check parameters

  if(length(cutsNumber) != 1)
  {
    stop("Parameter cutsNumber should be a single value")
  }

  if(!IfInteger(cutsNumber) | cutsNumber <= 0)
  {
    stop("Parameter cutsNumber should be integer value and > 0")
  }


  if(!isFuzzyData(fuzzySample))
  {

    stop("Parameter fuzzySample should consist of fuzzy numbers (single value or list)")

  }

  if(!(bootstrapMethod %in% c("std","anti")))
  {
    stop("Parameter bootstrapMethod should be a proper name of epistemic bootstrap method (std or anti)")
  }


  # generate epistemic bootstrap samples

  if(bootstrapMethod=="std") {

    outputSample <- EpistemicBootstrap(fuzzySample,cutsNumber = cutsNumber)

  }

  if(bootstrapMethod=="anti") {

    outputSample <- AntitheticBootstrap(fuzzySample,cutsNumber = cutsNumber)

  }

  # calculate the within and between-group variations

  mean1 <- apply(outputSample,MARGIN = 1,FUN = mean)

  mean1 <- matrix(data=mean1, nrow = cutsNumber, ncol = ncol(outputSample))

  var1 <- sum((outputSample-mean1)^2)

  # we can't divide by 0

  if(ncol(outputSample)==1) {

    var1 <- var1 / cutsNumber

  } else {

    var1 <- var1 / (cutsNumber * (ncol(outputSample)-1))

  }



  mean2 <- apply(outputSample,MARGIN = 2,FUN = mean)

  mean2 <- matrix(data=mean2, nrow = cutsNumber, ncol = ncol(outputSample),byrow = TRUE)

  var2 <- sum((outputSample-mean2)^2)

  # we can't divide by 0

  if(cutsNumber == 1) {

    var2 <- var1 / (ncol(outputSample))

  } else {

    var2 <- var1 / ((cutsNumber-1) * (ncol(outputSample)))

  }



  output <- var1 - var2

  return(output)

}
