# Function returns correct values

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicMean(testSample1$value)
    Output
      $value
      [1] -0.07957496
      
      $SE
      [1] NA
      
      $MSE
      [1] NA
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicMean(testSample1$value, cutsNumber = 10)
    Output
      $value
      [1] -0.2325832
      
      $SE
      [1] 0.1211593
      
      $MSE
      [1] NA
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicMean(testSample1$value, cutsNumber = 10, trueValue = 0.1)
    Output
      $value
      [1] -0.2325832
      
      $SE
      [1] 0.1211593
      
      $MSE
      [1] 0.1238232
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicMean(testSample1$value, cutsNumber = 12, trueValue = 0.1)
    Output
      $value
      [1] -0.1716568
      
      $SE
      [1] 0.1254708
      
      $MSE
      [1] 0.08822842
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 1, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6),
      suppRightPD = "runif", parSuppRightPD = list(min = 0, max = 0.6), type = "triangular")
      EpistemicMean(testSample1$value[[1]], cutsNumber = 12)
    Output
      $value
      [1] 0.6149814
      
      $SE
      [1] 0.1314047
      
      $MSE
      [1] NA
      

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 3, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 10, type = "PLFN")
      EpistemicMean(testSample1$value, cutsNumber = 8, trueValue = -0.1)
    Output
      $value
      [1] -0.5295721
      
      $SE
      [1] 0.2914375
      
      $MSE
      [1] 0.2588511
      

