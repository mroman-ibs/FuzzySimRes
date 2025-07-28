nazwy <-c()

for (i in 1:40) {

  nazwy<-c(nazwy,paste0("Exp.1.",i))

}

nazwy

for (i in 1:38) {

  nazwy<-c(nazwy,paste0("Exp.2.",i))

}

nazwy

for (i in 1:42) {

  nazwy<-c(nazwy,paste0("Exp.3.",i))

}

nazwy

length(nazwy)

getwd()

cheeseMatrix <- read.csv2("data-raw/cheeseQualityData.csv",header = FALSE)

cheeseMatrix

cheeseQualityData <- MatrixToFuzzyNumbers(cheeseMatrix,nazwy)

cheeseQualityData[[2]]

usethis::use_data(cheeseQualityData)
