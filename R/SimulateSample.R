#' Simulate a sample of random fuzzy numbers.
#'
#' @description
#' `SimulateSample` generates the whole sample of fuzzy numbers using the
#' various random distributions based on the functions from the \code{stats} package.
#'
#' @details
#' The procedure randomly generates the independent sample of fuzzy numbers (triangulars, trapezoidals, or PLFNs) with the
#' original, increases of its core, and increases of its support given by some random distributions.
#' The names of the respective functions of these probability distributions should be in the form
#'  required by the \code{stats} package.
#' For triangular fuzzy number, \code{increasesRandomDist} is not used.
#' For both triangular and trapezoidal fuzzy numbers, \code{knotNumbers} is not used.
#'
#'
#' The "true origin" of the fuzzy number is independently drawn from the probability distribution using
#' \code{originalPD} function from the \code{stats} package with the parameters defined by
#' \code{parOriginalPD}.
#' The same applies to the increases of the core (the function \code{incrCorePD} with the parameters
#' \code{parIncrCorePD} is then used), the left increase of the support (the function \code{suppLeftPD}
#'  with the parameters \code{parSuppLeftPD}, respectively), and the right increase of the support
#'  (the function \code{suppRightPD}
#'  with the parameters \code{parSuppRightPD}, respectively).
#'
#'
#' @return
#' The output is given as a list with values:
#' \code{original} - a vector with "true origins" of the simulated fuzzy numbers generated
#'  from the probability distribution \code{originalPD},
#' and \code{value} -- a list of the simulated triangular, trapezoidal, or PLFN fuzzy number as in the
#'  \code{FuzzyNumbers} package.
#'
#'
#'
#'
#' @param n Size of the simulated sample
#'
#' @param originalPD Name of the random generator used to create the "true origin" of a fuzzy number (as
#' defined in the \code{stats} package).
#'
#' @param parOriginalPD List of parameters required by the random generator used
#' to create the "true origin" of fuzzy number.
#'
#' @param incrCorePD Name of the random generator used to create the increases of the core of fuzzy
#'  number (as defined in the \code{stats} package).
#'
#' @param parIncrCorePD List of parameters required by the random generator used
#' to create the increases of the core of trapezoidal number.
#'
#' @param suppLeftPD Name of the random generator used to create the increases of the left support of fuzzy
#'   number (as defined in the \code{stats} package).
#'
#' @param parSuppLeftPD List of parameters required by the random generator used
#' to create the increases of the left support of fuzzy  number.
#'
#' @param suppRightPD Name of the random generator used to create the increases of the right support of fuzzy
#'  number (as defined in the \code{stats} package).
#'
#' @param parSuppRightPD List of parameters required by the random generator used
#' to create the increases of the right support of trapezoidal number.
#'
#'
#' @param knotNumbers Number of the knots necessary to generate the output fuzzy number.
#'
#' @param type Type of the generated fuzzy number ("triangular", "trapezoidal", or "PLFN").
#'
#' @param ... Possible parameters passed to other functions.
#'
#' @seealso \code{\link{SimulateFuzzyNumber}} for generation of the single random fuzzy number
#'
#' @examples
#'
#' # seed PRNG
#'
#' set.seed(1234)
#'
#' # generate 10 triangular fuzzy numbers (the normal distribution for the "true origin",
#' # and two different uniform distribution for the increases of the support)
#'
#' SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="triangular")
#'
#' # generate 20 trapezoidal fuzzy number (the normal distribution for the "true origin",
#' # the exponential distribution for the increases of the core,
#' # and two different uniform distribution for the increases of the support)
#'
#' SimulateSample(n=20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#' # generate 5 PLFN fuzzy numbers with two knots
#'
#' SimulateSample(n=5,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' knotNumbers = 2,
#' type="PLFN")
#'
#'
#'@references
#'
#' Grzegorzewski, P., Romaniuk, M. (2022)
#' Bootstrap Methods for Epistemic Fuzzy Data.
#' International Journal of Applied Mathematics and Computer Science, 32(2)
#'
#' Grzegorzewski, P., Romaniuk, M. (2022)
#' Bootstrap methods for fuzzy data.
#' Uncertainty and Imprecision in Decision Making and Decision Support: New Advances, Challenges, and Perspectives, pp. 28-47
#' Springer
#'
#' Gagolewski, M., Caha, J. (2021) FuzzyNumbers Package: Tools to deal with fuzzy numbers in R.
#' R package version 0.4-7, https://cran.r-project.org/web/packages=FuzzyNumbers
#'
#' Parchami, A., Grzegorzewski, P., Romaniuk, M. (2024)
#' Statistical simulations with LR random fuzzy numbers.
#' Statistical Papers, 65
#'
#' Romaniuk, M., Grzegorzewski, P., Parchami, A. (2024)
#' FuzzySimRes: Epistemic Bootstrap - an Efficient Tool for Statistical Inference Based on Imprecise Data.
#' R Journal, 16(2)
#'
#' @export




SimulateSample <- function(n=1,originalPD, parOriginalPD,
                                incrCorePD, parIncrCorePD,
                                suppLeftPD, parSuppLeftPD,
                                suppRightPD, parSuppRightPD,
                                knotNumbers=0,
                                type="trapezoidal",...)
{

  # check parameters

  if(length(n) != 1)
  {
    stop("Parameter n should be a single value")
  }

  if(!IfInteger(n) | n <= 0)
  {
    stop("Parameter n should be integer value and > 0")
  }

  # create vector and list

  outputOriginal <- rep(NA, n)

  outputValues <- list(NA)

  # generate random values

  for (i in 1:n) {

    singleOutput <- SimulateFuzzyNumber(originalPD=originalPD,
                                        parOriginalPD=parOriginalPD,
                                        incrCorePD=incrCorePD,
                                        parIncrCorePD=parIncrCorePD,
                                        suppLeftPD=suppLeftPD,
                                        parSuppLeftPD=parSuppLeftPD,
                                        suppRightPD=suppRightPD,
                                        parSuppRightPD=parSuppRightPD,
                                        knotNumbers=knotNumbers,
                                        type=type,
                                        ...)

    # put the original and value in the respective places

    outputOriginal[i] <- singleOutput$original

    outputValues[[i]] <- singleOutput$value

  }


  names(outputValues) <- noquote(paste("X", 1:n, sep=""))


  return(list(original=outputOriginal,value=outputValues))

}
