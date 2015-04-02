library(lubridate)

#Reads the entire dataset
data<-read.csv2("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, dec = ".", nrows=2075259)

#Transforms the dates and hours using lubridate
data$Date_Time<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)


#Subsets for the two dates "2007-02-01" and "2007-02-02"
data_feb<-subset(data,data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"), select=c(Date_Time, Sub_metering_1,Sub_metering_2,Sub_metering_3))

#Configures the exit file
png("plot3.png")

Sys.setlocale(category = "LC_ALL", locale = "English")

with(data_feb,plot(Date_Time,Sub_metering_1,type="l", xlab="",ylab="Energy sub metering", main=""))
with(data_feb,lines(Date_Time,Sub_metering_2,type="l",col="red", xlab="",ylab="Energy sub metering", main=""))
with(data_feb,lines(Date_Time,Sub_metering_3,type="l",col="blue", xlab="",ylab="Energy sub metering", main=""))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))


#Saves png
dev.off()