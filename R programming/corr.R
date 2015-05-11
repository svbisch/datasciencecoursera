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
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}