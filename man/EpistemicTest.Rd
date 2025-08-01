% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EpistemicTest.R
\name{EpistemicTest}
\alias{EpistemicTest}
\title{Apply epistemic test for one or two fuzzy samples.}
\usage{
EpistemicTest(sample1, sample2, algorithm = "avs", ...)
}
\arguments{
\item{sample1}{Sample of fuzzy numbers given in the form of a list or as a single number.}

\item{sample2}{Sample of fuzzy numbers given in the form of a list or as a single number (two-sample test case) or
\code{NULL} (one-sample test case).}

\item{algorithm}{Type of the epistemic bootstrap
algorithm used to calculate the output p-value (possible values: \code{avs, ms, res}).}

\item{...}{Additional arguments passed to the epistemic test.}
}
\value{
The output is given in the form of a real number (the p-value) for the selected statistical test.
}
\description{
`EpistemicTest` calculates the p-value for the given real-valued statistical test using one of the
epistemic bootstrap approaches.
}
\details{
This is a general procedure that can be used to invoke other epistemic bootstrap tests: \code{AverageStatisticEpistemicTest}
(if the \code{algorithm} is set to \code{"avs"}), \code{MultiStatisticEpistemicTest} (if \code{algorithm="ms"}), and
\code{ResamplingStatisticEpistemicTest} (for \code{algorithm="res"}).
For additional details about these procedures and their parameters, see the respective functions.
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
# with the average statistics approach

EpistemicTest(list1$value,list2$value,cutsNumber = 30)

# apply the Kolmogorov-Smirnov two sample test for two different samples
# with the multi-statistic and antithetic approach

EpistemicTest(list1$value,list2$value,algorithm = "ms",bootstrapMethod = "anti")


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
\code{\link{MultiStatisticEpistemicTest}} for the epistemic bootstrap test related to multi-statistic approach,
\code{\link{ResamplingStatisticEpistemicTest}} for the epistemic bootstrap test related to resampling statistics,
\code{\link{AverageStatisticEpistemicTest}} for the epistemic bootstrap test related to averaging statistics,

Other epistemic bootstrap statistical test: 
\code{\link{AverageStatisticEpistemicTest}()},
\code{\link{MultiStatisticEpistemicTest}()},
\code{\link{ResamplingStatisticEpistemicTest}()}
}
\concept{epistemic bootstrap statistical test}
