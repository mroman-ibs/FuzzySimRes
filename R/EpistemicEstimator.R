#' Apply the epistemic bootstrap to find an estimator.
#'
#' @description
#' `EpistemicEstimator` calculates the selected estimator and its SE/MSE for the fuzzy sample using the epistemic bootstrap approach.
#'
#' @details
#' For the given initial sample, the function calculates the selected estimator
#' (provided by the respective function as the \code{estimator} parameter) using the standard (if \code{bootstrapMethod} is set to
#' \code{"std"}) or the antithetic (when \code{bootstrapMethod="anti"}) epistemic bootstrap.
#' The initial sample should be given in the form of a list of numbers or a single number.
#' These values have to be the fuzzy numbers defined as in the \code{FuzzyNumbers} package.
#' The estimators are calculated for each epistemic bootstrap sample (i.e. based on the rows of the output matrix),
#' then these values are averaged to give the final output (i.e. the mean for all cuts is obtained).
#' Additionally, the standard error (SE) of this estimator is calculated or its mean squared error (MSE).
#' This second type of the error is used if some value (other than \code{NA}) is provided for the \code{trueValue} parameter.
#'
#'
#' @return
#' The output is given in the form of a list consisting of two real numbers: \code{value} - the obtained
#' estimator, and \code{SE} - its SE/MSE.
#'
#' @seealso \code{\link{EpistemicMean}} for the epistemic estimator of the mean,
#' \code{\link{EpistemicCorrectedVariance}} for the corrected epistemic estimator of the variance
#'
#'
#' @param fuzzySample Sample of fuzzy numbers given in the form of a list or as a single number.
#'
#' @param estimator Real-valued function used to calculate the respective estimator.
#'
#' @param cutsNumber Number of cuts used in the epistemic bootstrap.
#'
#' @param bootstrapMethod The standard (\code{std}) or antithetic (\code{anti}) method used for the epistemic bootstrap.
#'
#' @param trueValue The true (usually unknown) value of the estimated parameter. If \code{NA} is used for this parameter,
#' the SE is calculated.
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
#' # calculate the standard deviation using the standard epistemic bootstrap approach
#'
#' EpistemicEstimator(list1,estimator="sd",cutsNumber = 30)
#'
#' # calculate the median using the antithetic epistemic bootstrap approach
#'
#' EpistemicEstimator(list1,estimator="median",cutsNumber = 30,bootstrapMethod="anti")
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





EpistemicEstimator <- function(fuzzySample, estimator="sd", cutsNumber=1, bootstrapMethod="std", trueValue = NA)
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

  if(length(trueValue) != 1)
  {
    stop("Parameter trueValue should be a single value")
  }

  if(!is.numeric(trueValue))
  {
    if(!is.na(trueValue))
    {
      stop("Parameter trueValue should be a numerical value or NA")
    }


  }


  # generate epistemic bootstrap samples

  if(bootstrapMethod=="std") {

    outputSample <- EpistemicBootstrap(fuzzySample,cutsNumber = cutsNumber)

  }

  if(bootstrapMethod=="anti") {

    outputSample <- AntitheticBootstrap(fuzzySample,cutsNumber = cutsNumber)

  }

  # calculate the estimator

  estimators <- apply(outputSample,MARGIN = 1,FUN = estimator)

  outputEstimator <- mean(estimators)

  # calculate the SE/MSE

  if(is.na(trueValue)) {

    SE <- stats::sd(estimators)

  } else {

    SE <- sum((estimators-trueValue)^2) / cutsNumber

  }

  output <- list(value = outputEstimator, SE = SE)

  return(output)

}