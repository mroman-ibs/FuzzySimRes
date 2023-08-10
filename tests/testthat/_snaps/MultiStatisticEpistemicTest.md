# Function returns correct values

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample3$value, testSample4$value, cutsNumber = 15)
    Output
      [1] 0.1405484

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample3$value, testSample4$value, cutsNumber = 25,
      bootstrapMethod = "anti")
    Output
      [1] 0.1415652

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample5$value, testSample6$value, cutsNumber = 25)
    Output
      [1] 0.7800995

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample5$value, testSample6$value, cutsNumber = 5,
      bootstrapMethod = "anti")
    Output
      [1] 0.4622732

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample3$value, sample2 = NULL, cutsNumber = 5,
      y = "pnorm")
    Output
      [1] 0.09406478

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample4$value, sample2 = NULL, cutsNumber = 30,
      y = "pnorm", bootstrapMethod = "anti")
    Output
      [1] 0.2448311

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample5$value, sample2 = NULL, cutsNumber = 30,
      y = "pexp")
    Output
      [1] 0.000146586

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample3$value, testSample4$value, cutsNumber = 15,
      combineMethod = "mean")
    Output
      [1] 0.1631996

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample3$value, testSample4$value, cutsNumber = 25,
      bootstrapMethod = "anti", combineMethod = "mean")
    Output
      [1] 0.1168603

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample3$value, sample2 = NULL, cutsNumber = 5,
      y = "pnorm", combineMethod = "mean")
    Output
      [1] 0.1738417

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample4$value, sample2 = NULL, cutsNumber = 30,
      y = "pnorm", bootstrapMethod = "anti", combineMethod = "mean")
    Output
      [1] 0.1959411

---

    Code
      set.seed(1234567)
      MultiStatisticEpistemicTest(testSample5$value, sample2 = NULL, cutsNumber = 30,
      y = "pexp", combineMethod = "mean")
    Output
      [1] 0.01760001

