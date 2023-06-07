#' Simulate random fuzzy number.
#'
#' @description
#' `SimulateFuzzyNumber` generates a single fuzzy number using the
#' various random distributions based on the functions from the \code{stats} package.
#'
#' @details
#' The procedure randomly generates fuzzy number (a triangular, trapezoidal or PLFN one) with the
#' original, increases of its core, and increases of its support given by some random distributions.
#' The names of the respective functions of these probability distributions should be in the form
#'  required by \code{stats} package.
#' For triangular fuzzy number, \code{increasesRandomDist} is not used.
#' For both triangular and trapezoidal fuzzy number, \code{knotNumbers} is not used.
#'
#'
#' The "true origin" of the fuzzy number is independently drawn from the random distribution using
#' \code{originalRandomDist} function from the \code{stats} package with the list of parameters defined by
#' \code{parametersOriginalRD}.
#' The same applies to the increases of the core (the function \code{increasesCoreRandomDist} with the parameters
#' \code{parametersCoreIncreasesRD} is then used), the left increase of the support (the function \code{supportLeftRandomDist}
#'  with the parameters \code{parametersSupportLeftRD}, respectively), and the right increase of the support
#'  (the function \code{supportRightRandomDist}
#'  with the parameters \code{parametersSupportRightRD}, respectively).
#'
#'
#' @return
#' The output is given as a triangular, trapezoidal or PLFN fuzzy number as in the \code{FuzzyNumbers} package.
#'
#'
#'
#'
#'
#'
#' @param originalRandomDist Name of the random generator used to create the "true origin" of fuzzy number (as
#' defined in \code{stats} package).
#'
#' @param parametersOriginalRD List of parameters required by the random generator used
#' to create the "true origin" of fuzzy number.
#'
#' @param increasesCoreRandomDist Name of the random generator used to create the increases of the core of fuzzy
#'  number (as defined in \code{stats} package).
#'
#' @param parametersCoreIncreasesRD List of parameters required by the random generator used
#' to create the increases of the core of trapezoidal number.
#'
#' @param supportLeftRandomDist Name of the random generator used to create the increase of the left support of fuzzy
#'   number (as defined in \code{stats} package).
#'
#' @param parametersSupportLeftRD List of parameters required by the random generator used
#' to create the increase of the left support of fuzzy  number.
#'
#' @param supportRightRandomDist Name of the random generator used to create the increase of the right support of fuzzy
#'  number (as defined in \code{stats} package).
#'
#' @param parametersSupportRightRD List of parameters required by the random generator used
#' to create the increase of the right support of trapezoidal number.
#'
#'
#' @param knotNumbers Number of the knots necessary to generate the output fuzzy number.
#'
#' @param type Type of the generated fuzzy number ("triangular", "trapezoidal", or "PLFN").
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
#' SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
#' supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
#' supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
#' type="triangular")
#'
#' # generate trapezoidal fuzzy number (the normal distribution for the "true origin",
#' # the exponential distribution for the increases of the core,
#' # and two different uniform distribution for the increases of the support)
#'
#' SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
#' increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
#' supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
#' supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
#' type="trapezoidal")
#'
#' # generate PLFN fuzzy number with two knots
#'
#' SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
#' increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
#' supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
#' supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
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
#'
#'
#'
#' @export




SimulateFuzzyNumber <- function(originalRandomDist, parametersOriginalRD,
                                increasesCoreRandomDist, parametersCoreIncreasesRD,
                                supportLeftRandomDist, parametersSupportLeftRD,
                                supportRightRandomDist, parametersSupportRightRD,
                                knotNumbers=0,
                                type="trapezoidal")
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

    leftSupport <- do.call(supportLeftRandomDist, append(1,parametersSupportLeftRD))

    core <- do.call(originalRandomDist, append(1,parametersOriginalRD))

    rightSupport <- do.call(supportRightRandomDist, append(1,parametersSupportLeftRD))

    # use proper function to simulate the output

    output <- FuzzyNumbers::TriangularFuzzyNumber (core-leftSupport,core,core+rightSupport)

  }



  # create trapezoidal fuzzy number

  if((type=="trapezoidal") || (type=="PLFN" && knotNumbers==0))
  {
    # simulate four values

    leftSupport <- do.call(supportLeftRandomDist, append(1,parametersSupportLeftRD))

    origin <- do.call(originalRandomDist, append(1,parametersOriginalRD))

    leftCore <- origin -
      do.call(increasesCoreRandomDist, append(1,parametersCoreIncreasesRD))

    rightCore <- origin +
      do.call(increasesCoreRandomDist, append(1,parametersCoreIncreasesRD))

    rightSupport <- do.call(supportRightRandomDist, append(1,parametersSupportLeftRD))

    # use proper function to simulate the output

    output <- FuzzyNumbers::TrapezoidalFuzzyNumber (leftCore-leftSupport,leftCore,
                                                    rightCore,rightCore+rightSupport)

  }

  # create PLFN fuzzy number

  if(type=="PLFN" && knotNumbers != 0)
  {
    # simulate four values

    leftSupport <- do.call(supportLeftRandomDist, append(1,parametersSupportLeftRD))

    origin <- do.call(originalRandomDist, append(1,parametersOriginalRD))

    leftCore <- origin -
      do.call(increasesCoreRandomDist, append(1,parametersCoreIncreasesRD))

    rightCore <- origin +
      do.call(increasesCoreRandomDist, append(1,parametersCoreIncreasesRD))

    rightSupport <- do.call(supportRightRandomDist, append(1,parametersSupportLeftRD))

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

    leftKnots <- TruncDistribution(n=knotNumbers, distributionName=supportLeftRandomDist,
                                   distributionParameters=parametersSupportLeftRD,
                                   leftEndSupport=0,rightEndSupport=leftSupport,decreasing = TRUE)

    # cat("leftKnots: ", leftKnots, "\n")


    rightKnots <- rep(NA,knotNumbers)

    rightKnots <- TruncDistribution(n=knotNumbers, distributionName=supportRightRandomDist,
                                    distributionParameters=parametersSupportRightRD,
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




    return(output)

}
