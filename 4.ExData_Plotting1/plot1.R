plot1 <- function(){
  # 1.Read data from text file. Uses the "fread function, the "data.table" library has to be loaded first
  library(data.table)
  data<-fread("household_power_consumption.txt")
  
  # 2.Extract data for the data range 1/2/2007 to (and including) 2/2/20007
  data_feb <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
  
  # 3. Set background to be transparent, as per example provided
  par(bg=NA)
  
  # 4.Plot a histogram using "hist", set bar colours to Red and set x-label name
  hist(as.numeric(data_feb$Global_active_power), 
       col="red",main="Global Active Power",
       xlab="Global Active Power (killowatts)")
  
  # 5.Copy plot to PNG file called "plot1.png"
  dev.copy(png,file="plot1.png")
  
  # 6.Close plot device
  dev.off()
}