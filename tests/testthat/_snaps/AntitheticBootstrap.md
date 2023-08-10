# Function returns correct values

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      AntitheticBootstrap(testSample1$value, cutsNumber = 1)
    Output
                   X1        X2       X3        X4         X5      X6         X7
      0.1944 1.000741 -1.483574 1.262368 -2.008874 -0.9801226 1.24424 -0.0134166
                    X8        X9         X10
      0.1944 0.6090119 -1.748704 -0.07387787

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      AntitheticBootstrap(testSample1$value, cutsNumber = 10)
    Output
                    X1        X2       X3         X4         X5       X6          X7
      0.1944 0.2159733 -2.055241 1.177046 -0.7785720 -0.7866184 1.483450 -0.25857448
      0.6487 0.1848165 -1.817580 1.307335 -1.1740932 -1.1420529 1.589131 -0.42444312
      0.9406 0.5281562 -2.011888 1.367484 -1.5501486 -0.8618847 1.801819 -0.31899523
      0.3464 0.7471876 -1.893304 1.729097 -0.9356380 -0.7657370 1.683750 -0.20435758
      0.845  0.6197171 -1.870103 1.408824 -1.7831373 -0.9746151 1.956644 -0.31580706
      0.1294 0.2651445 -1.672270 1.334041 -1.6675460 -0.8652898 1.905064 -0.22959402
      0.8518 0.7190156 -1.392197 1.139946 -1.7474640 -0.8164556 1.399199 -0.30821181
      0.2184 0.8176342 -2.148180 1.215118 -0.9858447 -0.8937896 1.589825 -0.45955844
      0.1322 0.4384077 -1.222886 1.452181 -2.2459561 -1.1186734 1.713356  0.01190652
      0.6215 0.3144269 -1.123224 1.012382 -1.6932994 -1.1345071 1.242585 -0.27792602
                    X8        X9         X10
      0.1944 0.5462766 -1.202497  0.49488108
      0.6487 1.0007933 -1.604353  0.31374954
      0.9406 0.6071629 -2.328314  0.00193005
      0.3464 0.8821424 -2.281952  0.50488129
      0.845  0.9750038 -2.195288  0.78353182
      0.1294 0.9426243 -2.099345  0.76817532
      0.8518 0.6206618 -2.677048  0.45295926
      0.2184 0.8089989 -1.444732  0.22672422
      0.1322 0.6930241 -1.987370 -0.20621359
      0.6215 0.5928618 -1.360725  0.18800757

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 10, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), type = "trapezoidal")
      AntitheticBootstrap(testSample1$value, cutsNumber = 5)
    Output
                    X1        X2        X3        X4         X5       X6          X7
      0.1944 0.1052417 -1.783612 0.8818097 -1.527982 -1.0750423 1.371735 -0.14413481
      0.6487 0.4751061 -1.908257 1.6526464 -1.491386 -1.0786132 1.334679 -0.21362941
      0.9406 0.7327973 -1.846313 1.3258791 -2.140852 -0.9506891 1.132209 -0.03340507
      0.3464 0.6325503 -1.739027 0.9979839 -1.110918 -0.8311048 1.705444 -0.23024732
      0.845  0.7423821 -1.829401 1.4361167 -1.776384 -0.8192903 1.337851 -0.52963308
                    X8        X9       X10
      0.1944 0.8862522 -1.765969 0.2597434
      0.6487 0.9254334 -2.533014 0.1662795
      0.9406 0.7000223 -1.909245 0.7403077
      0.3464 0.6654657 -2.108214 0.2396578
      0.845  0.7998756 -2.607897 0.1394242

---

    Code
      set.seed(123456)
      testSample1 <- SimulateSample(n = 3, originalRandomDist = "rnorm",
        parametersOriginalRD = list(mean = 0, sd = 1), increasesCoreRandomDist = "rexp",
        parametersCoreIncreasesRD = list(rate = 2), supportLeftRandomDist = "runif",
        parametersSupportLeftRD = list(min = 0, max = 0.6), supportRightRandomDist = "runif",
        parametersSupportRightRD = list(min = 0, max = 0.6), knotNumbers = 10, type = "PLFN")
      AntitheticBootstrap(testSample1$value, cutsNumber = 8)
    Output
                     X1        X2         X3
      0.2091 1.21320302 -1.286906 -0.9030100
      0.8766 0.57326764 -1.214215 -0.7758669
      0.2708 0.07367616 -1.184798 -0.9423535
      0.2405 0.59366955 -1.330670 -0.7385112
      0.7588 0.25664576 -1.263103 -0.9155445
      0.0578 0.75697758 -1.195831 -0.9552984
      0.4509 0.96445155 -1.300650 -0.8647639
      0.6979 1.05190355 -1.256670 -0.8425828

