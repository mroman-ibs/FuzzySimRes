test_that("Function returns correct values", {

  # starting values

  # equal tests

  expect_equal(CombinePValues(c(0.5,0.37,0.45),method = "mean"), 0.44, tolerance = 1e-6)

  expect_equal(CombinePValues(c(0.5,0.37,0.45),method = "simes"), 0.5, tolerance = 1e-6)

  expect_equal(CombinePValues(c(0.5,0.37,0.45),method = "fisher"), 0.5474332, tolerance = 1e-6)

  expect_equal(CombinePValues(c(0.5,0.37,0.45),method = "tippet"), 1, tolerance = 1e-6)

  expect_equal(CombinePValues(c(0.5,0.37,0.45),method = "sidak"), 0.749953, tolerance = 1e-6)

  expect_equal(CombinePValues(c(0.5,0.37,0.45,0.1,0),method = "mean"), 0.284, tolerance = 1e-6)



})


test_that("Function reports errors", {

  # starting values



  # tests

  expect_error(CombinePValues(c(0.5,0.37,0.45,0.1,NA),method = "mean"),

               "There are some NA in pValues parameter")

  expect_error(CombinePValues("x",method = "mean"),

               "Some values in pValues parameter are not numeric ones")

  expect_error(CombinePValues(matrix(0.5,nrow = 3,ncol=3),method = "mean"),

               "Parameter pValues should be a vector of numerical values")

  expect_error(CombinePValues(c(0.5,0.37,0.45,0.1),method = 5),

               "Parameter method should be a proper name of the p-value combining method")

  expect_error(CombinePValues(c(0.5,0.37,0.45,0.1),method = "x"),

               "Parameter method should be a proper name of the p-value combining method")

  expect_error(CombinePValues(c(0.5,0.37,0.45,0.1),method = NA),

               "Parameter method should be a proper name of the p-value combining method")




})


