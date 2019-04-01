rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if(outcome=="heart attack"){
    data[, 11] <- as.numeric(data[, 11])
    OutcomeByState <- split(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, data$State)
    OutcomeOneState <- OutcomeByState[[state]]
    if(is.null(OutcomeOneState)){
      stop(paste("Error in best (\"",state,"\", \"",outcome,"\") : invalid state",sep=""))
    }
    if (num=="worst"){
      g <- order(OutcomeOneState,decreasing=TRUE)
    } else {
      g <- order(OutcomeOneState)      
    }
    OutcomeOneState <- OutcomeOneState[g]
    if (num=="best" | num=="worst"){
      MinHospital <- OutcomeOneState[1]
    } else{
      MinHospital <- OutcomeOneState[num]
    }
    
    z <- subset(data,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==MinHospital & State==state)
    ListofHospitals <- z$Hospital.Name
    ListofHospitals <- ListofHospitals[order(ListofHospitals,decreasing=TRUE)]
    return(ListofHospitals[1])
  } else if(outcome=="heart failure"){
      data[, 17] <- as.numeric(data[, 17])
      OutcomeByState <- split(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, data$State)
      OutcomeOneState <- OutcomeByState[[state]]
      if(is.null(OutcomeOneState)){
        stop(paste("Error in best (\"",state,"\", \"",outcome,"\") : invalid state",sep=""))
      }
      if (num=="worst"){
        g <- order(OutcomeOneState,decreasing=TRUE)
      } else {
        g <- order(OutcomeOneState)      
      }
      OutcomeOneState <- OutcomeOneState[g]
      if (num=="best" | num=="worst"){
        MinHospital <- OutcomeOneState[1]
      } else{
        MinHospital <- OutcomeOneState[num]
      }
      
      z <- subset(data,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==MinHospital & State==state)
      ListofHospitals <- z$Hospital.Name
      ListofHospitals <- ListofHospitals[order(ListofHospitals,decreasing=TRUE)]
      return(ListofHospitals[1])
    } else if (outcome=="pneumonia"){
      data[, 23] <- as.numeric(data[, 23])
      OutcomeByState <- split(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, data$State)
      OutcomeOneState <- OutcomeByState[[state]]
      if(is.null(OutcomeOneState)){
        stop(paste("Error in best (\"",state,"\", \"",outcome,"\") : invalid state",sep=""))
      }
      if (num=="worst"){
        g <- order(OutcomeOneState,decreasing=TRUE)
      } else {
        g <- order(OutcomeOneState)      
      }
      OutcomeOneState <- OutcomeOneState[g]
      if (num=="best" | num=="worst"){
        MinHospital <- OutcomeOneState[1]
      } else{
        MinHospital <- OutcomeOneState[num]
      }
      
      z <- subset(data,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==MinHospital & State==state)
      ListofHospitals <- z$Hospital.Name
      ListofHospitals <- ListofHospitals[order(ListofHospitals,decreasing=TRUE)]
      return(ListofHospitals[1])
      } else{
        stop(paste("Error in best (\"",state,"\", \"",outcome,"\") :  invalid outcome",sep=""))
      }
}

