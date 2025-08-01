#' Generate a bootstrap sample with the epistemic bootstrap.
#'
#' @description
#' `EpistemicBootstrap` generates the secondary (real-valued) sample from the fuzzy-valued
#' initial sample using the epistemic bootstrap.
#'
#' @details
#' The procedure randomly generates the secondary, bootstrapped sample of real values from the
#' initial sample which consists of fuzzy numbers. The procedure applies the so-called epistemic bootstrap.
#' The initial sample should be given in the form of a list of numbers or a single number.
#' These values have to be the fuzzy numbers defined in the \code{FuzzyNumbers} package.
#'
#'
#' @return
#' The output is given in the form of a real-valued matrix, where the number of rows is equal to the number of cuts, and the
#' number of columns is equal to the length of the initial sample.
#' Rows are denoted with the randomly drawn values of alpha for the consecutive alpha-cuts.
#'
#' @importFrom stats runif
#'
#'
#' @param fuzzySample Sample of fuzzy numbers given in the form of a list or as a single number.
#'
#' @param cutsNumber Number of cuts used in the epistemic bootstrap.
#'
#' @param ... Possible parameters passed to other functions.
#'
#' @family epistemic bootstrap function
#'
#' @seealso \code{\link{AntitheticBootstrap}} for the antithetic epistemic bootstrap algorithm
#'
#' @examples
#'
#' # seed PRNG
#'
#' set.seed(1234)
#'
#' # generate the initial sample consisting of 5 trapezoidal fuzzy numbers
#'
#' sample1 <- SimulateSample(5,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#' # apply the epistemic bootstrap with 10 cuts
#'
#' EpistemicBootstrap (sample1$value, cutsNumber=10)
#'
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
#' Romaniuk, M., Grzegorzewski, P., Parchami, A. (2024)
#' FuzzySimRes: Epistemic Bootstrap - an Efficient Tool for Statistical Inference Based on Imprecise Data.
#' R Journal, 16(2)
#'
#'
#' @export





EpistemicBootstrap <- function(fuzzySample, cutsNumber=1,...)
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

    stop("Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  }


  # output matrix, in each row we have generated values from the whole sample

  if(length(fuzzySample)==1)
  {
    fuzzySample <- list(fuzzySample)
  }




  # generate random cuts

  selectedCuts <- runif(cutsNumber,min = 0, max = 1)

  # prepare output

  namesOutput <- list(round(selectedCuts,digits = 4),
                      noquote(paste("X", 1:length(fuzzySample), sep="")))

  output <- matrix(NA, nrow = cutsNumber, ncol = length(fuzzySample), dimnames = namesOutput)


  # cat("selectedCuts: ", selectedCuts, "\n")

  # generate values from each fuzzy number for the given cuts

  for (i in 1:length(fuzzySample)) {

    # find alpha-cuts

    alphaCuts <- FuzzyNumbers::alphacut(fuzzySample[[i]],selectedCuts)

    # cat("alphaCuts: \n")
    # print(alphaCuts)

    # and values

    output[,i] <- runif(cutsNumber,min=alphaCuts[,1],max=alphaCuts[,2])

  }


  return(output)

}
