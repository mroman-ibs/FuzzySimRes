#' Simulate random fuzzy number.
#'
#' @description
#' `SimulateFuzzyNumber` generates a single fuzzy number using the
#' various random distributions based on the functions from the \code{stats} package.
#'
#' @details
#' The procedure randomly generates a fuzzy number (a triangular, trapezoidal, or PLFN one) with the
#' originalPD, increases of its core, and increases of its support given by some random distributions.
#' The names of the respective functions of these probability distributions should be in the form
#'  required by the \code{stats} package.
#' For triangular fuzzy number, \code{increasesRandomDist} is not used.
#' For both triangular and trapezoidal fuzzy numbers, \code{knotNumbers} is not used.
#'
#'
#' The "true origin" of the fuzzy number is independently drawn from the probability distribution using
#' \code{originalPD} function from the \code{stats} package with the list of parameters defined by
#' \code{parOriginalPD}.
#' The same applies to the increases of the core (the function \code{incrCorePD} with the parameters
#' \code{parIncrCorePD} is then used), the left increase of the support (the function \code{suppLeftPD}
#'  with the parameters \code{parSuppLeftPD}, respectively), and the right increase of the support
#'  (the function \code{suppRightPD}
#'  with the parameters \code{parSuppRightPD}, respectively).
#'
#'
#' @return
#' The output is given as a list of two values:
#' \code{original} with "true origin" of the simulated fuzzy number generated
#'  from the probability distribution \code{originalPD},
#' and \code{value} -- the simulated triangular, trapezoidal, or PLFN fuzzy number as in the \code{FuzzyNumbers} package.
#'
#'
#'
#'
#'
#'
#' @param originalPD Name of the random generator used to create the "true origin" of fuzzy number (as
#' defined in the \code{stats} package).
#'
#' @param parOriginalPD List of parameters required by the random generator used
#' to create the "true origin" of a fuzzy number.
#'
#' @param incrCorePD Name of the random generator used to create the increases of the core of fuzzy
#'  number (as defined in the \code{stats} package).
#'
#' @param parIncrCorePD List of parameters required by the random generator used
#' to create the increases of the core of trapezoidal number.
#'
#' @param suppLeftPD Name of the random generator used to create the increase of the left support of fuzzy
#'   number (as defined in the \code{stats} package).
#'
#' @param parSuppLeftPD List of parameters required by the random generator used
#' to create the increase of the left support of fuzzy  number.
#'
#' @param suppRightPD Name of the random generator used to create the increase of the right support of fuzzy
#'  number (as defined in the \code{stats} package).
#'
#' @param parSuppRightPD List of parameters required by the random generator used
#' to create the increase of the right support of trapezoidal number.
#'
#'
#' @param knotNumbers Number of the knots necessary to generate the output fuzzy number.
#'
#' @param type Type of the generated fuzzy number ("triangular", "trapezoidal", or "PLFN").
#'
#' @param ... Possible parameters passed to other functions.
#'
#' @seealso \code{\link{SimulateSample}} for generation of the whole random fuzzy sample
#'
#' @examples
#'
#' # seed PRNG
#'
#' set.seed(1234)
#'
#' # generate triangular fuzzy number (the normal distribution for the "true origin",
#' # and two different uniform distribution for the increases of the support)
#'
#' SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="triangular")
#'
#' # generate trapezoidal fuzzy number (the normal distribution for the "true origin",
#' # the exponential distribution for the increases of the core,
#' # and two different uniform distribution for the increases of the support)
#'
#' SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#' # generate PLFN fuzzy number with two knots
#'
#' SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
#' incrCorePD="rexp", parIncrCorePD=list(rate=2),
#' suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
#' suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
#' knotNumbers = 2,
#' type="PLFN")
#'
#'
#'@references
#'
#' Ban, A.I., Coroianu, L., Grzegorzewski, P. (2015)
#' Fuzzy Numbers: Approximations, Ranking and Applications.
#' Institute of Computer Sciences, Polish Academy of Sciences
#'
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
#' Statistical Papers
#'
#'
#'
#'
#' @export




SimulateFuzzyNumber <- function(originalPD, parOriginalPD,
                                incrCorePD, parIncrCorePD,
                                suppLeftPD, parSuppLeftPD,
                                suppRightPD, parSuppRightPD,
                                knotNumbers=0,
                                type="trapezoidal",...)
{

  # check parameters

  if(length(knotNumbers) != 1)
  {
    stop("Parameter knotNumbers should be a single value")
  }

  if(!IfInteger(knotNumbers) | knotNumbers < 0)
  {
    stop("Parameter knotNumbers should be integer value and => 0")
  }

  if(!(type %in% c("triangular","trapezoidal","PLFN")))
  {
    stop("Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")
  }


  # create triangular fuzzy number

  if(type=="triangular")
  {
    # simulate three values

    leftSupport <- do.call(suppLeftPD, append(1,parSuppLeftPD))

    origin <- do.call(originalPD, append(1,parOriginalPD))

    rightSupport <- do.call(suppRightPD, append(1,parSuppLeftPD))

    # use proper function to simulate the output

    output <- FuzzyNumbers::TriangularFuzzyNumber (origin-leftSupport,origin,origin+rightSupport)

  }



  # create trapezoidal fuzzy number

  if((type=="trapezoidal") || (type=="PLFN" && knotNumbers==0))
  {
    # simulate four values

    leftSupport <- do.call(suppLeftPD, append(1,parSuppLeftPD))

    origin <- do.call(originalPD, append(1,parOriginalPD))

    leftCore <- origin -
      do.call(incrCorePD, append(1,parIncrCorePD))

    rightCore <- origin +
      do.call(incrCorePD, append(1,parIncrCorePD))

    rightSupport <- do.call(suppRightPD, append(1,parSuppLeftPD))

    # use proper function to simulate the output

    output <- FuzzyNumbers::TrapezoidalFuzzyNumber (leftCore-leftSupport,leftCore,
                                                    rightCore,rightCore+rightSupport)

  }

  # create PLFN fuzzy number

  if(type=="PLFN" && knotNumbers != 0)
  {
    # simulate four values

    leftSupport <- do.call(suppLeftPD, append(1,parSuppLeftPD))

    origin <- do.call(originalPD, append(1,parOriginalPD))

    leftCore <- origin -
      do.call(incrCorePD, append(1,parIncrCorePD))

    rightCore <- origin +
      do.call(incrCorePD, append(1,parIncrCorePD))

    rightSupport <- do.call(suppRightPD, append(1,parSuppLeftPD))

    # cat("leftSupport: ", leftSupport, "\n")
    #
    # cat("leftCore: ", leftCore, "\n")
    #
    # cat("origin: ", origin, "\n")
    #
    # cat("rightCore: ", rightCore, "\n")
    #
    # cat("rightSupport: ", rightSupport, "\n")

    # simulate knots


    leftKnots <- rep(NA,knotNumbers)

    leftKnots <- TruncDistribution(n=knotNumbers, distributionName=suppLeftPD,
                                   distributionParameters=parSuppLeftPD,
                                   leftEndSupport=0,rightEndSupport=leftSupport,decreasing = TRUE)

    # cat("leftKnots: ", leftKnots, "\n")


    rightKnots <- rep(NA,knotNumbers)

    rightKnots <- TruncDistribution(n=knotNumbers, distributionName=suppRightPD,
                                    distributionParameters=parSuppRightPD,
                                    leftEndSupport=0,rightEndSupport=rightSupport)

    # cat("rightKnots: ", rightKnots, "\n")

    # change values

    leftKnots <- leftCore - leftKnots

    rightKnots <- rightKnots + rightCore

    # cat("leftKnots: ", leftKnots, "\n")
    # cat("rightKnots: ", rightKnots, "\n")

    # construct PLFN

    output <- FuzzyNumbers::PiecewiseLinearFuzzyNumber(a1=leftCore-leftSupport,
                                                       a2=leftCore,
                                                       a3=rightCore,
                                                       a4=rightCore+rightSupport,
                                                       knot.n = knotNumbers,
                                                       knot.left = leftKnots,
                                                       knot.right = rightKnots)







  }


    outputList <- list(original=origin,value=output)

    return(outputList)

}
