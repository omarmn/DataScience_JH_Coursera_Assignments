run_analysis <- function(){

#########
#Step 1:#
#########

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
#########
#Step 3:#
#########

  # Convert to character
  dataSet[,2]<-as.character(dataSet[,2])
  
  # Find and replace activity with appropriate names
  dataSet[,2]<-sub("1","WALKING",dataSet[,2])
  dataSet[,2]<-sub("2","WALKING_UPSTAIRS",dataSet[,2])
  dataSet[,2]<-sub("3","WALKING_DOWNSTAIRS",dataSet[,2])
  dataSet[,2]<-sub("4","SITTING",dataSet[,2])
  dataSet[,2]<-sub("5","STANDING",dataSet[,2])
  dataSet[,2]<-sub("6","LAYING",dataSet[,2])
  
  #Rename columns 1 & 2 as bper below
  names(dataSet)[1]='Subject_ID'
  names(dataSet)[2]='Activity'

#########
#Step 4:#
#########
  # read Features.text file to get column names
  columnNames <- read.table("UCI HAR Dataset//features.txt")
  
  # Change type to Character and store in a vector
  columnName <- as.character(columnNames$V2)
  
  # For loop to rename remaining column names with the appropriate name of the variable
  # Which is sourced from the features.txt file
  for (i in 1:length(columnName)){
    names(dataSet)[i+2]=columnName[i]
  }
  
#########
#Step 2:#
#########
  
  # Extract column names of the newly created data set
  colNameVector<-colnames(dataSet)
  
  # Look for column names with the word "mean" and extract those into a new data
  meanCols <- grep("mean", colNameVector)
  newDataSet_mean <- dataSet[,meanCols]
  
  # Look for column names with the word "std" and extract those into a new data
  stdCols <- grep("std", colNameVector)  
  newDataSet_std <- dataSet[,stdCols]
  
  # Merge Subject ID, Activity, std and mean columns using cbind
  std_mean_data <- cbind(Subject, Y, newDataSet_mean,newDataSet_std)
  names(std_mean_data)[1]='Subject_ID'
  names(std_mean_data)[2]='Activity'

  # Export the mean & std data into a comma separated text file
  write.table(std_mean_data,"mean_std_data_only.txt",sep=",",row.name=FALSE)
#########
#Step 5:#
#########

  meanVariables<-ddply(std_mean_data, .(Subject_ID, Activity), summarise, mean=mean(std_mean_data[,3]))
  for (i in 4:length(std_mean_data)){
    temp<-ddply(std_mean_data, .(Subject_ID, Activity), summarise, mean=mean(std_mean_data[,i]))
    meanVariables<-cbind(meanVariables, temp[,3])
  }
  write.table(meanVariables,"meanVariablesPerSubjectPerActivity.txt",sep=",",row.name=FALSE)
}