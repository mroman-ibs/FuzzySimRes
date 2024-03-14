test_that("Function returns correct values", {

  # starting values

  set.seed(123456)

  testSample3 <-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                               incrCorePD="rexp", parIncrCorePD=list(rate=2),
                               suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                               suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                               type="trapezoidal")

  testSample4 <-SimulateSample(10,originalPD="rnorm",parOriginalPD=list(mean=0.2,sd=1),
                               incrCorePD="rexp", parIncrCorePD=list(rate=2),
                               suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                               suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                               type="trapezoidal")

  testSample5 <-SimulateSample(10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                               incrCorePD="rexp", parIncrCorePD=list(rate=2),
                               suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                               suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                               knotNumbers = 10,
                               type="PLFN")

  testSample6 <-SimulateSample(15,originalPD="rnorm",parOriginalPD=list(mean=0,sd=2),
                               incrCorePD="rexp", parIncrCorePD=list(rate=2),
                               suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                               suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                               knotNumbers = 10,
                               type="PLFN")



  # tests

  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample3$value,testSample4$value,cutsNumber = 15,K=5)}
  )


  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample3$value,testSample4$value,cutsNumber = 25,bootstrapMethod = "anti",K=7)}
  )

  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample5$value,testSample6$value,cutsNumber = 25,K=5)}
  )


  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample5$value,testSample6$value,cutsNumber = 5,bootstrapMethod = "anti",K=2)}
  )


  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample3$value,sample2 = NULL,cutsNumber = 5,y="pnorm",K=5)}
  )

  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample4$value,sample2 = NULL,cutsNumber = 30,y="pnorm",bootstrapMethod = "anti",K=10)}
  )


  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample5$value,sample2 = NULL,cutsNumber = 30,y="pexp",K=5)}
  )

  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample3$value,testSample4$value,cutsNumber = 15,combineMethod = "mean",K=2)}
  )


  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample3$value,testSample4$value,cutsNumber = 25,bootstrapMethod = "anti",combineMethod = "mean")}
  )

  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample3$value,sample2 = NULL,cutsNumber = 5,y="pnorm",combineMethod = "mean",K=5)}
  )

  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample4$value,sample2 = NULL,cutsNumber = 30,y="pnorm",bootstrapMethod = "anti",combineMethod = "mean",K=10)}
  )


  expect_snapshot(

    {set.seed(1234567)

      ResamplingStatisticEpistemicTest(testSample5$value,sample2 = NULL,cutsNumber = 30,y="pexp",combineMethod = "mean",K=12)}
  )

})



test_that("Function reports errors", {

  # starting values

  set.seed(123456)

  testSample3 <-SimulateSample(20,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                               incrCorePD="rexp", parIncrCorePD=list(rate=2),
                               suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                               suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                               type="trapezoidal")

  # tests

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = -5),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = NA,K=5),

               "Parameter cutsNumber should be integer value and > 0")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = c(3,4)),

               "Parameter cutsNumber should be a single value")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10, bootstrapMethod = "x"),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10, bootstrapMethod = -2),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10, bootstrapMethod = NA),

               "Parameter bootstrapMethod should be a proper name of epistemic bootstrap method - std or anti")

  expect_error(ResamplingStatisticEpistemicTest(NA,testSample3$value,cutsNumber = 10),

               "Parameter sample1 should consist of fuzzy numbers - single value or list")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,NA,cutsNumber = 10),

               "Parameter sample2 should consist of fuzzy numbers - single value or list")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,c(1,23),cutsNumber = 10),

               "Parameter sample2 should consist of fuzzy numbers - single value or list")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,list(1,23,list(123)),cutsNumber = 10),

               "Parameter sample2 should consist of fuzzy numbers - single value or list")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10, bootstrapMethod = "std",combineMethod = 3),

               "Parameter combineMethod should be a proper name of the p-value combining method")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10, bootstrapMethod = "std",combineMethod = "x"),

               "Parameter combineMethod should be a proper name of the p-value combining method")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10, bootstrapMethod = "std",combineMethod = NA),

               "Parameter combineMethod should be a proper name of the p-value combining method")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10,K=-1),

               "Parameter K should be integer value and > 0")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10,K=0),

               "Parameter K should be integer value and > 0")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10,K=2.3),

               "Parameter K should be integer value and > 0")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10,K="x"),

               "Parameter K should be integer value and > 0")

  expect_error(ResamplingStatisticEpistemicTest(testSample3$value,testSample3$value,cutsNumber = 10,K=c(2,3)),

               "Parameter K should be a single value")



})






