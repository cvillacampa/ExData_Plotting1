library(lubridate)

#Reads the entire dataset
data<-read.csv2("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, dec = ".", nrows=2075259)

#Transforms the dates and hours using lubridate
data$Date_Time<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)


#Subsets for the two dates "2007-02-01" and "2007-02-02"
data_feb<-subset(data,data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"), select=c(Date_Time, Global_active_power))

#Configures the exit file
png("plot2.png")

Sys.setlocale(category = "LC_ALL", locale = "English")

with(data_feb,plot(Date_Time,Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)", main=""))


#Saves png
dev.off()