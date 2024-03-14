test_that("Function returns correct values", {

  # starting values

  # snapshots tests

  expect_snapshot(

    {set.seed(1234567)

      SimulateSample(n=1,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          type="triangular")}
  )



  expect_snapshot(

    {set.seed(1234567)

      SimulateSample(n=10,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          incrCorePD="rexp", parIncrCorePD=list(rate=2),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          type="trapezoidal")}
  )


  expect_snapshot(

    {set.seed(1234567)

      SimulateSample(n=3,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          incrCorePD="rexp", parIncrCorePD=list(rate=2),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          knotNumbers = 10,
                          type="PLFN")}
  )


  expect_snapshot(

    {set.seed(1234567)

      SimulateSample(n=5,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                          incrCorePD="rexp", parIncrCorePD=list(rate=2),
                          suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                          suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                          knotNumbers = 0,
                          type="PLFN")}
  )

})



test_that("Function reports errors", {



  # tests

  expect_error(SimulateSample(n=-3,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                              suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                              suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                              type="triangular"),

               "Parameter n should be integer value and > 0")

  expect_error(SimulateSample(n=0,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                              suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                              suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                              type="triangular"),

               "Parameter n should be integer value and > 0")

  expect_error(SimulateSample(n=NA,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                              suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                              suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                              type="triangular"),

               "Parameter n should be integer value and > 0")


  expect_error(SimulateSample(n="xx",originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                              suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                              suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                              type="triangular"),

               "Parameter n should be integer value and > 0")


  expect_error(SimulateSample(n=1.5,originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                              suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                              suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                              type="triangular"),

               "Parameter n should be integer value and > 0")

  expect_error(SimulateSample(n=c(4,5),originalPD="rnorm",parOriginalPD=list(mean=0,sd=1),
                              suppLeftPD="runif",parSuppLeftPD=list(min=0,max=0.6),
                              suppRightPD="runif", parSuppRightPD=list(min=0,max=0.6),
                              type="triangular"),

               "Parameter n should be a single value")






})


