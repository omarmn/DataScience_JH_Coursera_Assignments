plot4 <- function(){
  # 1.Read data from text file. Uses the "fread function, the "data.table" library has to be loaded first
  library(data.table)
  data<-fread("household_power_consumption.txt")
  
  # 2.Extract data for the data range 1/2/2007 to (and including) 2/2/20007
  data_feb <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
  
  # 3.Read only the data required for the plots and convert to numeric or date (using the strptime function)
  z <- data.frame(dnt = strptime(paste(data_feb$Date,data_feb$Time,sep=" "),"%e/%m/%Y %H:%M:%S"),
                  power=as.numeric(data_feb$Global_active_power),
                  sub1= as.numeric(data_feb$Sub_metering_1),
                  sub2= as.numeric(data_feb$Sub_metering_2),
                  sub3= as.numeric(data_feb$Sub_metering_3),
                  volt=as.numeric(data_feb$Voltage),
                  powerre=as.numeric(data_feb$Global_reactive_power))
  # 4.Set the plot area to include 4 plots (2X2)
  par(mfrow=c(2,2),bg="NA")
  
  # 5.For every plot use "with" to create a "sub-plot"
  with(z,{
    plot(z$dnt,z$power,type="n",xlab="",ylab="Global Active Power (killowatts)")
    lines(z$dnt,z$power)
  })
  with(z,{
    plot(z$dnt,z$volt,type="n",xlab="datetime",ylab="Voltage")
    lines(z$dnt,z$volt)
  })
  with(z,{
    plot(z$dnt,z$sub1,type="n",xlab="",ylab="Energy sub metering")
    legend("topright", 
           pch=c(NA,NA,NA), 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lwd=1, lty=c(1,1,1),
           bty="n")
    lines(z$dnt,z$sub1,col="black")
    lines(z$dnt,z$sub2,col="red")
    lines(z$dnt,z$sub3,col="blue")
  })
  with(z,{
    plot(z$dnt,z$powerre,type="n",xlab="datetime",ylab="Global_reactive_power")
    lines(z$dnt,z$powerre)
  })
  
  # 6.Copy plot to PNG file called "plot1.png"
  dev.copy(png,file="plot4.png")
  
  # 7.Close plot device
  dev.off()
}