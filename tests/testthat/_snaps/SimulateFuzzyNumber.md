# Function returns correct values

    Code
      set.seed(1234567)
      SimulateFuzzyNumber(originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "triangular")
    Output
      $original
      [1] 0.6022571
      
      $value
      Trapezoidal fuzzy number with:
         support=[0.264901,0.620074],
            core=[0.602257,0.602257].
      

---

    Code
      set.seed(1234567)
      SimulateFuzzyNumber(originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      incrCorePD = "rexp", parIncrCorePD = list(rate = 2), suppLeftPD = "runif",
      parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
    Output
      $original
      [1] 0.6022571
      
      $value
      Trapezoidal fuzzy number with:
         support=[-1.63434,2.36678],
            core=[-1.29698,1.84901].
      

---

    Code
      set.seed(1234567)
      SimulateFuzzyNumber(originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      incrCorePD = "rexp", parIncrCorePD = list(rate = 2), suppLeftPD = "runif",
      parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 10, type = "PLFN")
    Output
      $original
      [1] 0.6022571
      
      $value
      Piecewise linear fuzzy number with 10 knot(s),
         support=[-1.63434,2.36678],
            core=[-1.29698,1.84901].
      

---

    Code
      set.seed(1234567)
      SimulateFuzzyNumber(originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      incrCorePD = "rexp", parIncrCorePD = list(rate = 2), suppLeftPD = "runif",
      parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 0, type = "PLFN")
    Output
      $original
      [1] 0.6022571
      
      $value
      Trapezoidal fuzzy number with:
         support=[-1.63434,2.36678],
            core=[-1.29698,1.84901].
      

