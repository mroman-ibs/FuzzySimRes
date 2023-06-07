#' Simple wrapper to provide p-value for the K-S one- and two-sample test.
#'
#' @description
#' `KSTestCriticalValue` calculates the p-value for the given critical value,
#' based on the respective function from the \code{stats} package.
#'
#' @details
#' The function calculates the p-value for the one- and two-sample Kolmogorov-Smirnov test
#' using the respective function from the \code{stats} package.
#' The necessary information is the critical value given by \code{criticalValue} parameter,
#' and sizes of one or two samples (parameters \code{n1, n2}, respectively).
#' The output is used in one of the epistemic bootstrap methods, if the one- or two-sample K-S test is applied.
#'
#'
#'
#'
#' @return
#' The output is given as a real number equal to the p-value for the one- or two-sample
#' K-S test.
#'
#'
#'
#'
#' @param criticalValue Critical value for the one- or two-sample K-S test.
#'
#' @param n1 Size of the first sample.
#'
#' @param n2 Size of the second sample (or NA for the case of the one-sample test).
#'
#'
#'
#' @examples
#'
#' # find p-value for the critical value 0.3 and two samples of size 10
#'
#' KSTestCriticalValue(0.3,10,10)
#'
#' @useDynLib FuzzySimRes, .registration = TRUE, .fixes = "K_"
#'
#' @export








# p-value for the given test statistic

KSTestCriticalValue <- function(criticalValue,n1,n2)
{
  if(is.na(n2)) {

    1 - .Call(K_pkolmim2x, as.double(criticalValue), as.integer(n1),PACKAGE = "FuzzySimRes")

  } else {

    1-stats::psmirnov(q=criticalValue,sizes = c(n1,n2))

  }


}
