Plot4<-function(){
  
  data<-read.table("data/household.txt",sep = ";",header = TRUE,na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
  subdata<-subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  subdata<-subdata[complete.cases(subdata),]
  dateTime<-paste(subdata$Date,subdata$Time)
  subdata<-subdata[,!names(subdata) %in% c("Date","Time")]
  dateTime <- setNames(dateTime, "DateTime")
  subdata<-cbind(dateTime,subdata)
  subdata$DateTime<-as.POSIXct(dateTime)
  par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(subdata, {
    plot(Global_active_power ~ DateTime, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lwd = 1, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)
    plot(Global_reactive_power ~ DateTime, type = "l", 
         ylab = "Global_rective_power", xlab = "datetime")
  })
  dev.copy(png,"plot4.png",width=480,height=480)
  dev.off()
  }