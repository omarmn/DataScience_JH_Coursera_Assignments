best <- function(state, outcome) {
  ## Read data data
  ## Check that state and data are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if(outcome=="heart attack"){
    data[, 11] <- as.numeric(data[, 11])
    x <- split(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, data$State)
    y <- lapply(x,min,na.rm=TRUE)
    min=y[[state]]
    if (is.null(min)){
      message(paste("Error in best (\"",state,"\", \"",outcome,"\") : invalid state",sep=""))
    }
    z<-subset(data,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==min & State==state)
    return(z$Hospital.Name)
  } else if(outcome=="heart failure"){
    data[, 17] <- as.numeric(data[, 17])
    x <- split(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, data$State)
    y <- lapply(x,min,na.rm=TRUE)
    min=y[[state]]
    if (is.null(min)){
      stop(paste("Error in best (\"",state,"\", \"",outcome,"\") : invalid state",sep=""))
    }
    z<-subset(data,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==min & State==state)
    return(z$Hospital.Name)
  } else if(outcome=="pneumonia"){
    data[, 23] <- as.numeric(data[, 23])
    x <- split(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, data$State)
    y <- lapply(x,min,na.rm=TRUE)
    min=y[[state]]
    if (is.null(min)){
      stop(paste("Error in best (\"",state,"\", \"",outcome,"\") : invalid state",sep=""))
    }
    z <- subset(data,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==min & State==state)
    return(z$Hospital.Name)  
  } else {
    message(paste("Error in best (\"",state,"\", \"",outcome,"\") :  invalid outcome",sep=""))
  }
    
  
}