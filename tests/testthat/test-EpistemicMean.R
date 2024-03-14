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

      EpistemicMean(testSample1$value)}
  )



  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicMean(testSample1$value, cutsNumber = 10)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicMean(testSample1$value,cutsNumber = 10,trueValue = 0.1)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="trapezoidal")

      EpistemicMean(testSample1$value,cutsNumber = 12,trueValue = 0.1)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=1,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    type="triangular")

      EpistemicMean(testSample1$value[[1]],cutsNumber = 12)}
  )


  expect_snapshot(

    {set.seed(123456)

      testSample1 <- SimulateSample(n=3,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                    incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                    suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                    suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                    knotNumbers = 10,
                                    type="PLFN")

      EpistemicMean(testSample1$value,cutsNumber = 8,trueValue = -0.1)}
  )





})
