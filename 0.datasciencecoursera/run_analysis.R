run_analysis <- function(){

  # Read x train data which results in 7352 observations and 561 variables
  xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
  
  # Read x test data which results in 2947 observations and 561 variables
  xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
  
  # Merge the train and test data for X to result in 7352+2947=10299 observations(rows) 
  # and 561 variables (columns)
  X <- rbind(xTrain,xTest)
  
  # In similar fashion to the X_test data, read y_train data (7352 observations/rows)
  yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
  
  # Read y_test data (2947 observations/rows)
  yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
  
  # Merge rows of both y_train and y_test data to produce 10299 observations/rows
  Y <- rbind(yTrain,yTest)
  
  # Similarly do the same with the subject files for train and test subjects
  subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
  subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  # Then merge the rows to produce, again, 10299 observations, rows
  Subject <- rbind(subjectTrain,subjectTest)
  
  # Now merge the X(test+train) AND Y(test+train) AND subject(test+train)
  # to produce 10299 observations/rows and 563 variables (columns)
  dataSet <- cbind(Subject,Y,X)
  
  # Convert to character
  dataSet[,2]<-as.character(dataSet[,2])
  
  # Find and replace activity
  dataSet[,2]<-sub("1","WALKING",dataSet[,2])
  dataSet[,2]<-sub("2","WALKING_UPSTAIRS",dataSet[,2])
  dataSet[,2]<-sub("3","WALKING_DOWNSTAIRS",dataSet[,2])
  dataSet[,2]<-sub("4","SITTING",dataSet[,2])
  dataSet[,2]<-sub("5","STANDING",dataSet[,2])
  dataSet[,2]<-sub("6","LAYING",dataSet[,2])
  
  #Rename columns 1 & 2 as bper below
  names(dataSet)[1]='Subject_ID'
  names(dataSet)[2]='Activity'
  
  # read Features.text file to get column names
  columnNames <- read.table("UCI HAR Dataset//features.txt")
  
  # Change type to Character and store in a vector
  columnName <- as.character(columnNames$V2)
  
  #For loop to rename all
  for (i in 1:length(columnName)){
    names(dataSet)[i+2]=columnName[i]
  }
  
  sanitisedData <- data.frame()

}