complete <- function(directory, id = 1:332) {
  x <- data.frame()
  for (monitorid in id) {
    filename <- sprintf("%s/%03d.csv", directory, monitorid)
    data <- read.csv(filename)
    print(monitorid)
    nobs <- sum(complete.cases(data))
    x <- rbind(x, data.frame(id=monitorid, nobs=nobs))
  }
  x
}