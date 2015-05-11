corr <- function(directory, threshold = 0) {
  x <- numeric()
  for (filename in list.files(directory,full.names=TRUE)) {
    data <- read.csv(filename)
    compl <- complete.cases(data)
    nobs <- sum(compl)
    if (nobs > threshold) {
      data <- data[compl,]
      x <- append(x, cor(data["nitrate"], data["sulfate"]))
    }
  }
  x
}