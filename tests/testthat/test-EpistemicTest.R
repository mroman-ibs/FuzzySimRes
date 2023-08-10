test_that("Function returns correct values", {

  # starting values

  set.seed(123456)

  testSample3 <-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                               type="trapezoidal")

  testSample4 <-SimulateSample(10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0.2,sd=1),
                               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                               type="trapezoidal")

  testSample5 <-SimulateSample(10,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                               knotNumbers = 10,
                               type="PLFN")

  testSample6 <-SimulateSample(15,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=2),
                               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                               knotNumbers = 10,
                               type="PLFN")



  # tests

  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample3$value,testSample4$value,cutsNumber = 15)}
  )


  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample3$value,testSample4$value,cutsNumber = 25,bootstrapMethod = "anti",algorithm = "avs")}
  )

  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample5$value,testSample6$value,cutsNumber = 25,algorithm = "ms",combineMethod = "mean")}
  )


  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample5$value,testSample6$value,cutsNumber = 5,bootstrapMethod = "anti",algorithm = "res",combineMethod = "simes",K=5)}
  )


  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample3$value,sample2 = NULL,cutsNumber = 5,y="pnorm",algorithm = "ms",combineMethod = "mean")}
  )

  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample4$value,sample2 = NULL,cutsNumber = 30,y="pnorm",bootstrapMethod = "anti",algorithm = "res",combineMethod = "simes",K=5)}
  )


  expect_snapshot(

    {set.seed(1234567)

      EpistemicTest(testSample5$value,sample2 = NULL,cutsNumber = 30,y="pexp")}
  )



})




test_that("Function reports errors", {

  # starting values

  set.seed(123456)

  testSample3 <-SimulateSample(20,originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                               increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                               supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                               supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                               type="trapezoidal")

  # tests

  expect_error(EpistemicTest(testSample3$value,testSample3$value,cutsNumber = -5),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(EpistemicTest(testSample3$value,testSample3$value,cutsNumber = 5,algorithm = 5),

               "Parameter algorithm should be a proper name of epistemic bootstrap test - avs, ms or res")

  expect_error(EpistemicTest(testSample3$value,testSample3$value,cutsNumber = 5,algorithm = NA),

               "Parameter algorithm should be a proper name of epistemic bootstrap test - avs, ms or res")

  expect_error(EpistemicTest(testSample3$value,testSample3$value,cutsNumber = 5,algorithm = "x"),

               "Parameter algorithm should be a proper name of epistemic bootstrap test - avs, ms or res")

  expect_error(EpistemicTest(testSample3$value,testSample3$value,cutsNumber = 5,algorithm = c(2,3)),

               "Parameter algorithm should be a single value")


})


