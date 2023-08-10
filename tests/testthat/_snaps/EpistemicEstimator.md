# Function returns correct values

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicEstimator(testSample1$value)
    Output
      $value
      [1] 1.142346
      
      $SE
      [1] NA
      
      $MSE
      [1] NA
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicEstimator(testSample1$value, estimator = "median", cutsNumber = 10)
    Output
      $value
      [1] 0.015348
      
      $SE
      [1] 0.1825477
      
      $MSE
      [1] NA
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicEstimator(testSample1$value, estimator = "median", cutsNumber = 10,
      trueValue = 0.1)
    Output
      $value
      [1] 0.015348
      
      $SE
      [1] 0.1825477
      
      $MSE
      [1] 0.03715726
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicEstimator(testSample1$value, estimator = "var", cutsNumber = 5)
    Output
      $value
      [1] 1.633499
      
      $SE
      [1] 0.2497924
      
      $MSE
      [1] NA
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 3, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), knotNumbers = 10, type = "PLFN")
      EpistemicEstimator(testSample1$value, estimator = "sd", cutsNumber = 8,
      trueValue = 1)
    Output
      $value
      [1] 1.116206
      
      $SE
      [1] 0.1742042
      
      $MSE
      [1] 0.04005767
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 1, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "triangular")
      EpistemicEstimator(testSample1$value[[1]], estimator = "mean", cutsNumber = 8,
      trueValue = 0)
    Output
      $value
      [1] 0.6969027
      
      $SE
      [1] 0.1336097
      
      $MSE
      [1] 0.5012935
      

