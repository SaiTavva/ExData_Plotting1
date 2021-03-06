library(readr)
library(lubridate)
file <- "household_power_consumption.txt"
power <- read.csv( file = file ,sep=";")
power[,1]<-dmy(power[,1])
power<-subset(power,Date>="2007-02-01" & Date<="2007-02-02" )
power[,1]<-wday(power[,1],label=TRUE)
plot(ts(power$Sub_metering_1,start=5,end=7,frequency=1440),xlab="",ylab="Energy sub meeting",xaxt="n")
lines(ts(power$Sub_metering_3,start=5,end=7,frequency=1440),xlab="",ylab="Energy sub meeting",xaxt="n",col="blue")
lines(ts(power$Sub_metering_2,start=5,end=7,frequency=1440),xlab="",ylab="Energy sub meeting",xaxt="n",col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=1.1)
axis(1,at=seq_len(nrow(power)),label=nrow(power$Date))
dev.copy(png,file="plot3.png")
dev.off()