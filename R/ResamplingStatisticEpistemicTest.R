#' Apply resampling epistemic test for one or two fuzzy samples.
#'
#' @description
#' `ResamplingStatisticEpistemicTest` calculates the p-value for the given real-valued statistical test using the resampling
#' epistemic bootstrap approach.
#'
#' @details
#' The procedure calculates the p-value for the selected real-valued statistical test, like, e.g. the Kolmogorov-Smirnov
#' one- or two-sample test (invoked by \code{ks.test} function). Another statistical test can be also used if it has at
#' least one or two parameters
#' (\code{x} for one or \code{x,y} for two real-valued samples, namely) and gives
#'  a list of at least two values (\code{statistic} for the output test
#' statistic, and \code{p.value} for the calculated p-value). If necessary, the respective wrapper can be applied for the
#' user-defined function. To choose the one-sample variant of the test, \code{sample2=NULL} should be used.
#' Additional parameters to the statistical test can be passed with \code{...}
#'
#' As two input samples (\code{sample1} and \code{sample2}, respectively), two lists of fuzzy numbers should be provided.
#' These values have to be the fuzzy numbers defined in the \code{FuzzyNumbers} package (triangular, trapezoidal, etc.).
#' If only one-sample test is used, \code{sample1} is related to the fuzzy statistical sample, and \code{sample2=NULL} should
#' be set.
#'
#' To calculate the output, the multi-statistic epistemic bootstrap approach is used. Depending on the parameter
#' \code{bootstrapMethod}, the standard (\code{std}) or antithetic (\code{anti}) method can be used. Then,
#' the p-values are combined using the respective method (a value of the parameter \code{combineMethod}, which
#' is the same as for the function \code{CombinePValues}) to give a single result.
#'
#'
#'
#' @return
#' The output is given in the form of a real number (the p-value) for the selected statistical test.
#'
#'
#'
#'
#' @param sample1 Sample of fuzzy numbers given in the form of a list or as a single number.
#'
#' @param sample2 Sample of fuzzy numbers given in the form of a list or as a single number (two-sample test case) or
#'  \code{NULL} (one-sample test case).
#'
#' @param bootstrapMethod The standard (\code{std}) or antithetic (\code{anti}) method used for the epistemic bootstrap.
#'
#' @param test Name of the invoked function for the statistical test.
#'
#' @param cutsNumber Number of cuts used in the epistemic bootstrap.
#'
#' @param combineMethod Name of the method used to combine the multiple p-values to provide the single output.
#'
#' @param K Number of samples used to resample in the calculation of the p-values.
#'
#' @param ... Additional arguments passed to the statistical test.
#'
#' @family epistemic bootstrap statistical test
#'
#' @seealso \code{\link{MultiStatisticEpistemicTest}} for the epistemic bootstrap test related to multi-statistic approach,
#' \code{\link{AverageStatisticEpistemicTest}} for the epistemic bootstrap test related to averaging statistics,
#' \code{\link{EpistemicTest}} for the general epistemic bootstrap test
#'
#' @examples
#'
#' # seed PRNG
#'
#' set.seed(1234)
#'
#' # generate two independent initial fuzzy samples
#'
#' list1<-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#'
#' list2<-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#' # apply the Kolmogorov-Smirnov two sample test for two different samples
#'
#' ResamplingStatisticEpistemicTest(list1$value,list2$value,cutsNumber = 30)
#'
#' # and the same sample twice
#'
#' ResamplingStatisticEpistemicTest(list1$value,list1$value,cutsNumber = 30,bootstrapMethod = "anti")
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





ResamplingStatisticEpistemicTest <- function(sample1,sample2,bootstrapMethod="std",test="ks.test",
                                          cutsNumber = 1,K=1,combineMethod = "simes",...)
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


  if(length(K) != 1)
  {
    stop("Parameter K should be a single value")
  }

  if(!IfInteger(K) | K <= 0)
  {
    stop("Parameter K should be integer value and > 0")
  }


  if(!isFuzzyData(sample1))
  {

    stop("Parameter sample1 should consist of fuzzy numbers - single value or list")

  }


  if(!(isFuzzyData(sample2) || is.null(sample2)))
  {

    stop("Parameter sample2 should consist of fuzzy numbers - single value or list")

  }

  if(length(bootstrapMethod) > 1)
  {
    stop("Parameter bootstrapMethod should be a single value")
  }


  if(!(bootstrapMethod %in% c("std","anti")))
  {
    stop("Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")
  }

  if(length(combineMethod) > 1)
  {
    stop("Parameter combineMethod should be a single value")
  }

  if(!(combineMethod %in% c("simes","mean","fisher", "tippet", "sidak")))
  {
    stop("Parameter combineMethod should be a proper name of the p-value combining method")
  }


  # additional arguments passed to the statistical test

  additionalArgs <- list(...)

  # vector for output statistics

  vectorPValues <- rep(NA,K)

  # check if we have two- or one-sample test

  if(is.null(sample2)) {

    oneSample = TRUE

  } else {

    oneSample = FALSE

  }

  # generate epistemic bootstrap samples

  if(bootstrapMethod=="std") {

    outputSample1 <- EpistemicBootstrap(sample1,cutsNumber = cutsNumber,...)

    if(oneSample == FALSE) {

      outputSample2 <- EpistemicBootstrap(sample2,cutsNumber = cutsNumber,...)

    }
  }

  if(bootstrapMethod=="anti") {

    outputSample1 <- AntitheticBootstrap(sample1,cutsNumber = cutsNumber,...)

    if(oneSample == FALSE) {

      outputSample2 <- AntitheticBootstrap(sample2,cutsNumber = cutsNumber,...)

    }

  }


  # resample p-values

  if(cutsNumber==1) {

    if(oneSample == FALSE) {

      vectorPValues <- do.call(test,append(list(x=outputSample1,y=outputSample2),additionalArgs))$p.value

    } else {

      vectorPValues <- do.call(test,append(list(x=outputSample1),additionalArgs))$p.value

    }


  } else {

    # randomize samples

    if(oneSample == FALSE) {

      random1 <- sample(1:cutsNumber,K,replace = TRUE)

      random2 <- sample(1:cutsNumber,K,replace = TRUE)

      # print(random1)
      # print(random2)



      for (i in 1:K) {

        vectorPValues[i] <- do.call(test,append(list(x=outputSample1[random1[i],],y=outputSample2[random2[i],]),
                                                additionalArgs))$p.value

      }


    } else {

        random1 <- sample(1:cutsNumber,K,replace = TRUE)

        for (i in 1:K) {

          vectorPValues[i] <- do.call(test,append(list(x=outputSample1[random1[i],]),additionalArgs))$p.value

        }


    }




  }

  # print(vectorPValues)

  # combine p-values

  output <- CombinePValues(vectorPValues, combineMethod,...)

  return(output)

}
