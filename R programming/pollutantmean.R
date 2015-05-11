pollutantmean <- function(directory, pollutant, id = 1:332) {
  x <- c()
  for (monitorid in id) {
    filename <- sprintf("%s/%03d.csv", directory, monitorid)
    data <- read.csv(filename)
    x <- rbind(x, data)
  }
  mean(x[[pollutant]], na.rm=TRUE)
}