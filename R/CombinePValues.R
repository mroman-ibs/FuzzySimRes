#' Combine several p-values to obtain a single value.
#'
#' @description
#' `CombinePValues` calculates the single combined p-value using several input p-values.
#'
#' @details
#' The procedure combines many p-values into a single output using the selected statistical method.
#' This function is used as a tool in one of the epistemic bootstrap approaches to provide the necessary final p-value in the
#' statistical test. To combine the p-values different statistical methods can be applied.
#' Apart from the \code{mean} method (i.e., simple average of all p-values), other methods
#' are derived from the \code{palasso} package (the function
#' \code{.combine} is used there).
#'
#'
#' @return
#' The output is given as a single real-valued number.
#'
#'
#'
#'
#' @param pValues A vector of the p-values.
#'
#' @param method Method used to combine the p-values. The possible methods are the same as in the \code{palasso} package
#' plus the \code{mean} approach.
#'
#' @param ... Possible parameters passed to other functions.
#'

#'
#' @examples
#'
#' # combine the p-values using the Simes method
#'
#' p <- runif(20)
#'
#' CombinePValues(p)
#'
#'
#'
#'
#'@references
#'
#'
#' Westfall, P. H. (2005). Combining p-values.
#' Encyclopedia of Biostatistics, doi: 10.1002/0470011815.b2a15181
#' <https://doi.org/10.1002/0470011815.b2a15181>
#'
#'
#'
#'
#' @export

CombinePValues <- function(pValues,method="simes",...)
{
  if(!(method %in% c("simes","mean","fisher", "tippet", "sidak")))
  {
    stop("Parameter method should be a proper name of the p-value combining method")
  }


  if(!is.vector(pValues))
  {
    stop("Parameter pValues should be a vector of numerical values")
  }

  if(any(is.na(pValues)))
  {
    stop("There are some NA in pValues parameter")
  }

  if(!is.numeric(pValues))
  {
    stop("Some values in pValues parameter are not numeric ones")
  }



  # mean method

  if(method=="mean") {

    output <- mean(pValues)

  }

  # use palasso package for other methods

  if((method=="fisher")  || (method=="tippet") || (method=="sidak") || (method=="simes")) {

    output <- palasso::.combine(pValues,method=method)

  }

  return(output)
}
