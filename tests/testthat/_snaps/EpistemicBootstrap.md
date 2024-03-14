# Function returns correct values

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicBootstrap(testSample1$value, cutsNumber = 1)
    Output
                   X1         X2       X3         X4        X5      X6        X7
      0.1944 0.795569 -0.8179505 1.157482 -0.6927703 -1.318457 1.98015 -0.470419
                    X8        X9        X10
      0.1944 0.3998581 -1.612007 -0.2172056

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicBootstrap(testSample1$value, cutsNumber = 10)
    Output
                       X1        X2        X3         X4         X5        X6
      0.1944 -0.005106823 -1.898062 0.7270895 -1.6349206 -1.2132682 1.2361072
      0.6487 -0.010390013 -1.774672 1.5396112 -2.2170118 -1.0734412 1.6134420
      0.9406  1.073036466 -1.983360 1.2793967 -2.0752437 -0.7936109 1.4638577
      0.3464  1.251514287 -2.064525 0.9917004 -1.5907681 -0.6365544 1.6001780
      0.845   0.758513730 -1.638916 1.4908081 -2.1898105 -0.8426873 1.5363202
      0.1294  0.389747227 -2.375331 1.3942938 -1.7178605 -1.0590510 1.2610968
      0.8518  0.304853613 -1.125873 1.7119921 -1.6703898 -0.9970996 1.3099653
      0.2184  0.639384950 -1.117127 0.7664290 -1.9739328 -1.3913398 2.0411028
      0.1322  0.651153518 -2.246172 2.0097048 -1.4570211 -0.8378295 0.9252251
      0.6215  0.188162834 -1.725201 1.5041494 -0.6721859 -1.0422675 0.8932069
                       X7        X8        X9          X10
      0.1944  0.107341126 1.2116392 -1.075206  0.294146826
      0.6487 -0.114411100 0.8749117 -2.310073 -0.191675122
      0.9406 -0.102383003 0.5458974 -2.342254  0.686172228
      0.3464  0.006512414 1.0774133 -1.329588  0.679984163
      0.845  -0.435649229 0.7436025 -2.703868  0.511235211
      0.1294 -0.261101094 0.5256371 -1.973415  0.892197037
      0.8518 -0.118524960 0.4192799 -1.469287  0.552870060
      0.2184 -0.010915295 1.0994200 -1.041868 -0.324524898
      0.1322 -0.608326276 0.2463311 -2.625408  0.129575505
      0.6215 -0.202106299 0.5122839 -2.641741  0.006537327

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), type = "trapezoidal")
      EpistemicBootstrap(testSample1$value, cutsNumber = 5)
    Output
                      X1         X2       X3        X4         X5        X6
      0.1944 -0.02507058 -2.1811331 1.234860 -1.751712 -1.3919027 0.6322520
      0.6487  1.10269769 -2.2759387 1.093821 -1.707981 -0.7072671 1.6968659
      0.9406  0.37541455 -1.1826104 1.431659 -2.035455 -0.7357206 1.3371341
      0.3464  0.04014527 -0.8581651 1.456444 -1.981049 -1.2637536 0.9478305
      0.845   0.82232351 -1.4955891 1.145909 -1.583980 -0.9118434 1.6731157
                      X7        X8         X9         X10
      0.1944 -0.21890048 0.6732250 -2.2430177 -0.05954660
      0.6487  0.04640969 0.3862139 -2.0536016 -0.09414776
      0.9406 -0.39757094 0.4856610 -2.4279631  0.45634882
      0.3464  0.10819266 0.7007433 -1.9637739  0.90589918
      0.845  -0.14331634 0.4245925 -0.9543901  0.35790013

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 3, originalPD = "rnorm", parOriginalPD = list(
        mean = 0, sd = 1), incrCorePD = "rexp", parIncrCorePD = list(rate = 2),
      suppLeftPD = "runif", parSuppLeftPD = list(min = 0, max = 0.6), suppRightPD = "runif",
      parSuppRightPD = list(min = 0, max = 0.6), knotNumbers = 10, type = "PLFN")
      EpistemicBootstrap(testSample1$value, cutsNumber = 8)
    Output
                       X1        X2         X3
      0.2091  1.197246525 -0.611817 -0.7154786
      0.8766  0.270100390 -1.309858 -0.8678250
      0.2708 -0.004919886 -2.181290 -0.6872086
      0.2405  0.621027959 -1.601496 -0.8672691
      0.7588  0.247569495 -1.819534 -0.9013452
      0.0578  1.038508000 -1.737826 -0.6537212
      0.4509  1.093011191 -1.321355 -0.9105568
      0.6979  0.898364354 -1.035761 -0.8482977

