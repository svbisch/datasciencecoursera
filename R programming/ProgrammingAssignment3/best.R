## Determine the state's hospital with the lowest 30-day mortality rate from 
## the specified outcome. Valid outcomes are "heart attack", "heart failure" and
## "pneumonia". The state parameter is one the official 2-letter abbreviations.
best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  data[,11] <- suppressWarnings(as.numeric(data[,11]))
  data[,17] <- suppressWarnings(as.numeric(data[,17]))
  data[,23] <- suppressWarnings(as.numeric(data[,23]))
  
  valid_states <- unique(data$State)
  if (!is.element(state, valid_states)) {
    stop("invalid state")
  }
  
  valid_outcomes <- c("heart attack","heart failure","pneumonia")
  if (!is.element(outcome, valid_outcomes)) {
    stop("invalid outcome")
  }
  column_by_outcome <- c(11,17,23)
  column_by_outcome <- setNames(column_by_outcome, valid_outcomes)
  
  state_data <- data[data$State==state,]
  ranking <- order(c(state_data[[column_by_outcome[[outcome]] ]]), 
                   c(state_data$Hospital.Name), na.last=NA)
  
  state_data[ranking,2][1] 
}