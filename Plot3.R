Plot3<-function(){
  
  data<-read.table("data/household.txt",sep = ";",header = TRUE,na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
  subdata<-subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  subdata<-subdata[complete.cases(subdata),]
  dateTime<-paste(subdata$Date,subdata$Time)
  subdata<-subdata[,!names(subdata) %in% c("Date","Time")]
  dateTime <- setNames(dateTime, "DateTime")
  subdata<-cbind(dateTime,subdata)
  subdata$DateTime<-as.POSIXct(dateTime)
  with(subdata,plot(Sub_metering_1~DateTime,type="l",ylab="Energy sub metering",xlab=""))
with(subdata,lines(Sub_metering_2~DateTime,col="red"))
with(subdata,lines(Sub_metering_3~DateTime,col="blue"))
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
 }