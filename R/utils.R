# sorted values for truncated distribution

TruncDistribution <-   function(n, distributionName, distributionParameters, leftEndSupport=-Inf, rightEndSupport=Inf,
                                decreasing=FALSE)
{
    output <- rep(NA,n)

    # how many data is created

    i <- 0

    while(i<n){

      value <- do.call(distributionName, append(1,distributionParameters))

      # only truncated values can be added

      if((value >= leftEndSupport) & (value <= rightEndSupport)) {

        i <- i+1

        output[i] <- value

      }

    }
    return(sort(output,decreasing))
}


# function to check if the parameter is given by the integer

IfInteger <- function(x)
{
  if(is.numeric(x))
  {
    test <- all.equal(x, as.integer(x), check.attributes = FALSE)

    if(test == TRUE)
    { return(TRUE) }
    else { return(FALSE) }
  }

  else { return(FALSE) }
}


# function to check if the sample consists of FuzzyNumber objects

isFuzzyNumber <- function(value)
{
  return(methods::is(value,"FuzzyNumber"))
}

isFuzzyData <- function(x)
{

  if(length(x) == 1)
  {

    if(is.list(x)==TRUE)
    {

      return(isFuzzyNumber(x[[1]]))

    } else {

      return(isFuzzyNumber(x))

    }



  }

  if(is.list(x))
  {

    if(all(sapply(x,FUN=isFuzzyNumber))) {

      return(TRUE)

    }

  }

  return(FALSE)

}



