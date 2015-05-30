## Determine the hospital with the specified rank in 30-day mortality rate 
## from the specified outcome for each state. 
## Valid outcomes are "heart attack", "heart failure" and
## "pneumonia". num can be an integer, the string "worst" or "best"
rankall <- function(outcome, num="best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  data[,11] <- suppressWarnings(as.numeric(data[,11]))
  data[,17] <- suppressWarnings(as.numeric(data[,17]))
  data[,23] <- suppressWarnings(as.numeric(data[,23]))
    
  valid_outcomes <- c("heart attack","heart failure","pneumonia")
  if (!is.element(outcome, valid_outcomes)) {
    stop("invalid outcome")
  }
  column_by_outcome <- c(11,17,23)
  column_by_outcome <- setNames(column_by_outcome, valid_outcomes)
  
  state_data <- split(data, data$State)
  result_list <- lapply(state_data, rank_outcome(column_by_outcome[[outcome]], num))
  result <- stack(result_list)
  colnames(result) <- c("hospital", "state")
  rownames(result) <- result$state
  result
}

rank_outcome <- function(outcome_column, num="best") {
  function(data) {
    ranking <- order(c(data[[outcome_column]]), 
                     c(data$Hospital.Name), na.last=NA)
    if (is.numeric(num)) {
      rank <- num
    } else if (num == "best") {
      rank <- 1
    } else {
      # worst rank, i.e. last available rank
      rank <- length(ranking)
    }
    data[ranking,2][rank]
  }
}

