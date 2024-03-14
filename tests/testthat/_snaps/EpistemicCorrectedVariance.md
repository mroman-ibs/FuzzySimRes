# Function returns correct values

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicCorrectedVariance(testSample1$value)
    Output
      [1] 1.17446

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicCorrectedVariance(testSample1$value, cutsNumber = 10)
    Output
      [1] 1.807633

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 1, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6),
      suppRightPD = "runif", parSuppRightPD = list(min = 0, max = 0.6), type = "triangular")
      EpistemicCorrectedVariance(testSample1$value[[1]], cutsNumber = 12)
    Output
      [1] 0

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 5, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 0, type = "PLFN")
      EpistemicCorrectedVariance(testSample1$value, cutsNumber = 10)
    Output
      [1] 2.017854

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 5, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 0, type = "PLFN")
      testSample1Epistemic <- EpistemicBootstrap(testSample1$value, cutsNumber = 8)
      EpistemicCorrectedVariance(testSample1Epistemic)
    Output
      [1] 11.16113

