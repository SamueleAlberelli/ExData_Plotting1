Plot2<-function(){

  data<-read.table("data/household.txt",sep = ";",header = TRUE,na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
  subdata<-subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  subdata<-subdata[complete.cases(subdata),]
  dateTime<-paste(subdata$Date,subdata$Time)
  subdata<-subdata[,!names(subdata) %in% c("Date","Time")]
  dateTime <- setNames(dateTime, "DateTime")
  subdata<-cbind(dateTime,subdata)
  subdata$DateTime<-as.POSIXct(dateTime)
  plot(subdata$Global_active_power~subdata$DateTime,type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png,"plot2.png", width=480, height=480)
  dev.off()
  }