# Function returns correct values

    Code
      set.seed(1234567)
      SimulateSample(n = 1, originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "triangular")
    Output
      $original
      [1] 0.6022571
      
      $value
      $value$X1
      Trapezoidal fuzzy number with:
         support=[0.264901,0.620074],
            core=[0.602257,0.602257].
      
      

---

    Code
      set.seed(1234567)
      SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      incrCorePD = "rexp", parIncrCorePD = list(rate = 2), suppLeftPD = "runif",
      parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
    Output
      $original
       [1]  0.6022571  1.0515808  1.1707096 -0.2010067  1.9470200 -0.4471801
       [7] -1.3579031 -1.0830953  1.0460586  1.4999121
      
      $value
      $value$X1
      Trapezoidal fuzzy number with:
         support=[-1.63434,2.36678],
            core=[-1.29698,1.84901].
      
      $value$X2
      Trapezoidal fuzzy number with:
         support=[0.0474095,1.66711],
            core=[0.345371,1.37004].
      
      $value$X3
      Trapezoidal fuzzy number with:
         support=[0.837073,1.53013],
            core=[0.944438,1.27437].
      
      $value$X4
      Trapezoidal fuzzy number with:
         support=[-1.52015,0.71556],
            core=[-1.30857,0.23387].
      
      $value$X5
      Trapezoidal fuzzy number with:
         support=[1.4571,2.46841],
            core=[1.88074,1.96471].
      
      $value$X6
      Trapezoidal fuzzy number with:
         support=[-0.90152,0.915065],
            core=[-0.773345,0.387909].
      
      $value$X7
      Trapezoidal fuzzy number with:
         support=[-2.8275,-0.564381],
            core=[-2.3653,-0.783202].
      
      $value$X8
      Trapezoidal fuzzy number with:
         support=[-1.45215,-0.689634],
            core=[-1.09701,-0.883424].
      
      $value$X9
      Trapezoidal fuzzy number with:
         support=[0.650088,1.92015],
            core=[0.995504,1.44282].
      
      $value$X10
      Trapezoidal fuzzy number with:
         support=[0.688557,3.68201],
            core=[1.09081,3.32955].
      
      

---

    Code
      set.seed(1234567)
      SimulateSample(n = 3, originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      incrCorePD = "rexp", parIncrCorePD = list(rate = 2), suppLeftPD = "runif",
      parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 10, type = "PLFN")
    Output
      $original
      [1] 0.6022571 0.0443457 0.7074159
      
      $value
      $value$X1
      Piecewise linear fuzzy number with 10 knot(s),
         support=[-1.63434,2.36678],
            core=[-1.29698,1.84901].
      
      $value$X2
      Piecewise linear fuzzy number with 10 knot(s),
         support=[-1.15848,0.466801],
            core=[-0.76226,0.37051].
      
      $value$X3
      Piecewise linear fuzzy number with 10 knot(s),
         support=[-1.19169,1.96022],
            core=[-0.944723,1.77184].
      
      

---

    Code
      set.seed(1234567)
      SimulateSample(n = 5, originalPD = "rnorm", parOriginalPD = list(mean = 0, sd = 1),
      incrCorePD = "rexp", parIncrCorePD = list(rate = 2), suppLeftPD = "runif",
      parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 0, type = "PLFN")
    Output
      $original
      [1]  0.6022571  1.0515808  1.1707096 -0.2010067  1.9470200
      
      $value
      $value$X1
      Trapezoidal fuzzy number with:
         support=[-1.63434,2.36678],
            core=[-1.29698,1.84901].
      
      $value$X2
      Trapezoidal fuzzy number with:
         support=[0.0474095,1.66711],
            core=[0.345371,1.37004].
      
      $value$X3
      Trapezoidal fuzzy number with:
         support=[0.837073,1.53013],
            core=[0.944438,1.27437].
      
      $value$X4
      Trapezoidal fuzzy number with:
         support=[-1.52015,0.71556],
            core=[-1.30857,0.23387].
      
      $value$X5
      Trapezoidal fuzzy number with:
         support=[1.4571,2.46841],
            core=[1.88074,1.96471].
      
      

