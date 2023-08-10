# Function returns correct values

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample3$value, testSample4$value,
      cutsNumber = 15, K = 5)
    Output
      [1] 0.1218086

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample3$value, testSample4$value,
      cutsNumber = 25, bootstrapMethod = "anti", K = 7)
    Output
      [1] 0.2131651

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample5$value, testSample6$value,
      cutsNumber = 25, K = 5)
    Output
      [1] 0.4622732

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample5$value, testSample6$value,
      cutsNumber = 5, bootstrapMethod = "anti", K = 2)
    Output
      [1] 0.4622732

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample3$value, sample2 = NULL, cutsNumber = 5,
      y = "pnorm", K = 5)
    Output
      [1] 0.09406478

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample4$value, sample2 = NULL, cutsNumber = 30,
      y = "pnorm", bootstrapMethod = "anti", K = 10)
    Output
      [1] 0.1320721

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample5$value, sample2 = NULL, cutsNumber = 30,
      y = "pexp", K = 5)
    Output
      [1] 9.7724e-05

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample3$value, testSample4$value,
      cutsNumber = 15, combineMethod = "mean", K = 2)
    Output
      [1] 0.09204865

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample3$value, testSample4$value,
      cutsNumber = 25, bootstrapMethod = "anti", combineMethod = "mean")
    Output
      [1] 0.06228867

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample3$value, sample2 = NULL, cutsNumber = 5,
      y = "pnorm", combineMethod = "mean", K = 5)
    Output
      [1] 0.09818946

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample4$value, sample2 = NULL, cutsNumber = 30,
      y = "pnorm", bootstrapMethod = "anti", combineMethod = "mean", K = 10)
    Output
      [1] 0.2056949

---

    Code
      set.seed(1234567)
      ResamplingStatisticEpistemicTest(testSample5$value, sample2 = NULL, cutsNumber = 30,
      y = "pexp", combineMethod = "mean", K = 12)
    Output
      [1] 0.02299954

