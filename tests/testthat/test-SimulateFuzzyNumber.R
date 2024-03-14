test_that("Function returns correct values", {

  # starting values

  # snapshots tests

  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          type="triangular")}
  )



  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          incrCorePD="rexp", parIncrCorePD=list(rate=2),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          type="trapezoidal")}
  )


  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          incrCorePD="rexp", parIncrCorePD=list(rate=2),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          knotNumbers = 10,
                          type="PLFN")}
  )


  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          incrCorePD="rexp", parIncrCorePD=list(rate=2),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          knotNumbers = 0,
                          type="PLFN")}
  )

})



test_that("Function reports errors", {



  # tests

  expect_error(SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                   suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                   suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                   type="xxx"),

               "Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")


  expect_error(SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                   suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                   suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                   type=5),

               "Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")


  expect_error(SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                   suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                   suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                   type=NA),

               "Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")


  expect_error(SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                   incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                   suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                   suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                   knotNumbers = -2,
                                   type="PLFN"),

               "Parameter knotNumbers should be integer value and => 0")


  expect_error(SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                   incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                   suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                   suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                   knotNumbers = "aa",
                                   type="PLFN"),

               "Parameter knotNumbers should be integer value and => 0")


  expect_error(SimulateFuzzyNumber(originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                                   incrCorePD="rexp", parIncrCorePD=list(rate=2),
                                   suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                                   suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                                   knotNumbers = NA,
                                   type="PLFN"),

               "Parameter knotNumbers should be integer value and => 0")




})

