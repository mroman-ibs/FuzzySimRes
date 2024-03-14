test_that("Function returns correct values", {

  # starting values

  # snapshots tests

  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicCorrectedVariance(testSample1$value)}
  )



  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicCorrectedVariance(testSample1$value, cutsNumber = 10)}
  )




  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=1,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="triangular")

      EpistemicCorrectedVariance(testSample1$value[[1]],cutsNumber = 12)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=5,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    knotNumbers = 0,
                                    type="PLFN")

      EpistemicCorrectedVariance(testSample1$value, cutsNumber = 10)}
  )



  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=5,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    knotNumbers = 0,
                                    type="PLFN")

      testSample1Epistemic <- EpistemicBootstrap(testSample1$value,cutsNumber = 8)

      EpistemicCorrectedVariance(testSample1Epistemic)}
  )



})



test_that("Function reports errors", {

  # starting values

  set.seed(123456)

  testSample1 <- SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                type="trapezoidal")

  # tests

  expect_error(EpistemicCorrectedVariance(testSample1$value, cutsNumber = 0.5),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(EpistemicCorrectedVariance(testSample1$value, cutsNumber = -3),

               "Parameter cutsNumber should be integer value and > 0")


  expect_error(EpistemicCorrectedVariance(testSample1$value,cutsNumber = "xx"),

               "Parameter cutsNumber should be integer value and > 0")


  expect_error(EpistemicCorrectedVariance(list(12,3), cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(EpistemicCorrectedVariance(5, cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(EpistemicCorrectedVariance(c("x"), cutsNumber = 10),

               "Parameter fuzzySample should consist of fuzzy numbers - single value or list")

  expect_error(EpistemicCorrectedVariance(testSample1$value, bootstrapMethod = 4, cutsNumber = 10),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")

  expect_error(EpistemicCorrectedVariance(testSample1$value,bootstrapMethod = "x", cutsNumber = 10),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")


  expect_error(EpistemicCorrectedVariance(testSample1$value,bootstrapMethod = NA, cutsNumber = 10),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")





})





