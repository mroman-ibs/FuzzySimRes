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

      AntitheticBootstrap(testSample1$value,cutsNumber = 1)}
  )



  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="trapezoidal")

      AntitheticBootstrap(testSample1$value,cutsNumber = 10)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    type="trapezoidal")

      AntitheticBootstrap(testSample1$value,cutsNumber = 5)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=3,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                    increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                    supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                    supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                    knotNumbers = 10,
                                    type="PLFN")

      AntitheticBootstrap(testSample1$value,cutsNumber = 8)}
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

  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = 0),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = 1.5),

               "Parameter cutsNumber should be integer value and > 0")


  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = -5),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = NA),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = "xx"),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = c(2,3)),

               "Parameter cutsNumber should be a single value")

  expect_error(AntitheticBootstrap(testSample1$value,cutsNumber = list(2,3)),

               "Parameter cutsNumber should be a single value")

  expect_error(AntitheticBootstrap(12,cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(AntitheticBootstrap(list(12,3),cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(AntitheticBootstrap("x",cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")



})


