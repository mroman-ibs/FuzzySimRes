# Function returns correct values

    Code
      set.seed(1234567)
      EpistemicTest(testSample3$value, testSample4$value, cutsNumber = 15)
    Output
      [1] 0.1218086

---

    Code
      set.seed(1234567)
      EpistemicTest(testSample3$value, testSample4$value, cutsNumber = 25,
      bootstrapMethod = "anti", algorithm = "avs")
    Output
      [1] 0.06228867

---

    Code
      set.seed(1234567)
      EpistemicTest(testSample5$value, testSample6$value, cutsNumber = 25, algorithm = "ms",
      combineMethod = "mean")
    Output
      [1] 0.4975496

---

    Code
      set.seed(1234567)
      EpistemicTest(testSample5$value, testSample6$value, cutsNumber = 5,
      bootstrapMethod = "anti", algorithm = "res", combineMethod = "simes", K = 5)
    Output
      [1] 0.4622732

---

    Code
      set.seed(1234567)
      EpistemicTest(testSample3$value, sample2 = NULL, cutsNumber = 5, y = "pnorm",
      algorithm = "ms", combineMethod = "mean")
    Output
      [1] 0.1738417

---

    Code
      set.seed(1234567)
      EpistemicTest(testSample4$value, sample2 = NULL, cutsNumber = 30, y = "pnorm",
      bootstrapMethod = "anti", algorithm = "res", combineMethod = "simes", K = 5)
    Output
      [1] 0.1159471

---

    Code
      set.seed(1234567)
      EpistemicTest(testSample5$value, sample2 = NULL, cutsNumber = 30, y = "pexp")
    Output
      [1] 0.003835182

