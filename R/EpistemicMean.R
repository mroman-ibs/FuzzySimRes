#' Estimate the mean using the epistemic bootstrap.
#'
#' @description
#' `EpistemicMean` calculates the mean of the fuzzy sample using the epistemic bootstrap approach.
#'
#' @details
#' For the initial sample given by \code{fuzzySample}, the function estimates its mean using the standard (if \code{bootstrapMethod} is set to
#' \code{"std"}) or the antithetic (when \code{bootstrapMethod="anti"}) epistemic bootstrap.
#' The initial sample should be given in the form of a list of numbers or a single number.
#' These values have to be the fuzzy numbers defined in the \code{FuzzyNumbers} package.
#'
#' If, instead of fuzzy sample, the matrix is given by the parameter \code{fuzzySample}, then this matrix is treated
#' as the direct output from the epistemic or the antithetic bootstrap.
#' Then, the mean is directly calculated.
#'
#' Additionally, the standard error (SE) of this estimator is calculated and its mean squared error (MSE).
#' This second type of the error is used if some value (other than \code{NA}) is provided for the \code{trueValue} parameter.

#'
#'
#' @return
#' The output is given in the form of a real number (the estimator of the mean).
#'
#'
#'
#'
#' @param fuzzySample Sample of fuzzy numbers (given in the form of a list or as a single number) or a matrix with already sampled values (i.e.
#' output of function \code{AntitheticBootstrap} or \code{EpistemicBootstrap}).
#'
#' @param cutsNumber Number of cuts used in the epistemic bootstrap.
#'
#' @param bootstrapMethod The standard (\code{std}) or antithetic (\code{anti}) method used for the epistemic bootstrap.
#'
#' @param trueValue The true (usually unknown) value of the estimated parameter. If \code{NA} is used for this parameter,
#' the SE is calculated.
#'
#' @family epistemic estimators
#'
#' @seealso \code{\link{EpistemicEstimator}} for the general function concerning the epistemic estimator calculation,
#' \code{\link{EpistemicCorrectedVariance}} for the corrected epistemic estimator of the variance
#'
#' @examples
#'
#' # seed PRNG
#'
#' set.seed(1234)
#'
#' # generate an initial fuzzy sample
#'
#' list1<-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#'
#'
#' # calculate the mean using the standard epistemic bootstrap approach
#'
#' EpistemicMean(list1$value,cutsNumber = 30)
#'
#' # calculate the mean using the antithetic epistemic bootstrap approach
#'
#' EpistemicMean(list1$value,cutsNumber = 30,bootstrapMethod="anti")
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





EpistemicMean <- function(fuzzySample, cutsNumber=1, bootstrapMethod="std", trueValue = NA)
{
  # use the general function

  output <- EpistemicEstimator(fuzzySample = fuzzySample, estimator = "mean", cutsNumber = cutsNumber,
                               bootstrapMethod = bootstrapMethod, trueValue = trueValue)

  return(output)

}
