# Function returns correct values

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample3$value, testSample4$value, cutsNumber = 15)
    Output
      [1] 0.1218086

---

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample3$value, testSample4$value, cutsNumber = 25,
      bootstrapMethod = "anti")
    Output
      [1] 0.06228867

---

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample5$value, testSample6$value, cutsNumber = 25)
    Output
      [1] 0.4622732

---

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample5$value, testSample6$value, cutsNumber = 5,
      bootstrapMethod = "anti")
    Output
      [1] 0.3383473

---

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample3$value, sample2 = NULL, cutsNumber = 5,
      y = "pnorm")
    Output
      [1] 0.1139719

---

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample4$value, sample2 = NULL, cutsNumber = 30,
      y = "pnorm", bootstrapMethod = "anti")
    Output
      [1] 0.1539185

---

    Code
      set.seed(1234567)
      AverageStatisticEpistemicTest(testSample5$value, sample2 = NULL, cutsNumber = 30,
      y = "pexp")
    Output
      [1] 0.003835182

