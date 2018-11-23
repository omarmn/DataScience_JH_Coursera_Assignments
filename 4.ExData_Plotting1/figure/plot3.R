plot3 <- function(){
  # 1.Read data from text file. Uses the "fread function, the "data.table" library has to be loaded first
  library(data.table)
  data<-fread("household_power_consumption.txt")
  
  # 2.Extract data for the data range 1/2/2007 to (and including) 2/2/20007
  data_feb <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
  z <- data.frame(dnt = strptime(paste(data_feb$Date,data_feb$Time,sep=" "),"%e/%m/%Y %H:%M:%S"),
                  sub1= as.numeric(data_feb$Sub_metering_1),
                  sub2= as.numeric(data_feb$Sub_metering_2),
                  sub3= as.numeric(data_feb$Sub_metering_3))
  
  # 4. Set background to be transparent, as per example provided
  par(bg="NA")
  
  # 5. Create the empty plot, with x & y labels
  plot(z$dnt,z$sub1,type="n",xlab="",ylab="Energy sub metering")
  
  # 6. Setup the legend with correct colours, markers and labels
  legend("topright", 
         pch=c(NA,NA,NA), 
         col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lwd=1, lty=c(1,1,1),
         cex=1.0)
  
  # 7. Make a line plot for each data set on the same plot area
  lines(z$dnt,z$sub1,col="black")
  lines(z$dnt,z$sub2,col="red")
  lines(z$dnt,z$sub3,col="blue")
  
  # 8.Copy plot to PNG file called "plot1.png"
  dev.copy(png,file="plot3.png")
  
  # 9.Close plot device
  dev.off()
  
}