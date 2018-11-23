plot2 <- function(){
  # 1.Read data from text file. Uses the "fread function, the "data.table" library has to be loaded first
  library(data.table)
  data<-fread("household_power_consumption.txt")
  
  # 2.Extract data for the data range 1/2/2007 to (and including) 2/2/20007
  data_feb <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
  
  # 3.Read only the data required for the plots and convert to numeric or date (using the strptime function)
  z <- data.frame(dnt=strptime(paste(data_feb$Date,data_feb$Time,sep=" "),"%e/%m/%Y %H:%M:%S"),
                  power=as.numeric(data_feb$Global_active_power))
  # 4. Set background to be transparent, as per example provided
  par(bg="NA")
  
  # 5. Create the empty plot, with x & y labels
  plot(z$dnt,z$power,type="n",xlab="",ylab="Global Active Power (killowatts)")
  
  # 6. Create a line plot
  lines(z$dnt,z$power)
  
  # 7.Copy plot to PNG file called "plot1.png"
  dev.copy(png,file="plot2.png")
  
  # 8.Close plot device
  dev.off()
}