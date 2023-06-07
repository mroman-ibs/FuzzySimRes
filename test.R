library(devtools)

library(roxygen2)

library(testthat)



document()


load_all()

check()

build()

?SimulateFuzzyNumber

rm(list = c("EpistemicCorrectedVariance"))

SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    type="triangular")


is.numeric(c(1,2,NA))

FuzzyNumbers::TriangularFuzzyNumber(0.3551584,1.197018,0.4364929)

IfInteger(NA)


SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    type="trapezoidal")

SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    knotNumbers = 3,
                    type="trapezoidal")

SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    knotNumbers = c(2,3),
                    type="trapezoidal")


SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    knotNumbers = 10,
                    type="PLFN")


TruncDistribution(10,distributionName="rnorm", distributionParameters=list(mean=0,sd=1),leftEndSupport = 0,
                  rightEndSupport = 0.5)

TruncDistribution(10,distributionName="rnorm", distributionParameters=list(mean=0,sd=1),leftEndSupport = 0,
                  rightEndSupport = 0.5,decreasing = TRUE)


liczba1 <- SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    knotNumbers = 2,
                    type="PLFN")

liczba1

liczba1["knots"]

plot(liczba1)


liczba2<- SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                    knotNumbers = 0,
                    type="PLFN")

liczba2

?SimulateFuzzyNumber

c(noquote(paste("X", 1:3, sep="")))

SimulateSample(n=3,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
               type="PLFN",knotNumbers = -2)


lista1<-SimulateSample(3,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
               type="trapezoidal")

lista1[[1]]

lista1a<-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                       increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                       supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                       supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                       type="trapezoidal")


lista1b<-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                        increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                        supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                        supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                        type="trapezoidal")


lista2<-SimulateSample(5,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                       increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                       supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                       supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                       knotNumbers = 2,
                       type="PLFN")

lista2

lista3<- SimulateSample(10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                             supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                             supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                             type="triangular")

lista3

alfaCiecia1 <- FuzzyNumbers::alphacut(lista2[[1]],c(0,0.5,1))

FuzzyNumbers::alphacut(lista2[[1]],c(0.2,0.1,0.3))

typeof(FuzzyNumbers::alphacut(lista2[[1]],c(0,0.5,1)))

is.matrix(FuzzyNumbers::alphacut(lista2[[1]],c(0,0.5,1)))

alfaCiecia1[1,]

alfaCiecia1[,1]

runif(3,c(1,5,30),c(10,25,40))

length(lista1)

length(liczba1)

liczba1


EpistemicBootstrap(liczba1,10)

EpistemicBootstrap(liczba1,cutsNumber = "ch")

wynikA <- EpistemicBootstrap(lista1,10)

wynikA

mean(wynikA)

apply(wynikA,1,sd)

wynik13 <- EpistemicBootstrap(lista2,5)

wynik13

ncol(wynik13)

wynik14 <- EpistemicBootstrap(lista2,4)

wynik14

wynik15 <- apply(wynik14,MARGIN = 1,FUN = mean)

wynik15

sd(wynik15)

(wynik15-1)^2

matrix(data=wynik15,nrow=4,ncol=5)

wynik14 + matrix(data=wynik15,nrow=4,ncol=5)

(wynik14 + matrix(data=wynik15,nrow=4,ncol=5))^2

sum((wynik14 + matrix(data=wynik15,nrow=4,ncol=5))^2)

wynik16 <- apply(wynik14,MARGIN = 2,FUN = mean)

wynik16

wynik14+matrix(data=wynik16,nrow=4,ncol=5,byrow = TRUE)

matrix(data=wynik16,nrow=4,ncol=5,byrow = TRUE)

mean(wynik13)

apply(wynik13, 1, FUN = sd)

sd(wynik13)

EpistemicBootstrap(lista3,5)

EpistemicBootstrap(lista2,5)[1,]

?EpistemicBootstrap

lista1

liczba1

AntitheticBootstrap(liczba1,10)

AntitheticBootstrap(lista1,10)

?AntitheticBootstrap

rm(TruncDistribution)

listaTes1 <- rnorm(30)

listaTes2 <- rnorm(20)

ks.test(listaTes1,listaTes2)

ks.test(listaTes1,"pnorm")

KSTestCriticalValue(0.155,30,NA)

1 - .Call(K_pkolmim2x, as.double(0.155), as.integer(30),
          PACKAGE = "FuzzySimRes")


KSTestCriticalValue(0.25,30,20)

KSTestCriticalValue(0.155,30,NA)

?KSTestCriticalValue

p <- runif(20)

CombinePValues(p)

CombinePValues(matrix(c(1,2,3,4),nrow=2))

CombinePValues(p,method = "brak")

palasso:::.combine(p)

palasso:::.combine(p,method = "sidak")

grupowanie<-rep(1,20)
combineGroupedPValues(p,grupowanie,method = "tippet")$p.value

?CombinePValues

MultiStatisticEpistemicTest(lista1a,lista1a,cutsNumber = 10)

MultiStatisticEpistemicTest(lista1a,lista1a[[1]],cutsNumber = 10)

MultiStatisticEpistemicTest(lista1a,lista1a,cutsNumber = 1)

MultiStatisticEpistemicTest(lista2,lista2,cutsNumber = 30)

MultiStatisticEpistemicTest(lista2,lista2,cutsNumber = 30, alternative = "greater")

MultiStatisticEpistemicTest(lista3,lista3,cutsNumber = 30,bootstrapMethod = "anti",combineMethod = "mean")

MultiStatisticEpistemicTest(lista3,lista3,cutsNumber = 30,bootstrapMethod = "anti",combineMethod = "ch")

MultiStatisticEpistemicTest(lista1a,lista1b,cutsNumber = 30,bootstrapMethod = "anti",combineMethod = "mean")

EpistemicTest(lista1a,lista1b,algorithm = "ms",cutsNumber = 30,bootstrapMethod = "anti",combineMethod = "mean")

EpistemicTest(lista1a,lista1b,cutsNumber = 10,bootstrapMethod = "anti")

MultiStatisticEpistemicTest(lista2,sample2=NULL,cutsNumber = 30,y="pnorm",mean=0,sd=1)

MultiStatisticEpistemicTest(lista2,sample2=NULL,cutsNumber = 30,y="pnorm",mean=5,sd=1)

EpistemicTest(lista2,sample2=NULL,cutsNumber = 30,y="pnorm",mean=0.1,sd=1)

?EpistemicTest

is.numeric(lista1[[1]])
is.numeric(lista1[[1]])

do.call(ks.test,as.list(append()))

list(1,3,...)

?MultiStatisticEpistemicTest

?AverageStatisticEpistemicTest


AverageStatisticEpistemicTest(lista1a,lista1a,cutsNumber = 30)

AverageStatisticEpistemicTest(lista1a,lista1b,cutsNumber = 30)

AverageStatisticEpistemicTest(lista1a,lista1b,cutsNumber = 30,bootstrapMethod = "anti")

AverageStatisticEpistemicTest(lista1a,lista1b,cutsNumber = 30,bootstrapMethod = "anti",alternative="greater")

AverageStatisticEpistemicTest(lista1a,sample2=NULL,cutsNumber = 30,y="pnorm")

ResamplingStatisticEpistemicTest(lista1a,lista1a,cutsNumber = 30)

AverageStatisticEpistemicTest(lista3,lista3,cutsNumber = 30,bootstrapMethod = "anti")


ResamplingStatisticEpistemicTest(lista1a,lista1b,cutsNumber = 30,K=20)

ResamplingStatisticEpistemicTest(lista1a,lista1b,cutsNumber = 30,K=40)


ResamplingStatisticEpistemicTest(lista1a,sample2=NULL,cutsNumber = 30,K=20,y="pnorm")

f1 <- function(x, ...) {
  args <- list(...)

  return(args)

}

x1 <- f1 (5,c=16,f="ch")

append(x1,list(x2="b"))


macierz1 <- matrix(data=1:12,nrow = 3,ncol = 4,byrow = TRUE)

macierz1

macierz2 <- matrix(data=c(10,10,10,10,20,NA,20,NA,30,NA,NA,30),nrow = 3,ncol = 4,byrow = TRUE)

macierz2

colMeans(macierz2,na.rm=TRUE)

probka1 <- rnorm(10,mean=0.1,sd=1)

probka2 <- rnorm(30,mean=0.1,sd=1)

ks.test(probka1,"pnorm")$statistic

ks.test(probka1,"pnorm")$p.value

ks.test(probka1,probka2)

pkolmogorov(0.15,50)

1-psmirnov(q=0.33333,sizes=c(10,30))

1- .Call(stats:::C_pKolmogorov2x,0.1849798,100)

EpistemicMean(lista1)

EpistemicMean(lista2,cutsNumber = 10, bootstrapMethod = "anti")

?EpistemicMean

use_description()

packageVersion('pkgload')

1- .Call(stats:::C_pSmirnov2x, 0.5, 10, 10)

rm(list = c("KSTestCriticalValue"))

rm(list = c("EpistemicEstimator"))

EpistemicMean(lista1)

is.numeric(NA)

EpistemicMean(lista1,cutsNumber = 10,trueValue = 0)

EpistemicMean(lista1,cutsNumber = 10,trueValue = "ch")

EpistemicEstimator(lista2,estimator = "median",cutsNumber = 30, bootstrapMethod = "anti")

EpistemicEstimator(lista3,estimator = "median",cutsNumber = 30, bootstrapMethod = "anti")

EpistemicEstimator(lista2,estimator = median,cutsNumber = 30, bootstrapMethod = "anti")

EpistemicEstimator(lista2,estimator = median,cutsNumber = 30, bootstrapMethod = "anti",trueValue = 0.1)

EpistemicEstimator(lista3,estimator = "mean",cutsNumber = 30, bootstrapMethod = "anti")

EpistemicEstimator(lista3,estimator = "mean",cutsNumber = 30, bootstrapMethod = "anti", trueValue = 0.4)


EpistemicCorrectedVariance (lista2, cutsNumber=2, bootstrapMethod="std")

EpistemicCorrectedVariance (lista1a, cutsNumber=10, bootstrapMethod="anti")

EpistemicCorrectedVariance (lista1a, bootstrapMethod="anti")

EpistemicCorrectedVariance (lista1a, bootstrapMethod="ch",cutsNumber = 20)

EpistemicBootstrap(liczba1,cutsNumber = 10)

AntitheticBootstrap(liczba1, cutsNumber = 1.2)

EpistemicBootstrap(c(1,2,3,4), cutsNumber = 1)

class(liczba1)

class(liczba2)

is(liczba1,"FuzzyNumber")

is(lista2[[1]],"FuzzyNumber")

class(lista2[[1]])

length(liczba1)

is.list(lista2)

length(lista2)

isFuzzyData(lista3)

isFuzzyData(list(liczba1,"a"))

testLista1 <- list(liczba1,"a")

is(testLista1[[2]],"FuzzyNumber")

sapply(lista2,FUN=isFuzzyNumber)

isFuzzyData("liczba2")

AntitheticBootstrap(testLista1, cutsNumber = 1)

EpistemicBootstrap(testLista1, cutsNumber = c(2,4))

"chm" %in% c("trapezoidal","triangular")

EpistemicMean(lista1,estimator="median",cutsNumber = 30,bootstrapMethod="anti")

EpistemicTest(lista1,lista2,algorithm = "ms",bootstrapMethod = "anti")

EpistemicTest(lista1,lista2,algorithm = "bc",bootstrapMethod = "anti")

IfInteger(c(0,2))

length(NA)

is.vector(1)

is.null(NULL)


usethis::use_data_raw()

?AntitheticBootstrap

?AverageStatisticEpistemicTest

?CombinePValues

?EpistemicCorrectedVariance

?EpistemicEstimator

?EpistemicMean

?EpistemicTest

?KSTestCriticalValue

?MultiStatisticEpistemicTest

?ResamplingStatisticEpistemicTest

?SimulateFuzzyNumber

?SimulateSample

?controlChartData

controlChartData

?FuzzySimRes

usethis::use_readme_rmd()

usethis::use_news_md()

usethis::use_cran_comments()

devtools::check(remote = TRUE, manual = TRUE)

devtools::check_win_devel()

usethis::use_release_issue()

rhub::check_for_cran()

rhub::validate_email(email = NULL, token = NULL)

devtools::submit_cran()

