#' Fuzzy control charts data
#'
#' A set of fuzzy epistemic data concerning electronic circuit thickness, which is one of the most important
#'  quality characteristics in a process that produces electronic boards for vacuum cleaners.
#'
#' @format
#' A list of 90 triangular fuzzy numbers (as defined in \code{FuzzyNumbers} package) that contains
#' 30 samples, each of size three.
#' Each observation in the list has its label \code{X.y.z}, where \code{y} is the number of sample, and \code{z} is the
#' number of the element in this sample.
#'
#' @source
#' Faraz, A., Shapiro, A.F. (2010)
#' An application of fuzzy random variables to control charts.
#' Fuzzy Sets and Systems, 161(20)
#' <https://doi.org/10.1016/j.fss.2010.05.004>
"controlChartData"

#' Experts' opinions about cheese quality
#'
#' A set of fuzzy epistemic data containing the corrected version of the three experts' opinions about the Gamonedo cheese quality data.
#'
#' @format
#' A list of 120 trapezoidal fuzzy numbers (as defined in \code{FuzzyNumbers} package) for three experts (40 answers of the
#' first expert, 38 of the second, and 42 of the third one).
#' Each observation in the list has its label \code{Exp.y.z}, where \code{y} is the number of the expert, and \code{z} is the
#' number of his answer.
#'
#' @source
#' Ramos-Guajardo, A.B., Blanco-Fernandez, A., Gonzalez-Rodriguez, G. (2019)
#' Applying Statistical Methods with Imprecise Data to Quality Control in Cheese Manufacturing
#' <https://doi.org/10.1007/978-3-030-03201-2_8>
"cheeseQualityData"



