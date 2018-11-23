rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(data$State)
  states <- states[order(states)]
  best_hospitals <- data.frame(hospital=character(),state=character())
  for(i in 1:length(states)){
    temp<-data.frame(rankhospital(states[i],outcome,num),states[i])
    best_hospitals <- rbind(best_hospitals,temp)
  }
  names(best_hospitals)[1]='hospital'
  names(best_hospitals)[2]='state'
  return(best_hospitals)
  
}