% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MultiStatisticEpistemicTest.R
\name{MultiStatisticEpistemicTest}
\alias{MultiStatisticEpistemicTest}
\title{Apply multi-statistic epistemic test for one or two fuzzy samples.}
\usage{
MultiStatisticEpistemicTest(
  sample1,
  sample2,
  bootstrapMethod = "std",
  test = "ks.test",
  cutsNumber = 1,
  combineMethod = "simes",
  ...
)
}
\arguments{
\item{sample1}{Sample of fuzzy numbers given in the form of a list or as a single number.}

\item{sample2}{Sample of fuzzy numbers given in the form of a list or as a single number (two-sample test case) or
\code{NULL} (one-sample test case).}

\item{bootstrapMethod}{The standard (\code{std}) or antithetic (\code{anti}) method used for the epistemic bootstrap.}

\item{test}{Name of the invoked function for the statistical test.}

\item{cutsNumber}{Number of cuts used in the epistemic bootstrap.}

\item{combineMethod}{Name of the method used to combine the multiple p-values to provide the single output.}

\item{...}{Additional arguments passed to the statistical test.}
}
\value{
The output is given in the form of a real number (the p-value) for the selected statistical test.
}
\description{
`MultiStatisticEpistemicTest` calculates the p-value for the given real-valued statistical test using the multi-statistic
epistemic bootstrap approach.
}
\details{
The procedure calculates the p-value for the selected real-valued statistical test, like, e.g. the Kolmogorov-Smirnov
one- or two-sample test (invoked by \code{ks.test} function). Another statistical test can be also used if it has at
least one or two parameters
(\code{x} for one or \code{x,y} for two real-valued samples, namely) and gives
 a list of at least two values (\code{statistic} for the output test
statistic, and \code{p.value} for the calculated p-value). If necessary, the respective wrapper can be applied for the
user-defined function. To choose the one-sample variant of the test, \code{sample2=NULL} should be used.
Additional parameters to the statistical test can be passed with \code{...}

As two input samples (\code{sample1} and \code{sample2}, respectively), two lists of fuzzy numbers should be provided.
These values have to be the fuzzy numbers defined in the \code{FuzzyNumbers} package (triangular, trapezoidal, etc.).
If only one-sample test is used, \code{sample1} is related to the fuzzy statistical sample, and \code{sample2=NULL} should
be set.

To calculate the output, the multi-statistic epistemic bootstrap approach is used. Depending on the parameter
\code{bootstrapMethod}, the standard (\code{std}) or antithetic (\code{anti}) method can be used. Then,
the p-values are combined using the respective method (a value of the parameter \code{combineMethod}, which
is the same as for the function \code{CombinePValues}) to give a single result.
}
\examples{

# seed PRNG

set.seed(1234)

# generate two independent initial fuzzy samples

list1<-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
incrCorePD="rexp", parIncrCorePD=list(rate=2),
suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
type="trapezoidal")


list2<-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
incrCorePD="rexp", parIncrCorePD=list(rate=2),
suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
type="trapezoidal")

# apply the Kolmogorov-Smirnov two sample test for two different samples

MultiStatisticEpistemicTest(list1$value,list2$value,cutsNumber = 30)

# and the same sample twice

MultiStatisticEpistemicTest(list1$value,list1$value,cutsNumber = 30,bootstrapMethod = "anti",
combineMethod = "mean")

# and the one-sample K-S test for the standard normal distribution

MultiStatisticEpistemicTest(list1$value,sample2=NULL,cutsNumber = 30,y="pnorm")


}
\references{
Grzegorzewski, P., Romaniuk, M. (2022)
Bootstrap Methods for Epistemic Fuzzy Data.
International Journal of Applied Mathematics and Computer Science, 32(2)

Grzegorzewski, P., Romaniuk, M. (2022)
Bootstrapped Kolmogorov-Smirnov Test for Epistemic Fuzzy Data.
Communications in Computer and Information Science, CCIS 1602, pp. 494-507, Springer

Gagolewski, M., Caha, J. (2021) FuzzyNumbers Package: Tools to deal with fuzzy numbers in R.
R package version 0.4-7, https://cran.r-project.org/web/packages=FuzzyNumbers

Romaniuk, M., Grzegorzewski, P., Parchami, A. (2024)
FuzzySimRes: Epistemic Bootstrap - an Efficient Tool for Statistical Inference Based on Imprecise Data.
R Journal, 16(2)
}
\seealso{
\code{\link{AverageStatisticEpistemicTest}} for the epistemic bootstrap test related to averaging statistics,
\code{\link{ResamplingStatisticEpistemicTest}} for the epistemic bootstrap test related to resampling statistics
\code{\link{EpistemicTest}} for the general epistemic bootstrap test

Other epistemic bootstrap statistical test: 
\code{\link{AverageStatisticEpistemicTest}()},
\code{\link{EpistemicTest}()},
\code{\link{ResamplingStatisticEpistemicTest}()}
}
\concept{epistemic bootstrap statistical test}
