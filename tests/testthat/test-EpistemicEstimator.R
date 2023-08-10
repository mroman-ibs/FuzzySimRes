test_that("Function returns correct values", {

  # starting values

  # snapshots tests

  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicEstimator(testSample1$value)}
  )



  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicEstimator(testSample1$value,estimator = "median", cutsNumber = 10)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicEstimator(testSample1$value,estimator = "median", cutsNumber = 10,trueValue = 0.1)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicEstimator(testSample1$value,estimator = "var", cutsNumber = 5)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=3,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    knotNumbers = 10,
                                    type="PLFN")

      EpistemicEstimator(testSample1$value,estimator = "sd", cutsNumber = 8,trueValue = 1)}
  )



  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=1,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="triangular")

      EpistemicEstimator(testSample1$value[[1]],estimator = "mean", cutsNumber = 8,trueValue = 0)}
  )




})


test_that("Function reports errors", {

  # starting values

  set.seed(123456)

  testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                type="trapezoidal")

  # tests

  expect_error(EpistemicEstimator(testSample1$value,estimator = "mean", cutsNumber = 0.5),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(EpistemicEstimator(testSample1$value,estimator = "mean", cutsNumber = -3),

               "Parameter cutsNumber should be integer value and > 0")


  expect_error(EpistemicEstimator(testSample1$value,estimator = "mean", cutsNumber = "xx"),

               "Parameter cutsNumber should be integer value and > 0")


  expect_error(EpistemicEstimator(list(12,3), cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(EpistemicEstimator(5, cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(EpistemicEstimator(c("x"), cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(EpistemicEstimator(testSample1$value,estimator = "mean", bootstrapMethod = 4, cutsNumber = 10),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")

  expect_error(EpistemicEstimator(testSample1$value,estimator = "mean", bootstrapMethod = "x", cutsNumber = 10),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")


  expect_error(EpistemicEstimator(testSample1$value,estimator = "mean", bootstrapMethod = NA, cutsNumber = 10),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")

  expect_error(EpistemicEstimator(testSample1$value,estimator = "sd", bootstrapMethod = "std", cutsNumber = 10, trueValue = "x"),

               "Parameter trueValue should be a numerical value or NA")

  expect_error(EpistemicEstimator(testSample1$value,estimator = "sd", bootstrapMethod = "std", cutsNumber = 10, trueValue = c(2,3)),

               "Parameter trueValue should be a single value")



})




