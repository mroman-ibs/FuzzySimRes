test_that("Function reports errors", {

  # starting values

  # snapshots tests

  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                          supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                          supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                          type="triangular")}
  )



  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                          increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                          supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                          supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                          type="trapezoidal")}
  )


  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                          increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                          supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                          supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                          knotNumbers = 10,
                          type="PLFN")}
  )


  expect_snapshot(

    {set.seed(1234567)

      SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                          increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                          supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                          supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                          knotNumbers = 0,
                          type="PLFN")}
  )



  # tests

  expect_error(SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                   supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                   supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                   type="xxx"),

               "Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")


  expect_error(SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                   supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                   supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                   type=5),

               "Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")


  expect_error(SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                   supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                   supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                   type=NA),

               "Parameter type should be a valid name of the type of fuzzy number - triangular, trapezoidal or PLFN")


  expect_error(SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                   increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                   supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                   supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                   knotNumbers = -2,
                                   type="PLFN"),

               "Parameter knotNumbers should be integer value and => 0")


  expect_error(SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                   increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                   supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                   supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                   knotNumbers = "aa",
                                   type="PLFN"),

               "Parameter knotNumbers should be integer value and => 0")


  expect_error(SimulateFuzzyNumber(originalRandomDist="rnorm",parametersOriginalRD=list(mean=0,sd=1),
                                   increasesCoreRandomDist="rexp", parametersCoreIncreasesRD=list(rate=2),
                                   supportLeftRandomDist="runif",parametersSupportLeftRD=list(min=0,max=0.6),
                                   supportRightRandomDist="runif", parametersSupportRightRD=list(min=0,max=0.6),
                                   knotNumbers = NA,
                                   type="PLFN"),

               "Parameter knotNumbers should be integer value and => 0")




})

