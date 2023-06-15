
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FuzzySimRes

The goal of FuzzySimRes, a library written in R, is to simulate
synthetic fuzzy data and provide so-called epistemic bootstrap
procedures.

The simulation procedures are useful to generate synthetic samples that
can be applied in statistical inference (see, e.g., (P. Grzegorzewski,
Hryniewicz, and Romaniuk 2020a, 2020b)) and consist of fuzzy numbers
(e.g., triangular or trapezoidal ones).

The epistemic bootstrap is used for epistemic fuzzy data (see (Couso and
Dubois 2014)) and it allows (see (P. Grzegorzewski and Romaniuk 2021;
Przemyslaw Grzegorzewski and Romaniuk 2022)):

- application of special resampling procedures,
- application of real-valued statistical tests for fuzzy data,
- estimation of statistical characteristics (like the mean) of a fuzzy
  sample.

Additionally, the special epistemic fuzzy real-life data set is provided
(see (Faraz and Shapiro 2010)) which consists of triangular fuzzy
numbers.

The fuzzy data used in this package should be defined as the variables
introduced in (Gagolewski and Caha 2021) (as, e.g., triangular fuzzy
numbers).

The following procedures are available in the library:

- Epistemic bootstrap procedures:
  - *EpistemicBootstrap* - the standard epistemic bootstrap,
  - *AntitheticBootstrap* - the antithetic epistemic bootstrap.
- Random generation of the initial samples:
  - *SimulateFuzzyNumber* - generation of a single fuzzy number
    (triangular, trapezoidal, PLFN one),
  - *SimulateSample* - generation of the whole fuzzy sample using
    various random distributions.
- Applications of the epistemic bootstrap:
  - *EpistemicEstimator* - estimation of the given statistical
    characteristic together with its SE/MSE using the fuzzy sample and
    epistemic bootstrap,
  - *EpistemicMean* - estimation of the mean using the fuzzy sample and
    epistemic bootstrap,
  - *EpistemicCorrectedVariance* - estimation of the variance with the
    special corrected formula using the fuzzy sample and epistemic
    bootstrap,
  - *EpistemicTest* - estimation of the p-value of the selected
    real-valued statistical test using the fuzzy sample and epistemic
    bootstrap,
  - *AverageStatisticEpistemicTest* - estimation of the p-value of the
    selected real-valued statistical test using the fuzzy sample,
    epistemic bootstrap, and averaging statistics method,
  - *MultiStatisticEpistemicTest* - estimation of the p-value of the
    selected real-valued statistical test using the fuzzy sample,
    epistemic bootstrap, and multi-statistics method,
  - *ResamplingStatisticEpistemicTest* - estimation of the p-value of
    the selected real-valued statistical test using the fuzzy sample,
    epistemic bootstrap, and resampling statistics method.
- Additional procedures:
  - *CombinePValues* - combining the p-values of a statistical test into
    a single value,
  - *KSTestCriticalValue* - calculation of the p-value for a given
    critical value in the case of the one- and two-sample
    Kolmogorov-Smirnow test.
- Dataset:
- *controlChartData* - the real-life fuzzy epistemic data concerning
  electronic circuit thickness.

## Installation

You can install the latest development version of FuzzyResampling with:

``` r
library(devtools)
install_github("mroman-ibs/FuzzySimRes")
```

You can install the latest stable version from CRAN with:

``` r
install.packages("FuzzySimRes")
```

## Examples

``` r
# set seed

set.seed(12345)

# load library

library(FuzzySimRes)


# generate the initial sample consisting of 5 trapezoidal fuzzy numbers

sample1 <- SimulateSample(5,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
type="trapezoidal")

# apply the epistemic bootstrap with 10 cuts

EpistemicBootstrap (sample1, cutsNumber=10)
#>                X1       X2         X3         X4          X5
#> alpha1  1.1497756 1.892964 -0.4412416 -0.4123010 -0.21887696
#> alpha2  1.0789047 2.256274  0.8043010 -0.2897991  0.21447852
#> alpha3  1.0821638 1.558882 -0.5234141 -0.4201384  0.01919864
#> alpha4  0.9770422 1.871995  0.2864493 -0.4820862  0.22506592
#> alpha5  1.4685182 1.471085  1.1883406 -0.7735033 -0.53509789
#> alpha6  1.6920152 2.316149  0.3981874 -0.3132989  0.29258249
#> alpha7  1.6567735 1.597893  0.1417311 -0.4820543  0.24728641
#> alpha8  1.2565657 2.537325 -0.1589284 -0.6728166 -0.22298375
#> alpha9  1.1521309 2.275875 -0.2135284 -0.7091520  0.07312683
#> alpha10 1.5825929 2.525235 -0.8153841 -0.7529021  0.17019910

# apply the antithetic bootstrap with 10 cuts

AntitheticBootstrap (sample1, cutsNumber=10)
#>               X1       X2          X3         X4          X5
#> alpha1  1.715099 2.348629  0.84791420 -0.4155065 -0.10278774
#> alpha2  1.657023 2.315396  0.75226172 -0.2950119 -0.18807131
#> alpha3  1.525241 1.529150  0.04191831 -0.4140887  0.28010819
#> alpha4  1.036562 1.548077  0.88263662 -0.2954918 -0.28473900
#> alpha5  1.123620 2.289173  0.08373510 -0.4331157 -0.19568336
#> alpha6  1.423709 1.622644  0.68312991 -0.4069346  0.13470515
#> alpha7  1.300673 2.154367  0.27146818 -0.6049461  0.30957665
#> alpha8  1.153848 1.880561  0.76471178 -0.5728187 -0.29215072
#> alpha9  1.384238 2.107480  0.30352891 -0.6221601 -0.08907579
#> alpha10 1.574392 1.977895 -0.28340154 -0.3810230  0.25160955

# calculate the mean using the standard epistemic bootstrap approach

EpistemicMean(sample1,cutsNumber = 30)
#> $value
#> [1] 0.60163
#> 
#> $SE
#> [1] 0.1570901

# calculate the median using the antithetic epistemic bootstrap approach

EpistemicEstimator(sample1,estimator="median",cutsNumber = 30,bootstrapMethod="anti")
#> $value
#> [1] 0.136565
#> 
#> $SE
#> [1] 0.2187421


# generate two independent initial fuzzy samples

list1<-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
type="trapezoidal")


list2<-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
type="trapezoidal")

# apply the Kolmogorov-Smirnov two-sample test for two different samples
# with the average statistics approach

EpistemicTest(list1,list2,cutsNumber = 30)
#> [1] 0.8319696

# apply the Kolmogorov-Smirnov two-sample test for two different samples
# with the multi-statistic and antithetic approach

EpistemicTest(list1,list2,algorithm = "ms",bootstrapMethod = "anti")
#> [1] 0.8319696

# apply the Kolmogorov-Smirnov one-sample test
# with the averaging statistic approach for the first sample

AverageStatisticEpistemicTest(list1,sample2=NULL,cutsNumber = 30,y="pnorm")
#> [1] 0.6101717
```

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Couso2014" class="csl-entry">

Couso, I., and D. Dubois. 2014. “Statistical Reasoning with Set-Valued
Information: Ontic Vs. Epistemic Views.” *International Journal of
Approximate Reasoning* 55: 1502–18.

</div>

<div id="ref-FARAZ20102684" class="csl-entry">

Faraz, Alireza, and Arnold F. Shapiro. 2010. “An Application of Fuzzy
Random Variables to Control Charts.” *Fuzzy Sets and Systems* 161 (20):
2684–94. <https://doi.org/10.1016/j.fss.2010.05.004>.

</div>

<div id="ref-Gagolewski" class="csl-entry">

Gagolewski, Marek, and Jan Caha. 2021. *FuzzyNumbers Package: Tools to
Deal with Fuzzy Numbers in r*.
<https://github.com/gagolews/FuzzyNumbers/>.

</div>

<div id="ref-grzegorzewskietal2020" class="csl-entry">

Grzegorzewski, P., O. Hryniewicz, and M. Romaniuk. 2020a. “Flexible
Bootstrap for Fuzzy Data Based on the Canonical Representation.”
*International Journal of Computational Intelligence Systems* 13:
1650–62. <https://doi.org/10.2991/ijcis.d.201012.003>.

</div>

<div id="ref-grzegorzewskiamcs2020" class="csl-entry">

———. 2020b. “Flexible Resampling for Fuzzy Data.” *International Journal
of Applied Mathematics and Computer Science* 30: 281–97.
<https://doi.org/10.34768/amcs-2020-0022>.

</div>

<div id="ref-grzegorzewski2021" class="csl-entry">

Grzegorzewski, P., and M. Romaniuk. 2021. “Epistemic Bootstrap for Fuzzy
Data.” In *Joint Proceedings of IFSA-EUSFLAT-AGOP 2021 Conferences*,
538–45. Atlantis Press.

</div>

<div id="ref-Grzegorzewski_Romaniuk_2022" class="csl-entry">

Grzegorzewski, Przemyslaw, and Maciej Romaniuk. 2022. “Bootstrap Methods
for Epistemic Fuzzy Data.” *International Journal of Applied Mathematics
and Computer Science* 32 (2): 285–97.

</div>

</div>
