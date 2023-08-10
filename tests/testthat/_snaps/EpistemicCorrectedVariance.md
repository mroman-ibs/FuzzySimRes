# Function returns correct values

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicCorrectedVariance(testSample1$value)
    Output
      [1] 1.17446

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicCorrectedVariance(testSample1$value, cutsNumber = 10)
    Output
      [1] 1.807633

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 1, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "triangular")
      EpistemicCorrectedVariance(testSample1$value[[1]], cutsNumber = 12)
    Output
      [1] 0

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 5, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), knotNumbers = 0, type = "PLFN")
      EpistemicCorrectedVariance(testSample1$value, cutsNumber = 10)
    Output
      [1] 2.017854

