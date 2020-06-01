Plot1<-function(){
  data<-read.table("data/household.txt",sep = ";",header = TRUE,na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
 data$Date<-as.Date(data$Date,"%d/%m/%Y")
   subdata<-subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  hist(subdata$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col = "red")
  dev.copy(png,"plot1.png", width=480, height=480)
  dev.off()
}